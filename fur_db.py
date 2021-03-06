import numpy as np
import conf
import time
import grequests
import logging
import requests
import pandas as pd
import sys
import ast
import re
import platform
import os
from tqdm import tqdm
from decouple import config
from bs4 import BeautifulSoup as soup
from datetime import datetime
import json

formatter = logging.Formatter("%(asctime)s %(levelname)s %(message)s")


def setup_logger(name, log_file, level=logging.INFO):
    """To setup few loggers"""
    handler = logging.FileHandler(log_file, 'w', 'utf-8')
    handler.setFormatter(formatter)
    logger = logging.getLogger(name)
    logger.setLevel(level)
    logger.addHandler(handler)
    return logger


movies_logger = setup_logger('movies_log', 'movies.log')


def get_soup_from_response(response):
    """receives  a response from requests/grequests and returns soup"""
    page_html = response.content
    # html parser
    page_soup = soup(page_html, "html.parser")
    return page_soup


def get_soup_from_url(url):
    """function gets a url and returns it's parsed content in bs4.BeautifulSoup type"""
    try:
        movies_logger.info(f'Trying to get response for {url}')
        response = requests.get(url)
    except Exception as err:
        movies_logger.error(f'An error occurred: {err}')
        movies_logger.error(f'Exit program')
        sys.exit(1)
    movies_logger.info(f'Succeed getting response for {url}')
    return get_soup_from_response(response)


def get_responses_from_urls(urls):
    """receives urls and returns a dict:
    keys = urls
    values = responses"""
    try:
        # in order to prevent the site from blocking us: sleep 1 sec
        time.sleep(1)
        movies_logger.info(f'trying to get responses for next {len(urls)} urls')
        rs = (grequests.get(url) for url in urls)
        # If the response was successful, no Exception will be raised
        responses = grequests.map(rs)
        responses_dict = {}
        for i, url in enumerate(urls):
            responses_dict[url] = responses[i]
    except Exception as err:
        movies_logger.error(f'An error occurred: {err}')
        movies_logger.error(f'Exit program')
        sys.exit(1)
    movies_logger.info(f'Succeed getting responses for {len(urls)} urls')
    return responses_dict


def get_soups_from_urls(urls):
    """receives urls and returns a dict
    keys = urls
    values = soups"""
    responses_dict = get_responses_from_urls(urls)
    soups_dict = {}
    for key in responses_dict:
        movies_logger.info(f'Creating soup for {key}')
        soups_dict[key] = get_soup_from_response(responses_dict[key])
    return soups_dict


def get_titles_with_bs4(url):
    """function receives the url of the current top 100 movies on netflix
    and returns a list of 100 soups (including the name of the movie and url to it's
    page on rotten tomatoes)"""
    page_soup = get_soup_from_url(url)
    movies_logger.info(f'Fetching the current top 100 movies from Rotten Tomatoes {url}')
    titles = page_soup.findAll("div", {"class": "article_movie_title"})
    movies_logger.info(f'Finished fetching the current top 100 movies from Rotten Tomatoes {url}')
    return titles


def get_attributes_from_soup(key, movie_soup):
    """receives the soup of a movie url and returns a pandas df with the attributes"""
    movies_logger.info(f'Looking for movie attributes in soup of {key}')

    error = movie_soup.find("div", {"id": "mainColumn"}).get_text()
    if 'Internal Server Error' in error:
        movies_logger.error(f'{error} for {key}')
        return False
    if '404 - Not Found' in error:
        movies_logger.error(f'{error} for {key}')
        return False

    movies_logger.info(f'Looking for score-board in {key}')
    if movie_soup.findAll("score-board", {"audiencestate": "upright"}):
        move_profile = movie_soup.findAll("score-board", {"audiencestate": "upright"})
        movies_logger.info(f'score-board found for {key}!')
    elif movie_soup.findAll("score-board", {"audiencestate": "spilled"}):
        move_profile = movie_soup.findAll("score-board", {"audiencestate": "spilled"})
        movies_logger.info(f'score-board found for {key}!')
    else:
        move_profile = movie_soup.findAll("score-board", {"audiencestate": "N/A"})

    movies_logger.info(f'Looking for poster in {key}')
    movie_poster = movie_soup.find("img", {"class": "posterImage js-lazyLoad"})

    movies_logger.info(f'Looking for desc in {key}')
    movie_desc = movie_soup.find("div", {"id": "movieSynopsis"})
    if movie_desc:
        movie_desc = movie_desc.get_text().strip()
    if movie_poster:
        movie_poster = movie_poster.get('data-src')
    audience_score = move_profile[0].get('audiencescore')
    tomato_score = move_profile[0].get('tomatometerscore')
    h1_tag_text = move_profile[0].find('h1').get_text()
    p_tag_text = move_profile[0].find('p').get_text()

    list_of_p_values = p_tag_text.split(',')

    if len(list_of_p_values) == 3:
        year = list_of_p_values[0]
        genre = list_of_p_values[1]
        length = list_of_p_values[2]
    elif len(list_of_p_values) == 2:
        movies_logger.info(f"Didn't find length in {key}")
        year = list_of_p_values[0]
        genre = list_of_p_values[1]
        length = np.NaN
    elif len(list_of_p_values) == 1:
        movies_logger.info(f"Didn't find length in {key}")
        movies_logger.info(f"Didn't find genre in {key}")
        year = list_of_p_values[0]
        genre = np.NaN
        length = np.NaN
    else:
        movies_logger.info(f"Didn't find length in {key}")
        movies_logger.info(f"Didn't find genre in {key}")
        movies_logger.info(f"Didn't find year in {key}")
        year = np.NaN
        genre = np.NaN
        length = np.NaN

    movie_data = {
        "url": key,
        "title": h1_tag_text,
        "poster": movie_poster,
        "desc": movie_desc,
        "year": year,
        "genre": genre,
        "length": length,
        "audience_score": audience_score,
        "tomato_score": tomato_score,
    }
    movies_logger.info(f'Finished taking movie attributes for {key}')
    return movie_data


def add_data_to_movies_df(movies, movie_dict):
    """This function receives a movies with movie names and a dict of data of one movie.
    it fills the data of the dict into the df in the relevant line of the movie"""
    atts = movies.columns[1:]
    url = movie_dict['url']
    movies_logger.info(f"Adding the attributes of movie {movie_dict['title']} to the df")
    for att in atts:
        movies.at[url, att] = movie_dict[att]
    return movies




def get_rotten_tomatos_attributes_from_movies_urls(movies):
    """This function receives a df with movie title and a url for the movie's page on rotten tomatoes
     and returns a filled df, with additional attributes for each movie"""
    # We will work in batches in order to sent several requests in parallel
    for x in tqdm(range(int(len(movies) / conf.BATCH_SIZE))):
        # runs from 0 till len(movies) / BATCH_SIZE
        movies_logger.info(f'Starting batch {x + 1}/{len(range(int(len(movies) / conf.BATCH_SIZE)))}')
        soups_dict = get_soups_from_urls(movies.index[x * conf.BATCH_SIZE:x * conf.BATCH_SIZE + conf.BATCH_SIZE])
        for key in tqdm(soups_dict):
            movie_dict = get_attributes_from_soup(key, soups_dict[key])
            if movie_dict:
                movies = add_data_to_movies_df(movies, movie_dict)
            else:
                movies_logger.info(f'Could not get attributes from {key}')
                movies_logger.info(f'Moving on to the next url')
    return movies


def get_movie_titles_from_rotten_tomatos(url):
    """This function receives the url and of the top netflix movies on rotten tomatoes
    and returns a pandas df with the movie names and urls to their page in rotten tomatoes"""
    titles = get_titles_with_bs4(url)
    movies_logger.info(f'Creating a pandas df')
    movies = pd.DataFrame(
        columns=['title', 'url', 'genre', 'length', 'audience_score', 'tomato_score', 'year', 'poster', 'desc'])
    for t in titles:
        movie_name, href = t.a.contents[0], t.a['href']
        movies = movies.append(pd.DataFrame(columns=['title', 'url'], data=[[movie_name, href]]))
    movies_logger.info(f'Movie titles and url were added to the pandas df')
    movies = movies.set_index('url')
    return movies


def create_omdb_url(title):
    """gets a title and returns a clean url for the omdb API"""
    key = config('API_KEY')
    title = re.sub("\(.*?\)","()",title)\
              .replace('(', '')\
              .replace(')', '')\
              .rstrip()\
              .replace(' ', '_')\
              .rsplit(':', 1)[0]
    url = f'http://www.omdbapi.com/?t={title}&apikey={key}'
    return url
def omdb_id(id):
    key = config('API_KEY')
    i = id 
    url = f'http://www.omdbapi.com/?i={i}&apikey={key}'
    return url


def mo_glich(be_ginn, e_nd):
    f_eld = []
    
    while  be_ginn < e_nd :
      if be_ginn <= 9:
         sa_ite = 'tt000000'
         id = sa_ite+str(be_ginn).strip()
         f_eld.append(id)
         be_ginn += 1
      elif be_ginn <= 99:
         sa_ite = 'tt00000'
         id = sa_ite+str(be_ginn).strip()
         f_eld.append(id)
         be_ginn += 1
      elif be_ginn <= 999:
         sa_ite = 'tt0000'
         id = sa_ite+str(be_ginn).strip()
         f_eld.append(id)
         be_ginn += 1
      elif be_ginn <= 9999:
         sa_ite = 'tt000'
         id = sa_ite+str(be_ginn).strip()
         f_eld.append(id)
         be_ginn += 1
      elif be_ginn <= 99999:
         sa_ite = 'tt00'
         id = sa_ite+str(be_ginn).strip()
         f_eld.append(id)
         be_ginn += 1
      elif be_ginn <= 999999:
         sa_ite = 'tt0'
         id = sa_ite+str(be_ginn).strip()
         f_eld.append(id)
         be_ginn += 1
      else :
         sa_ite = 'tt'
         id = sa_ite+str(be_ginn).strip()
         f_eld.append(id)
         be_ginn += 1
    
    return f_eld
def pruf_fung(nicht):
    try:
      ja = json.loads(nicht)
    except ValueError as e:
       return False
    return True
def get_json(b_g):
    e_d = b_g + conf.BATCH_SIZE
    f_eld = []
    id = mo_glich(b_g, e_d)
    urls = [omdb_id(t) for t in id]
    ant_wort = get_responses_from_urls(urls)
    for key in tqdm(ant_wort):
        a = ant_wort[key]
        if a is not None:
           ja = a.content.decode('UTF-8')
           if pruf_fung(ja) == True:

              zu_tat = ast.literal_eval(ja)
              if zu_tat['Response']=='False' or zu_tat['Type']!='movie' or zu_tat['Poster'] == 'N/A' or len(bytes(zu_tat['Title'], 'utf-8'))>48:
                  continue
              try:
                  f_eld.append(zu_tat) 


                 
              except Exception as x:
                   f_eld.append(np.nan)
    or_dung = list()
    for in_diz in range(len(f_eld)):
        if in_diz == 0:
           or_dung.append(f_eld[in_diz])
        else:
           if int(f_eld[in_diz]['imdbID'][2:]) <= int(f_eld[in_diz-1]['imdbID'][2:]):
              continue
           
           else :
              or_dung.append(f_eld[in_diz])
    return or_dung

def pruf_fung_(data):
    
    or_dung = list()
    zwei = json.loads(data)
    print('vor ', len(zwei))
    for in_diz in range(len(zwei)):
       if in_diz == 0:
          or_dung.append(zwei[in_diz])
       else:
          if int(zwei[in_diz]['imdbID'][2:]) <= int(zwei[in_diz-1]['imdbID'][2:]):
             continue
          else:
             or_dung.append(zwei[in_diz])
    print('nach ', len(or_dung))
    return or_dung

def get_omdb_attributes_from_movies_urls(movies, url_omdbapi):
    """This function receives a pandas df with movies attributes from rotten tomatoes and
    adds two columns: imdb score and metacritic score"""
    movies_logger.info(f'Fetching scores from OMDb API')
    imdb_scores = []
    metacritic_scores = []
    for x in tqdm(range(int(len(movies) / conf.BATCH_SIZE))):
        # runs from 0 till len(movies) / BATCH_SIZE
        idxs = movies.index[x * conf.BATCH_SIZE:x * conf.BATCH_SIZE + conf.BATCH_SIZE]
        titles = movies[movies.index.isin(idxs)]['title']
        urls = [create_omdb_url(t) for t in titles]
        responses_dict = get_responses_from_urls(urls)
        for key in tqdm(responses_dict):
            r = responses_dict[key]
            omdb_dict = ast.literal_eval(r.content.decode("UTF-8"))
            try:
                imdb_scores.append(round(float(omdb_dict['imdbRating']) * 10))
            except Exception as err:
                # did not find
                imdb_scores.append(np.nan)
            try:
                metacritic_scores.append(round(float(omdb_dict['Metascore'])))
            except Exception as err:
                # did not find
                metacritic_scores.append(np.nan)
    movies['imdb_score'] = imdb_scores
    movies['metacritic_score'] = metacritic_scores
    return movies


def file_created_today(path_to_file='output.csv'):
    """
    returns True is file exists and was created today.
    Else - False
    """
    if os.path.exists(path_to_file):
        if platform.system() == 'Windows':
            result = os.path.getmtime(path_to_file)
        else:
            result = os.stat(path_to_file).st_mtime
        return datetime.fromtimestamp(result).date() == datetime.now().date()
    else:
        return False
def fur_oracle():
    aus_geben = open('a_g.json').read()
    dump = open('a_g.dmp', 'w', encoding ='utf-8')
    ag = json.loads(aus_geben)
    for f_eld in ag:
       
       sa_ite = str(f_eld)
       dump.writelines("%s\n" % sa_ite )
    dump.close()

def fur_dump(f_eld):
     aus_geben = open('a_g.json',  encoding='UTF-8')
     ag = json.loads(aus_geben.read())
     print(len(ag), ' im gross')
     aus_geben.close()
     ag.extend(f_eld)
     aus_geben = open('a_g.json' , 'w', encoding ='utf-8')
     json.dump(ag, aus_geben, indent = 6)
     aus_geben.close()
     

def get_top_movies_data(url_rotten_tomatoes=conf.TOMATO_BEST_MOVIES, url_omdbapi=conf.OMDB_API_URL):
    """this function receives no input and:
    1. creates a pandas df with several attributes about the top netflix movies on rotten tomatoes
    2. saves it to csv
    """
    if file_created_today():
        print('Scraping was done today.\nImporting db from file')
        movies = pd.read_csv('output.csv')
    else:
        start = datetime.now()
        movies_logger.info(f'Starting to fetch all movies from {url_rotten_tomatoes} now!')
        # getting the names of the movies and their urls and putting them in a df
        print('Scraping Rotten Tomatoes! Please wait a moment')
        movies = get_movie_titles_from_rotten_tomatos(url_rotten_tomatoes)
        # fill the df with attributes of the movies
        movies = get_rotten_tomatos_attributes_from_movies_urls(movies)
        print('Done scraping from Rotten Tomatoes!')
        print('Scraping IMDb! Please wait a moment')
        movies = get_omdb_attributes_from_movies_urls(movies, url_omdbapi)
        print('Done scraping from IMDb!')
        print(f'This operation took {datetime.now() - start} ')
        movies_logger.info(f'Done!')
        movies_logger.info(f'This operation took {datetime.now() - start}')
        movies.to_csv('output.csv')
    return movies



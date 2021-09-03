import json

def parse_actor():
    schlu_ssel = list_actor().items()
    da_ten = open('a_g.json')
    in_nen = json.loads(da_ten.read())
    f_eld = list()
    for qu_enz in range(len(in_nen)):
       id = in_nen[qu_enz]['imdbID']
       for na_men in in_nen[qu_enz]['Actors'].split(','):
           for key, value in schlu_ssel:
              if value == na_men.strip():
                  pa_ar = (id, key)

           if pa_ar in f_eld or pa_ar[1]=='N/A':
                 continue
           else:
              f_eld.append(pa_ar)
    o_ffen = open('insert_actor.dat',"w")
    for  set in f_eld:
         o_ffen.writelines('''"%s"|%d|\n''' % (set[0],int(set[1])) )
    o_ffen.close()
    return open('insert_actor.dat')


def parse_director():
    schlu_ssel = list_director().items()
    da_ten = open('a_g.json')
    in_nen = json.loads(da_ten.read())
    f_eld = list()
    for qu_enz in range(len(in_nen)):
       id = in_nen[qu_enz]['imdbID']
       for na_men in in_nen[qu_enz]['Director'].split(','):
             for key, value in schlu_ssel:
                 if value == na_men.strip() :
                     pa_ar = (id, key)
             
             if pa_ar in f_eld or pa_ar[1]=='N/A':
                continue
             else:
                f_eld.append(pa_ar)
    o_ffen = open('insert_director.dat',"w")
    for  set in f_eld:
         o_ffen.writelines('''"%s"|%d|\n''' % (set[0],int(set[1])) )
    o_ffen.close()
    return open('insert_director.dat')



def parse_title():
    da_ten = open('a_g.json')
    in_nen = json.loads(da_ten.read())
    f_eld = list()
    for qu_enz in range(len(in_nen)):
       id = in_nen[qu_enz]['imdbID']
       rating =in_nen[qu_enz]['imdbRating']
       if rating == 'N/A':
           rating = 0
       year = int(in_nen[qu_enz]['Year'])
       if year == 'N/A':
            year = 1000
       vor = in_nen[qu_enz]['Released'].split()
       if len(vor)!=3:
          released = '01-JAN-'+str(year)
       else:
          released = str(vor[0])+'-'+vor[1].upper()+'-'+str(vor[2])
       runtime = in_nen[qu_enz]['Runtime']
       plot = in_nen[qu_enz]['Plot']
       country = in_nen[qu_enz]['Country']
       poster = in_nen[qu_enz]['Poster']       
       na_men = in_nen[qu_enz]['Title'].strip()
       pa_ar = (id, rating, na_men, year, released, runtime, plot, country, poster)
       f_eld.append(pa_ar)
    o_ffen = open('insert_title.dat',"w")
    for  set in f_eld:
         o_ffen.writelines('''"%s"|"%s"|%2.2f|%d|%s|"%s"|"%s"|"%s"|"%s"|\n''' % (set[0],set[2],float(set[1]), int(set[3]), set[4], set[5], set[6], set[7], set[8]) )
    o_ffen.close()
    return open('insert_title.dat')


def parse_genre():
    schlu_ssel = list_genre().items()
    da_ten = open('a_g.json')
    in_nen = json.loads(da_ten.read())
    f_eld = list()
    for qu_enz in range(len(in_nen)):
       id = in_nen[qu_enz]['imdbID']
       for na_men in in_nen[qu_enz]['Genre'].split(','):
           for key, value in schlu_ssel:
               if value == na_men.strip():
                  pa_ar = (id, key)
           if pa_ar in f_eld or pa_ar[1]=='N/A':
                continue
           else:
              f_eld.append(pa_ar)
    o_ffen = open('insert_genre.dat',"w")
    for  set in f_eld:
         o_ffen.writelines('''"%s"|%d|\n''' % (set[0],int(set[1])) )
    o_ffen.close()
    return open('insert_genre.dat')





def list_actor():
    da_ten = open('a_g.json')
    in_nen = json.loads(da_ten.read())
    f_eld = list()
    for qu_enz in range(len(in_nen)):
       
       for na_men in in_nen[qu_enz]['Actors'].split(','):
             
             if na_men.strip() in f_eld:
                continue
             else:
                f_eld.append(na_men.strip())
    schlu_ssel = dict()
    for in_diz in range(len(f_eld)):
      schlu_ssel[str(in_diz+20000000)] = f_eld[in_diz]
    
    o_ffen = open('list_actor.dat',"w")
    for  key, value in schlu_ssel.items():
         o_ffen.writelines('''%d|"%s"|\n''' % (int(key), value) )
    o_ffen.close()
    return schlu_ssel

def list_director():
    da_ten = open('a_g.json')
    in_nen = json.loads(da_ten.read())
    f_eld = list()
    
    for qu_enz in range(len(in_nen)):
       
       for na_men in in_nen[qu_enz]['Director'].split(','):
             
             if na_men.strip() in f_eld:
                continue
             else:
                f_eld.append(na_men.strip())
    schlu_ssel = dict()
    for in_diz in range(len(f_eld)):
      schlu_ssel[str(in_diz+10000000)] = f_eld[in_diz]
    
    o_ffen = open('list_director.dat',"w")
    for  key, value in schlu_ssel.items():

         o_ffen.writelines('''%d|"%s"|\n''' % (int(key), value) )

    o_ffen.close()
    return schlu_ssel

def list_genre():
    da_ten = open('a_g.json')
    in_nen = json.loads(da_ten.read())
    f_eld = list()
    for qu_enz in range(len(in_nen)):
       
       for na_men in in_nen[qu_enz]['Genre'].split(','):
             
             if na_men.strip() in f_eld:
                continue
             else:
                f_eld.append(na_men.strip())
    schlu_ssel = dict()
    for in_diz in range(len(f_eld)):
      schlu_ssel[str(in_diz)] = f_eld[in_diz]
    
    o_ffen = open('list_genre.dat',"w")
    for  key, value in schlu_ssel.items():
         o_ffen.writelines('''%d|"%s"|\n''' % (int(key), value) )

    o_ffen.close()
    return schlu_ssel


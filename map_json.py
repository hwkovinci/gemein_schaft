import json

def r_eihe();
    
    

def parse_actor():
    da_ten = open('a_g.json')
    in_nen = json.loads(da_ten.read())
    schlu_ssel = 
    f_eld = list()
    for qu_enz in range(len(in_nen)):
       id = in_nen[qu_enz]['imdbID']
       for na_men in in_nen[qu_enz]['Actors'].split(','):
             pa_ar = (id, na_men.strip())
             if pa_ar in f_eld or pa_ar[1]=='N/A':
                continue
             else:
                f_eld.append(pa_ar)
    o_ffen = open('insert_actor.sql',"w")
    for  set in f_eld:
         o_ffen.writelines("insert into actor_set values (%s, %s);\n" % (set[0],set[1]) )
    o_ffen.close()
    return open('insert_actor.sql')


def parse_director():
    da_ten = open('a_g.json')
    in_nen = json.loads(da_ten.read())
    f_eld = list()
    for qu_enz in range(len(in_nen)):
       id = in_nen[qu_enz]['imdbID']
       for na_men in in_nen[qu_enz]['Director'].split(','):
             pa_ar = (id, na_men.strip())
             if pa_ar in f_eld or pa_ar[1]=='N/A':
                continue
             else:
                f_eld.append(pa_ar)
    o_ffen = open('insert_director.sql',"w")
    for  set in f_eld:
         o_ffen.writelines("insert into director_set values (%s, %s);\n" % (set[0],set[1]) )
    o_ffen.close()
    return open('insert_director.sql')



def parse_title():
    da_ten = open('a_g.json')
    in_nen = json.loads(da_ten.read())
    f_eld = list()
    for qu_enz in range(len(in_nen)):
       id = in_nen[qu_enz]['imdbID']
       for na_men in in_nen[qu_enz]['Title'].split(','):
             pa_ar = (id, na_men.strip())
             if pa_ar in f_eld or pa_ar[1]=='N/A':
                continue
             else:
                f_eld.append(pa_ar)
    o_ffen = open('insert_title.sql',"w")
    for  set in f_eld:
         o_ffen.writelines("insert into title_set values (%s, %s);\n" % (set[0],set[1]) )
    o_ffen.close()
    return open('insert_title.sql')


def parse_genre():
    da_ten = open('a_g.json')
    in_nen = json.loads(da_ten.read())
    f_eld = list()
    for qu_enz in range(len(in_nen)):
       id = in_nen[qu_enz]['imdbID']
       for na_men in in_nen[qu_enz]['Genre'].split(','):
             pa_ar = (id, na_men.strip())
             if pa_ar in f_eld or pa_ar[1]=='N/A':
                continue
             else:
                f_eld.append(pa_ar)
    o_ffen = open('insert_genre.sql',"w")
    for  set in f_eld:
         o_ffen.writelines("insert into genre_set values (%s, %s);\n" % (set[0],set[1]) )
    o_ffen.close()
    return open('insert_genre.sql')



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
      schlu_ssel[str(in_diz)] = f_eld[in_diz]
    
    o_ffen = open('list_actor.dat',"w")
    for  key, value in schlu_ssel.items():
         o_ffen.writelines('''%d|"%s"|\n''' % (int(key), value) )
    o_ffen.close()
    return open('list_actor.dat')

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
      schlu_ssel[str(in_diz)] = f_eld[in_diz]
    
    o_ffen = open('list_director.dat',"w")
    for  key, value in schlu_ssel.items():

         o_ffen.writelines('''%d|"%s"|\n''' % (int(key), value) )

    o_ffen.close()
    return open('list_director.dat')

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

       #  o_ffen.writelines("insert into genre_list values (%d, '%s');\n" % (int(key), value) )
    o_ffen.close()
    return open('list_genre.dat')

list_genre()
list_actor()
list_director()

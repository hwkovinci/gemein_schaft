import fur_db as fd
import parse_json as pj
import zeit_db as zd


import time
import json


#da_ten = open('a_g.json', encoding = 'utf-8')
#ag = fd.pruf_fung_(da_ten.read())
#da_ten.close()
#dt = open('a_g.json', 'w', encoding='utf-8')
#json.dump(ag, dt, indent =6)
#dt.close()
#print('gepruft')
#fd.fur_oracle()
#print('doppelt')
#zd.fur_dump()

ag = open('a_g.json', encoding = 'utf-8').read()

pj.parse_title(ag)
pj.parse_actor(ag)
pj.parse_director(ag)
pj.parse_genre(ag)
print('all unique set recorded')

 

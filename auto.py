import fur_db as fd
import parse_json as pj

import conf
import time
import json
import numpy as np
schritt = conf.BATCH_SIZE
qu_enz = 10000000/schritt
pro_zess = 15235
while  pro_zess >= 0 :
    f_eld = fd.get_json(pro_zess*schritt)
    fd.fur_dump(f_eld)
    print(pro_zess, '# batch complete')
    pro_zess = pro_zess -1
    time.sleep(1)


print('all batches completed')
print('json has been dumped')
#ag= open('a_g.json', encoding= 'utf-8').read()
#pj.parse_title(ag)
#pj.parse_actor(ag)
#pj.parse_director(ag)
#pj.parse_genre(ag)
#print('all unique set recorded')

 

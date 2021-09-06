import fur_db as fd
import parse_json as pj

import conf
import time

schritt = conf.BATCH_SIZE
qu_enz = 10000/schritt
pro_zess = 0
f_eld = list()
while  pro_zess < qu_enz:
    f_eld = f_eld + fd.get_json(pro_zess*schritt)
    print(len(f_eld), ' gross')
    fd.fur_oracle(pro_zess*schritt)
    print(pro_zess, '# batch complete')
    pro_zess += 1
    time.sleep(4)

print('all batches completed')
fd.fur_dump(f_eld)
print('json has been dumped')
pj.parse_title()
pj.parse_actor()
pj.parse_director()
pj.parse_genre()
print('all unique set recorded')

 

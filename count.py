a = open('insert_title.dat')
for line in a:
  b = line.split('|')
   
  for q in range (len(b)):
     print(len(bytes(b[q], 'utf-8')))
  print("fin--------------")
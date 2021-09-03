
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

a= mo_glich(1 , 5000)
for  in_diz in range(len(a)):
  print (a[in_diz])


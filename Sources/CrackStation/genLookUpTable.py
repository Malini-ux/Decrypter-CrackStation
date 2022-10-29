import hashlib
import string
import json
from pathlib import Path
from itertools import permutations, product
dict={}
lc=string.ascii_lowercase
uc=string.ascii_uppercase
digits="0123456789"
val=lc + uc + digits
result1 = [''.join(p) for p in permutations(val,1)]
#for result in product(list(val), repeat=2):
    #print(''.join(result))
result2 = ["".join(p) for p in product(list(val), repeat=2)]
final=result1 + result2
print(final)
for j in final:
    bt = bytes(j, 'utf-8')
    sha = hashlib.sha1()
    sha.update(bt)
    dict[sha.hexdigest()]=j
hashfile = json.dumps(dict)
file_path = Path(r"C:\Users\malin\SE\Ass\w6\CS\CrackStation\Sources\CrackStation\sha1.json")
with open(file_path,"w") as wr:
    wr.write(hashfile) 
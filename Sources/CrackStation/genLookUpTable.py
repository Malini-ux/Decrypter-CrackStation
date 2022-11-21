import hashlib
import string
import json
from pathlib import Path
from itertools import permutations, product
#import re
dict={}
lc=string.ascii_lowercase
uc=string.ascii_uppercase
digits="0123456789"
sym="?!"
val=lc + uc + digits + sym
print(val)
#Character length is 1
result1 = [''.join(p) for p in permutations(val,1)]
#Character length is 2
result2 = [''.join(p) for p in product(list(val), repeat=2)]
#Character length is 3
result3= [''.join(p) for p in product(list(val), repeat=3)]
final=result1 + result2 + result3
#final=result2+result1
#regexList = re.findall("[A-Za-z0-9?!]{1,3}",final)
print(final)
for j in final:
    bt = bytes(j, 'utf-8')
    sha1 = hashlib.sha1()
    sha2 = hashlib.sha256()
    sha1.update(bt)
    sha2.update(bt)
    dict[sha1.hexdigest()]=j
    dict[sha2.hexdigest()]=j
hashfile = json.dumps(dict)
file_path = Path(r"C:\Users\malin\SE\Ass\w9\CS\CrackStation\Sources\CrackStation\data.json")
with open(file_path,"w") as wr:
    wr.write(hashfile) 
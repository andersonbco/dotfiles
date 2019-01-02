from pathlib import Path
import os

home = os.getenv('HOME')
p = Path('.')

for x in p.iterdir():
    print(x.name)
    

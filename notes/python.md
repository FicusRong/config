# Server
```
python -m SimpleHTTPServer 7800
python3 -m http.server 7800

ssh -L 9999:localhost:9999 USER@SERVER
jupyter notebook --no-browser --port=9999
```


# Misc
```
# -*- coding: utf-8 -*- 

# list dir
import os
rootDir = 'C:\\zabbix\\'
def Test1(rootDir):
    for root,dirs,files in os.walk(rootDir):
        for filespath in files:
            print os.path.join(root,filespath)
```

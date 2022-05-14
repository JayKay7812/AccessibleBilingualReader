# -*- coding: utf-8 -*-
import sys
import uuid
import requests
import hashlib
import time
import json
from flask import jsonify
from imp import reload

import time

reload(sys)

YOUDAO_URL = 'https://openapi.youdao.com/api'
APP_KEY = '75467209b4e161cf'
APP_SECRET = 'JzmtIPaUm7FS1UHhHa0K0eaTqXeyTYWr'

def readfile(filedir):
    f = open(filedir,encoding="utf-8")
    content = f.read()
    return content

def encrypt(signStr):
    hash_algorithm = hashlib.sha256()
    hash_algorithm.update(signStr.encode('utf-8'))
    return hash_algorithm.hexdigest()


def truncate(q):
    if q is None:
        return None
    size = len(q)
    return q if size <= 20 else q[0:10] + str(size) + q[size - 10:size]


def do_request(data):
    headers = {'Content-Type': 'application/x-www-form-urlencoded'}
    return requests.post(YOUDAO_URL, data=data, headers=headers)


def connect():
    q = readfile('../upload/test.txt')

    data = {}
    data['from'] = 'zh'
    data['to'] = 'en'
    data['signType'] = 'v3'
    curtime = str(int(time.time()))
    data['curtime'] = curtime
    salt = str(uuid.uuid1())
    signStr = APP_KEY + truncate(q) + salt + curtime + APP_SECRET
    sign = encrypt(signStr)
    data['appKey'] = APP_KEY
    data['q'] = q
    data['salt'] = salt
    data['sign'] = sign
    data['vocabId'] = "您的用户词表ID"

    response = do_request(data)
    contentType = response.headers['Content-Type']
    if contentType == "audio/mp3":
        millis = int(round(time.time() * 1000))
        filePath = "合成的音频存储路径" + str(millis) + ".mp3"
        fo = open(filePath, 'wb')
        fo.write(response.content)
        fo.close()
    else:
        res = {
            "src":q,
            "tar":json.loads(response.text)['translation'][0]
        }
        print(res['tar'])
        return 0



if __name__ == '__main__':
    connect()






'''
AK="Qu58ScYoNzVRFZS8wR6isVNO"
SK="2xAlRpFWaWDr5qdKiOio8DPcU60Hntuw"


host = 'https://aip.baidubce.com/oauth/2.0/token?grant_type=client_credentials&client_id='+AK+'&client_secret='+SK
response = requests.get(host)
if response:
    res=response.json()
    token=res['access_token']
    print(token)


url = 'https://aip.baidubce.com/rpc/2.0/mt/texttrans/v1?access_token=24.bc2f52e667c2f9f231b80b836e94fe50.2592000.1650525959.282335-25815321'
'''
'''
q = readfile('../upload/test.txt')
url='http://api.yeekit.com/dotranslate.php'
from_lang = 'zh';
to_lang = 'fr';
app_kid = '623a8dace13d9'
app_key = 'd239d018a261ef21c9d8a05f95814e20'

# Build request
headers = {'Content-Type': 'application/json'}
payload = {'text': '卧槽什么怪东西，我遭不住了', 'from': 'zh', 'to': 'en', 'app_kid': app_kid, 'app_key':app_key}

# Send request
r = requests.post(url, params=payload, headers=headers)
#result = r.json()
print(r.text)

# Show response
#print(json.dumps(result, indent=4, ensure_ascii=False))
'''

# -*- coding: utf-8 -*-
from flask import Flask, make_response, request, render_template, redirect, url_for, jsonify
from flask_cors import *
from pypinyin import lazy_pinyin
from gevent import pywsgi
import json
import pymysql
from pymysql.converters import escape_string
import re
import os
import requests
import sys
import uuid
import hashlib
import time
import datetime
import random
#from imp import reload
from werkzeug.utils import secure_filename


#reload(sys)

def gen_http_result():
    res = {
        'status': 'ok',
        'msg': '',
        'data': []
    }
    return res

def make_resp(ret):
    resp = make_response(json.dumps(ret,ensure_ascii=False))
    resp.mimetype = 'application/json'
    resp.headers['Access-Control-Allow-Origin'] = '*'
    resp.headers['Content-Type']='application/json;charset=utf-8;'
    return resp

def cut_sent(para):
    para = re.sub('\n', r"", para)
    para = re.sub('([。！？\?\!])([^”’\"\'\)）])', r"\1\n\2", para)  # 单字符断句符
    para = re.sub('(\.+)([^”’\"\'\)）])', r"\1\n\2", para)  # 英文省略号
    para = re.sub('(…{2})([^”’\"\'\)）])', r"\1\n\2", para)  # 中文省略号
    para = re.sub('([\.+…{2}。！？\?\!][”’\"\'\)）])([^，。！？\?\!])', r'\1\n\2', para)
    para = para.rstrip()  # 去除段尾\n
    sentencelist=para.split("\n")
    tempstr=""
    for i in range(len(sentencelist)):
        if sentencelist[i][0]==" ":
            for j in range(1,len(sentencelist[i])):
                tempstr+=sentencelist[i][j]
            sentencelist[i]=tempstr
            tempstr=""
        print("1",sentencelist[i])
    return sentencelist

def readfile(filedir):
    f = open(filedir,encoding="utf-8")
    content = f.read()
    return content

YOUDAO_URL = 'https://openapi.youdao.com/api'
APP_KEY = '75467209b4e161cf'
APP_SECRET = 'JzmtIPaUm7FS1UHhHa0K0eaTqXeyTYWr'

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


def connectMT(srctxt, fromlan, tolan):
    q = srctxt

    data = {}
    data['from'] = fromlan
    data['to'] = tolan
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
    data['strict'] = "true"#严格遵循翻译方向设置

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
        tarSentence=res['tar']
        print("src:",q,"tar:",json.loads(response.text)['translation'])
        print("117",json.loads(response.text)['errorCode'])
        return res['tar']



#数据库参数
app = Flask(__name__, template_folder="../webpage")
CORS(app, supports_credentials=True)

host = "localhost"
port = 3306
user = "root"
passwd = "1234"
database = "accessible_reader"

@app.route('/upload', methods=['POST', 'GET'])
def upload():
    filename = request.values.get('fileName')
    filetype = request.values.get('typeradios')
    srclan = request.values.get('srcLan')
    tarlan = request.values.get('tarLan')
    ret = gen_http_result()
    db = pymysql.connect(host=host,user=user,password=passwd,database=database)
    cursor = db.cursor()
    sql = "INSERT INTO fileindex (file_name, file_type, file_lan, tar_lan) VALUES ('{}','{}','{}','{}');".format(escape_string(filename),filetype,srclan,tarlan)
    try:
       # 执行sql语句
       cursor.execute(sql)
       # 提交到数据库执行
       db.commit()
       # 最后插入行的主键id
       fileid=cursor.lastrowid
       # 最新插入行的主键id 注意，不适用于多线程
       #fileid = db.insert_id()
    except:
       # 如果发生错误则回滚
       db.rollback()
       print("sth wrong with the last sql query")
    f = request.files.get('srcFile')
    file_name=secure_filename(''.join(lazy_pinyin(f.filename)))
    random_num = random.randint(0,100)
    file_name = datetime.datetime.now().strftime('%Y%m%d%H%M%S')+"_"+str(random_num)+"."+file_name.split(".",1)[1]#为防止文件名重复导致上传失败引入随机变量和时
    if not os.path.exists("../upload"):#检查是否创建了upload目录
        os.makedirs("../upload",755)
    basedir = os.path.abspath(os.path.dirname(__file__))  # 当前文件所在路径
    upload_path = '../upload/'+file_name  #注意：没有的文件夹一定要先创建，不然会提示没有该路径
    print(upload_path)
    f.save(upload_path)
    #return redirect(url_for('upload'))
    #return render_template('upload.html')
    srcContent = readfile(upload_path)
    srcList = cut_sent(srcContent)
    print(srcList)
    if filetype=="srcntar":
        f1 = request.files.get('tarFile')
        file_name1=secure_filename(f1.filename)
        random_num1 = random.randint(0,100)
        file_name1 = datetime.datetime.now().strftime('%Y%m%d%H%M%S')+"_"+str(random_num1)+"."+file_name1.split('.',1)[1]#为防止文件名重复导致上传失败引入随机变量和时
        if not os.path.exists("../upload"):#检查是否创建了upload目录
            os.makedirs("../upload",755)
        upload_path1 = '../upload/'+file_name1  #注意：没有的文件夹一定要先创建，不然会提示没有该路径
        print(upload_path1)
        f1.save(upload_path1)
        #return redirect(url_for('upload'))
        #return render_template('upload.html')
        tarContent = readfile(upload_path1)
        tarList = cut_sent(tarContent)
        print(tarList)
        for i in range(len(srcList)):
            cursor1 = db.cursor()
            sql1 = "INSERT INTO sentencepool (sentence_sequence, sentence, sentence_type, file_id) VALUES ('{}','{}','{}','{}');".format(i,escape_string(srcList[i]),"src",fileid)
            try:
               # 执行sql语句
               cursor1.execute(sql1)
               # 提交到数据库执行
               db.commit()
            except:
               # 如果发生错误则回滚
               db.rollback()
               print("sth wrong with the last sql query")
        for j in range(len(tarList)):
            cursor2 = db.cursor()
            sql2 = "INSERT INTO sentencepool (sentence_sequence, sentence, sentence_type, file_id) VALUES ('{}','{}','{}','{}');".format(j,escape_string(tarList[j]),"tar",fileid)
            try:
               # 执行sql语句
               cursor2.execute(sql2)
               # 提交到数据库执行
               db.commit()
            except:
               # 如果发生错误则回滚
               db.rollback()
               print("sth wrong with the last sql query")
    elif filetype=="srconly":
        for i in range(len(srcList)):
            cursor1 = db.cursor()
            sql1 = "INSERT INTO sentencepool (sentence_sequence, sentence, sentence_type, file_id) VALUES ('{}','{}','{}','{}');".format(i,escape_string(srcList[i]),"src",fileid)
            try:
               # 执行sql语句
               cursor1.execute(sql1)
               # 提交到数据库执行
               db.commit()
            except:
               # 如果发生错误则回滚
               db.rollback()
               print("sth wrong with the last sql query")
            tarTemp=""
            tarTemp=connectMT(srcList[i], srclan, tarlan)
            print("NO.",i,tarTemp)
            cursor2 = db.cursor()
            sql2 = "INSERT INTO sentencepool (sentence_sequence, sentence, sentence_type, file_id) VALUES ('{}','{}','{}','{}');".format(i,escape_string(tarTemp),"tar",fileid)
            try:
               # 执行sql语句
               cursor2.execute(sql2)
               # 提交到数据库执行
               db.commit()
            except:
               # 如果发生错误则回滚
               db.rollback()
               print("sth wrong with the last sql query")
    return "success"

@app.route('/getAllList',methods=['GET']) #显示个人信息
def getAllList():
    ret = gen_http_result()
    db = pymysql.connect(host=host,user=user,password=passwd,database=database)
    cursor = db.cursor()
    sql = "select * from fileindex"
    cursor.execute(sql)
    result = cursor.fetchall()
    print(result)
    '''
    alllist=[]
    for i in range (len(result)):
        tempdata = {
            "FILE_ID":result[i][0],
            "FILE_NAME":result[i][1],
            "FILE_TYPE":result[i][2],
            "FILE_LAN":result[i][3],
            "TAR_LAN":result[i][4],
        }
        alllist.append(tempdata)
        tempdata={}
        print(alllist)
    '''
    db.close()
    ret['data']=result
    rsp = make_resp(ret)
    return rsp

@app.route('/getSearchList/<keyword>',methods=['GET']) #显示搜索结果
def getSearchList(keyword):
    ret = gen_http_result()
    db = pymysql.connect(host=host,user=user,password=passwd,database=database)
    cursor = db.cursor()
    sql = "select * from fileindex where file_name like '%{}%'".format(escape_string(keyword))
    cursor.execute(sql)
    result = cursor.fetchall()
    print(result)
    '''
    alllist=[]
    for i in range (len(result)):
        tempdata = {
            "FILE_ID":result[i][0],
            "FILE_NAME":result[i][1],
            "FILE_TYPE":result[i][2],
            "FILE_LAN":result[i][3],
            "TAR_LAN":result[i][4],
        }
        alllist.append(tempdata)
        tempdata={}
        print(alllist)
    '''
    db.close()
    ret['data']=result
    rsp = make_resp(ret)
    return rsp

@app.route('/getRowList/<fileid>',methods=['GET']) #显示个人信息
def getRowList(fileid):
    ret = gen_http_result()
    fileid = fileid
    db = pymysql.connect(host=host,user=user,password=passwd,database=database)
    #获取源文本列表
    cursor1 = db.cursor()
    sql1 = "select * from sentencepool where sentence_type='src' and file_id="+fileid
    cursor1.execute(sql1)
    srcresult = cursor1.fetchall()
    #获取目标文本列表
    cursor2 = db.cursor()
    sql2 = "select * from sentencepool where sentence_type='tar' and file_id="+fileid
    cursor2.execute(sql2)
    tarresult = cursor2.fetchall()
    print("result1:",srcresult)
    print("result2:",tarresult)
    '''
    alllist=[]
    for i in range (len(result)):
        tempdata = {
            "FILE_ID":result[i][0],
            "FILE_NAME":result[i][1],
            "FILE_TYPE":result[i][2],
            "FILE_LAN":result[i][3],
            "TAR_LAN":result[i][4],
        }
        alllist.append(tempdata)
        tempdata={}
        print(alllist)

    if len(srcresult)<=len(tarresult):
        for i in range len(srcresult):
            '''
    db.close()
    ret['data'].append(srcresult)
    ret['data'].append(tarresult)
    print("ret: ",ret)
    rsp = make_resp(ret)
    return rsp

if __name__ == '__main__':
    server = pywsgi.WSGIServer(('0.0.0.0',5000),app)
    server.serve_forever()
    app.run(debug=True)

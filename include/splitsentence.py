#coding=utf-8
import re

def readfile(filedir):
    f = open(filedir,encoding="utf-8")
    content = f.read()
    return content
'''
def cut_sent(text):
    paralist=text.split("\n")
    print("paralist:",paralist)
    sentencelist=[]
    tempsentencelist=[]
    for i in range (len(paralist)):
        paralist[i] = re.sub('([。！？\?\!])([^”’])', r"\1\n\2", paralist[i])  # 单字符断句符
        print("no1.",paralist[i])
        paralist[i] = re.sub('(\.+)([^”’])', r"\1\n\2", paralist[i])  # 英文省略号
        print("no2.",paralist[i])
        paralist[i] = re.sub('(\…{2})([^”’])', r"\1\n\2", paralist[i])  # 中文省略号
        print("no3.",paralist[i])
        paralist[i] = re.sub('([。！？\?\!][”’])([^，。！？\?\!])', r'\1\n\2', paralist[i])
        print("no4.",paralist[i])
        # 如果双引号前有终止符，那么双引号才是句子的终点，把分句符\n放到双引号后，注意前面的几句都小心保留了双引号
        paralist[i] = paralist[i].rstrip()  # 段尾如果有多余的\n就去掉它
        # 很多规则中会考虑分号;，但是这里我把它忽略不计，破折号、英文双引号等同样忽略，需要的再做些简单调整即可。
        tempsentencelist=text.split("\n")
        print(tempsentencelist)

        for j in range (len(tempsentencelist)):
            tempstr=""

            if tempsentencelist[j][0]==" ":
                for k in range(1,len(sentencelist[i])):
                    tempstr+=sentencelist[i][k]
                tempsentencelist[j]=tempstr
                tempstr=""

            sentencelist.append(tempsentencelist[j])
        tempsentencelist=[]

    for a in range(len(sentencelist)):
        print("final:",a,sentencelist[a])
    return sentencelist
'''

def cut_sent(para):
    para = re.sub('\n', r"", para)
    print("1",para)
    para = re.sub('([。！？\?\!])([^”’\"\'\)）])', r"\1\n\2", para)  # 单字符断句符
    print("2",para)
    para = re.sub('(\.+)([^”’\"\'\)）])', r"\1\n\2", para)  # 英文省略号
    print("3",para)
    para = re.sub('(…{2})([^”’\"\'\)）])', r"\1\n\2", para)  # 中文省略号
    print("4",para)
    para = re.sub('([\.+…{2}。！？\?\!][”’\"\'\)）])([^，。！？\?\!])', r'\1\n\2', para)
    print("5",para)
    para = para.rstrip()  # 去除段尾\n
    # 很多规则中会考虑分号;，但是这里我把它忽略不计，破折号、英文双引号等同样忽略，需要的再做些简单调整即可。
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
cut_sent(readfile("../upload/test.txt"))

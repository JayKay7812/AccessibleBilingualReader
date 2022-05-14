from pymysql import escape_string
sql = "INSERT INTO sentencepool (sentence_sequence, sentence, sentence_type, file_id) VALUES ('{}','{}','{}','{}');".format(i,tarTemp,"tar",fileid)
sql = escape_string(sql)


from pypinyin import lazy_pinyin
file_name=secure_filename(''.join(lazy_pinyin(f.filename))

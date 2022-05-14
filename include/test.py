elif filetype=="srconly":
    for i in range(len(srcList)):
        cursor1 = db.cursor()
        sql1 = "INSERT INTO sentencepool (sentence_sequence, sentence, sentence_type, file_id) VALUES ('{}','{}','{}','{}');".format(i,srcList[i],"src",fileid)
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
        sql2 = "INSERT INTO sentencepool (sentence_sequence, sentence, sentence_type, file_id) VALUES ('{}','{}','{}','{}');".format(i,tarTemp,"tar",fileid)
        try:
           # 执行sql语句
           cursor2.execute(sql2)
           # 提交到数据库执行
           db.commit()
        except:
           # 如果发生错误则回滚
           db.rollback()
           print("sth wrong with the last sql query")



f = request.files.get('srcFile')
file_name=secure_filename(f.filename)
print("file_name:",file_name)
random_num = random.randint(0,100)
#Introduce time and a random value to creat a unique file name.
file_name = datetime.datetime.now().strftime('%Y%m%d%H%M%S')+"_"+str(random_num)+"."+file_name.split(".",1)[1]
#Check if there is an "upload" directory in the project folder. If no, create one.
if not os.path.exists("../upload"):
  os.makedirs("../upload",755)
#Get directory of teh current file "backend.py"
basedir = os.path.abspath(os.path.dirname(__file__))
#Combine the "upload" directory with file_name to make the saving path of the new file.
upload_path = '../upload/'+file_name
print(upload_path)
f.save(upload_path)

$("#accc").removeClass("d-none");
$(document).on('mouseenter.ccitem', speakTags, function (e) {
        var $target = $(e.target);
        console.log(getText(e.target));
        // 开始朗读
        $("#cccontent").text(getText(e.target));
    });
$(document).on('focus.ccitem', speakTags, function (e) {
        var $target = $(e.target);
        console.log(getText(e.target));
        // 开始朗读
        $("#cccontent").text(getText(e.target));
    });

$(document).on('mouseenter.speakitem', speakTags, function (e) {
        var $target = $(e.target);
        // 开始朗读
        speakText(getText(e.target));
    });
$(document).on('focus.speakitem', speakTags, function (e) {
        var $target = $(e.target);
        // 开始朗读
        speakText(getText(e.target));
    });
var speakTags = 'a, p, span, h1, h2, h3, h4, h5, h6, img, input, button, label, select';
var tagTextConfig = {
  'a': '链接',
  'input[text]': '文本输入框',
  'button': '按钮',
  'img': '图片',
  'select': '下拉菜单',
};
function getTagText(el) {
    if (!el) return '';
    var tagName = el.tagName.toLowerCase();
    // 处理input等多属性元素
    switch (tagName) {
        case 'input':
            tagName += '[' + el.type + ']';
            break;
        default:
            break;
    }

    return (tagTextConfig[tagName] || '') + ' ';
}
function getText(el) {
  if (!el) return '';
  if ($(el).is("select")){
    return getTagText(el) + ($(el).children("option:checked").text());
  }
  else {
    return getTagText(el) + (el.title || el.alt || el.innerText || '');
  }
}

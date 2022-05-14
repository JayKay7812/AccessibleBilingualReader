function getAllList() {
  console.log("1");
    $.ajax({
        type: "GET",
        url: "http://192.168.1.5:5000/getAllList",
        contentType : false,
		    processData: false,
        success: function (res) {
            console.log(res);
            if(res){
              console.log("yes");
              var allfilelist = res['data'];
              var appendHtml = '';
              for(var i = 0; i < allfilelist.length; i++){
                  var ret = allfilelist[i];
                  var html_template = "<div class=\"card\"><div class=\"card-header\">语料id：{0}</div><div class=\"card-body\"><h5 class=\"card-title\">语料名：{1}</h5><p class=\"card-text\">语料类型：{2}</p><p class=\"card-text\">源语言：{3}</p><p class=\"card-text\">目标语言：{4}</p><a href=\"reader.html?id={5}\" class=\"btn btn-primary\">开始阅读</a></div></div>"
                  console.log(html_template);
                  appendHtml += $.validator.format(html_template, ret[0], ret[1], ret[2], ret[3], ret[4], ret[0]);
                  //console.log(appendHtml);
              }
              $("#cardlist").html(appendHtml);
          }
        }
    });
    return false;
}

function getSearchList() {
    var keyword=$("#keyword").val();
    $.ajax({
        type: "GET",
        url: "http://192.168.1.5:5000/getSearchList/"+keyword,
        contentType : false,
		    processData: false,
        success: function (res) {
            console.log(res);
            if(res){
              var searchlist = res['data'];
              var appendHtml = '';
              for(var i = 0; i < searchlist.length; i++){
                var ret = searchlist[i];
                var html_template = "<div class=\"card\"><div class=\"card-header\">语料id：{0}</div><div class=\"card-body\"><h5 class=\"card-title\">语料名：{1}</h5><p class=\"card-text\">语料类型：{2}</p><p class=\"card-text\">源语言：{3}</p><p class=\"card-text\">目标语言：{4}</p><a href=\"reader.html?id={5}\" class=\"btn btn-primary\">开始阅读</a></div></div>"
                console.log(html_template);
                appendHtml += $.validator.format(html_template, ret[0], ret[1], ret[2], ret[3], ret[4], ret[0]);
                console.log(appendHtml);
              }
              $("#cardlist").html(appendHtml);
          }
        }
    });
    return false;
}

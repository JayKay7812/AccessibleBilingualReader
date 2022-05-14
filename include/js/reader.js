function getQueryVariable(variable)
{
       var query = window.location.search.substring(1);
       var vars = query.split("&");
       for (var i=0;i<vars.length;i++) {
               var pair = vars[i].split("=");
               if(pair[0] == variable){return pair[1];}
       }
       return(false);
}

var fileid = getQueryVariable("id");

function getRowList() {
    $.ajax({
        type: "GET",
        url: "http://192.168.1.5:5000/getRowList/"+fileid,
        contentType : false,
		    processData: false,
        success: function (res) {
            console.log(res);
            if(res){
              console.log("yes");
              var srclist = res['data'][0];
              var tarlist = res['data'][1];
              var appendHtml = '';
              var srclistindex = srclist.length;
              var tarlistindex = tarlist.length;
              if (srclistindex<tarlistindex){
                for(var i = 0; i < tarlistindex; i++){
                  if(i<srclistindex){
                    var srcrow = srclist[i];
                    var tarrow = tarlist[i];
                    var html_template = $("#rowtemplate").html();
                    console.log(srcrow);
                    console.log(tarrow);
                    console.log(html_template);
                    appendHtml += $.validator.format(html_template, i, srcrow[2], tarrow[2]);
                  }
                  else if(i>srclistindex && i<=tarlistindex){
                    var srcrow = "";
                    var tarrow = tarlist[i];
                    var html_template = $("#rowtemplate").html();
                    console.log(html_template);
                    appendHtml += $.validator.format(html_template, i, srcrow, tarrow[2]);
                  }
                  //console.log(appendHtml);
                }
              }
              else if (srclistindex>=tarlistindex){
                for(var i = 0; i < srclistindex; i++){
                  if(i<=tarlistindex){
                    var srcrow = srclist[i];
                    var tarrow = tarlist[i];
                    var html_template = $("#rowtemplate").html();
                    console.log(html_template);
                    console.log(srcrow);
                    console.log(tarrow);
                    appendHtml += $.validator.format(html_template, i, srcrow[2], tarrow[2]);
                  }
                  else if(i>tarlistindex && i<=srclistindex){
                    var srcrow = srclist[i];
                    var tarrow = "";
                    var html_template = $("#rowtemplate").html();
                    console.log(html_template);
                    appendHtml += $.validator.format(html_template, i, srcrow[2], tarrow);
                  }
                  //console.log(appendHtml);
                }
              }

              $("#rowtemplate").html(appendHtml);
          }
        }
    });
    return false;
}

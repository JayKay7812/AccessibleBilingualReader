function toggleType(){
  if ($("[name='typeradios']:eq(0)").prop("checked")){
    $("#tarfilesection").prop("hidden",true);
    console.log("1");
  } else if($("[name='typeradios']:eq(1)").prop("checked")){
    $("#tarfilesection").prop("hidden",false);
    console.log("2");
  }
}

function getForm() {
    var form = new FormData(document.getElementById('uploadForm1'));
    $.ajax({
        type: "POST",
        url: "http://192.168.1.5:5000/upload",
        data: form,
        contentType : false,
		    processData: false,
        success: function (res) {
            console.log(res);
            alert("你的文件已经上传！");
        }
    });
    return false;
}

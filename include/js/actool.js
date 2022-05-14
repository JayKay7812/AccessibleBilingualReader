var displayswitch=window.sessionStorage.getItem("displayswitch");
var pbrswitch=window.sessionStorage.getItem("pbrswitch");
var cursorswitch=window.sessionStorage.getItem("cursorswitch");
var fontswitch=window.sessionStorage.getItem("fontswitch");
var muteswitch=window.sessionStorage.getItem("muteswitch");
var ccswitch=window.sessionStorage.getItem("ccswitch");
var speakswitch=window.sessionStorage.getItem("speakswitch");
var modeswitch=window.sessionStorage.getItem("modeswitch");
var skipswitch=window.sessionStorage.getItem("skipswitch");
var colorswitch=window.sessionStorage.getItem("colorswitch");

//页面加载检查项 切换页面时确保辅助功能继续运行
function acSwitchCheck(){
  //辅助功能条显示检查
  if (displayswitch==1 && $("#actoolbar").hasClass("d-none")){
    $("#actoolbar").removeClass("d-none");
    $("#actoolbarspace").removeClass("d-none");
    //$("#actoolbarspace").addClass("py-3");
    console.log(displayswitch);
    console.log("b");
  }
  else if (displayswitch==0 || displayswitch==null && !$("#actoolbar").hasClass("d-none")){
    $("#actoolbar").addClass("d-none");
    $("#actoolbarspace").addClass("d-none");
    //$("#actoolbarspace").removeClass("py-3");
    console.log(displayswitch);
    console.log("d");
  }
  //字体切换状态检查
  if (fontswitch==1 && !($("body").css("font-size")=="30px !important")){
    $('body').css("cssText","font-size:30px !important");
    console.log(fontswitch);
    console.log("b");
  }
  else if (displayswitch==0 || displayswitch==null && ($("body").css("font-size")=="30px")){
    $('body').css("cssText","font-size:");
    console.log(fontswitch);
    console.log("d");
  }
  //光标样式状态检查
  if (cursorswitch==1 && ($("body").css("cursor")=="auto")){
    console.log($("body").css("cursor"));
    $('body').css("cursor","url(https://www.zhihu.com/wza/public/theme/1/images/allaw.cur),auto");
    console.log($("body").css("cursor"));
    console.log(cursorswitch);
    console.log("b");
  }
  else if (cursorswitch==0 || cursorswitch==null && !($("body").css("cursor")=="auto")){
    $('body').css("cursor","auto");
    console.log(cursorswitch);
    console.log("d");
  }
  //大字幕显示检查
  if (ccswitch==1 && $("#accc").hasClass("d-none")){
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
    console.log(ccswitch);
    console.log("cc b");
  }
  else if (ccswitch==0 || ccswitch==null && !$("#accc").hasClass("d-none")){
    $("#accc").addClass("d-none");
    $(document).off('mouseenter.ccitem', speakTags);
    $(document).off('focus.ccitem', speakTags);
    console.log(ccswitch);
    console.log("cc d");
  }
  //朗读开关状态检查
  if (speakswitch==1){
    $(speakTags).attr("tabindex","0");
    console.log($(speakTags).attr("tabindex"));
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
    console.log(speakswitch);
    console.log("speak b");
  }
  else if (speakswitch==0 || speakswitch==null){
    console.log($(speakTags).attr("tabindex"));
    $(speakTags).removeAttr("tabindex");
    $(document).off('mouseenter.speakitem', speakTags);
    $(document).off('focus.speakitem', speakTags);
    console.log(speakswitch);
    console.log("speak d");
  }
  //朗读语速状态检查 五档切换
  if (pbrswitch==1 || pbrswitch==null){
    $("#pbrimg").attr("src","http://localhost/Accessible%20Bilingual%20Reader/assets/img/pbr1.0.svg");
    $("#pbrimg").attr("alt","朗读语速,当前为1.0倍速");
    //$("#actoolbarspace").addClass("py-3");
    pbrswitch=1;
    console.log(pbrswitch);
    console.log("pbr 1.0");
  }
  else if (pbrswitch==1.5){
    $("#pbrimg").attr("src","http://localhost/Accessible%20Bilingual%20Reader/assets/img/pbr1.5.svg");
    $("#pbrimg").attr("alt","朗读语速,当前为1.5倍速");
    //$("#actoolbarspace").removeClass("py-3");
    pbrswitch=window.sessionStorage.getItem("pbrswitch");
    console.log(pbrswitch);
    console.log("pbr 1.5");
  }
  else if (pbrswitch==2){
    $("#pbrimg").attr("src","http://localhost/Accessible%20Bilingual%20Reader/assets/img/pbr2.0.svg");
    $("#pbrimg").attr("alt","朗读语速,当前为2.0倍速");
    pbrswitch=window.sessionStorage.getItem("pbrswitch");
    console.log(pbrswitch);
    console.log("pbr 2.0");
  }
  else if (pbrswitch==2.5){
    $("#pbrimg").attr("src","http://localhost/Accessible%20Bilingual%20Reader/assets/img/pbr2.5.svg");
    $("#pbrimg").attr("alt","朗读语速,当前为2.5倍速");
    pbrswitch=window.sessionStorage.getItem("pbrswitch");
    console.log(pbrswitch);
    console.log("pbr 2.5");
  }
  else if (pbrswitch==3){
    $("#pbrimg").attr("src","http://localhost/Accessible%20Bilingual%20Reader/assets/img/pbr3.0.svg");
    $("#pbrimg").attr("alt","朗读语速,当前为3.0倍速");
    pbrswitch=window.sessionStorage.getItem("pbrswitch");
    console.log(pbrswitch);
    console.log("pbr 3");
  }
  //跳过导航栏开关检查
  if (skipswitch==1){
    $('main').find(speakTags)[0].focus();
    console.log(skipswitch);
    console.log("a");
  }
  else if (skipswitch==0 || skipswitch==null){
    console.log(skipswitch);
    console.log("c");
  }
  //文字配色状态检查
  if (colorswitch==1){
    $(speakTags).css({"background-color":"white","color":"black"});
    console.log(colorswitch);
    console.log("color b");
  }
  else if (colorswitch==0 || colorswitch==null){
    $(speakTags).css({"background-color":"","color":""});
    console.log(colorswitch);
    console.log("color d");
  }
  //朗读模式状态检查
  if (modeswitch==1){
    console.log("modeswitch is 1");
    for (var i=0, len=$(splitTags).length; i<len; i++){
      console.log(len);
      temparry=[];
      console.log($(splitTags)[i]);
      text=$(splitTags).eq(i).text().trim();
      tempchildren=$(splitTags).eq(i).children();
      console.log(text);
      for( var j = 0, len1 = text.length; j < len1; j++ ) {
        //console.log(text[j]);
        temparry[j] = '<span id="charsplit">' + text[j] + '</span>';
        //console.log(temparry[j]);
      }
      $(splitTags).eq(i).html(temparry.join("")).prepend(tempchildren);
    }
    $("span").attr("tabindex","0");
    console.log(modeswitch);
    console.log("mode b");
  }
  else if (modeswitch==0){
    for (var i=0, len=$(splitTags).length; i<len; i++){
      temptext="";
      //console.log($(splitTags).eq(i).children());
      chararray=$(splitTags).eq(i).children("span#charsplit");
      //console.log(chararray);
      console.log($(splitTags).eq(i).children().not("span#charsplit"));
      tempchildren1=$(splitTags).eq(i).children().not("span#charsplit");
      //console.log(chararray);
      temptext=$(splitTags).eq(i).text();
      console.log(tempchildren1);
      $(splitTags).eq(i).html("");
      $(splitTags).eq(i).text(temptext);
      $(splitTags).eq(i).prepend(tempchildren1);
    }
    console.log(modeswitch);
    console.log("mode d");
  }
}

function acDisplaySwitch() {
  if (displayswitch==0 || displayswitch==null && $("#actoolbar").hasClass("d-none")){
    $("#actoolbar").removeClass("d-none");
    $("#actoolbarspace").removeClass("d-none");
    //$("#actoolbarspace").addClass("py-3");
    window.sessionStorage.setItem("displayswitch",1);
    displayswitch=window.sessionStorage.getItem("displayswitch");
    console.log(displayswitch);
    console.log("a");
  }
  else if (displayswitch==1 && !$("#actoolbar").hasClass("d-none")){
    $("#actoolbar").addClass("d-none");
    $("#actoolbarspace").addClass("d-none");
    //$("#actoolbarspace").removeClass("py-3");
    window.sessionStorage.setItem("displayswitch",0);
    displayswitch=window.sessionStorage.getItem("displayswitch");
    console.log(displayswitch);
    console.log("c");
  }
}

function acPbrSwitch(){
  if (pbrswitch==1 || pbrswitch==null){
    $("#pbrimg").attr("src","http://localhost/Accessible%20Bilingual%20Reader/assets/img/pbr1.5.svg");
    $("#pbrimg").attr("alt","朗读语速,当前为1.5倍速");
    //$("#actoolbarspace").addClass("py-3");
    window.sessionStorage.setItem("pbrswitch",1.5);
    pbrswitch=window.sessionStorage.getItem("pbrswitch");
    console.log(pbrswitch);
    console.log("pbr 1.5");
  }
  else if (pbrswitch==1.5){
    $("#pbrimg").attr("src","http://localhost/Accessible%20Bilingual%20Reader/assets/img/pbr2.0.svg");
    $("#pbrimg").attr("alt","朗读语速,当前为2.0倍速");
    //$("#actoolbarspace").removeClass("py-3");
    window.sessionStorage.setItem("pbrswitch",2);
    pbrswitch=window.sessionStorage.getItem("pbrswitch");
    console.log(pbrswitch);
    console.log("pbr 2");
  }
  else if (pbrswitch==2){
    $("#pbrimg").attr("src","http://localhost/Accessible%20Bilingual%20Reader/assets/img/pbr2.5.svg");
    $("#pbrimg").attr("alt","朗读语速,当前为2.5倍速");
    //$("#actoolbarspace").removeClass("py-3");
    window.sessionStorage.setItem("pbrswitch",2.5);
    pbrswitch=window.sessionStorage.getItem("pbrswitch");
    console.log(pbrswitch);
    console.log("pbr 2.5");
  }
  else if (pbrswitch==2.5){
    $("#pbrimg").attr("src","http://localhost/Accessible%20Bilingual%20Reader/assets/img/pbr3.0.svg");
    $("#pbrimg").attr("alt","朗读语速,当前为3.0倍速");
    //$("#actoolbarspace").removeClass("py-3");
    window.sessionStorage.setItem("pbrswitch",3);
    pbrswitch=window.sessionStorage.getItem("pbrswitch");
    console.log(pbrswitch);
    console.log("pbr 3");
  }
  else if (pbrswitch==3){
    $("#pbrimg").attr("src","http://localhost/Accessible%20Bilingual%20Reader/assets/img/pbr1.0.svg");
    $("#pbrimg").attr("alt","朗读语速,当前为1.0倍速");
    //$("#actoolbarspace").removeClass("py-3");
    window.sessionStorage.setItem("pbrswitch",1);
    pbrswitch=window.sessionStorage.getItem("pbrswitch");
    console.log(pbrswitch);
    console.log("pbr 1");
  }
}

function acCursorSwitch(){
  console.log($("body").css("cursor"));
  if (cursorswitch==0 || cursorswitch==null && ($("body").css("cursor")=="auto")){
    $('body').css("cursor",'url(https://www.zhihu.com/wza/public/theme/1/images/allaw.cur),auto');
    window.sessionStorage.setItem("cursorswitch",1);
    cursorswitch=window.sessionStorage.getItem("cursorswitch");
    console.log(cursorswitch);
    console.log("a");
    console.log($("body").css("cursor"));
  }
  else if (cursorswitch==1 && !($("body").css("cursor")=="auto")){
    $('body').css("cursor","auto");
    window.sessionStorage.setItem("cursorswitch",0);
    cursorswitch=window.sessionStorage.getItem("cursorswitch");
    console.log(cursorswitch);
    console.log("c");
  }
  return 0;
}

function acFontSwitch(){
  if (fontswitch==0 || fontswitch==null && !($("body").css("font-size")=="30px")){
    $(speakTags).css("cssText","font-size:30px !important");
    window.sessionStorage.setItem("fontswitch",1);
    fontswitch=window.sessionStorage.getItem("fontswitch");
    console.log(fontswitch);
    console.log("a");
    console.log($("body").css("font-size"));
  }
  else if (fontswitch==1){
    $(speakTags).css("cssText","font-size:");
    window.sessionStorage.setItem("fontswitch",0);
    fontswitch=window.sessionStorage.getItem("fontswitch");
    console.log(fontswitch);
    console.log("c");
  }
  return 0;
}

function acColorSwitch(){
  if (colorswitch==0 || colorswitch==null){
    $(speakTags).css({"background-color":"white","color":"black"});
    window.sessionStorage.setItem("colorswitch",1);
    colorswitch=window.sessionStorage.getItem("colorswitch");
    console.log(colorswitch);
    console.log("color a");
  }
  else if (colorswitch==1){
    $(speakTags).css({"background-color":"","color":""});
    window.sessionStorage.setItem("colorswitch",0);
    colorswitch=window.sessionStorage.getItem("colorswitch");
    console.log(colorswitch);
    console.log("color c");
  }
  return 0;
}

function acSkipSwitch(){
  console.log($('main').find(speakTags)[0]);
  if (skipswitch==0 || skipswitch==null){
    $('main').find(speakTags)[0].focus();
    window.sessionStorage.setItem("skipswitch",1);
    skipswitch=window.sessionStorage.getItem("skipswitch");
    console.log(skipswitch);
    console.log("a");
  }
  else if (skipswitch==1){
    $('main').find(speakTags)[0].focus();
    window.sessionStorage.setItem("skipswitch",0);
    skipswitch=window.sessionStorage.getItem("skipswitch");
    console.log(skipswitch);
    console.log("c");
  }
}

// 非正文需要朗读的标签 逗号分隔
var speakTags = 'a, p, span, h1, h2, h3, h4, h5, h6, img, input, button, label, select';
var splitTags = 'a, p, h1, h2, h3, h4, h5, h6, input, button, label, select';
// 标签朗读文本
var tagTextConfig = {
  'a': '链接',
  'input[text]': '文本输入框',
  'input[search]': '搜索输入框',
  'button': '按钮',
  'img': '图片',
  'select': '下拉菜单',
};
var speaker = new window.SpeechSynthesisUtterance();
var speakTimer, stopTimer;
var i;
// 开始朗读
function speakText(text) {
  clearTimeout(speakTimer);
  window.speechSynthesis.cancel();
    speakTimer = setTimeout(function () {
    speaker.text = text;
    speaker.lang = "zh-CN";
    speaker.rate = pbrswitch;
    window.speechSynthesis.speak(speaker);
    }, 200);
}

function stopSpeak() {
  clearTimeout(stopTimer);
  clearTimeout(speakTimer);
  stopTimer = setTimeout(function () {
    window.speechSynthesis.cancel();
  }, 100);
}
/**
 * 获取完整朗读文本
 * @param {HTMLElement} el 要处理的HTMLElement
 * @returns {String}   朗读文本
 */
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

function acSpeakSwitch(){
  if (speakswitch==0 || speakswitch==null){
    console.log();
    $(speakTags).attr("tabindex","0");
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
    //console.log($(window.frames["dictHcContent"].document));
    window.sessionStorage.setItem("speakswitch",1);
    speakswitch=window.sessionStorage.getItem("speakswitch");
    console.log(speakswitch);
    console.log("speak a");
  }
  else if (speakswitch==1 && ($(speakTags).attr("tabindex")=='0')){
    console.log($(speakTags).attr("tabindex"));
    $(speakTags).removeAttr("tabindex");
    $(document).off('mouseenter.speakitem', speakTags);
    $(document).off('focus.speakitem', speakTags);
    window.sessionStorage.setItem("speakswitch",0);
    speakswitch=window.sessionStorage.getItem("speakswitch");
    console.log(speakswitch);
    console.log("speak c");
  }
}

function acCCSwitch(){
  if (ccswitch==0 || ccswitch==null && $("#accc").hasClass("d-none")){
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
    window.sessionStorage.setItem("ccswitch",1);
    ccswitch=window.sessionStorage.getItem("ccswitch");
    console.log(ccswitch);
    console.log("cc a");
  }
  else if (ccswitch==1 && !$("#accc").hasClass("d-none")){
    $("#accc").addClass("d-none");
    $("#cccontent").text();
    $(document).off('mouseenter.ccitem', speakTags);
    $(document).off('focus.ccitem', speakTags);
    window.sessionStorage.setItem("ccswitch",0);
    ccswitch=window.sessionStorage.getItem("ccswitch");
    console.log(ccswitch);
    console.log("cc c");
  }
}

function acModeSwitch(){
  if (modeswitch==0 || modeswitch==null){
    for (var i=0, len=$(splitTags).length; i<len; i++){
      console.log(len);
      temparry=[];
      console.log($(splitTags)[i]);
      text=$(splitTags).eq(i).text().trim();
      tempchildren=$(splitTags).eq(i).children();
      console.log(text);
      for( var j = 0, len1 = text.length; j < len1; j++ ) {
        //console.log(text[j]);
        temparry[j] = '<span id="charsplit">' + text[j] + '</span>';
        //console.log(temparry[j]);
      }
      $(splitTags).eq(i).html(temparry.join("")).prepend(tempchildren);
    }
    $("span").attr("tabindex","0");
    window.sessionStorage.setItem("modeswitch",1);
    modeswitch=window.sessionStorage.getItem("modeswitch");
    console.log(modeswitch);
    console.log("mode a");
  }
  else if (modeswitch==1){
    for (var i=0, len=$(splitTags).length; i<len; i++){
      temptext="";
      //console.log($(splitTags).eq(i).children());
      chararray=$(splitTags).eq(i).children("span#charsplit");
      //console.log(chararray);
      console.log($(splitTags).eq(i).children().not("span#charsplit"));
      tempchildren1=$(splitTags).eq(i).children().not("span#charsplit");
      //console.log(chararray);
      temptext=$(splitTags).eq(i).text();
      console.log(tempchildren1);
      $(splitTags).eq(i).html("");
      $(splitTags).eq(i).text(temptext);
      $(splitTags).eq(i).prepend(tempchildren1);
    }
    window.sessionStorage.setItem("modeswitch",0);
    modeswitch=window.sessionStorage.getItem("modeswitch");
    console.log(modeswitch);
    console.log("mode c");
  }

}

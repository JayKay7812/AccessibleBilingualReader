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

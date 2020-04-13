/*
 * j.switchBg.js
 * 首页切换背景大图功能
 * author : zk
 * modifier: binwu
 * date : 2013/12/16
 * 
 */
var _cemvc = _cemvc || [];
(function switchBg($target)
{
    var template = '<ul class="bjqs"><json:for select="."><li title={{.name}} style="background:url({{.img}}) top center no-repeat;" onclick="window.open(\'{{.link}}\')"></li></json:for></ul>';
    _cemvc.push(["JSONView", {"json": slideParam, "format": template}, function (sHtml)
    {
        $target.html(sHtml);
        $.getScript("http://easternmiles.ceair.com/resource3/js/home-slider/slider.js");
    }]);
})($('#home-slider'));
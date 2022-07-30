$(function() {
    //	鎼滅储妗�
    var inputEl = $('.text'),
        defVal = inputEl.val();
    inputEl.bind({
        focus: function() {
            var _this = $(this);
            if (_this.val() == defVal) {
                _this.val('');
            }
        },
        blur: function() {
            var _this = $(this);
            if (_this.val() == '') {
                _this.val(defVal);
            }
        }
    });

    //瀵艰埅
    $(".nav li").hover(function() {
        //$(this).find("a").css("color","#fff")
        $(this).find(".submenu").show();
    }, function() {
        //$(this).find("a").css("color","#333")
        $(this).find(".submenu").hide();
    })
})	
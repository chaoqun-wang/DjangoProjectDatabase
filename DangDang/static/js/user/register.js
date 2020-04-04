$(function () {
    // 设置请求头
    $.ajaxSetup({
        headers: {"X-CSRFToken": "{{ csrf_token }}"},
    });


    let flag_username = false;

    function check_username(username) {
        $.ajax({
            type: "POST",
            url: "/user/register_logic/",
            data: "username=" + username,
            success: function (msg) {

            }
        })
    }

    $('#txt_username').blur(function () {
        let username = $('#txt_username').val();
        let span_username_ok = $('#spn_username_ok');
        let re_phone = /^1[3456789]\d{9}$/;
        let re_email = /^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/;
        if (/^[0-9]*$/.test(username)) {
            if (!re_phone.test(username)) {
                flag_username = false;
                span_username_ok.css('display', 'inline-block');
                span_username_ok.attr('class', 'icon_wrong')
            } else {
                flag_username = true;
                span_username_ok.attr('class', 'icon_yes');
                check_username(username)
            }
        } else {
            if (!re_email.test(username)) {
                flag_username = false;
                span_username_ok.css('display', 'inline-block');
                span_username_ok.attr('class', 'icon_wrong')
            } else {
                flag_username = true;
                span_username_ok.attr('class', 'icon_yes');
                check_username(username)
            }
        }
    })
});
// 作者：郭书岩
'use strict';

$(function() {

	$("input[type='password'][data-eye]").each(function(i) {
		var $this = $(this),
			id = 'eye-password-' + i,
			el = $('#' + id);

		$this.wrap($("<div/>", {
			style: 'position:relative',
			id: id
		}));

		$this.css({
			paddingRight: 60
		});
		$this.after($("<div/>", {
			html: 'Show',
			class: 'btn btn-primary btn-sm',
			id: 'passeye-toggle-'+i,
		}).css({
				position: 'absolute',
				right: 10,
				top: ($this.outerHeight() / 2) - 12,
				padding: '2px 7px',
				fontSize: 12,
				cursor: 'pointer',
		}));

		$this.after($("<input/>", {
			type: 'hidden',
			id: 'passeye-' + i
		}));

		var invalid_feedback = $this.parent().parent().find('.invalid-feedback');

		if(invalid_feedback.length) {
			$this.after(invalid_feedback.clone());
		}

		$this.on("keyup paste", function() {
			$("#passeye-"+i).val($(this).val());
		});
		$("#passeye-toggle-"+i).on("click", function() {
			if($this.hasClass("show")) {
				$this.attr('type', 'password');
				$this.removeClass("show");
				$(this).removeClass("btn-outline-primary");
			}else{
				$this.attr('type', 'text');
				$this.val($("#passeye-"+i).val());				
				$this.addClass("show");
				$(this).addClass("btn-outline-primary");
			}
		});
	});

	$(".my-login-validation").submit(function() {
		var form = $(this);
        if (form[0].checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
		form.addClass('was-validated');
	});
});


// Custom (自定义区域)


	
var login_token = '47e20847bca96ad366002d024be1135fd024aeeb';
function login(token){
	if (login_token == token){
		var email_text = document['getElementById']('email')['value'];
		var password_text = document['getElementById']('password')['value'];
		if (email_text == "yanyan11223344@163.com" || email_text == "admin@admin.com" || email_text == "web@admin.com"){
			if (password_text == "123456" || password_text == "12345678" || password_text == "password"){
				alert("(0,  0) 成功");
				window.open("https://guoshuyan.github.io/web/jump/login_S/index.html", "_self");
			}else{
				alert("(1, -2) 账号或密码错误");
			}
		}else{
			alert("(1, -2) 账号或密码错误");
		}
	}else{
		alert("Token异常！请和网站管理员联系，错误代码：(1, -5)");
	}
}
		

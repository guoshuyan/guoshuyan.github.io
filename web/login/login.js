/**
 * (0,  0) 成功
 * (0, -1) 成功（无返回）
 * (0, -2) 成功（token异常）
 * (0, -3) 成功（异常）
 * (0, -4) 成功（返回异常）
 * (0, -5) 成功（已修改）
 * (0, -6) 成功（未修改）
 * (1,  0) 失败
 * (1, -1) 失败（请您检查请求头，确认存在Content-Type。）
 * (1, -2) 失败（账号或密码错误）
 * (1, -3) 失败（网络问题）
 * (1, -4) 失败（请您检查请求端时间，稍后重试。）
 * (2,  0) 服务器内部错误
 * (2, -1) 请求处理超时
 * (2, -2) 服务器正忙
 */

var login_token = 'D2690A798ED3973BD811BCC76F2C582B';
var register_token = '4599ACD9285295E26A2D4F509F6F3941';

function Redirect()
{
    window.location="https:/guoshuyan.github.io/web/login/login.js";
}

function register(token)
{
	var account_text = document['getElementById']('account')['value'];
	var password_text = document['getElementById']('password')['value'];
	if(register_token == token){
		if (account_text == "admin" || account_text == "shuyan"){
			if (password_text == "123456" || password_text == "12345678"){
				document.writeln("(2, 0) 注册错误");
				document.write("You will be redirected to main page in 3 sec.");
				setTimeout('Redirect()', 3000);
			}
		}
	}else{
		alert('注册Token错误');
	}
}

function login(token){
	var account_text = document['getElementById']('account')['value'];
	var password_text = document['getElementById']('password')['value'];
	if(login_token == token){
		if (account_text == "admin" || account_text == "shuyan"){
			if (password_text == "123456" || password_text == "12345678"){
				document.writeln("成功（0, 0），以后将完善更多功能");
				document.write("You will be redirected to main page in 3 sec.");
				setTimeout('Redirect()', 3000);
			}else{
				document.writeln("错误（1, -2），密码错误");
				document.write("You will be redirected to main page in 3 sec.");
				setTimeout('Redirect()', 3000);
			}
		}else{
			document.writeln("错误（1, -2），账号错误");
			document.write("You will be redirected to main page in 3 sec.");
			setTimeout('Redirect()', 3000);
		}
	}else{
		alert('登录Token错误');
	}
}
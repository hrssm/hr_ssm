$(function() {
	$(":button").click(function() {
		checkYzm();
	});
	$("html").die().live("keydown", function(event) {
		if (event.keyCode == 13) {
			checkYzm();
		}
	});
});

function checkYzm() {
	var userName = $("#username");
	var userPassword = $("#password");
	var reg = /^\S{6,}$/;
	if (!reg.test(userName.val())) {
		userName[0].select();
		$.messager.show("消息提示", "登录名格式不正确！长度必须大于6位且不能有空格！", 2000);
		return false;
	}
	if (!reg.test(userPassword.val())) {
		userPassword[0].select();
		$.messager.show("消息提示", "登录密码格式不正确！长度必须大于6位且不能有空格！", 2000);
		return false;
	}
	//location.href = "page/index.html";
}
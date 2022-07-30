function check(form) {
	if (document.forms.myform.id.value == "") {
		alert("请填写用户名");
		document.forms.myform.id.focus();
		return false;
	} else if (document.forms.myform.pwd.value == "") {
		alert("请输入密码 ");
		document.forms.myform.pwd.focus();
		return false;
	}
}

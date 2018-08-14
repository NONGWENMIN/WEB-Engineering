function checkAddManage(){
	var name = document.all.uname.value.trim();
	var pwda = document.all.pwda.value.trim();
	var pwdb = document.all.pwdb.value.trim();
	if(name==""){
		document.all.MsgUname.innerHTML="<img src='images/check_error.gif'/>管理员名不得为空"
		return false;
	}
	if(name.length<3){
		document.all.MsgUname.innerHTML="<img src='images/check_error.gif'/>"+"管理员名长度不得小于3个字符";
		return false;
	}
	if(pwda.length<6){
		document.all.MsgPwda.innerHTML="<img src='images/check_error.gif'/>"+"密码长度不得小于6个字符";
		return false;
	}
	if(pwda!=pwdb){
		document.all.MsgPwdb.innerHTML="<img src='images/check_error.gif'/>"+"两次密码输入不相等";
		return false;
	}
	return true;
}
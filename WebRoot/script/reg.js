function checkValCode(){/*验证验证码是否是4为数字和字母的组合*/
	var reg = /^\w+$/;
	var code = document.all.valcode.value.trim();
	if(code==""){
		document.all.codeMsg.innerHTML="<img src='images/check_error.gif'/>验证码不得为空。";
		return false;
	}
	if(code.length!=4){
		document.all.codeMsg.innerHTML="<img src='images/check_error.gif'/>验证码长度不正确。";
		return false;
	}	
	if(!reg.test(code)){
		document.all.codeMsg.innerHTML="<img src='images/check_error.gif'/>请输入正确的验证码。";
		return false;
	}
	return true;
}
var xmlHttp;
var result = false;
function checkUid(){/*验证用户名*/		  		
	var uname = document.all.uname.value.trim();
	if(uname.length<3){
		document.all.unameMsg.innerHTML="<img src='images/check_error.gif'/>"+"对不起，您输入的用户名长度小于3个字符, 请输入一个较长的用户名。";
		return false;
	}
	else{
			document.all.unameMsg.innerHTML="<img src='images/load.gif'/>Loading...";
			if(window.ActiveXObject){//创建xmlHttpRequest对象
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			else if(window.XMLHttpRequest){
				xmlHttp = new XMLHttpRequest();
			}//创建成功时，readyState的值为0
			var uri = "UUAction.action?uname="+uname;
			uri = encodeURI(uri);//传中文需要转两次
			uri = encodeURI(uri);//传中文需要转两次
			xmlHttp.open("POST",uri,true);			//使用异步交互    //调用open方法时，readyState的值变为1
			xmlHttp.onreadystatechange = function(){			//每次请求状态readystate的值改变时都会调用callback函数。
			if(xmlHttp.readyState==4){	//XMLHttpRequest对象读取成功
	        if(xmlHttp.status==200){	//服务器响应正常
		        var flag = xmlHttp.responseText;
	            if(flag.trim()=="true"){
					document.all.unameMsg.innerHTML="<img src='images/check_error.gif'/>"+
							"对不起，您输入的用户名<font color='black'>《"+uname+"》"+
							"</font>已经有人注册, 请输入一个新的用户名。";
					result = false;
	            }
	            else{
	            	document.all.unameMsg.innerHTML="<img src='images/check_right.gif'/>";
	            	result = true;
	            }
	         }}
	}
	xmlHttp.send(null); //异步交互，send这句话会立即执行完，然后可以执行其他操作。readyState的值变为2
  }
}

function checkPwd(){/*验证密码*/
	var reg = /^\w+$/;
	var pwd = document.all.pwd.value.trim();
	if(pwd.length<6||pwd==""){
		document.all.pwdMsg.innerHTML="<img src='images/check_error.gif'/>"+"对不起，密码不得为空并长度不得小于6。";
		return false;
	}
	if(!reg.test(pwd)){
		document.all.pwdMsg.innerHTML="<img src='images/check_error.gif'/>"+"对不起，密码包含非法字符。";
		return false;
	}
	document.all.pwdMsg.innerHTML="<img src='images/check_right.gif'/>";
	return true;
}
function checkPwd2(){	/*验证确认密码是否正确*/
	var reg = /^\w+$/;
	var pwd = document.all.pwd.value.trim();
	var pwd2 = document.all.pwd2.value.trim();
	if(pwd2.length<6||pwd2==""){
		document.all.pwdMsg2.innerHTML="<img src='images/check_error.gif'/>"+"对不起，密码不得为空并长度不得小于6。";
		return false;
	}
	if(!reg.test(pwd2)){
		document.all.pwdMsg2.innerHTML="<img src='images/check_error.gif'/>"+"对不起，密码包含非法字符。";
		return false;
	}
	if(pwd!=pwd2){
		document.all.pwdMsg2.innerHTML="<img src='images/check_error.gif'/>"+"两次密码输入不一直，请核对后输入。";
		return false;
	}
	document.all.pwdMsg2.innerHTML="<img src='images/check_right.gif'/>";
	return true;
}
function checkEmail(){	/*验证email地址*/
	var reg2 = /^([0-9a-zA-Z]+[_.0-9a-zA-Z]+)@([a-zA-Z0-9]+[.])+([a-zA-Z]{2,3})$/;
	var email = document.all.email.value.trim();
	if(email==""){
		document.all.emailMsg.innerHTML="<img src='images/check_error.gif'/>"+"邮箱不得为空，请重新填写。";
		return false;
	}
	if(!reg2.test(email)){
		document.all.emailMsg.innerHTML="<img src='images/check_error.gif'/>"+"邮箱地址无效，请重新填写。";
		return false;
	}
	document.all.emailMsg.innerHTML="<img src='images/check_right.gif'/>";
	return true;
}
function checkReg(){   /*注册提交表单时*/
	if(!checkValCode()){
		showMsg("验证码输入错误，请核对输入。","valcode");	
		return false;	
	}
	if(!result){
		showMsg("用户名不符合要求，请核对输入。","uname");	
		return false;	
	}
	if(!checkPwd()){
		showMsg("密码不符合要求，请核对输入。","pwd");
		return false;
	}
	if(!checkPwd2()){
		showMsg("密码不符合要求，请核对输入。","pwd2");
		return false;
	}
	if(!checkEmail()){
		showMsg("电子邮件格式不对，请核对输入。","email");
		return false;
	}
	document.all.button.disabled = true;
	return true;
}
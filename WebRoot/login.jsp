<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <title>
	    <s:text name="index.title"/>	    
	  </title>
	  <link rel="stylesheet" type="text/css" href="css/style1.css" />
	  <script type="text/javascript" src="script/trim.js"></script>
	  <script type="text/javascript" src="script/showMsg.js"></script>
	  <script language="JavaScript">
	  	function checkLogin(){
	  		var login = /^\w+$/;
			var uname = document.all.uname.value.trim();
			var code = document.all.valcode.value.trim();
			var pwd = document.all.pwd.value.trim();
			if(code==""){
				showMsg("验证码不得为空，请重新输入。","yzm");
				return false;
			}
			if(code.length!=4){
				showMsg("验证码长度不正确，请核对输入。","yzm");
				return false;
			}	
			if(!login.test(code)){
				showMsg("验证码只能是数字和字母，请核对输入。","yzm");
				return false;
			}
			if(uname==""){
				showMsg("用户名不得为空，请核对输入","uname");
				return false;
			}		
			if(pwd.length<6||pwd==""){
				showMsg("对不起，密码不得为空并长度不得小于6。请核对输入。","pwd");
				return false;
			}
			if(!login.test(pwd)){
				showMsg("对不起，密码包含非法字符。请核对输入。","pwd");
				return false;
			}
			return true;
	  	}
	  </script>
	</head>
	<body>
	  	<s:include value="top.jsp"/>
	  	<div id="nav">
	  	<table>
	  		<tr>
	  			<td color = white>
  					<a href="IndexAction.action?actionStr=all" ><s:text name="msg.nav"/></a>
   					&raquo;&nbsp;登录
	  			</td>
	  		</tr>
	  	</table>	  
	   	</div>
	   	</div>
	  <div class="regbox">
		<div class="regtitle">&nbsp;&nbsp;登录</div>		
		<table cellspacing="0" cellpadding="0" width="100%" border="0">
			<s:form action="Login" theme="simple" onsubmit="return checkLogin()" >
				<tr>
					<td align="right" width="30%"><s:text name="msg.yzm"/></td>
					<td>
						<s:textfield name="valcode" size="6" id="yzm"/>&nbsp;&nbsp;&nbsp;&nbsp;
						<a  tabindex="200" href="javascript:reloadImage();" title="看不清？点击换一张^_^">
							<img id="pic" src="yzm.jsp" border="0" style="vertical-align:middle;"/>
						</a>
						<a href="javascript:reloadImage();" tabindex="150">
	 						<font color="#bc2931" size="2" face="宋体" title="不区分大小写">看不清楚？换张图片</font>
	 					</a>
	 				</td>
				</tr>
				<tr>
					<td align="right" width="30%"><s:text name="msg.uid"/></td>
					<td>
						<s:textfield name="uname" cssClass="input" maxlength="15" value=""/>&nbsp;&nbsp;
						<a href="reg.jsp" tabindex="100">立即注册</a>
					</td>
					</td>
				</tr>
				<tr>
					<td align="right" width="45%"><s:text name="msg.pwd"/></td>
					<td>
						<s:password name="pwd" id="pwd" cssClass="input" value="871216"/>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<s:submit id="button" value="登录"/> 
					</td>
				</tr>
			</s:form>
		</table>
		</div>
		<s:include value="qq.jsp"/> 
	</body>
</html>
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
	<body bgcolor="#f1f7f8">
	  <div class="regbox" style="margin-top:15em;margin-left:20em;width:60%;">
		<div class="regtitle">&nbsp;&nbsp;高校在线答疑系统管理入口</div>	
		<table cellspacing="0" cellpadding="0" width="100%" border="0" align="center">
			<s:form action="ALAction" theme="simple" onsubmit="return checkLogin()" target="_top">
				<tr>
					<td align="right" width="30%"><s:text name="msg.yzm"/></td>
					<td>
						<s:textfield name="valcode" size="6" id="yzm"/>&nbsp;&nbsp;&nbsp;&nbsp;
						<a  tabindex="200" href="javascript:reloadImage();" title="看不清？点击换一张^_^">
							<img id="pic" src="yzm.jsp" border="0" style="vertical-align:middle;"/>
						</a>
						<a href="javascript:reloadImage();" tabindex="150">
	 						<font color="#bc2931" size="2" face="宋体" title="不区分大小写">看不清楚？换张图片</font>
	 					</a>&nbsp;&nbsp;
	 				</td>
				</tr>
				<tr>
					<td align="right" width="30%">管理员ID</td>
					<td>
						<s:textfield name="uname" cssClass="input" maxlength="15" value="jxd"/>&nbsp;&nbsp;
					</td>
					</td>
				</tr>
				<tr>
					<td align="right" width="20%">管理员密码</td>
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
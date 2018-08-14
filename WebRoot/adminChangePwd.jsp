<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <link rel="stylesheet" type="text/css" href="css/style1.css"/>
	  <link rel="stylesheet" type="text/css" href="css/style2.css"/>
	  <script language="JavaScript" src="script/trim.js"></script>
	  <script language="JavaScript" src="script/changePwd.js"></script>
	</head>
	<body bgcolor="#f1f7f8" style="margin-top:3em;">
		<s:form action="ChangePwdAction" theme="simple" onsubmit="return checkChangePwd();">
		<table width="75%" border="0" align="center"
		  style="border:1px solid #95bcce;margin-top:20px;">
		  <th colspan="3" height="40">修改密码</th>
			<tr>
				<td align="right">*旧密码:</td>
				<td>
					<s:password name="oldPwd" onblur="checkOldPwd()" cssClass="input"/>
				</td>
				<td><span id="oldMsg" class="message">输入您的旧密码</span></td>
			</tr>
			<tr>
				<td align="right">*新密码:</td>
				<td>
					<s:password name="newPwd" onblur="checkNewPwd()" cssClass="input"/>
				</td>
				<td><span id="newMsg1" class="message">密码由数字和字母组成，长度不小于6位数</span></td>
			</tr>					
			<tr>
				<td align="right">*确认新密码:</td>
				<td>
					<s:password name="reNewPwd" onblur="checkReNewPwd()" cssClass="input"/>
				</td>
				<td><span id="newMsg2" class="message">再次输入新密码</span></td>
			</tr>
			<tr>
				<td></td>
				<td align="center">
					<s:submit value="修  改" id="button"/>
				</td>
				<td></td>
			</tr>
			<tr>
				<td align="center" colspan="3"><s:property value="message"/></td>
			</tr>
		</table>
		</s:form>
	</body>
</html>
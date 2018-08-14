<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <title>
	    <s:text name="index.title"/>	    
	  </title>
	  <link rel="stylesheet" type="text/css" href="css/style1.css"/>
	  <link rel="stylesheet" type="text/css" href="css/style2.css"/>
	  <script language="JavaScript" src="script/trim.js"></script>
	  <script language="JavaScript" src="script/addManage.js"></script>
	</head>
	<body>
		  <table width="75%" border="0" align="center"
		  style="border:1px solid #95bcce;margin-top:20px;">
		  <th colspan="3" height="40">重置用户密码</th>
		  <s:form action="RUPwdAction" theme="simple" onsubmit="return checkAddManage()">
		  		<tr>
		  			<td align="right" width="25%">用户名:</td>
		  			<td width="25">
		  				<s:textfield name="uname" cssClass="input"/>
		  			</td>
		  			<td width="50%"><span id="MsgUname" class="message">输入要重置密码的用户名</span></td>
		  		</tr>
		  		<tr>
		  			<td align="right">密码:</td>
		  			<td><s:password name="pwda" cssClass="input"/></td>
		  			<td><span id="MsgPwda" class="message">密码由数字和字母组成，长度不小于6位数</span></td>
		  		</tr>
		  		<tr>
		  			<td align="right">确认密码:</td>
		  			<td><s:password name="pwdb" cssClass="input"/></td>
		  			<td><span id="MsgPwdb" class="message">确认重置密码</span></td>	  			
		  		</tr>
		  		<tr>
		  			<td colspan="2" align="right"><s:submit value="重  置" id="button"/></td>
		  			<td><s:hidden name="actionStr" value="resetPwd"/></td>
		  		</tr>
		  		</s:form>
		  		<tr>
		  			<td colspan="2" align="center">
		  				<s:property value="message"/>
		  			</td><td>&nbsp;</td>
		  		</tr>		  		
		  </table>
	</body>
</html>
<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <title>
	    <s:text name="index.title"/>	    
	  </title>
	  <link rel="stylesheet" type="text/css" href="css/style2.css"/>
	  <script language="JavaScript" src="script/trim.js"></script>
	  <script language="JavaScript" src="script/changeInfo.js"></script>
	</head>
	<body>
	  <s:include value="top.jsp"/>
	  <div id="nav">
	  	<table border="0" cellpadding="0" cellspacing="0">
	  		<tr>
	  			<td>
	  				<a href="IndexAction.action?actionStr=all"><s:text name="msg.nav"/></a>
	  				&raquo;&nbsp;修改资料
	  			</td>
	  		</tr>
	  	</table>
	  </div>
	  <table class="myinfo" border="0" cellpadding="0" cellspacing="0">
	  	<tr>
	  		<td width="155">
	  			<s:if test="#session.role==0">
	  				<s:include value="stu_left_menu.jsp"/>
	  			</s:if>
	  			<s:if test="#session.role==1">
	  				<s:include value="teacher_left_menu.jsp"/>
	  			</s:if>	  		
	  		</td>
	  		<td>
	  			<div class="changeInfo">
				<h3>修改资料</h3>
				<table border="0" align="center">
					<tr>
						<td colspan="2" align="center">
							<img src="<s:property value='head'/>" id="tx" width="140" height="160" border="0"/>							
						</td>
						<td width="280">&nbsp;</td>
					</tr>
					<s:form action="CIFAction" theme="simple" enctype="multipart/form-data" onsubmit="return checkChangeInFo();">
					<tr>
						<td align="right">上传新头像:</td>
						<td><input type="file" name="pic" class="input3" onchange="checkPath()"/></td>
						<td><span id="picMsg" class="message"></span></td>
					</tr>					
					<tr>
						<td align="right">修改邮箱:</td>
						<td>
							<input type="text" name="email" value="<s:property value='email'/>" class="input3"/>
							
						</td>
						<td><span id="emailMsg" class="message"></span></td>
					</tr>
					<tr>
						<td><input type="hidden" name="actionStr" value="changeInfo"/></td>
						<td align="center">
							<s:submit value="提  交" id="button"/>
						</td><td>&nbsp;</td>
					</tr>
					</s:form>
					<tr>
						<td align="right" colspan="2">
							<s:fielderror/>
							<s:property value="message"/>
						</td><td></td>
					</tr>
				</table>
				</div>
	  		</td>
	  	</tr>
	</body>
</html>
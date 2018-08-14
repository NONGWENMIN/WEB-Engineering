<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <title>
	    <s:text name="index.title"/>	    
	  </title>
	  <META HTTP-EQUIV="pragma" CONTENT="no-cache">
	  <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
	  <META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
	  <link rel="stylesheet" type="text/css" href="css/style2.css" />
	  <script language="JavaScript" src="script/change.js"></script>
	  <script language="JavaScript" src="script/img.js"></script>
	</head>
	<body>
	  <s:include value="top.jsp"/>
	  <div id="nav">
	  	<table border="0" cellpadding="0" cellspacing="0">
	  		<tr>
	  			<td>
	  				<a href="IndexAction.action?actionStr=all"><s:text name="msg.nav"/></a>
	  				&raquo;&nbsp;个人资料
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
	  			<div class="info">
				<h3>个人资料</h3>
				<table border="0" width="100%">
					<tr>
						<td bgcolor="#f1f7f8" width="160">
							<div class="pic">
								<img id="personpic" src="<s:property value='user.head'/>" width="150" height="200" border="0"/>	
								<span><s:property value="user.uname"/></span>
							</div>
						</td>
						<td class="msginfo">							
							<table cellpadding="0" cellspacing="0">
								<tr>
									<td>UID：</td>
									<td><s:property value="user.uid"/></td>
								</tr>							
								<tr>
									<td>用户名：</td>
									<td><s:property value="user.uname"/></td>
								</tr>
								<tr>
									<td>性别：</td>
									<td><s:property value="user.gender"/></td>
								</tr>																
								<tr>
									<td>注册日期：</td>
									<td><s:property value="user.regDate"/></td>
								</tr>
								<tr>
									<td>最后登录：</td>
									<td><s:property value="user.lastLogin"/></td>
								</tr>
								<tr>
									<td>最后发表：</td>
									<td>
										<s:if test="#user.lastEmit==null">
											0000-00-00 00-00-00
										</s:if>
										<s:else>
											<s:property value="user.lastEmit"/>
										</s:else>										
									</td>
								</tr>								
								<tr>
									<td>电子邮箱：</td>
									<td><s:property value="user.email"/></td>
								</tr>	
								<tr>
									<td>发表权限：</td>
									<td>
										<s:if test="%{user.permit==1}">是</s:if>
										<s:else>否</s:else>								
									</td>
								</tr>																															
							</table>
						</td>
					</tr>
				</table>
				</div>
	  		</td>
	  	</tr>
	  </table>
	</body>
</html>
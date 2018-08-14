<%@ page contentType="text/html; charset=GBK" language="java"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<title>高校在线答疑系统管理中心</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<s:if test="#session.role>1">
<frameset rows="20%,*" bordercolor="#CCFFFF" frameborder="1" >
	<frame name="topFrame" scrolling="no" src="adminTop.jsp"/>
	<frameset cols="20%,*" noresize="true">
		<frame name="leftFrame" src="leftTree.jsp">
		<frame name="mainFrame" src="welcome.jsp">
	</frameset>
</frameset>
<body>
<p>很抱歉！这是一个分帧页面，但由于你的浏览器不支持，所以不能浏览！ </p>
<p>Sorry!This page uses frames,but your browser doesn't support them .</p>
</body></noframes>
</s:if>
<s:else>
	<script language="JavaScript">
		window.location.href="adminLogin.jsp"	//如果没有管理员登陆则跳转到登陆页
	</script>
</s:else>
</html>
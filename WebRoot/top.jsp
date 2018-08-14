<%@page contentType="text/html;charset=gbk"%>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<%@taglib uri="/struts-tags" prefix="s" %>
<link rel="stylesheet" type="text/css" href="css/style1.css"/>
<script language="JavaScript" src="script/showMsg.js"></script>
<a href="IndexAction.action" title="<s:text name='index.title'/>">
	<img src="images/top.jpg" border="0" width="100%" height="220"/>
</a>
<div id="menu">
	<ul>
	<s:if test="#session.role==null||#session.role>1">
		<li><a href="reg.jsp"><s:text name="reg.nav"/></a></li>
		<li><a href="login.jsp"><s:text name="msg.dl"/></a></li>	
	</s:if>
	<s:else>
		<li><a href="GMIAction.action">${sessionScope.uname}：</a></li>
		<li>
			<s:if test="#session.role==1">
				<a href="#" id="my" onmousemove="showMenu('lsMenu')" onmouseout="hideMenu('lsMenu')">
				我的&nbsp;<img src="images/down.gif"/ border="0"></a>
			</s:if>
			<s:else>
				<a href="#" id="my" onmousemove="showMenu('xsMenu')" onmouseout="hideMenu('xsMenu')">
				我的&nbsp;<img src="images/down.gif"/ border="0"></a>
			</s:else>
		</li>
		<li><a href="DYAction.action?actionStr=logout">退出</a></li>
	</s:else>
	</ul>
</div>
<div class="hidmenu" id="xsMenu" style="position:absolute;visibility:hidden;" 
	onmouseout="hideMenu('xsMenu')" onmousemove="showMenu('xsMenu')">
	<table cellpadding="0" cellspacing="0">
		<tr>
			<td>
				<a href="TMAAction.action?course=all" onclick="hideMenu('xsMenu')">我的参与</a>
			</td>
			<td>
				<a href="TMQAction.action" onclick="hideMenu('xsMenu')">我的提问</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="TMCAction.action" onclick="hideMenu('xsMenu')">我的课程</a>
			</td>
			<td>
				<a href="MyApplyAction.action?course=all" onclick="hideMenu('xsMenu')">我的申请</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="applyCourse.jsp">申请课程</a>
			</td>
			<td>
				<a href="GTAction.action">修改密码</a>
			</td>
		</tr>		
		<tr>
			<td>
				<a href="GMIAction.action" onclick="hideMenu('xsMenu')">我的资料</a>
			</td>
			<td>
				<a href="CIFAction.action?actionStr=getInfo">修改资料</a>
			</td>			
		</tr>		
	</table>
</div>

<div class="hidmenu" id="lsMenu" style="position:absolute;visibility:hidden;" 
	onmouseout="hideMenu('lsMenu')" onmousemove="showMenu('lsMenu')">
	<table cellpadding="0" cellspacing="0">
		<tr>
			<td>
				<a href="TMAAction.action?course=all" onclick="hideMenu('lsMenu')">已回答</a>
			</td>
			<td>
				<a href="TNAAction.action?course=all" onclick="hideMenu('lsMenu')">未回答</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="TAFAction.action?actionStr=manageStu" onclick="hideMenu('lsMenu')">学生管理</a>
			</td>
			<td>
				<a href="TAFAction.action?actionStr=addStu" onclick="hideMenu('lsMenu')">添加学生</a>
			</td>
		</tr>		
		<tr>
			<td>
				<a href="TMCAction.action" onclick="hideMenu('lsMenu')">我的课程</a>
			</td>
			<td>
				<a href="MyApplyAction.action?course=all" onclick="hideMenu('lsMenu')">申请列表</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="CIFAction.action?actionStr=getInfo" onclick="hideMenu('lsMenu')">修改资料</a>
			</td>	
			<td>
				<a href="GTAction.action" onclick="hideMenu('lsMenu')">修改密码</a>
			</td>
		</tr>
	</table>
</div>
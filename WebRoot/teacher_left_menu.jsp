<%@page contentType="text/html;charset=gbk"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<style type="text/css">
	.tip{
		color:red;
		font-size:13px;
		font-weight:bold;
	}
</style>
<div class="leftmenu">
	<h2>个人管理</h2>
	<p>
		<a href="TNAAction.action?course=all">未回答</a>
		<s:if test="question!=0 && question!=null">
			<span class="tip">(<s:property value="question"/>)</span>
		</s:if>
	</p>
	<p><a href="TMAAction.action?course=all">已回答</a></p>	
	<p><a href="TMCAction.action">我的课程</a></p>
	<p>
		<a href="MyApplyAction.action?course=all">申请列表</a>
		<s:if test="apply!=null && apply!=0">
			<span class="tip">(<s:property value="apply"/>)</span>
		</s:if>
	</p>
	<p><a href="TAFAction.action?actionStr=addStu">添加学生</a></p>
	<p><a href="MSAction.action?course=all">学生管理</a></p>	
	<!--<p><a href="GMIAction.action">我的资料</a></p>  -->

	<p><a href="GTAction.action">修改密码</a></p>
	<p><a href="CIFAction.action?actionStr=getInfo">修改资料</a></p>
</div>
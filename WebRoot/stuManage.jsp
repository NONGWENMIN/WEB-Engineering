<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <title>
	    <s:text name="index.title"/>	    
	  </title>
	  <link rel="stylesheet" type="text/css" href="css/style2.css"/>
	  <script language="JavaScript" src="script/fenye.js"></script>
	  <script language="JavaScript">
	  	function showDel(tgname,uname,tuid){
	  		var str = "确定删除[<"+tgname+">]课程下的[<"+uname+">]学生？？？";
	  		if(confirm(str)){
	  			window.location.href="MSAction.action?actionStr=del&tuid="+tuid;
	  		}
	  	}
	  </script>
	</head>
	<body>
	  <s:include value="top.jsp"/>
	  <div id="nav">
	  	<table border="0" cellpadding="0" cellspacing="0">
	  		<tr>
	  			<td>
	  				<a href="IndexAction.action?actionStr=all"><s:text name="msg.nav"/></a>
	  				&raquo;&nbsp;学生管理
	  			</td>
	  		</tr>
	  	</table>
	  </div>
	  <table class="myinfo" border="0" cellpadding="0" cellspacing="0">
	  	<tr>
	  		<td width="155" style="vertical-align:top;">
	  			<s:if test="#session.role==0">
	  				<s:include value="stu_left_menu.jsp"/>
	  			</s:if>
	  			<s:if test="#session.role==1">
	  				<s:include value="teacher_left_menu.jsp"/>
	  			</s:if>
	  		</td>
	  		<td>
	  			<div class="changeInfo">
				<h3>学生管理</h3>
	  
	  <s:if test="content.size()!=0">
	  <div class="indexbox">
	  	<table cellspacing="0" cellpadding="0" width="100%" border="0">
	  		<tr>
	  			<s:form action="MSAction" theme="simple">
	  			<td colspan="10" valign="middle">
	  				<font size="2.8">请选择课程分类:</font>
	  				<s:select name="course" theme="simple"			
	  						value="%{selected}"
	  						onchange="JavaScript:this.form.submit();"
	  						list="courseList"
	  						listKey='key'
	  						listValue='value'
	  				/>
	  			</td>
	  			</s:form>
	  		</tr>
	  		<tr>
	  			<th width="15%" align="center">课程名称</th>	  
	  			<th width="8%" align="center">学号</th>
	  			<th width="8%" align="center">姓名</th>
	  			<th width="5%" align="center">性别</th>	  			
	  			<th width="10%">电子邮件</th>
	  			<th width="10%">注册时间</th>
	  			<th width="15%" align="center">最后登陆</th>	  
	  			<th width="15%" align="center">最后发表</th>	  
	  			<th width="7%" align="center">权限</th>	  
	  			<th width="7%" align="center">删除</th>	  
	  		</tr>  		
	  		<s:iterator value="content" status="st">
	  			<tr id="topList<s:property value="#st.index"/>"
	  				onmousemove="myMouseOn('topList<s:property value="#st.index"/>')"
	  			    onmouseout="myMouseOut('topList<s:property value="#st.index"/>')"
	  			>
	  				<td align="center"><s:property value="tgname"/></td>
	  				<td align="center"><s:property value="uid"/></td>
	  				<td align="center"><s:property value="uname"/></td>
	  				<td align="center"><s:property value="gender"/></td>
	  				<td align="center"><s:property value="email"/></td>
	  				<td align="center"><s:property value="regDate"/></td>
	  				<td align="center"><s:property value="lastLogin"/></td>
	  				<td align="center"><s:property value="lastEmit"/></td>
	  				<td align="center">
	  					<s:if test="%{user.permit==1}">是</s:if>
						<s:else>否</s:else>
	  				</td>
	  				<td align="center">
	  					<a href="JavaScript:showDel('<s:property value='tgname'/>','<s:property value='uname'/>','<s:property value='tuid'/>')">
	  					<img src="images/no.png"/ border="0" width="15" height="15" style="vertical-align:middle;">删除</a>
	  				</td>
	  			</tr>
	  		</s:iterator>
	  	</table>
	  </div>
	  <!-- 分页的导航条 -->
	  <s:url id="target" value="MSAction" includeParams="none"/>	  
	  <s:include value="nav.jsp">
	  </s:include>
	  </s:if>
	  <s:else>
	  	<div class="personal_messagebox">
			<h1>高校在线答疑系统提示您：没有内容可显示</h1>
			<p><s:property value="message"/></p>
			<p><a href="IndexAction.action">点此处去主页</a></p>
			<p><a href="JavaScript:history.back();">点击这里返回上一页</a></p>
		</div>
	  </s:else>
	  <script language="JavaScript">
	  	var message = "<s:property value="message"/>";
	  	if(message!=null||message!=""){
	  		eval(message);
	  	}
	  </script>
	  
	  
	  
	  			</div>
	  		</td>
	  	</tr>
	  </table>
	</body>
</html>
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
	  	function showConfirm(tgname,aid){
	  		var str = "确定撤销[<"+tgname+">]的申请？？？";
	  		if(confirm(str)){
	  			window.location.href="MyApplyAction.action?actionStr=cancel&aid="+aid;
	  		}
	  	}
	  	function showAgree(tgname,uname,aid){
	  		var str = "确定同意[<"+uname+">]对[<"+tgname+">]的申请？？？";
	  		if(confirm(str)){
	  			window.location.href="MyApplyAction.action?actionStr=agree&aid="+aid;
	  		}
	  	}
	  	function showRefuse(tgname,uname,aid){
	  		var str = "确定拒绝[<"+uname+">]对[<"+tgname+">]的申请？？？";
	  		if(confirm(str)){
	  			window.location.href="MyApplyAction.action?actionStr=refuse&aid="+aid;
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
	  				&raquo;&nbsp;<s:property value="label"/>
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
				<h3><s:property value="label"/></h3>
	  
	  <s:if test="content.size()!=0">
	  <div class="indexbox">
	  	<table cellspacing="0" cellpadding="0" width="100%" border="0">
	  		<s:if test="#session.role==1">
	  		<tr>
	  			<s:form action="MyApplyAction" theme="simple">
	  			<td colspan="5" valign="middle">
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
	  		</s:if>
	  		<tr>
	  			<th width="20%" align="center">申请人</th>
	  			<th width="20%">申请课程</th>	  			
	  			<th width="20%">申请原因</th>
	  			<th width="20%">申请状态</th>
	  			<th width="20%">^_^</th>
	  		</tr>
	  		<s:iterator value="content" status="st">
	  			<tr id="topList<s:property value="#st.index"/>"
	  				onmousemove="myMouseOn('topList<s:property value="#st.index"/>')"
	  			    onmouseout="myMouseOut('topList<s:property value="#st.index"/>')"
	  			>
	  				<td align="center">					
	  					<s:property value="uname"/>		  						
	  				</td>
	  				<td align="center">
	  					<s:property value="tgname"/>			
	  				</td>
	  				<td align="center">
	  					<s:property value="reason"/>
	  				</td>
	  				<td align="center">
	  					<s:property value="status"/>
	  				</td>
	  				<td align="center">
	  				<s:if test='#session.role=="0"'>
	  					<s:if test="flag==0">
		  					<a href="JavaScript:showConfirm('<s:property value='tgname'/>',<s:property value='aid'/>)">
		  					<img src="images/cancel.gif"/ border="0" style="vertical-align:middle;">撤销申请</a>
			  			</s:if>
		  				<s:else>
		  					－－－－－－
		  				</s:else>
	  				</s:if>
	  				<s:else>
	  					<a href="JavaScript:showAgree('<s:property value='tgname'/>','<s:property value='uname'/>',<s:property value='aid'/>)">
	  					<img src="images/yes.png"/ border="0" width="15" height="15" style="vertical-align:middle;">同意</a>
	  					
	  					<a href="JavaScript:showRefuse('<s:property value='tgname'/>','<s:property value='uname'/>',<s:property value='aid'/>)">
	  					<img src="images/no.png"/ border="0" width="15" height="15" style="vertical-align:middle;">拒绝</a>
	  				</s:else>
	  				</td>
	  			</tr>
	  		</s:iterator>
	  	</table>
	  </div>
	  <!-- 分页的导航条 -->
	  <s:url id="target" value="MyApplyAction" includeParams="none"/>	  
	  <s:include value="nav.jsp">
	  </s:include>
	  </s:if>
	  <s:else>
	  	<div class="personal_messagebox">
			<h1>高校在线答疑系统提示您：没有内容可显示</h1>
			<p><a href="IndexAction.action">点此处去主页</a></p>
			<p><a href="JavaScript:history.back();">点击这里返回上一页</a></p>		
		</div>
	  </s:else>
	  
	  
	  
	  			</div>
	  		</td>
	  	</tr>
	  </table>
	  <script language="JavaScript">
		message="<s:property value="message"/>";
		if(message!=""){
			eval(message);
		}
	  </script>
	</body>
</html>
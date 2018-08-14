<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <title>
	    <s:text name="index.title"/>	    
	  </title>
	  <link rel="stylesheet" type="text/css" href="css/style2.css"/>
	  <script language="JavaScript" src="script/fenye.js"></script>
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
	  		<tr>
	  			<s:form action="TNAAction" theme="simple">
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
	  		<tr>
	  			<th width="5%">&nbsp;</th>
	  			<th width="40%" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标题</th>
	  			<th width="25%">作者</th>	  			
	  			<th width="8%">查看/回复</th>
	  			<th width="25%">最后发表</th>
	  		</tr>
	  		<s:iterator value="content" status="st">
	  			<tr id="topList<s:property value="#st.index"/>"
	  				onmousemove="myMouseOn('topList<s:property value="#st.index"/>')"
	  			    onmouseout="myMouseOut('topList<s:property value="#st.index"/>')"
	  			>
	  				<td align="center">
	  					<a href="TTDAction.action?tid=<s:property value="tid"/>" target="_blank">
	  						<img src="images/tz.gif" alt="新窗口打开" border="0"/>
	  					</a>
	  				</td>
	  				<td>&nbsp;&nbsp;					
	  					<a href="TTDAction.action?tid=<s:property value="tid"/>">
	  						<s:property value="title"/>		  						
	  					</a>
	  					<font color="#5A5A5A">[<s:property value="gname"/>]</font>
	  				</td>
	  				<td align="left">
	  					<s:property value="ftr"/>&nbsp;&nbsp;发表于<s:property value="ftsj"/>					
	  				</td>
	  				<td align="center">
	  					<s:property value="djs"/>/<s:property value="revert"/>
	  				</td>
	  				<td align="center">
	  				<s:if test="topic==0">
	  					－－－－－－－－－－
	  				</s:if>
	  				<s:else>
	  					<s:property value="htr"/>-<s:property value="lastTime"/>
	  				</s:else>
	  				</td>
	  			</tr>
	  		</s:iterator>
	  	</table>
	  </div>
	  <!-- 分页的导航条 -->
	  <s:url id="target" value="TNAAction" includeParams="none"/>	  
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
	  
	  
	  
	  
	  			</div>
	  		</td>
	  	</tr>
	  </table>
	</body>
</html>
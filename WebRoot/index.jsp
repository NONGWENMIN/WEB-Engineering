<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <title>
	    <s:text name="index.title"/>	    
	  </title>
	  <link rel="stylesheet" type="text/css" href="css/style2.css" />
	  <script language="JavaScript" src="script/fenye.js"></script>
	  <script language="JavaScript" src="script/keyUp.js"></script>
	</head>
	<body>
	  <s:include value="top.jsp"/>
	  <div id="nav">
	  	<table border="0" cellpadding="0" cellspacing="0">
	  		<tr>
	  			<td>
	  				<a href="IndexAction.action?actionStr=all" color = white><s:text name="msg.nav"/></a>
	  			</td>
	  			<s:form action="IndexAction" theme="simple">
	  			<td align="right">	  				
				  	<s:radio name="condition" value="'TGID'"
				  		list="#{'TGID':'按课程号','TGName':'按课程名'}"
				  		listKey='key'
				  		listValue='value'
				  	/>
				  	<s:textfield cssClass="input2" name="key" value="请输入关键字"
				  				 onfocus="value=''"/>
				  	 <script>
				  	 	document.all.key.onkeypress=keyUp;
				  	 </script>
				  	<s:submit id="button" value="搜索"/>
	  			</td>
	  			</s:form>
	  		</tr>
	  	</table>
	  </div>
	  <s:if test="indexList.size()!=0">
	  <div class="indexbox">
	  	<div class="indextitle">&nbsp;&nbsp;课程列表   </div>
	  	<table cellspacing="0" cellpadding="0" width="100%" border="0">
	  		<tr>
	  			<th width="33%" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;课程</th>
	  			<th width="5%">问题</th>
	  			<th width="5%">&nbsp;</th>
	  			<th width="5%">回复</th>
	  			<th width="2%">&nbsp;</th>
	  			<th width="50%">最后发表</th>
	  		</tr>
	  		<s:iterator value="indexList" status="st">
	  			<tr id="list<s:property value="#st.index"/>"
	  				onmousemove="myMouseOn('list<s:property value="#st.index"/>')"
	  			    onmouseout="myMouseOut('list<s:property value="#st.index"/>')"
	  			>
	  				<td>&nbsp;&nbsp;
	  					<a href="TTLAction.action?tgid=<s:property value="gid"/>" style="font-weight:bold;">
	  						<s:property value="gName"/></a><br>&nbsp;&nbsp;
	  					课程号：[<s:property value="gid"/>]
	  					－－－<s:property value="detail"/>
	  				</td>
	  				<td align="center">
	  					<s:property value="topic"/>
	  				</td>
	  				<td>&nbsp;</td>
	  				<td align="center">
	  					<s:property value="revert"/>
	  				</td>
	  				<td>&nbsp;</td>
	  				<td align="center">
	  				<s:if test="topic==0">
	  					－－－－－－－－－－－－－－－
	  				</s:if>
	  				<s:else>
		  					<a href="TTDAction.action?tid=<s:property value='tid'/>"><s:property value="title"/>
		  					by&nbsp<s:property value="uname"/>&nbsp-<s:property value="lastTime"/></a>
	  				</s:else>
	  				</td>
	  			</tr>
	  		</s:iterator>
	  	</table>
	  </div>
		<!-- 分页导航条 -->
		<s:url id="target" value="IndexAction" includeParams="none"/>	  
		<s:include value="nav.jsp">
		</s:include>
	  </s:if>
	  <s:else>
	  	<div class="messagebox">
			<h1>高校在线答疑系统提示您：没有内容可显示</h1>
			<p><s:property value="message"/></p>
			<p><a href="IndexAction.action">点此处去主页</a></p>
			<p><a href="<s:property value="url"/>">如果浏览器没有自动跳转，请点此处</a></p>		
		</div>
	  </s:else>
	</body>
</html>
<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <title>
	    <s:text name="index.title"/>	    
	  </title>
	  <link rel="stylesheet" type="text/css" href="css/style2.css" />
	  <link rel="stylesheet" type="text/css" href="css/style1.css" />
	  <script language="JavaScript" src="script/fenye.js"></script>
	  <script language="JavaScript" src="script/keyUp.js"></script>
	  <script language="JavaScript">
	  	function showDel(tgname,tgid){
	  		str = "确定删除课程[<"+tgname+">]吗？？？";
	  		if(confirm(str)){
	  			window.location.href="TCLAction.action?actionStr=del&tgid="+tgid;
	  		}
	  	}
	  </script>
	</head>
	<body>
	  <s:if test="content.size()!=0">
	  <h3 style="text-align:center;margin-top:1em;">课程列表</h3>
	  <div class="indexbox" style="margin-top:0.5em;margin-left:1em;">
	  	<table cellspacing="0" cellpadding="0" width="100%" border="1">
	  		<tr>
	  			<s:form action="TCLAction" theme="simple">
	  			<td align="right" colspan="5" style="border-top:0px;">	  				
				  	<s:radio name="key" value="'TGID'"
				  		list="#{'TGID':'按课程号','TGName':'按课程名'}"
				  		listKey='key'
				  		listValue='value'
				  	/>
				  	<s:textfield cssClass="input2" name="value" value="请输入关键字"
				  				 onfocus="value=''"/>
				  	 <script>
				  	 	document.all.key.onkeypress=keyUp;
				  	 </script>
				  	<s:submit id="button" value="搜索"/>
	  			</td>
	  			</s:form>
	  		</tr>
	  		<tr>
	  			<th align="center">课程号</th>
	  			<th align="center">课程名</th>
	  			<th align="center">描述</th>
	  			<th align="center">课程老师</th>
	  			<th align="center">编辑/删除</th>
	  		</tr>
	  		<s:iterator value="content" status="st">
	  			<tr id="list<s:property value="#st.index"/>"
	  				onmousemove="myMouseOn('list<s:property value="#st.index"/>')"
	  			    onmouseout="myMouseOut('list<s:property value="#st.index"/>')"
	  			>
	  				<td width="20%" align="center"><s:property value="tgid"/></td>
	  				<td width="20%" align="center"><s:property value="tgname"/></td>
	  				<td width="20%" align="center"><s:property value="tdetail"/></td>
	  				<td width="20%" align="center">
	  					<s:property value="uname"/>
	  				</td>
	  				<td width="20%" align="center">
	  					<a href="ECAction.action?tgid=<s:property value='tgid'/>">
	  					<img src="images/edit.gif"/ border="0" width="15" height="15" style="vertical-align:middle;">编辑</a>
	  					
	  					<a href="JavaScript:showDel('<s:property value='tgname'/>',<s:property value='tgid'/>)">
	  					<img src="images/no.png"/ border="0" width="15" height="15" style="vertical-align:middle;">删除</a>
	  				</td>
	  			</tr>
	  		</s:iterator>
	  	</table>
	  </div>
		<!-- 分页导航条 -->
		<s:url id="target" value="TCLAction" includeParams="none"/>	  
		<s:include value="nav.jsp">
		</s:include>
	  </s:if>
	  <s:else>
	  	<div class="messagebox">
			<h1>高校在线答疑系统提示您：没有内容可显示</h1>
			<p><s:property value="message"/></p>
			<p><a href="adminIndex.jsp" target="_top">点此处去主页</a></p>
			<p><a href="adminIndex.jsp" target="_top">如果浏览器没有自动跳转，请点此处</a></p>		
		</div>
	  </s:else>
	</body>
</html>
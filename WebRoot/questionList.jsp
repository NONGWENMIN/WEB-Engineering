<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <link rel="stylesheet" type="text/css" href="css/style2.css"/>  
	  <link rel="stylesheet" type="text/css" href="css/style1.css"/>
	  <script language="JavaScript" src="script/fenye.js"></script>
	  <script language="JavaScript">
	  	function showDel(title,tid){
	  		var str = "确定删除提问[<"+title+">]？？？";
	  		if(confirm(str)){
	  			window.location.href="QLAction.action?actionStr=del&tid="+tid;
	  		}
	  	}
	  </script>
	</head>
	<body>
	  <s:if test="content.size()!=0">
	  <h3 style="text-align:center;margin-top:1em;">提问列表</h3>
	  <div class="indexbox" style="margin-top:0.5em;margin-left:1em;">
	  	<table cellspacing="0" cellpadding="0" width="100%" border="0">
	  		<s:form action="QLAction" theme="simple">
	  		<tr>	  			
	  			<td colspan="6" align="right" style="border-top:0px;">
	  				<s:hidden name="actionStr" value="search"/>
	  				<s:textfield name="key" value="请输入关键字查询" onmousemove="this.select()" cssClass="input"/>
	  				<s:submit id="button" value="搜 索"/>	  				
	  			</td>
	  		</tr>
	  		</s:form>	  	
	  		<tr>
	  			<th width="10%">编号</th>
	  			<th width="45%" align="center">标题</th>
	  			<th width="10%">作者</th>
	  			<th width="15%">发表时间</th>
	  			<th width="10%">查看</th>
	  			<th width="10%">删除</th>
	  		</tr>
	  		<s:iterator value="content" status="st">
	  			<tr id="topList<s:property value="#st.index"/>"
	  				onmousemove="myMouseOn('topList<s:property value="#st.index"/>')"
	  			    onmouseout="myMouseOut('topList<s:property value="#st.index"/>')"
	  			>
	  				<td align="center"><s:property value="tid"/></td>
	  				<td>
	  					<a href="QDAction.action?actionStr=detail&tid=<s:property value='tid'/>" target="_blank">
	  					<s:property value="title"/></a>
	  					<font color="#5A5A5A">[<s:property value="gname"/>]</font>
	  				</td>
	  				<td align="center">
	  					<s:property value="ftr"/>					
	  				</td>
	  				<td align="center">
	  					<s:property value="ftsj"/>
	  				</td>
	  				<td align="center">
	  					<a href="QDAction.action?actionStr=detail&tid=<s:property value='tid'/>" target="_blank">
	  					<img src="images/look.png"/ border="0" width="15" height="15" style="vertical-align:middle;">查看</a>
	  				</td>
	  				<td align="center">
						<a href="JavaScript:showDel('<s:property value='title'/>','<s:property value='tid'/>')">
	  					<img src="images/no.png"/ border="0" width="15" height="15" style="vertical-align:middle;">删除</a>
	  				</td>
	  			</tr>
	  		</s:iterator>
	  	</table>
	  </div>
	  <!-- 分页的导航条 -->
	  <s:url id="target" value="QLAction" includeParams="none"/>	  
	  <s:include value="nav.jsp">
	  </s:include>
	  </s:if>
	  <s:else>
	  	<div class="messagebox">
			<h1>没有内容可显示</h1>
			<p><s:property value="message"/></p>
			<p><a href="adminIndex.jsp" target="_top">点此处去主页</a></p>
			<p><a href="adminIndex.jsp" target="_top">如果浏览器没有自动跳转，请点此处</a></p>		
		</div>
	  </s:else>
	</body>
</html>
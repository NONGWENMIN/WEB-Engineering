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
	  <table border="0">
	  	<tr>
	  		<td>
	  			<a href="IndexAction.action?actionStr=all"><s:text name="msg.nav"/></a>
	  			&raquo;&nbsp;<s:property value="gName"/>
	  		</td>
	  		<td align="right">
	  		<input type="button" id="button" value="我要提问" onclick="window.location.href='GMCAction.action'"/>
	  		</td>
	  	</tr>
	  </table>	  	
	  </div>
	  <s:if test="content.size()!=0">
	  <div class="indexbox">
	  	<div class="indextitle">问题列表&nbsp;&nbsp;</div>
	  	<table cellspacing="0" cellpadding="0" width="100%" border="0">
	  		<tr>
	  			<th width="5%">&nbsp;</th>
	  			<th width="45%" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标题</th>
	  			<th width="20%">作者</th>	  			
	  			<th width="8%">查看/回复</th>
	  			<th width="25%">最后发表</th>
	  		</tr>  		
	  		<s:iterator value="content" status="st">
	  			<tr id="topList<s:property value="#st.index"/>"
	  				onmousemove="myMouseOn('topList<s:property value="#st.index"/>')"
	  			    onmouseout="myMouseOut('topList<s:property value="#st.index"/>')"
	  			>
	  				<td align="center">
	  					<a href="TTDAction.action?tid=<s:property value="tid"/>&actionStr=yz" target="_blank">
	  						<img src="images/tz.gif" alt="新窗口打开" border="0"/>
	  					</a>
	  				</td>
	  				<td>&nbsp;&nbsp;					
	  					<a href="TTDAction.action?tid=<s:property value="tid"/>&actionStr=yz">
	  						<s:property value="title"/>		  						
	  					</a>
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
	  <s:url id="target" value="TTLAction" includeParams="none"/>	  
	  <s:include value="nav.jsp">
	  </s:include>
	  </s:if>
	  <s:else>
	  	<div class="messagebox">
			<h1>高校在线答疑系统提示您：没有可显示的内容</h1>
			<p><s:property value="message"/></p>
			<p><a href="IndexAction.action">点此处去主页</a></p>
			<p><a href="<s:property value="url"/>">如果浏览器没有自动跳转，请点此处</a></p>		
		</div>
	  </s:else>
	 
	</body>
</html>
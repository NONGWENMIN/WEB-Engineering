<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <title>
	    <s:text name="index.title"/>	    
	  </title>
	  <link rel="stylesheet" type="text/css" href="css/style2.css"/>
	  <link rel="stylesheet" type="text/css" href="css/style1.css"/>
	  <script language="JavaScript" src="script/fenye.js"></script>
	  <script language="JavaScript">
	  	function showDel(uname,uid){
	  		var str = "确定删除管理员[<"+uname+">]？？？";
	  		if(confirm(str)){
	  			window.location.href="TMLAction.action?actionStr=del&uid="+uid;
	  		}
	  	}
	  </script>
	</head>
	<body> 
	  <s:if test="content.size()!=0">
	  <h3 style="text-align:center;margin-top:1em;">管理员列表</h3>
	  <div class="indexbox" style="margin-top:0.5em;">	  
	  	<table cellspacing="0" cellpadding="0" width="100%" border="0">	  		
	  		<tr>
	  			<th width="8%" align="center">管理员ID</th>
	  			<th width="5%" align="center">管理员名</th>  
	  			<th width="7%" align="center">权限</th>
	  			<th width="7%" align="center">删除</th>
	  		</tr>
	  		<s:iterator value="content" status="st">
	  			<tr id="topList<s:property value="#st.index"/>"
	  				onmousemove="myMouseOn('topList<s:property value="#st.index"/>')"
	  			    onmouseout="myMouseOut('topList<s:property value="#st.index"/>')"
	  			>
	  				
	  				<td align="center"><s:property value="uid"/></td>
	  				<td align="center"><s:property value="uname"/></td>
	  				<td align="center">
	  					<s:if test="%{role>2}">
	  						超级管理员
	  					</s:if>
	  					<s:else>
	  						普通管理员
	  					</s:else>	  					
	  				</td>
	  				<td align="center">
	  					<s:if test="%{role>2}">
	  						－－－－
	  					</s:if>
	  					<s:else>
	  						<a href="JavaScript:showDel('<s:property value='uname'/>','<s:property value='uid'/>')">
	  						<img src="images/no.png"/ border="0" width="15" height="15" style="vertical-align:middle;">删除</a>
	  					</s:else>
	  				</td>
	  			</tr>
	  		</s:iterator>
	  	</table>
	  </div>
	  <!-- 分页的导航条 -->
	  <s:url id="target" value="TMLAction" includeParams="none"/>	  
	  <s:include value="nav.jsp">
	  </s:include>
	  </s:if>
	  <s:else>
	  	<div class="personal_messagebox">
			<h1>高校在线答疑系统提示您：没有内容可显示</h1>
			<p><s:property value="message"/></p>
			<p><a href="adminIndex.jsp target="_top"">点此处去主页</a></p>
			<p><a href="JavaScript:history.back();">点击这里返回上一页</a></p>
		</div>
	  </s:else>
	  <script language="JavaScript">
	  	var message = "<s:property value="message"/>";
	  	if(message!=null||message!=""){
	  		eval(message);
	  	}
	  </script>
	</body>
</html>
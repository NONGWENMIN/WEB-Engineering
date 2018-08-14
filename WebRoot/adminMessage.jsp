<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <title>
	    <s:text name="index.title"/>	    
	  </title>
	  <link rel="stylesheet" type="text/css" href="css/style1.css" />
	  <script language="JavaScript">
       var count = 2;
       function myTimer(){
          if(count!=0){
            count--;
            setTimeout("myTimer()",1000);
          }
          else{
            window.location.href=("<s:property value="url"/>");
          }
       }
     </script>
	</head>	
	<body onload="myTimer();">
		<s:include value="adminTop.jsp"/>
		<div id="nav">
		<table>
			<tr>
				<td>
					<a href="adminIndex.jsp">高校在线答疑系统管理</a>
	   				&raquo;&nbsp;提示信息
				</td>
			</tr>
		</table>
		</div>
		<div class="messagebox">
			<h1>高校在线答疑系统提示您：</h1>
			<p><s:property value="message"/></p>
			<p><a href="adminIndex.jsp">点此处去主页</a></p>
			<p><a href="<s:property value="url"/>">如果浏览器没有自动跳转，请点此处</a></p>		
		</div>
	</body>
</html>
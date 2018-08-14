<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <title>
	    <s:text name="index.title"/>	    
	  </title>
	  <link rel="stylesheet" type="text/css" href="css/style2.css"/>
	  <script language="JavaScript" src="script/trim.js"></script>
	  <script language="JavaScript">
	  	function checkApp(){
	  		var reg = /^\d+$/;	  		
	  		var reason = document.all.reason.value.trim();
	  		var kh = document.all.tgid.value.trim();
	  		if(kh==""){
	  			showMsg("课程号不得为空，且为数字组合","tgid");
	  			return false;
	  		}
	  		if(!reg.test(kh)){
	  			showMsg("课程号格式不正确，应为数字组合","tgid");
	  			return false;
	  		}
	  		if(reason==""){	  			
	  			showMsg("申请原因不得为空，一般填写自己资料和加入原因","reason");
	  			return false;
	  		}
	  		return true;
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
	  				&raquo;&nbsp;申请课程
	  			</td>
	  		</tr>
	  	</table>
	  </div>
	  <table class="myinfo" border="0" cellpadding="0" cellspacing="0">
	  	<tr>
	  		<td width="155">
	  			<s:if test="#session.role==0">
	  				<s:include value="stu_left_menu.jsp"/>
	  			</s:if>
	  			<s:if test="#session.role==1">
	  				<s:include value="teacher_left_menu.jsp"/>
	  			</s:if>	  		
	  		</td>
	  		<td>
	  			<div class="changeInfo">
				<h3>申请课程</h3>
					<table width="50%" border="0" align="center" style="margin-top:3em;">
						<s:form action="AAction" theme="simple" onsubmit="return checkApp()">
						<tr>
							<td align="right" width="25%">课程编号：</td>
							<td><s:textfield name="tgid" cssClass="input"/></td>
						</tr>
						<tr>
							<td align="right" width="25%">申请理由：</td>
							<td><s:textarea name="reason" cssClass="textarea" rows="4" cols="30"/></td>
						</tr>
						<tr>
							<td align="center">&nbsp;</td>
							<td align="center"><s:submit id="button" value="提交申请"/></td>
						</tr>
						</s:form>
					</table>
				</div>
	  		</td>
	  	</tr>
	  </table>
	  <s:include value="qq.jsp"/>
	</body>
</html>
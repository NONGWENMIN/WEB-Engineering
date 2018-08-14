<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <title>
	    <s:text name="index.title"/>	    
	  </title>
	  <link rel="stylesheet" type="text/css" href="css/style1.css"/>
	  <link rel="stylesheet" type="text/css" href="css/style2.css"/>
	  <script language="JavaScript" src="script/trim.js"></script>
	  <script language="JavaScript">
	  function checkCourse(){
	  	var gname = document.all.tgname.value.trim();
	  	var name = document.all.uname.value.trim();
	  	var detail = document.all.tdetail.value.trim();
	  	if(gname==""){
	  		document.all.MsgTname.innerHTML="<img src='images/check_error.gif'/>课程名不得为空。";
			return false;
	  	}
	  	if(name==""){
	  		document.all.MsgTeacher.innerHTML="<img src='images/check_error.gif'/>课程老师不得为空。";
			return false;
	  	}
	  	if(detail==""){
	  		document.all.MsgDetail.innerHTML="<img src='images/check_error.gif'/>课程描述不得为空。";
			return false;
	  	}
	  	return true;
	  }
	 </script>
	</head>
	<body>
		  <table width="75%" border="0" align="center"
		  style="border:1px solid #95bcce;margin-top:20px;">
		  <th colspan="3" height="40">编辑课程信息</th>
		  <s:form action="ECAction" theme="simple" onsubmit="return checkCourse()">
		  		<tr>
		  			<td align="right" width="25%">课程名:</td>
		  			<td width="25">		  				
		  				<input type="text" name=tgname value="<s:property value='course.tgname'/>" class="input4">
		  			</td>
		  			<td width="50%"><span id="MsgTname" class="message"></span></td>
		  		</tr>
		  		<tr>
		  			<td align="right">课程老师:</td>
		  			<td><input type="text" name=uname value="<s:property value='course.uname'/>" class="input4"></td>
		  			<td><span id="MsgTeacher" class="message"></span></td>
		  		</tr>
		  		<tr>
		  			<td vlign="top" align="right" style="vertical-align:top;">课程描述:</td>
		  			<td>
		  				<s:textarea name="tdetail" cssClass="textarea" rows="4" cols="30" value="%{course.tdetail}"/>
		  			</td>
		  			<td><span id="MsgDetail" class="message"></span></td>
		  		</tr>
		  		<tr>
		  			<td colspan="2" align="right"><s:submit value="修  改" id="button"/></td>
		  			<td>
		  				<s:hidden name="actionStr" value="save"/>
		  				<s:hidden name="tgid" value="%{course.tgid}"/>
		  			</td>
		  		</tr>
		  		<tr>
		  			<td></td>
		  			<td colspan="2" align="left">
		  				${message}
		  			</td>
		  		</tr>
		  		</s:form>
		  </table>
	</body>
</html>
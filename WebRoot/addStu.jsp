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
		function checkAddStu(){
			var stu = document.getElementById('stuNO').value.trim();
			var course = document.all.course.value;
			var reg = /^(\d+)(;\d+)*;?$/;
			if(course=="all"){
				alert("请选择具体某一门课程");
				return false;
			}
			if(stu==""){
				alert("学号不能为空");
				return false;
			}
			if(!reg.test(stu)){
				alert("输入的学号格式不正确，多个学号请用英文格式逗号隔开");
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
	  				&raquo;&nbsp;添加学生
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
				<h3>添加学生</h3>
				  	<table width="50%" border="0" align=center style="margin-top:4em;">
				  		<s:form action="ASAction" theme="simple" onsubmit="JavaScript:return checkAddStu();">
				  		<tr>
				  			<td valign="top" align="right" width="30%">请选择课程:
				  			</td>
				  			<td>
				  				<s:select name="course" theme="simple"			
				  						value="%{selected}"
				  						list="courseList"
				  						listKey='key'
				  						listValue='value'
				  				/>
				  			</td>
				  		</tr>
				  		<tr>
				  			<td valign="top" align="right">请输入学号:</td>
				  			<td>
				  				<s:textarea id="stuNO" name="stuNO" cssClass="textarea" rows="5" cols="40"  
				  					onclick="JavaScript:this.value=''"	value="多个学号请用英文分号隔开"/>
				  			</td>
				  		</tr>
				  		<tr>
				  			<td colspan="2" align="center"><s:submit value="提  交" id="button"/></td>
				  		</tr>
				  		</s:form>
				  		<tr><td></td><td>${message}</td></tr>
				  	</table>
	  			</div>
	  		</td>
	  	</tr>
	  </table>
	  
	</body>
</html>
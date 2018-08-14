<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <title>
	    <s:text name="index.title"/>	    
	  </title>
	  <link rel="stylesheet" type="text/css" href="css/style2.css"/>
	  <link rel="stylesheet" type="text/css" href="css/style1.css"/>
	  <script type="text/javascript" src="script/trim.js"></script>
	  <script language="JavaScript">
	  	function checkRevert(){
	  		var rcontent = document.all.nr.value.trim();
	  		var rtitle = document.all.bt.value.trim();
	  		if(rtitle==""){
	  			alert("提问标题不得为空");
	  			return false;
	  		}
	  		if(rtitle.length<8){
	  			alert("问题标题长度不得小于8");
	  			return false;
	  		}
	  		if(rcontent==""){
	  			alert("问题内容不得为空");
	  			return false;
	  		}
	  		if(rcontent.length<8){
	  			alert("问题内容长度不得小于8");
	  			return false;
	  		}
			return true;
	  	}
	  </script>
	</head>
	<body>
	  <s:include value="top.jsp"/>
	  <div id="nav">
	  <table>
	  	<tr>
	  		<td>
	  			<a href="IndexAction.action?actionStr=all"><s:text name="msg.nav"/></a>	  	
				&raquo;&nbsp发起新问题			  	
	  		</td>
	  	</tr>
	  </table>
	  </div>
	  <!-- 发起新问题的表单 -->
	  <div class="tw">
	  	<div class="left">
		  	<h4>提出新问题</h4>
		  	<div class="notice2">
		  		提问注意事项：
		  		<p>1.不得谩骂他人</p>
		  		<p>2.不要恶意灌水</p>
		  		<p>3.问题字数不得少于8</p>
		  		<p>4.不得发表带政治色彩内容</p>
		  		<p>5.不要发表与课程问题无关的东西  </p>
		  	</div>
	  	</div>
	  	<s:form action="EAction" theme="simple" onsubmit="return checkRevert()">
	  		<table>
	  			<tr>
	  				<td>课程：</td>
	  				<td>
	  					<s:select
	  						name="tgid"
	  						list="course"
	  						listKey='key'
	  						listValue='value'
	  					/>
	  					<script language="JavaScript">
	  						var gid = ${sessionScope.tgid};
	  						if(gid!=null){
	  							document.all.tgid.value=gid;
	  						}
	  					</script>
	  				</td>
	  			</tr>
	  			<tr>
	  				<td>标题：</td>
	  				<td><s:textfield name="bt" cssClass="wtbt"/></td>
	  			</tr>
	  			<tr>
	  				<td>内容：</td>
	  				<td><s:textarea name="nr" rows="10" cols="80" cssClass="textarea" /></td>
	  			</tr>
	  			<tr>
	  				<td>
	  					<s:hidden name="actionStr" value="fqwt"/>
	  				</td>
	  				<td>
	  					<s:submit id="button" value="发起问题"/>
	  				</td>
	  			</tr>
	  		</table>
	  	</s:form>
	  </div>
	</body>
</html>
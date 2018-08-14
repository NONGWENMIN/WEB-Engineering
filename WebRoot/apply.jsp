<%@page contentType="text/html;charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
	  <title>
	    <s:text name="index.title"/>	    
	  </title>
	  <link rel="stylesheet" type="text/css" href="css/style1.css" />
	  <script type="text/javascript" src="script/trim.js"></script>
	  <script type="text/javascript" src="script/showMsg.js"></script>
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
	  <table>
	  	<tr>
	  		<td>
	  			<a href="IndexAction.action"><s:text name="msg.nav"/></a>
	   			&raquo;&nbsp;申请课程
	  		</td>
	  	</tr>
	  </table>
	  </div>
	  <div class="regbox">
		<div class="regtitle">&nbsp;&nbsp;申请课程</div>		
		<table cellspacing="0" cellpadding="0" width="100%" border="0">
			<s:form action="AAction" theme="simple" onsubmit="return checkApp()">
			<tr>
				<td align="right" width="40%">课程编号：</td>
				<td><s:textfield name="tgid" cssClass="input"/></td>
				<script>
					var gid = ${param.tgid}+"";
					if(gid!=""){
						document.all.tgid.value = gid;
					}
				</script>
			</tr>
			<tr>
				<td align="right">申请理由：</td>
				<td><s:textarea name="reason" cssClass="textarea" rows="4" cols="30"/></td>
			</tr>
			<tr>
				<td align="center">&nbsp;</td>
				<td style="padding-left:11em;"><s:submit id="button" value="提交申请"/></td>
			</tr>
			</s:form>
		</table>
		</div>
		<s:include value="qq.jsp"/>
	</body>
</html>
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
	  <script language="JavaScript" src="script/keyUp.js"></script>
	  <script language="JavaScript">
	  	function showDel(uname,uid){
	  		var str = "确定删除用户[<"+uname+">]？？？";
	  		if(confirm(str)){
	  			window.location.href="TULAction.action?actionStr=del&uid="+uid;
	  		}
	  	}
	  	function showSetTeacher(uname,uid){
	  		var str = "确定设置用户[<"+uname+">]为老师？？？";
	  		if(confirm(str)){
	  			window.location.href="TULAction.action?actionStr=setTeacher&uid="+uid;
	  		}
	  	}
	  	function showCancelTeacher(uname,uid){
	  		var str = "确定取消用户[<"+uname+">]的老师身份？？？";
	  		if(confirm(str)){
	  			window.location.href="TULAction.action?actionStr=cancelTeacher&uid="+uid;
	  		}
	  	}
	  </script>
	</head>
	<body>
	  <s:if test="content.size()!=0">
	  <h3 style="text-align:center;margin-top:1em;">用户列表</h3>
	  <div class="indexbox" style="margin-top:0.5em;">
	  	<table cellspacing="0" cellpadding="0" width="100%" border="1">
	  		<tr>
	  			<s:form action="TULAction" theme="simple">
	  			<td colspan="5" valign="middle" style="border:0px;">
	  				<font size="2.8">请选择分类:</font>
	  				<s:select name="condition" theme="simple"			
	  						value="%{selected}"
	  						onchange="JavaScript:this.form.submit();"
	  						list="#{'all':'所有用户','stu':'学生用户','teacher':'老师用户'}"
	  						listKey='key'
	  						listValue='value'
	  				/>
	  			</td>
	  			</s:form>
	  			<s:form action="TULAction" theme="simple">
	  			<td align="right" colspan="5" style="border:0px;">	  				
				  	<s:radio name="key" value="'UName'"
				  		list="#{'UID':'按用户ID','UName':'按用户名'}"
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
	  			<th width="6%" align="center">用户ID</th>
	  			<th width="6%" align="center">姓名</th>
	  			<th width="4%" align="center">性别</th>
	  			<th width="10%" align="center">角色</th>	  			
	  			<th width="10%">电子邮件</th>
	  			<th width="10%">注册时间</th>
	  			<th width="15%" align="center">最后登陆</th>	  
	  			<th width="15%" align="center">最后发表</th>	  
	  			<th width="7%" align="center">权限</th>	  
	  			<th width="5%" align="center">删除</th>
	  		</tr>  		
	  		<s:iterator value="content" status="st">
	  			<tr id="topList<s:property value="#st.index"/>"
	  				onmousemove="myMouseOn('topList<s:property value="#st.index"/>')"
	  			    onmouseout="myMouseOut('topList<s:property value="#st.index"/>')"
	  			>
	  				<td align="center"><s:property value="uid"/></td>
	  				<td align="center"><s:property value="uname"/></td>
	  				<td align="center"><s:property value="gender"/></td>
	  				<td align="center">
	  					<s:if test="%{role==0}">
	  						学生
	  						<a href="#" onclick="JavaScript:showSetTeacher('<s:property value='uname'/>','<s:property value='uid'/>');">设为老师</a>
	  					</s:if>
	  					<s:else>
	  						老师
	  						<a href="#" onclick="JavaScript:showCancelTeacher('<s:property value='uname'/>','<s:property value='uid'/>');">取消老师</a>
	  					</s:else>
	  				</td>
	  				<td align="center"><s:property value="email"/></td>
	  				<td align="center"><s:property value="regDate"/></td>
	  				<td align="center"><s:property value="lastLogin"/></td>
	  				<td align="center"><s:property value="lastEmit"/></td>
	  				<td align="center">
	  					<s:if test="%{permit==1}">
	  						是
	  						<a href="TULAction.action?actionStr=jy&uid=<s:property value='uid'/>">禁言</a>
	  					</s:if>	
	  					<s:else>
	  						否
	  						<a href="TULAction.action?actionStr=hf&uid=<s:property value='uid'/>">恢复</a>
	  					</s:else>
	  				</td>
	  				<td align="center">
	  					<a href="JavaScript:showDel('<s:property value='uname'/>','<s:property value='uid'/>')">
	  					<img src="images/no.png"/ border="0" width="15" height="15" style="vertical-align:middle;">删除</a>
	  				</td>
	  			</tr>
	  		</s:iterator>
	  	</table>
	  </div>
	  <!-- 分页的导航条 -->
	  <s:url id="target" value="TULAction" includeParams="none"/>	  
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
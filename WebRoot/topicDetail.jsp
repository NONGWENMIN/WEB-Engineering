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
	  		if(rcontent==""){
	  			alert("回答内容不得为空");
	  			return false;
	  		}
	  		if(rcontent.length<8){
	  			alert("回答问题内容长度不得小于8");
	  			return false;
	  		}
	  		document.all.button.disabled=true;
			return true;
	  	}
	  	function setTitle(title){
	  		document.all.bt.value=title;
	  	}
	  </script>
	</head>
	<body>
	  <s:include value="top.jsp"/>
	  <div id="nav">
	  <table>
	  	<tr>
	  		<td>
	  			<a href="IndexAction.action?actionStr=all"><s:text name="msg.nav"/></a>&nbsp;&raquo;	  	
			  	<a href="TTLAction.action?tgid=<s:property value="gid"/>">
			  		<s:property value="gName"/>
			  	</a>&nbsp;&raquo;
			  	<s:property value="title"/>
	  		</td>
	  		<td align="right">
	  		<s:if test="#session.uid!=null">
	  			<input type="button" id="button" value="我要提问" onclick="window.location.href='GMCAction.action'"/>
	  			<input type="button" id="button" value="我要回答" 
	  				onclick="window.location.href='#1';document.all.nr.focus();"/>
	  			</s:if>
	  		</td>
	  	</tr>
	  </table>	  	
	  </div>
	  <s:iterator value="content" status="st">
	  <div class="revert">
		  <s:if test="#st.first">
		  	<h1><s:property value="title"/></h1>
		  </s:if>
	  		<table cellpadding="0" cellspacing="0" width="1223" height="120">
	  			<tr>
	  				<td class="author" height="120">
	  					<div class="tx">
	  					<span>&nbsp;<s:property value="uname"/></span>
	  					<br>
							<img src="<s:property value="tx"/>" margin="10px" width="120" height="120"/>
							<br><br>
							<p>注册时间&nbsp;<s:property value="zcsj"/></p>
							<p>最后登陆&nbsp;<s:property value="zhdl"/></p>
						</div>
	  				</td>
	  				<td class="nr">
	  					<span>
	  						<em>
	  							<s:if test="#st.first">
	  								楼主
	  							</s:if>
	  							<s:else>
	  								<s:property value="#st.index"/>楼
	  							</s:else>	  												
	  						</em>
	  						&nbsp;发表于&nbsp;<s:property value="fbsj"/>
	  					</span>
	  					<h2><s:property value="title"/></h2>
	  					<h3><s:property value="content"/></h3>
	  				</td>
	  			</tr>
	  			<tr>
	  				<td class="author"></td>
	  				<td>
	  					<div class="operate">	
	  					<span style="valign=middle;">  						
	  						<p><a href="#" onclick="scroll(0,0)">TOP</a></p>
	  						<s:if test="!#session.uname.equals(uname)"><!-- 该回复是自己回复的时候 -->
	  						<p><a href="#1" onclick="setTitle('回答 <s:property value="uname"/>')">回复</a></p>
	  						</s:if>
	  					</span>
	  					</div>
	  				</td>
	  			</tr>
	  		</table>
	  </div>
	  </s:iterator>
	  <!-- 分页导航条 -->
	  <s:url id="target" value="TTDAction" includeParams="none"/>	  
	  <s:include value="nav.jsp">
	  </s:include>
	  <!-- 回复帖子的表单 -->
	  <div class="hf">
	  	<h4><a name="#1"></a>回复本主题</h4>
	  	<div class="notice">
	  		回帖注意事项：
	  		<p>1.不得谩骂他人</p>
	  		<p>2.不要恶意灌水</p>
	  		<p>3.不得发表带政治色彩内容</p>
	  		<p>4.回答问题字数不得少于8</p>
	  		<p>5.不要回复与本问题无关的东西</p>
	  	</div>
	  	<s:form action="EAction" theme="simple" onsubmit="return checkRevert()">
	  		<table>
	  			<tr>
	  				<td>标题：</td>
	  				<td><s:textfield name="bt" cssClass="htbt"/></td>
	  			</tr>
	  			<tr>
	  				<td>内容：</td>
	  				<td><s:textarea name="nr" rows="6" cols="80" cssClass="textarea" /></td>
	  			</tr>
	  			<tr>
	  				<td>
	  					<s:hidden name="actionStr" value="hftz"/>
	  					<s:hidden name="tid"/>
	  				</td>
	  				<td>
	  					<s:submit id="button" value="参与讨论"/>
	  				</td>
	  			</tr>
	  		</table>
	  	</s:form>
	  </div>
	 
	</body>
</html>
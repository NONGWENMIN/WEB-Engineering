<%@ page contentType="text/html; charset=GBK" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
 <table width="98%" border="0" align="center" style="margin:4px 0px;">
  	<tr align="right">
  		<td align="left" style="font-size:13px;">
  			共${total}页|第${curPage}页
  		</td>
  		<s:form action="%{target}" theme="simple">
  		<td width="65%"><font size="2">选择分页跨度：</font>  		
	        <s:select
	           name="span"
	           list="#{'1':'每页1个','2':'每页2个','5':'每页5个','10':'每页10个','15':'每页15个','20':'每页20个'}"
	           listKey="key"
	           listValue="value"
	           onchange="this.form.submit();"
	         />
	    </td>
	    </s:form>
	   	<td width="7%">
	        <s:if test="curPage!=1">
	        	<a href="?curPage=<s:property value="curPage-1"/>">
	            	<img src="images/pre.gif" alt="上一页" border="0">
	          	</a>
	        </s:if>
      	</td>
  		<s:form action="%{target}" theme="simple">
  		<td width="7%">
	        <s:select
	           name="curPage"
	           list="pageList"
	           listKey="key"
	           listValue="value"
	           onchange="this.form.submit();"
	         />					
  		</td>
  		</s:form>
	   	<td width="7%">
	        <s:if test="curPage<total">
	        	<a href="?curPage=<s:property value="curPage+1"/>">
	            	<img src="images/next.gif" alt="下一页" border="0">
	          	</a>
	        </s:if>
      	</td>	  		
  	</tr>
</table>
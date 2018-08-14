package Action;
import java.util.*;
import com.opensymphony.xwork2.*;
public class TopicDetailAction extends FenYeAction{
	private int tid;								//提问ID
	public void setTid(int tid){		
		this.tid = tid;								//设置提问ID的值
		getSession().put("tid",tid);				//将提问ID放进session
		this.setCurPage(1);							//设置当前显示第一页
	}
	public int getTid(){
		return (Integer)getSession().get("tid"); 	//返回提问ID
	}
	@Override
	public String getSql(){
		sql = "select du.UName uname,a.tag,a.gender,a.tx"+
			",a.zcsj,a.zhdl,b.title,b.content,b.fbsj from("+
			"select du.UID uid,du.UGender "+
			"gender,du.UHead tx,du.URegDate "+
			"zcsj,ifnull(du.ULastLogin,'xx') zhdl,case "+
			"du.URole when 0 then '学生' when 1 then '老师'"+
			" when 2 then '管理员' end tag	from DY_User du) "+
			"a,(select dt.UID uid,dt.TTitle title,dt.TContent"+
			" content,dt.TDate fbsj	from DY_Topic dt where "+
			"dt.TID="+getTid()+" union	select dr.UID uid,"+
			"dr.RTitle title,dr.RContent content,dr.RDate fbsj"+
			" from DY_Revert dr	where dr.TID="+getTid()+")b,"+
			"DY_User du where a.uid=b.uid and a.uid=du.UID order by b.fbsj";	//设置SQL语句的值
		return sql;																//返回SQL语句
	}
	public List getContent(){
		return dbu.getTopicDetail(getFenYe());									//得到页面显示内容
	}
	public int getGid(){														//得到当前提问对应的课程ID
		tempSql = "select TGID from DY_Topic where TID="+getTid();
		return Integer.parseInt(dbu.getStringInfo(tempSql));		
	}
	public String getGName(){
		tempSql = "select TGName from DY_Topic dt,DY_Topic_Group"+
			" dtg where dt.TGID=dtg.TGID and dt.TID="+getTid();					//得到提问对应课程名的SQL语句
		return dbu.getStringInfo(tempSql);										//执行查询并返回结果
	}
	public String getTitle(){													
		tempSql = "select TTitle from DY_Topic where TID="+getTid();			//得到提问标题的SQL语句
		return dbu.getStringInfo(tempSql);										//执行查询返回结果
	}
    public String execute()throws Exception{
		String uid = (String)getSession().get("uid");//得到登陆的用户
    	if("maxPage".equals(actionStr)){			 //回帖过后显示最后一页
    		this.setCurPage(getTotal());			 //设置显示最后一页
    	}
    	tempSql = "select TGID from DY_Topic where TID="+tid;
    	String tgid = dbu.getStringInfo(tempSql);	 //查询得到该问题的所属课程号
    	if("yz".equals(actionStr)){
    		tempSql = "select 1 from DY_TU where UID="+uid+" and TGID="+
    		"(select TGID from DY_Topic where TID="+tid+")";
	    	if(!dbu.isExist(tempSql)){
	    			tempSql = "select 1 from DY_Apply da where UID="+uid+
						" and AFlag=0 and TGID="+tgid;		//查看是否已提交该门课的申请并且没有处理
					if(dbu.isExist(tempSql)){
						url = "IndexAction.action?actionStr=all";
						message = "您已经提交了该门课的申请，请耐心等待";
					}
					else{
						url = "apply.jsp?tgid="+tgid;
						message = "对不起，你没选择这门课，你可以申请这门课";
					}
					return ERROR;
	    	}
    	}
    	tempSql = "update DY_Topic set TReadCount=TReadCount+1 where"+
    		" TID="+tid;
    	dbu.update(tempSql);						//将阅读次数加一
		return SUCCESS;								//返回SUCCESS字符串
	}
}

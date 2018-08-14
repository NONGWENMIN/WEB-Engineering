package Action;
import java.util.*;
import com.opensymphony.xwork2.*;
public class TopicListAction extends FenYeAction{
	private int tgid;
	public void setTgid(int tgid){				//tgid属性的set方法
		this.tgid = tgid;						//设置tgid的值
		getSession().put("tgid",tgid);			//将其值放进session中
		this.setCurPage(1);						//设置当前页显示第一页
	}
	public int getTgid(){						//得到课程ID		 									
		return (Integer)getSession().get("tgid");
	}
	@Override
	public String getSql(){
		sql = "select a.tid,a.gname,a.ftr,a.title,a.djs,a.ftsj,"+
			"ifnull(c.htr,a.ftr) htr,ifnull(c.htsj,a.ftsj) htsj,"+
			"ifnull(c.revert,0) revert from(select dta.TID tid,"+
			"dtg.TGName gname,du.UName ftr,dta.TTitle title,"+
			"dta.TReadCount djs,dta.TDate ftsj from DY_Topic "+
			"dta,DY_User du,DY_Topic_Group dtg where dta.TGID="+
			"dtg.TGID and du.UID=dta.UID and dta.TGID="+getTgid()+
			")a left join(select b.tid,du.UName htr,dra.RDate htsj,"+
			"b.revert from (select TID tid,max(RID) RID,count(RID)"+
			" revert from DY_Revert group by TID order by TID)b,"+
			"DY_Revert dra,DY_User du where b.RID=dra.RID and "+
			"du.UID=dra.UID)c on a.tid=c.tid order by htsj desc";
		return sql;
	}
	public List getContent(){
		return dbu.getGroupContent(getFenYe());//得到页面显示内容
	}
	public String getGName(){
		tempSql = "select TGName from DY_Topic_Group where"+
						" TGID="+getTgid();
		return dbu.getStringInfo(tempSql);
	}
	@Override
	public String execute()throws Exception{
		String role = (String)getSession().get("role");
		String uid = (String)getSession().get("uid");
		if("0".equals(role)){
			tempSql = "select 1 from DY_TU where UID="+uid+
				" and TGID="+getTgid();
			if(!dbu.isExist(tempSql)){					//该学生不属于这门课
				tempSql = "select 1 from DY_Apply da where UID="+uid+
					" and AFlag=0 and TGID="+getTgid();	//查看是否已提交该门课的申请并且没有处理
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
		return SUCCESS;									//返回SUCCESS字符串
	}
}
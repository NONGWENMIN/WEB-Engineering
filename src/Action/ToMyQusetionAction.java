package Action;
import java.util.*;
import com.opensymphony.xwork2.*;
public class ToMyQusetionAction extends TipAndFenYeAction{
 	private List content;									//显示内容的集合
    @Override
    public String getSql(){
    	String uid = (String)getSession().get("uid");		//得到登录人的ID
		sql = "select a.gname,a.tid,a.ftr,a.title,a.djs,"+
			"a.ftsj,ifnull(c.htr,a.ftr) htr,"+
			"ifnull(c.htsj,a.ftsj) htsj,ifnull(c.revert,0)"+
			" revert from(select dtg.TGName gname,dta.TID "+
			"tid,du.UName ftr,dta.TTitle title,"+
			"dta.TReadCount djs,dta.TDate ftsj from "+
			"DY_Topic dta,DY_User du,DY_Topic_Group dtg "+
			"where du.UID=dta.UID and dta.TGID=dtg.TGID "+
			"and dta.UID="+uid+" and dtg.TGID "+getCourse()+
			" )a left join(select b.tid,"+
			"du.UName htr,dra.RDate htsj,b.revert from("+
			"select TID tid,max(RID) RID,count(RID) revert"+
			" from DY_Revert group by TID order by TID)b,"+
			"DY_Revert dra,DY_User du where b.RID=dra.RID"+
			" and du.UID=dra.UID)c on a.tid=c.tid order by"+
			" htsj desc";
    	//sql = "select * from dy_topic";
		return sql;
	}
	public List getContent(){
		return content;
	}
	@Override
	public String execute()throws Exception{
		content = dbu.getGroupContent(getFenYe());	//查询数据库得到首页显示内容
		return SUCCESS;
	}
    
    
}
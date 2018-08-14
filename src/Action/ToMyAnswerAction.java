package Action;
import java.util.*;
import com.opensymphony.xwork2.*;

public class ToMyAnswerAction extends TipAndFenYeAction{
    private List content;		//显示内容
    @Override
    public String getSql(){
    	String uid = (String)getSession().get("uid");		//得到登录人的ID
		sql = "select a.tid,a.gname,a.ftr,a.title,a.djs,"+
			"a.ftsj,ifnull(c.htr,a.ftr) htr,"+
			"ifnull(c.htsj,a.ftsj) htsj,ifnull(c.revert,0)"+
			" revert from(select dtg.TGName gname,dta.TID "+
			"tid,du.UName ftr,dta.TTitle title,dta.TReadCount"+
			" djs,dta.TDate ftsj from DY_Topic_Group dtg,"+
			"DY_Topic dta,DY_User du where du.UID=dta.UID and"+
			" dta.TGID=dtg.TGID and dta.TID in "+
			"(select distinct TID from DY_Revert where UID="+
			uid+") and dtg.TGID "+getCourse()+")a left join("+
			"select b.tid,"+
			"du.UName htr,dra.RDate htsj,b.revert from(select "+
			"TID tid,max(RID) RID,count(RID) revert from "+
			"DY_Revert group by TID order by TID)b,DY_Revert "+
			"dra,DY_User du where b.RID=dra.RID and du.UID="+
			"dra.UID and b.tid in (select "+
			"distinct TID from DY_Revert where UID="+uid+
			"))c on a.tid=c.tid order by htsj desc";
		return sql;
	}
	public List getContent(){
		return content;
	}
	public String getLabel(){
		String role = (String)getSession().get("role");
		return role.equals("0")?"我的参与":"已回答";
	}
	@Override
	public String execute() throws Exception{
		content = dbu.getGroupContent(getFenYe());			//查询数据库得到显示内容
		return SUCCESS;
	}
}
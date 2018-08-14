package Action;
import java.util.*;
import com.opensymphony.xwork2.*;

public class ToMyCourseAction extends TipAndFenYeAction{
    private List content;		//显示内容
    @Override
    public String getSql(){
    	String uid = (String)getSession().get("uid");		//得到登录人的ID
		sql = "select dtg.TGID gid,dtg.TGName gname,dtg.TDetail"+
			" detail,count(a.TID) topic,sum(ifnull(a.revert,0))"+
			" revert,ifnull(a.uname,'') uname,ifnull(a.tid,'') "+
			"tid,ifnull(a.title,'') title,ifnull(a.lastTime,'')"+
			" lastTime from DY_TU dtu,DY_Topic_Group dtg left "+
			"join(select du.UName uname,d.gid,d.tid,d.revert,"+
			"d.title,d.lastTime from DY_User du,(select dtb.TGID"+
			" gid,dtb.TID tid,dtb.TTitle title,ifnull(b.revert,0)"+
			" revert,ifnull(b.uid,dtb.UID) UID,"+
			"ifnull(b.lastTime,dtb.TDate) lastTime from DY_Topic"+
			" dtb left join(select c.tid,c.revert,dra.UID uid,"+
			"dra.RDate lastTime from(select TID tid,max(RID) RID"+
			",count(RID) revert from DY_Revert group by TID)c,"+
			"DY_Revert dra where c.RID=dra.RID)b on dtb.TID=b.tid"+
			" order by gid asc,lastTime desc)d where du.UID=d.UID"+
			")a on dtg.TGID=a.gid where dtu.UID="+uid+" and "+
			"dtu.TGID=dtg.TGID group by dtg.TGID";
		return sql;
	}
	public List getContent(){
		return content;
	}
	@Override
	public String execute()throws Exception{
		content = dbu.getIndexContent(getFenYe());			//查询数据库得到首页显示内容
		return SUCCESS;
	}
}
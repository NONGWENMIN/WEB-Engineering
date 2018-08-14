package Action;
import com.opensymphony.xwork2.*;
public class GetTipAction extends BaseAction{
	private String apply;					//未处理申请的数目
	private String question;				//未回答的申请的数目
	public String getApply(){
		String uid = (String)getSession().get("uid");//得到登陆的人的UID
		String sql = "select count(*) from (select 1 from"+
			" DY_Apply da,DY_Topic_Group dtg,DY_User du "+
			"where da.UID=du.UID and da.TGID=dtg.TGID and"+
			" da.AFlag=0 and da.TGID in(select TGID from "+
			"DY_TU dtu where dtu.UID="+uid+"))a";	//搜出未处理申请数目的SQL语句
		return dbu.getStringInfo(sql);
	}
	public String getQuestion(){
		String uid = (String)getSession().get("uid");//得到登陆的人的UID
		String sql = "select count(*) from (select dta.TID"+
			" tid from DY_Topic dta,DY_User du,DY_Topic_Group"+
			" dtg where du.UID=dta.UID and dta.TGID=dtg.TGID "+
			"and dta.TID not in (select distinct TID from "+
			"DY_Revert where UID="+uid+") and dtg.TGID in "+
			"(select TGID from DY_TU dtu where dtu.UID="+uid+
			"))a";
		return dbu.getStringInfo(sql);
	}
	@Override
	public String execute()throws Exception{
		if(getSession().get("uid")==null){			//如果用户没有登陆
			return LOGIN;							//返回LOGIN视图
		}
		return SUCCESS;
	}
}
package Action;
import com.opensymphony.xwork2.*;
public class EmitAction extends BaseAction{
    private String bt;			//问题标题
    private String nr;			//问题内容
    private int tid;			//所回复问题ID
    private int tgid;			//发起问题的课程
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		System.out.println("set:"+tid);
		this.tid = tid;
	}
	public int getTgid() {
		return tid;
	}
	public void setTgid(int tgid) {
		this.tgid = tgid;
	}
    public String getBt() {
		return bt;
	}
	public void setBt(String bt) {
		this.bt = bt;
	}
	public String getNr() {
		return nr;
	}
	public void setNr(String nr) {
		this.nr = nr;
	}
	@Override
	public String execute()throws Exception{
		String sql = "";							
		String uid = (String)getSession().get("uid");
		sql = "select UPermit from DY_User where UID="+uid;
		String permit = dbu.getStringInfo(sql);
		if(actionStr.equals("hftz")){			//动作是回复问题
			if(permit.equals("0")){					//没有权限
				message = "对不起，你没有发表的权限，请联系管理员解决";
				url = "TTDAction.action?tid="+tid+"&actionStr=maxPage";
				return SUCCESS;
			}
			sql = "select 1 from DY_Topic where TID="+tid;
			if(!dbu.isExist(sql)){
				message = "对不起，你回复的问题不存在";
				url = "IndexAction.action?actionStr=all";
				return SUCCESS;
			}
			sql = "insert into DY_Revert(TID,UID,RTitle,"+
				"RContent,RDate) values('"+tid+"','"+uid+"','"+bt
				+"','"+nr+"',now())";
			if(dbu.update(sql)){
				message = "回复成功，现在将要跳转到问题页面";
				url = "TTDAction.action?tid="+tid;
			}
		}
		if(actionStr.equals("fqwt")){			//发起新问题
			if(permit.equals("0")){					//没有权限
				message = "对不起，你没有发表的权限，请联系管理员解决";
				url = "TTLAction.action?tgid="+tgid;
				return SUCCESS;
			}
			sql = "insert into DY_Topic(UID,TGID,TTitle,"+
				"TContent,TDate)values ('"+uid+"',"+tgid+",'"+bt+
				"','"+nr+"',now())";
			if(dbu.update(sql)){				//成功插入新问题
				message = "新问题发表成功，现在将要跳转到该课程问题列表页面";
				url = "TTLAction.action?tgid="+tgid;
			}
		}
		sql = "update DY_User set ULastEmit=now() where UID="+uid;
		dbu.update(sql);						//更新用户最后发表的时间
		return SUCCESS;
	}
}
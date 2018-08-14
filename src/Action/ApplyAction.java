package Action;
import com.opensymphony.xwork2.*;
public class ApplyAction extends BaseAction{
	private String tgid;		//申请课程的编号
	private String reason;		//申请课程的原因
	public void setTgid(String tgid){
		this.tgid = tgid;
	}
	public String getTgid(){
		return tgid;
	}
	public void setReason(String reason){
		this.reason = reason;
	}
	public String getReason(){
		return reason;
	}
	@Override
	public String execute()throws Exception{
		System.out.println(tgid+"===="+reason);
		String sql  = "select 1 from DY_Topic_Group where TGID="+getTgid();
		if(!dbu.isExist(sql)){
			url = "apply.jsp";							//此课不存在跳转到主页
			message = "该课程号对应的课程不存在，现在将跳转到申请页";
			return SUCCESS;
		}
		String uid = (String)getSession().get("uid");
		sql = "select 1 from DY_Apply where TGID="+tgid+" and UID='"+uid+"'"
			+" and AFlag=0";							//如果存在该学生对该门课没有处理的请求时
		if(dbu.isExist(sql)){
			url = "apply.jsp";
			message = "你已经申请过该课程，请耐心等待处理";
			return SUCCESS;
		}
		sql = "select 1 from DY_TU where TGID="+tgid+" and UID='"+uid+"'";
		if(dbu.isExist(sql)){
			url = "apply.jsp";
			message = "你已经是该课程学生，无需申请";
			return SUCCESS;
		}
		String role = (String)getSession().get("role");
		if(!"0".equals(role)){							//目前登陆的不是学生
			url = "IndexAction.action";
			message = "你的身份不是学生，不需要申请课程，现在将要跳转到主页";
			return SUCCESS;
		}
		sql = "insert into DY_Apply(TGID,UID,AReason)values ("+tgid+",'"
			+uid+"','"+reason+"')";		
		if(dbu.update(sql)){
			url = "IndexAction.action";
			message = "申请提交成功，请耐心等待，现在将要跳转到主页";
			return SUCCESS;
		}
		else{
			url = "apply.jsp";
			message = "未知错误，申请提交失败，现在将要跳转到申请页面";
			return SUCCESS;
		}
	}
}
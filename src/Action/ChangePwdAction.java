package Action;
import com.opensymphony.xwork2.*;
public class ChangePwdAction extends BaseAction{
	private String oldPwd;
	private String newPwd;
	private String reNewPwd;
	public String getOldPwd() {
		return oldPwd;
	}
	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}
	public String getNewPwd() {
		return newPwd;
	}
	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}
	public String getReNewPwd() {
		return reNewPwd;
	}
	public void setReNewPwd(String reNewPwd) {
		this.reNewPwd = reNewPwd;
	}
	@Override
	public String execute()throws Exception{
		String uid = (String)getSession().get("uid");
		if(uid==null){
			return LOGIN;
		}
		if(!reNewPwd.equals(newPwd)){
			message = "两次密码输入不一致，请核对输入";
			return SUCCESS;
		}
		String sql = "select 1 from DY_User where UID="+uid+
			" and UPwd='"+oldPwd+"'";		//查看密码是否正确的SQL语句
		if(!dbu.isExist(sql)){				//密码不正确
			message = "旧密码不匹配，修改失败";
		}
		else{
			sql = "update DY_User set UPwd='"+newPwd+"'"+
				" where UID="+uid;
			if(dbu.update(sql)){
				message = "密码修改成功，下一次登陆请用新密码";
			}
			else{
				message = "未知错误，修改失败";
			}
		}
		return SUCCESS;
	}
}
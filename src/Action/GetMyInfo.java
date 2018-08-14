package Action;

import Entity.User;

public class GetMyInfo extends GetTipAction{
	private User user;
	public void setUser(User user){
		this.user = user;					//user属性的setter方法
	}
	public User getUser(){
		return user;
	}
	@Override
	public String execute()throws Exception{
		String uid = (String)getSession().get("uid");		//得到登陆用户的ID
		String sql = "select UID,UName,UGender,UEmail,URole"+
			",UHead,URegDate,ULastLogin,ULastEmit,UPermit"+
			" from DY_User where UID="+uid;					//搜索用户资料的SQL语句
		this.setUser(dbu.getUserInfo(sql));
		return SUCCESS;
	}
}
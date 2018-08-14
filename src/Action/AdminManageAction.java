package Action;
import java.util.*;
import com.opensymphony.xwork2.*;
public class AdminManageAction extends FenYeAction{
    private List content;		//显示内容
    private String uid;			//管理员ID
    
	private String uname;		//管理员名
	private String pwda;		//管理员密码
	private String pwdb;		//确认密码
	private String role;    	//管理员级别
    public String getUid(){
    	return uid;
    }
    public void setUid(String uid){
    	this.uid = uid;
    }
    
    public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPwda() {
		return pwda;
	}
	public void setPwda(String pwda) {
		this.pwda = pwda;
	}
	public String getPwdb() {
		return pwdb;
	}
	public void setPwdb(String pwdb) {
		this.pwdb = pwdb;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
    
    @Override
    public String getSql(){
		sql = " select UID,UName,URole from DY_User where URole>1";
		return sql;
	}
	public List getContent(){
		return content;
	}
	@Override
	public String execute()throws Exception{
		if("del".equals(actionStr)){
			sql = "delete from DY_User where UID="+uid;
			if(dbu.update(sql)){
				message = "alert('成功删除管理员')";
			}
			else{
				message = "alert('未知错误删除失败')";
			}
			this.setCurPage(1);
		}
		if("add".equals(actionStr)){						//添加管理员
			if(!pwda.equals(pwdb)){							//两次密码不相同
				message = "两次输入密码不一样，请核对输入";
			}			
			sql = "select 1 from DY_User where UName='"+uname+"'";//验证用户名是否存在
			if(dbu.isExist(sql)){									//用户名已经存在
				message = "该名字已被占用，请重新选择一个";
				return SUCCESS;
			}
			sql = "insert into DY_User(UName,UPwd,URole) value"+
				"('"+uname+"','"+pwda+"',"+role+")";
			if(dbu.update(sql)){							//执行添加动作
				message = "管理员添加成功";
			}
			else{
				message = "未知错误，添加失败";			//添加失败的消息
			}
		}
		if("resetPwd".equals(actionStr)){
			if(!pwda.equals(pwdb)){							//两次密码不相同
				message = "两次输入密码不一样，请核对输入";
			}			
			sql = "select 1 from DY_User where UName='"+uname+"'";//验证用户名是否存在
			if(!dbu.isExist(sql)){									//用户名已经存在
				message = "没有该名字的账号";
				return SUCCESS;
			}
			sql = "update DY_User set UPwd='"+pwda+"' where UName='"+uname+"'";
			if(dbu.update(sql)){							//执行添加动作
				message = "密码重置成功";
			}
			else{
				message = "未知错误，重置失败";			//添加失败的消息
			}
		}
		if("all".equals(actionStr)){
			this.setCurPage(1);
		}
		content = dbu.getManageList(getFenYe());			//查询数据库得到首页显示内容
		System.out.println(content.size());
		return SUCCESS;
	}
}
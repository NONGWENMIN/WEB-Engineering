package Action;
import com.opensymphony.xwork2.*;
import org.springframework.jdbc.core.*;
public class RegAction extends UnameUniqueAction {
	private String gender;					//用户性别
	private String email;					//电子邮件
	public String getGender() {
		return gender;						//性别属性的get方法
	}
	public void setGender(String gender) {
		this.gender = gender;				//性别属性的set方法
	}
	public String getEmail(){
		return email;						//电子邮件的get方法
	}
	public void setEmail(String email) {
		this.email = email;					//电子邮件属性的set方法
	}
	public String execute() throws Exception{
		String randNum = (String)getSession().get("randNum");		//得到存在Session中的验证码
		randNum = randNum.toUpperCase();							//将验证码转大写
		if(!randNum.equals(valcode)){								//如果验证码相同
			message = "验证码输入错误，注册失败，请重新输入。现"+
											"在将要跳转到注册页面"; //给出提示信息
			url = "reg.jsp";
			return SUCCESS;
		}
		if(this.getFlag()){											  //注册名已经存在
			message = "您所注册的用户名已经存在，请重新输入。现"+
										   "在将要跳转到注册页面";	//给出提示信息
			url = "reg.jsp";
			return SUCCESS;
		}
		sql = "insert into DY_USer(UName,UPwd,UGender,UEmail,"+
		  	  "URegDate,ULastLogin,ULastEmit) values('"+uname+"','"+
		  	  pwd+"','"+gender+"','"+email+"',now(),now(),now())";	 //插入新用户的SQL
		if(dbu.update(sql)){
			message = "恭喜您，注册成功，欢迎来到高校在线答疑系统。"+
										"现在将要跳转到主页";		//注册成功的提示消息
			url = "IndexAction.action?actionStr=all";				 //跳转到主页
		}
		else{
			message = "未知错误，注册失败。现在将要跳转到注册页面";	//注册失败信息
			url = "reg.jsp";										 //返回注册页面
		}
		return SUCCESS;
	}
}
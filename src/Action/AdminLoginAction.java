package Action;
import com.opensymphony.xwork2.*;
import org.springframework.jdbc.core.*;
public class AdminLoginAction extends UnameUniqueAction{
	public String execute() throws Exception{
		sql = "select URole from DY_User where UName='"+
			  uname+"' and UPwd='"+pwd+"' and URole>1";		
		String randNum = (String)getSession().get("randNum");		//得到存在Session中的验证码
		randNum = randNum.toUpperCase();							//将验证码转大写
		if(!randNum.equals(valcode)){
			message = "验证码输入错误，登陆失败，现在将跳转到登陆页";
			url = "adminLogin.jsp";
			return SUCCESS;
		}
		String role = dbu.getStringInfo(sql);						//执行搜索得到登陆用户的权限
		sql = "select UID from DY_User where UName='"+uname+"'";	//得到用户的ID的SQL
		String uid = dbu.getStringInfo(sql);						//执行查询
		if(role!=null){
			getSession().put("uname",uname);						//将登陆用户名放进session
			getSession().put("role",role);							//将用户角色放进session
			getSession().put("uid",uid);							//将用户ID放进session
			sql = "update DY_User set ULastLogin=now() where UID="+uid;
			dbu.update(sql);										//更新用户最后登陆时间
			message="欢迎回来，"+uname+"。现在将要跳转到管理主页";
			url = "adminIndex.jsp";
		}
		else{
			message = "用户名和密码不匹配，登陆失败,现在将要跳转到登陆页";
			url = "adminLogin.jsp";
		}
		return SUCCESS;
	}
}
package Action;
import java.util.Map;

import DAO.DBUtil;

import com.opensymphony.xwork2.*;
public class BaseAction extends ActionSupport{
	protected DBUtil dbu;						//声明DBUtil对象引用
	protected String message;					//返回信息
	protected String url;						//要跳转到的URL
    protected  String actionStr;				//动作标志
    public void setDbu(DBUtil dbu){
    	this.dbu = dbu;							//dbu的setter方法
    }
	public Map getSession(){					//得到Struts里模拟HttpSession的实例
		return ActionContext.getContext().getSession();
	}
	public String getMessage(){
		return message;							//message属性的getter方法
	}
	public String getUrl(){						//url属性的getter方法
		return url;
	}
	public String getActionStr() {				//actionStr的getter方法
		return actionStr;
	}
	public void setActionStr(String actionStr) {
		this.actionStr = actionStr;				//actionStr的setter方法
	}
    @Override
    public String execute()throws Exception{
    	String result = SUCCESS;
    	if("logout".equals(actionStr)){						//注销动作    		
    		String role = (String)getSession().get("role");	//得到用户角色
    		getSession().clear();							//将session清空
    		System.out.println("role:=="+role);
    		if("0".equals(role)||"1".equals(role)){			//如果登陆的是老师或者是学生
    			url = "IndexAction.action";
    			message = "退出成功，现在将跳转到主页";	   //给出提示消息
    		}
    		else{											//登陆的人是管理员
    			url = "adminLogin.jsp";
    			message = "退出成功，现在将要跳转到登陆页"; //给出提示消息
    			result = LOGIN;								//返回LOGIN视图
    		}
    	}
    	return result;
    }
}
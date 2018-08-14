package Action;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.opensymphony.xwork2.interceptor.*;

public class MyInterceptor extends AbstractInterceptor {
	@Override
    public String intercept(ActionInvocation invocation) throws Exception{
    	Map session = ActionContext.getContext().getSession();		//得到session
    	System.out.println("=============拦截器=============" + new Date());
    	String result = "LOGIN";							//返回结果字符串	    	
    	if(session.get("uid") != null){
    		return invocation.invoke();
    	}
		return result;
	}
}
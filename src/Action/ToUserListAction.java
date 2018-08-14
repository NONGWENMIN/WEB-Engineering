package Action;
import java.util.*;
import com.opensymphony.xwork2.*;

public class ToUserListAction extends FenYeAction{
    private List content;		//显示内容
    private String key;			//查找条件
    private String value;		//查找关键字
    private String condition;	//条件
    private String selected;	//下拉选中
    private String uid;			//用户ID参数
    public void setCondition(String condition){
    	this.selected = condition;
    	if("all".equals(condition)){				//显示所有用户
    		condition = " where URole<2";
    	}
    	if("stu".equals(condition)){				//显示学生用户
    		condition = " where URole=0";
    	}
    	if("teacher".equals(condition)){			//显示老师用户
    		condition = " where URole=1";
    	}
    	this.setCurPage(1);							//设置显示第一页
    	getSession().put("condition",condition);
    }
    public String getSelected(){
		return selected;
	}
    public String getCondition(){
    	return (String)getSession().get("condition");
    }
    public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		condition = " where "+getKey()+" like '%"+value+"%' and URole<2";
    	this.setCurPage(1);
    	getSession().put("condition",condition);
		this.value = value;
	}
    @Override
    public String getSql(){
		sql = "select UID,UName,UGender,UEmail,URegDate,"+
			"ULastLogin,ULastEmit,UPermit,URole from DY_User"+getCondition();
		return sql;
	}
	public List getContent(){
		return content;
	}
	@Override
	public String execute()throws Exception{
		if("del".equals(actionStr)){						//删除用户的动作
			sql = "delete from DY_User where UID="+uid;
			if(dbu.update(sql)){
				message = "alert('删除ID为"+uid+"用户成功')";
			}
			else{
				message = "alert('未知错误删除失败')";
			}
			this.setCurPage(1);
		}
		if("jy".equals(actionStr)){							//禁言某个用户
			sql = "update DY_User set UPermit=0 where UID="+uid;
			dbu.update(sql);								//执行更新
		}
		if("hf".equals(actionStr)){
			sql = "update DY_User set UPermit=1 where UID="+uid;
			dbu.update(sql);								//执行更新
		}
		if("setTeacher".equals(actionStr)){
			sql = "select 1 from DY_TU where UID="+uid;		//查看该用户是否属于某课程
			if(dbu.isExist(sql)){							//如果该用户属于某课程，则为学生用户
				message = "alert('ID为["+uid+"]的用户为学生用户，不能指定为老师')";
			}
			else{
				sql = "update DY_User set URole=1 where UID="+uid;
				dbu.update(sql);
			}
		}
		if("cancelTeacher".equals(actionStr)){
			sql = "update DY_User set URole=0 where UID="+uid;
			dbu.update(sql);
		}
		content = dbu.getUserList(getFenYe());			//查询数据库得到显示内容
		return SUCCESS;
	}
}
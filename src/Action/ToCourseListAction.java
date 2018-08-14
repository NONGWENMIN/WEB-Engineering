package Action;
import java.util.*;
import com.opensymphony.xwork2.*;

public class ToCourseListAction extends FenYeAction{
    private List content;		//显示内容
    private String key;			//查找条件
    private String value;		//查找关键字
    private String condition;	//条件
    private String tgid;
    public void setCondition(String condition){
		this.condition = condition;
    }
    public String getCondition(){
    	return (String)getSession().get("condition");
    }
    
    public String getTgid() {
		return tgid;
	}
	public void setTgid(String tgid) {
		this.tgid = tgid;
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
		condition = " where "+getKey()+" like '%"+value+"%'";
    	this.setCurPage(1);
    	getSession().put("condition",condition);
	}
	
	
    @Override
    public String getSql(){
		sql = "select a.TGID,a.TGName,a.TDetail,ifnull(b.UID,'')"+
			" UID,ifnull(b.UName,'---') UName from (select "+
			"TGID,TGName,TDetail from DY_Topic_Group)a left join"+
			"(select dtu.TGID,dtu.UID,du.UName from DY_TU dtu,"+
			"DY_User du where du.URole=1 and du.UID=dtu.UID)b on "+
			"a.TGID=b.TGID";
		sql = "select * from ("+sql+")b "+getCondition();
		System.out.println(sql);
		return sql;
	}
	public List getContent(){
		return content;
	}
	@Override
	public String execute()throws Exception{
		if("del".equals(actionStr)){
			sql = "delete from DY_Topic_Group where TGID="+tgid;
			dbu.update(sql);this.setCurPage(1);
		}
		 if("all".equals(actionStr)){
    		this.setCurPage(1);
    		getSession().put("condition","");
    	}
		content = dbu.getCourseList(getFenYe());			//查询数据库得到首页显示内容
		return SUCCESS;
	}
}
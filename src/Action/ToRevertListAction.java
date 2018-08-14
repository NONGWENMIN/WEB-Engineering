package Action;
import java.util.*;
import com.opensymphony.xwork2.*;
public class ToRevertListAction extends FenYeAction{
    private List content;		//显示内容
    private String rid;
    private String title;		//某一提问的标题
    private String nr;			//某一提问的内容
    private String key;			//搜索关键字
    public void setKey(String key){
    	key = " and RContent like '%"+key+"%'";
    	getSession().put("key",key);
    	this.setCurPage(1);
    }
    public String getKey(){
    	return (String)getSession().get("key");
    }
    public void setRid(String rid){
    	this.rid = rid;
    }
    public String getTitle(){
    	return title;
    }
    public String getNr(){
    	return nr;
    }
    @Override
    public String getSql(){
    	if("all".equals(actionStr)){
    		getSession().put("key","");
    	}
		sql = "select dr.RID,dr.RContent,du.UName,RDate "+
			"from DY_User du,DY_Revert dr where du.UID="+
			"dr.UID"+getKey();
		System.out.println(sql);
		return sql;
	}
	public List getContent(){
		return content;
	}
	@Override
	public String execute()throws Exception{
		if("del".equals(actionStr)){							//删除回复
			sql = "delete from DY_Revert where RID="+rid;
			dbu.update(sql);
		}
		if("detail".equals(actionStr)){							//查看详情
			sql = "select RTitle from DY_Revert where RID="+rid;
			title = dbu.getStringInfo(sql);						//执行搜索得到回复标题
			sql = "select RContent from DY_Revert where RID="+rid;
			nr = dbu.getStringInfo(sql);
		}
		content = dbu.getRevertList(getFenYe());			//查询数据库得到首页显示内容
		return SUCCESS;
	}
}
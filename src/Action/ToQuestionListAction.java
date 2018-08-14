package Action;
import java.util.*;
import com.opensymphony.xwork2.*;
public class ToQuestionListAction extends FenYeAction{
    private List content;		//显示内容
    private String tid;
    private String title;		//某一提问的标题
    private String nr;			//某一提问的内容
    private String key;			//搜索关键字
    public void setKey(String key){
    	key = " and TTitle like '%"+key+"%'";
    	getSession().put("key",key);
    	this.setCurPage(1);
    }
    public String getKey(){
    	return (String)getSession().get("key");
    }
    public void setTid(String tid){
    	this.tid = tid;
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
		sql = "select dtg.TGName,TID,TTitle,du.UName,TDate"+
			" from DY_User du,DY_Topic dt,DY_Topic_Group dtg"+
			" where dtg.TGID=dt.TGID and du.UID=dt.UID "+getKey();
		return sql;
	}
	public List getContent(){
		return content;
	}
	@Override
	public String execute()throws Exception{
		if("del".equals(actionStr)){							//删除提问
			sql = "delete from DY_Topic where TID="+tid;
			System.out.println(sql);
			dbu.update(sql);
		}
		if("detail".equals(actionStr)){							//查看详情
			sql = "select TTitle from DY_Topic where TID="+tid;
			title = dbu.getStringInfo(sql);						//执行搜索得到提问标题
			sql = "select TContent from DY_Topic where TID="+tid;
			nr = dbu.getStringInfo(sql);
		}
		content = dbu.getQuestionList(getFenYe());			//查询数据库得到首页显示内容
		return SUCCESS;
	}
}
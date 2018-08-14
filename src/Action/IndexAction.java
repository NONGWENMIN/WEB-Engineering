package Action;
import java.util.List;
import com.opensymphony.xwork2.*;
import org.springframework.jdbc.core.*;
public class IndexAction extends FenYeAction{
	private String condition;	//查找条件
	private String key;			//查找关键字
	private List content;		//首页显示内容
	public void setCondition(String condition){
		this.condition = condition;				//设置查询条件属性值
		this.setCurPage(1);						//设置当前显示第一页
		getSession().put("condition",condition);//将查询条件放进session
	}
	public void setKey(String key){				
		this.key = key;							//设置查询关键字的属性值
		this.setCurPage(1);						//设置显示第一页
		getSession().put("key",key);			//将查询关键字放进session
	}
	@Override
	public String getSql(){
		sql = "select dtg.TGID gid,dtg.TGName gname,dtg.TDetail"+
			" detail,count(a.TID) topic,sum(ifnull(a.revert,0))"+
			" revert,ifnull(a.uname,'') uname,ifnull(a.tid,'') "+
			"tid,ifnull(a.title,'') title,ifnull(a.lastTime,'')"+
			" lastTime from DY_Topic_Group dtg left join(select"+
			" du.UName uname,d.gid,d.tid,d.revert,d.title,"+
			"d.lastTime from DY_User du,(select dtb.TGID gid,"+
			"dtb.TID tid,dtb.TTitle title,ifnull(b.revert,0) "+
			"revert,ifnull(b.uid,dtb.UID) UID,"+
			"ifnull(b.lastTime,dtb.TDate) lastTime from DY_Topic"+
			" dtb left join(select c.tid,c.revert,dra.UID uid,"+
			"dra.RDate lastTime from(select TID tid,max(RID) RID"+
			",count(RID) revert from DY_Revert group by TID)c,"+
			"DY_Revert dra where c.RID=dra.RID)b on dtb.TID=b.tid"+
			" order by gid asc,lastTime desc)d where du.UID=d.UID"+
			")a on dtg.TGID=a.gid";							//搜索出首页显示内容的SQL语句
		String role = (String)getSession().get("role");		//得到登陆人的角色
		String uid = (String)getSession().get("uid");		//得到登录人的ID
		if("all".equals(actionStr)){						//显示所有课程的请求
			getSession().put("key","");						//设置搜索关键字为空
		}
		if(getSession().get("condition")!=null){		//如果有查询条件的话
			sql = sql+" where "+getSession().get("condition")+
				" like '%"+getSession().get("key")+"%'";	//拼装搜索SQL语句
		}
		sql = sql+" group by dtg.TGID";						
		if("1".equals(role)){								//登陆人是老师
			sql = "select * from ("+sql+")f,DY_TU dtu where f.gid"+
				"=dtu.TGID and dtu.UID="+uid;				//搜出老师的课程
		}	
		return sql;											//返回SQL字符串
	}
	public List getIndexList(){
		return content;										//显示内容的getter方法
	}
	@Override
	public String execute()throws Exception{
		content = dbu.getIndexContent(getFenYe());			//查询数据库得到首页显示内容
		return SUCCESS;
	}
}
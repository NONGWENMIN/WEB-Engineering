package Action;
import java.util.Map;
import java.util.HashMap;
import com.opensymphony.xwork2.*;
public class TipAndFenYeAction extends FenYeAction{
	protected String selected;								//查询条件
    public void setCourse(String course){
    	this.selected = course;								//下拉列表框的选中属性
		String uid = (String)getSession().get("uid");		//得到登录人的ID
		this.setCurPage(1);									//设置显示第一页
		if("all".equals(course)){
			course = "in (select TGID from DY_TU dtu"+
				" where dtu.UID="+uid+")";					//用于拼凑SQL语句的字句
		}
		else{												//显示是某一课程下的问题
    		course = "="+course;							//查找条件具体到某一课程ID
    	}
    	System.out.println("====="+course+"======"+selected);
		getSession().put("course",course);
	}
	public String getCourse(){
		return (String)getSession().get("course");
	}
	public String getSelected(){
		return selected;
	}
	public String getApply(){
		String uid = (String)getSession().get("uid");//得到登陆的人的UID
		String sql = "select count(*) from (select 1 from"+
			" DY_Apply da,DY_Topic_Group dtg,DY_User du "+
			"where da.UID=du.UID and da.TGID=dtg.TGID and"+
			" da.AFlag=0 and da.TGID in(select TGID from "+
			"DY_TU dtu where dtu.UID="+uid+"))a";	//搜出未处理申请数目的SQL语句
		return dbu.getStringInfo(sql);
	}
	public String getQuestion(){
		String uid = (String)getSession().get("uid");//得到登陆的人的UID
		String sql = "select count(*) from (select dta.TID"+
			" tid from DY_Topic dta,DY_User du,DY_Topic_Group"+
			" dtg where du.UID=dta.UID and dta.TGID=dtg.TGID "+
			"and dta.TID not in (select distinct TID from "+
			"DY_Revert where UID="+uid+") and dtg.TGID in "+
			"(select TGID from DY_TU dtu where dtu.UID="+uid+
			"))a";
		return dbu.getStringInfo(sql);
	}
	public Map getCourseList(){
		Map map = new HashMap();					//创建一HashMap对象
		map.put("all","所有课程");					//为map添加所有课程选项
		String uid = (String)getSession().get("uid");	//得到登陆用户的ID
		String sql = "select dtg.TGID tgid,TGName gname from "+
			"DY_Topic_Group dtg,DY_TU dt where dt.TGID="+
			"dtg.TGID and dt.UID="+uid;				//得到用户选课列表的SQL语句		
		map.putAll(dbu.getCourse(sql));				//执行查询得到Map课程列表
		return map;
	}
	@Override
	public String execute()throws Exception{
		if("addStu".equals(actionStr)){
			this.url = "addStu.jsp";
		}
		return SUCCESS;
	}
}
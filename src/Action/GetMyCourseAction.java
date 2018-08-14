package Action;
import java.util.*;
import com.opensymphony.xwork2.*;
public class GetMyCourseAction extends BaseAction{
	public Map getCourse(){
		String uid = (String)getSession().get("uid");	//得到登陆用户的ID
		String sql = "select dtg.TGID tgid,TGName gname from "+
			"DY_Topic_Group dtg,DY_TU dt where dt.TGID="+
			"dtg.TGID and dt.UID="+uid;		//得到用户选课列表的SQL语句
		return dbu.getCourse(sql);
	}
	@Override
	public String execute()throws Exception{
		return SUCCESS;
	}
}
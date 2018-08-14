package Action;
import java.util.*;
import com.opensymphony.xwork2.*;

public class ManageStuAction extends TipAndFenYeAction{
    private List content;		//显示内容
    private String tuid;
	public String getTuid(){
		return tuid;
	}
	public void setTuid(String tuid){
		this.tuid = tuid;
	}
    @Override
    public String getSql(){
    	String uid = (String)getSession().get("uid");		//得到登录人的ID
		sql = "select dtu.TUID,dtu.UID,du.UName,du.UGender,"+
			"du.UEmail,du.URegDate,du.ULastLogin,"+
			"du.UPermit,du.ULastEmit,dtg.TGName from"+
			" DY_TU dtu,DY_User du,DY_Topic_Group dtg"+
			" where du.URole=0 and dtu.UID=du.UID and "+
			"dtu.UID!="+uid+" and dtu.TGID=dtg.TGID "+
			"and dtu.TGID "+getCourse();
		System.out.println(sql);
		return sql;
	}
	public List getContent(){
		return content;
	}
	@Override
	public String execute()throws Exception{
		if("del".equals(actionStr)){
			sql = "delete from DY_TU where TUID="+tuid;
			if(dbu.update(sql)){
				message = "alert('删除该生成功');";
			}
			else{
				message = "alert('未知错误，删除失败');";
			}
		}
		content = dbu.getStuList(getFenYe());			//查询数据库得到显示内容		
		return SUCCESS;
	}
}
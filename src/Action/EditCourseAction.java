package Action;
import java.util.*;

import Entity.CourseItem;

import com.opensymphony.xwork2.*;

public class EditCourseAction extends FenYeAction{
    private String tgname;		//课程名
    private String uname;		//课程老师
    private String tgid;		//课程编号
    private String tdetail;		//课程描述
    
    public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
    public String getTgid() {
		return tgid;
	}
	public void setTgid(String tgid) {
		this.tgid = tgid;
	}
	public String getTgname() {
		return tgname;
	}
	public void setTgname(String tgname) {
		this.tgname = tgname;
	}
	public String getTdetail() {
		return tdetail;
	}
	public void setTdetail(String tdetail) {
		this.tdetail = tdetail;
	}
	public CourseItem getCourse(){
		sql = "select * from (select a.TGID,a.TGName,a.TDetail,"+
			"ifnull(b.UID,'') UID,ifnull(b.UName,'---'), UName "+       //在UNAME前加一个,
			"from (select dtg.TGID,dtg.TGName,dtg.TDetail from "+
			"DY_Topic_Group dtg)a left join(select dtu.TGID,"+
			"dtu.UID,du.UName from DY_TU dtu,DY_User du where "+
			"du.URole=1 and du.UID=dtu.UID)b on a.TGID=b.TGID)c"+
			" where c.TGID="+tgid;
		return dbu.getCourseInfo(sql);
	}
	@Override
	public String execute()throws Exception{
		if("save".equals(actionStr)){
			sql = "update DY_Topic_Group set TGName='"+tgname+"',"+
				"TDetail='"+tdetail+"' where TGID="+tgid;
			if(dbu.update(sql)){								//更新课程资料
				message = "课程资料保存成功<br>";
			}
			else{
				message = "未知错误，课程资料保存失败<br>";
			}
			sql = "select 1 from DY_User where URole=1 and UName='"+uname+"'";		//查看该用户是否是老师
			if(!dbu.isExist(sql)){													//如果该用户是老师
				message += "为课程指定老师失败，因为该用户不是老师"; 
			}
			else{
				sql = "select TUID from DY_TU where TGID="+tgid+" and UID=(select UID from"+
					" DY_User where UName='"+uname+"')";								//搜出该课程和老师ID的关系记录主键
				String tuid = dbu.getStringInfo(sql);
				sql = "update DY_TU set UID=(select UID from DY_User where UName='"+uname+
					"') where TUID="+tuid;
				if(dbu.update(sql)){
					message += "改课程老师资料修改成功";
				}
				else{
					message += "未知错误，老师信息修改失败";
				}
			}
		}
		if("add".equals(actionStr)){			
			sql = "insert into DY_Topic_Group(TGName,TDetail) values ('"+tgname+"','"+
				tdetail+"')";
			if(dbu.update(sql)){								//添加新课程成功
				message = "新课程添加成功";
			}
			else{
				message += "未知错误，新课程添加失败";
			}
		}
		return SUCCESS;
	}
}
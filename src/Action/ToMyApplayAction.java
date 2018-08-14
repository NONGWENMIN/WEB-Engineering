package Action;
import java.util.*;
import com.opensymphony.xwork2.*;

public class ToMyApplayAction extends TipAndFenYeAction{
    private List content;		//显示内容
    private String aid;
	public String getAid(){
		return aid;
	}
	public void setAid(String aid){
		this.aid = aid;
	}
    @Override
    public String getSql(){
    	String uid = (String)getSession().get("uid");		//得到登录人的ID
    	String role = (String)getSession().get("role");
    	if(role.equals("1")){								//登录人是老师
    		sql = "select da.AID,da.UID,du.UName,da.TGID,"+
    			"dtg.TGName,da.AReason,da.AFlag,da.AStatus"+
    			" from DY_Apply da,DY_Topic_Group dtg,"+
    			"DY_User du where da.UID=du.UID and da.TGID"+
    			"=dtg.TGID and da.AFlag=0 and da.TGID "+getCourse();//搜出未处理的申请
    	}
    	if(role.equals("0")){								//登陆的是学生
    		sql = "select da.AID,da.UID,du.UName,da.TGID,"+
			"dtg.TGName,da.AReason,da.AFlag,da.AStatus"+
			" from DY_Apply da,DY_Topic_Group dtg,"+
			"DY_User du where da.UID=du.UID and da.TGID"+
			"=dtg.TGID and da.UID="+uid+" order by "+
			"da.AID desc";
    	}
		return sql;
	}
	public List getContent(){
		return content;
	}
	public String getLabel(){
		String role = (String)getSession().get("role");
		return role.equals("0")?"我的申请":"申请列表";
	}
	@Override
	public String execute()throws Exception{
		Vector<String> v = new Vector<String>();				//创建存数SQL的向量
		if("cancel".equals(actionStr)){							//撤销某一项申请的请求
			tempSql = "delete from DY_Apply where AID="+aid; 	//删除的SQL语句
			dbu.update(tempSql);								//执行更新
		}
		if("agree".equals(actionStr)){
			tempSql = "update DY_Apply set AFlag=1,AStatus="+
				"'同意申请' where AID="+aid;					//更新该申请的状态的SQL语句
			v.add(tempSql);										//将SQL语句添加进向量
			tempSql = "select 1 from DY_TU where UID=(select "+
				"UID from DY_Apply where AID="+aid+") and TGID"+
				"=(select TGID from DY_Apply where AID="+aid+")";
			if(!dbu.isExist(tempSql)){							//该生不在该门课程下
				tempSql = "insert into DY_TU(UID,TGID)  select "+
				"UID,TGID from DY_Apply where AID="+aid;		//向关系表中插入该生和该课的关系
				v.add(tempSql);
			}			
			if(dbu.update(v)){									//事务处理更新方法进行更新
				message = "alert('申请处理成功')";
			}
			else{
				message = "alert('位置错误，申请处理失败')";
			}
		}
		if("refuse".equals(actionStr)){
			tempSql = "update DY_Apply set AFlag=1,AStatus="+
				"'拒绝申请' where AID="+aid;
			if(dbu.update(tempSql)){
				message = "alert('申请处理成功')";
			}
			else{
				message = "alert('未知错误，申请处理失败')";
			}
		}
		content = dbu.getApplyContent(getFenYe());				//查询数据库得到首页显示内容
		return SUCCESS;
	}
}


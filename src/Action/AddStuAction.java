package Action;
import java.util.Vector;
import com.opensymphony.xwork2.*;

public class AddStuAction extends TipAndFenYeAction{
	private String course;	//课程号
	private String stuNO;	//学生学号
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getStuNO() {
		return stuNO;
	}
	public void setStuNO(String stuNO) {
		this.stuNO = stuNO;
	}
	@Override
    public String execute()throws Exception{
    	Vector<String> v = new Vector<String>();	//创建SQL语句向量
    	StringBuilder sba = new StringBuilder();	//创建用于记录插入成功学生学号的字符串
    	StringBuilder sbb = new StringBuilder();	//记录已经在该课程下的学生学号
    	StringBuilder sbc = new StringBuilder();	//记录学号不存在的字符串
    	String sno[] = stuNO.split(";");			//将学号按分号分开
    	int size = sno.length;
    	for(int i=0;i<size;i++){
    		String no = sno[i].trim();
    		String sql = "select 1 from DY_User where UID="+no;//查询该学号对应学生是否存在
    		if(dbu.isExist(sql)){
    			sql = "select 1 from DY_TU where UID="+no+" and TGID="+course;
    			if(dbu.isExist(sql)){							//如果该生已经在该课程下
    				sbb.append(no+";");
    			}
    			else{
    				sba.append(no+";");							//该生符合添加条件
    				v.add("insert into DY_TU(UID,TGID) values ("
    					+no+","+course+")");//将存在的学号插入数据库的SQL语句
    			}
    		}
    		else{												//学号不存在的记录
    			sbc.append(no+";");
    		}
    	}
    	if(dbu.update(v)){										//执行更新插入数据库
    		message = sba.length()>0?"学号["+sba.toString()+"]的学生插入成功<br>":"";
    	}
    	message += sbb.length()>0?"学号["+sbb.toString()+"]的学生已经在该课程下<br>":"";
    	message += sbc.length()>0?"学号["+sbc.toString()+"]的学生不存在，请核对输入<br>":"";
    	return SUCCESS;
    }
}
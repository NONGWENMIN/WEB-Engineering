package Action;
import java.io.*;
import org.apache.struts2.*;
import com.opensymphony.xwork2.*;

public class ChangeInfoAction extends GetTipAction {
	private String email;					//电子邮件
	private String savePath;				//上传图像保存地址
	private File pic;						//上传的文件内容
	private String picContentType;			//上传文件类型
	private String picFileName;				//上传文件的名称	
	private String head;					//个人图像路径
	private String sql;						//SQL语句引用
	public String getEmail() {
		return email==null?"":email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public File getPic() {
		return pic;
	}
	public void setPic(File pic) {
		this.pic = pic;
	}
	
	public String getSavePath() {
		return ServletActionContext.getRequest().getRealPath(savePath);
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	
	public String getPicContentType() {
		return (this.picContentType);
	}
	public void setPicContentType(String picContentType) {
		this.picContentType = picContentType;
	}
	
	public String getPicFileName() {
		return (this.picFileName);
	}
	public void setPicFileName(String picFileName) {
		this.picFileName = picFileName;
	}
	
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}

	@Override
	public String execute() throws Exception{
		String result = SUCCESS;
		String uid = (String)getSession().get("uid");		//得到登陆的UID
		if("changeInfo".equals(actionStr)){
			if(this.getPicFileName()!=null){									//上传了文件
				int length = this.getPicFileName().length();					//得到上传文件名字符串长度
				int begin = this.getPicFileName().lastIndexOf(".");				//得到文件后缀中.的起始下标
				picFileName = (uid+this.getPicFileName().substring(begin,length));//生成自己的文件名
				picFileName = picFileName.toLowerCase();
				try{
					FileOutputStream fos = 										//建立上传文件输出流
						new FileOutputStream(this.getSavePath()+"\\"+picFileName);
					FileInputStream fis = new FileInputStream(this.getPic());	//建立文件上传流
					byte[] buffer=new byte[1024];			//创建缓冲数组
					length=0;							
					while((length=fis.read(buffer))>0){
						fos.write(buffer,0,length);
					}
				}
				catch(Exception e){
					message = "未知错误，保存失败";
				}
				head = "UserHead/"+picFileName;
				sql = "update DY_User set UHead='"+head+"',UEmail='"+
					email+"' where UID="+uid;
			}
			else{												//只修改了email
				sql = "update DY_User set UEmail='"+email+"' where UID="+uid;
			}
			if(dbu.update(sql)){
				message = "资料保存成功";						  //执行更新
			}
			else{
				message = "未知错误，保存失败";					//更新失败的信息
			}
		}
		sql = "select UEmail from DY_User where UID="+uid;	//查询Email的SQL语句
		this.email = dbu.getStringInfo(sql);				//执行查询得到Email
		sql = "select UHead from DY_User where UID="+uid;	//得到图像路径的SQL语句
		this.head = dbu.getStringInfo(sql);					//执行查询得到图像地址
		return result;
	}
}
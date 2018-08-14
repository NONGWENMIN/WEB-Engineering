package Entity;
public class GroupItem {
	private String gName;					//板块名称
	private String detail;					//板块描述
	private String topic;					//板块话题总数
	private String revert;					//板块回帖总数
	private String uname;					//最后回复的用户
	private String lastTime;				//最后发表日期
	private String tid;						//最后回复帖子的ID
	private String gid;						//板块ID
	private String title;					//帖子标题
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public String getLastTime() {
		return lastTime;
	}
	public void setLastTime(String lastTime) {
		this.lastTime = lastTime;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getGName() {
		return gName;
	}
	public void setGName(String name) {
		gName = name;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public String getRevert() {
		return revert;
	}
	public void setRevert(String revert) {
		this.revert = revert;
	}
	@Override
	public String toString(){
		return "gName:"+gName+"\tdetail:"+detail+"\ttopic:"+topic+"\nrevert:"+
			revert+"\tuname:"+uname+"\tlastTime:"+lastTime+"\ntid:"+tid+"\tgid:"+
			gid+"\tTitle:"+title+"\t========================================"+
			"======================";
	}
}
package Entity;

public class ApplyItem {
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
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
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAid(){
		return aid;
	}
	public void setAid(String aid){
		this.aid = aid;
	}
	private String aid;
	private String uid;
	private String uname;
	private String tgid;
	private String tgname;
	private String reason;
	private String flag;
	private String status;
}
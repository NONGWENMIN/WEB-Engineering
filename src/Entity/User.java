package Entity;

public class User {
	private String uid;
	private String uname;
	private String gender;
	private String email;
	private String role;
	private String regDate;
	private String lastLogin;
	private String lastEmit;
	private String permit;
	private String head;
	private String tgname;
	private String tuid;
	
	public String getTuid(){
		return tuid;
	}
	public void setTuid(String tuid){
		this.tuid = tuid;
	}
	public String getTgname() {
		return tgname;
	}
	public void setTgname(String tgname) {
		this.tgname = tgname;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getLastLogin() {
		return lastLogin;
	}
	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}
	public String getLastEmit() {
		return lastEmit;
	}
	public void setLastEmit(String lastEmit) {
		this.lastEmit = lastEmit;
	}
	public String getPermit() {
		return permit;
	}
	public void setPermit(String permit) {
		this.permit = permit;
	}
}

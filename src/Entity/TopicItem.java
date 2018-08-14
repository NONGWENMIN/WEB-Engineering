package Entity;

public class TopicItem {
	private String ftr;			//提问人
	private String title;		//提问标题
	private String djs;			//点击数
	private String revert;		//回复数
	private String ftsj;		//提问时间
	private String htr;			//最后回答人
	private String lastTime;	//最后回答时间
	private String tid;			//问题的ID
	private String gname;		//问题所属课程名


	@Override
	public String toString(){	//toString方法
		return "ftr:"+ftr+"\ttitle:"+title+"\tdjs:"+djs+"\nrevert:"+revert+
				"\tftsj:"+ftsj+"\thtr:"+htr+"\nlastTime:"+lastTime+"\ttid:"+tid+
				"\n==============================================================";
	}
	
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	
	public String getFtr() {
		return ftr;
	}
	public void setFtr(String ftr) {
		this.ftr = ftr;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getDjs() {
		return djs;
	}
	public void setDjs(String djs) {
		this.djs = djs;
	}
	
	public String getRevert() {
		return revert;
	}
	public void setRevert(String revert) {
		this.revert = revert;
	}
	
	public String getFtsj() {
		return ftsj;
	}
	public void setFtsj(String ftsj) {
		this.ftsj = ftsj;
	}
	
	public String getHtr() {
		return htr;
	}
	public void setHtr(String htr) {
		this.htr = htr;
	}
	
	public String getLastTime() {
		return lastTime;
	}
	public void setLastTime(String lastTime) {
		this.lastTime = lastTime;
	}
	
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
}
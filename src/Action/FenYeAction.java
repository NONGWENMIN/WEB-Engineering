package Action;
import java.util.*;
import com.opensymphony.xwork2.*;
public class FenYeAction extends BaseAction{
	protected int curPage = 1;		//当前页码
	protected int span = 5;			//每页显示记录条数
    protected String sql;			//SQL语句引用
    protected String tempSql;		//临时SQL语句引用
	public String getSql(){
		return sql;					//返回SQL语句
	}
	public String getFenYe(){
		Integer a = (Integer)getSession().get("curPage");
		Integer b = (Integer)getSession().get("span");
		if(a!=null){					//如果当前页不为空
			curPage = a;				//则curPage等于当前页的值
		}
		if(b!=null){					//如果每页显示记录条数不为空
			span = b;					//则span等于每页显示记录条数
		}
		int startRow = (curPage-1)*span;//计算要读取记录的起始行
		String fenye = "select * from ("+getSql()+")a limit "+
										startRow+","+span;
		return fenye;
	}
	public int getTotal(){
		return dbu.getTotal(getSql(),getSpan());//执行查询得到总页数
	}
	public Map getPageList(){
		Map map=new HashMap();							//创建Map对象
		int max=getTotal();								//得到最大页数
		for(int i=1;i<=max;i++){						//循环生成Map中的键和值
			map.put(i,"第"+i+"页");					  //将键和值房间Map中
		}
		return map;						//返回Map对象
	}
	public int getCurPage() {			//curPage的get方法
		return curPage;					//返回curPage的值
	}
	public void setCurPage(int curPage){//curPage的set方法
		this.curPage = curPage;			//设置curPage的值
		getSession().put("curPage",curPage);
	}
	public int getSpan() {				//span的get方法
		return span;					//返回span的值
	}
	public void setSpan(int span) {		//span的set方法
		this.span = span;				//设置span的值
		this.setCurPage(1);				//设置当前显示第一页
		getSession().put("span",span);
	}
	@Override
	public String execute()throws Exception{	//execute方法
		return SUCCESS;							//返回SUCCESS
	}
}
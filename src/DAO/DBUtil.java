package DAO;
import java.util.*;
import javax.sql.*;
import java.io.*;
import org.springframework.jdbc.core.*;
import org.springframework.transaction.*;
import org.springframework.jdbc.datasource.*;
import org.springframework.transaction.support.*;            

import Entity.*;

public class DBUtil{
	private JdbcTemplate jt;									//声明JdbcTemplate对象引用						
	private List rl = null;										//声明List对象引用
	private String sql = null;								//声明SQL字符串引用
	private DataSource ds;										//声明DataSource引用
	private DataSourceTransactionManager dtm;				
	private DefaultTransactionDefinition dtd;
	public void setJt(JdbcTemplate jt){						//jt成员的setter方法
		this.jt = jt;										//设置jt属性的值
	}
	public void setDs(DataSource ds){
		this.ds=ds;
	}
	
	public List getIndexContent(String sql){
		List al = new ArrayList();							//创建返回List对象
		try{
			rl = jt.queryForList(sql);							//搜索得到结果
			if(rl.size() != 0){									//结果不为空的情况
				for(int i = 0;i<rl.size();i++){					//遍历结果
					Map map=(Map)rl.get(i);						//结果List中每一行为一个LinkedHashMap
					GroupItem gi = new GroupItem();				//创建一个GroupItem对象
					gi.setGid(map.get("gid").toString());		//设置课程ID值
					gi.setGName(new String(map.get("gname").toString()));
					gi.setDetail(new String(map.get("detail").toString()));
					gi.setTopic(map.get("topic").toString());	//设置问题数量属性值
					gi.setRevert(map.get("revert").toString());	//设置回复数量属性值
					gi.setUname(new String(map.get("uname").toString()));
					gi.setTid((String) map.get("tid"));	//设置最后回复问题的ID值
					gi.setTitle(new String(map.get("title").toString()));
					gi.setLastTime((String) map.get("lastTime"));  
					
					al.add(gi);									//将此课程对象放进返回List中
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();										//捕获异常并打印
		}
		return al;														//返回结果
	}
	
	public List getGroupContent(String sql){	//得到板块内容
		List al = new ArrayList();							//创建返回List对象		
		try{
			rl = jt.queryForList(sql);						//搜索得到结果
			if(rl.size()!=0){								//结果不为空的情况
				for(int i=0;i<rl.size();i++){				//遍历结果
					Map map=(Map)rl.get(i);					//结果List中每一行为一个LinkedHashMap
					TopicItem ti = new TopicItem();			//创建一个TopicItem对象
					ti.setTid(map.get("tid").toString());	//设置TopicItem对象的帖子主键属性值
					ti.setFtr(new String(map.get("ftr").toString()));
					ti.setTitle(new String(map.get("title").toString()));
					ti.setDjs(map.get("djs").toString());		//设置TopicItem对象的点击数属性值				
					ti.setRevert(map.get("revert").toString());	//设置TopicItem对象的回复数属性值
					ti.setFtsj(map.get("ftsj").toString().substring(0,19));	//设置发帖时间属性值
					ti.setHtr(new String(map.get("htr").toString()));
					ti.setLastTime(map.get("htsj").toString().substring(0,19));
					ti.setGname(new String(map.get("gname").toString()));
					al.add(ti);
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();										//捕获异常并打印
		}
		return al;														//返回结果
	}
	
	public List getApplyContent(String sql){
		List al = new ArrayList();							//创建返回List对象
		System.out.println(sql);
		try{
			rl = jt.queryForList(sql);				//搜索得到结果
			if(rl.size()!=0){						//结果不为空的情况
				for(int i=0;i<rl.size();i++){		//遍历结果
					Map map=(Map)rl.get(i);			//结果List中每一行为一个LinkedHashMap
					ApplyItem ai = new ApplyItem();	//创建一个ApplyItem对象
					ai.setAid(map.get("AID").toString());
					ai.setUid(map.get("UID").toString());
					ai.setUname(new String(map.get("UName").toString()));
					ai.setTgid(map.get("TGID").toString());
					ai.setTgname(new String(map.get("TGName").toString()));
					ai.setReason(new String(map.get("AReason").toString()));
					ai.setFlag(map.get("AFlag").toString());
					ai.setStatus(new String(map.get("AStatus").toString()));
					al.add(ai);
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();									//捕获异常并打印
		}
		return al;
	}
	public List getTopicDetail(String sql){
		List al = new ArrayList();							//创建返回List对象		
		System.out.println(sql);
		try{
			rl = jt.queryForList(sql);				//搜索得到结果
			if(rl.size()!=0){						//结果不为空的情况
				for(int i=0;i<rl.size();i++){		//遍历结果
					Map map=(Map)rl.get(i);			//结果List中每一行为一个LinkedHashMap
					TopicDetailItem tdi = new TopicDetailItem();	//创建一个TopicDetailItem对象
					tdi.setUname(new String(map.get("uname").toString()));				
					tdi.setGender(new String(map.get("gender").toString()));
					tdi.setTx(new String(map.get("tx").toString()));
					tdi.setZcsj(map.get("zcsj").toString());		//设置tdi的发帖人注册时间属性值
					tdi.setZhdl(new String( map.get("zhdl").toString()));//设置tdi的发帖人最后登陆时间属性
					tdi.setTitle(new String(map.get("title").toString()));					
					tdi.setContent(new String(map.get("content").toString()));
					tdi.setTag(new String(map.get("tag").toString()));
					tdi.setFbsj(map.get("fbsj").toString().substring(0,19));
					al.add(tdi);					
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();										//捕获异常并打印
		}
		return al;														//返回结果		
	}
	
	public int getTotal(String sql,int span){						//得到总页数
		int total = 0;										//声明页数返回值
		sql = "select count(*) from ("+sql+")a";
		int rows = jt.queryForInt(sql);					//执行查询得到总记录条数			
		total = rows/span+((rows%span==0)?0:1);			//计算得到总页数						
	
		return total;
	}
	
	public User getUserInfo(String sql){
		User user = new User();							//创建返回User对象		
		try{
			rl = jt.queryForList(sql);				//搜索得到结果
			if(rl.size()!=0){						//结果不为空的情况
				Map map=(Map)rl.get(0);				//结果List中每一行为一个LinkedHashMap
				user.setUid(map.get("UID").toString());	//设置User对象的uid属性
				user.setUname(new String(map.get("UName").toString()));
				user.setGender(new String(map.get("UGender").toString()));
				user.setEmail(map.get("UEmail").toString());//设置User对象的email属性
				user.setRole(map.get("URole").toString());	//设置User对象的role属性					
				user.setHead(map.get("UHead").toString());	//设置User对象的head属性
				user.setRegDate(map.get("URegDate").toString());
				user.setLastLogin(map.get("ULastLogin").toString().substring(0,19));				
				user.setPermit(map.get("UPermit").toString());
				Object last = map.get("ULastEmit");
				if(last==null){
					user.setLastEmit("xxxx-xx-xx");				//没有发表过任何回复或问题
				}
				else{
					String lastEmit = last.toString();			//转为字符串
					user.setLastEmit(lastEmit.substring(0,19));	//发表过的情况
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();										//捕获异常并打印
		}
		return user;
	}
	
	public List getStuList(String sql){
		List al = new ArrayList();							//创建返回List对象			
		try{
			rl = jt.queryForList(sql);				//搜索得到结果
			if(rl.size()!=0){						//结果不为空的情况
				for(int i=0;i<rl.size();i++){		//遍历结果
					Map map=(Map)rl.get(i);				//结果List中每一行为一个LinkedHashMap
					User user = new User();							//创建返回User对象	
					user.setUid(map.get("UID").toString());	//设置User对象的uid属性
					user.setUname(new String(map.get("UName").toString()));
					user.setTgname(new String(map.get("TGName").toString()));
					user.setGender(new String(map.get("UGender").toString()));
					user.setEmail(map.get("UEmail").toString());//设置User对象的email属性	
					user.setTuid(map.get("TUID").toString());		
					user.setRegDate(map.get("URegDate").toString());
					user.setLastLogin(map.get("ULastLogin").toString().substring(0,19));				
					user.setPermit(map.get("UPermit").toString());				
					Object last = map.get("ULastEmit");
					if(last==null){
						user.setLastEmit("xxxx-xx-xx");				//没有发表过任何回复或问题
					}
					else{
						String lastEmit = last.toString();			//转为字符串
						user.setLastEmit(lastEmit.substring(0,19));	//发表过的情况
					}
					al.add(user);
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();										//捕获异常并打印
		}
		return al;
	}
	
	public List getUserList(String sql){
		List al = new ArrayList();							//创建返回List对象			
		try{
			rl = jt.queryForList(sql);				//搜索得到结果
			if(rl.size()!=0){						//结果不为空的情况
				for(int i=0;i<rl.size();i++){		//遍历结果
					Map map=(Map)rl.get(i);				//结果List中每一行为一个LinkedHashMap
					User user = new User();							//创建返回User对象	
					user.setUid(map.get("UID").toString());	//设置User对象的uid属性
					user.setUname(new String(map.get("UName").toString()));					
					user.setGender(new String(map.get("UGender").toString()));
					user.setEmail(map.get("UEmail").toString());	//设置User对象的email属性	
					user.setRegDate(map.get("URegDate").toString());				
					user.setPermit(map.get("UPermit").toString());	
					user.setRole(map.get("URole").toString());				
					Object last = map.get("ULastEmit");
					if(last==null){
						user.setLastEmit("xxxx-xx-xx");				//没有发表过任何回复或问题
					}
					else{
						String lastEmit = last.toString();			//转为字符串
						user.setLastEmit(lastEmit.substring(0,19));	//发表过的情况
					}
					last = map.get("ULastLogin");
					if(last==null){
						user.setLastLogin("xxxx-xx-xx");				//没有发表过任何回复或问题
					}
					else{
						String lastLogin = last.toString();				//转为字符串
						user.setLastLogin(lastLogin.substring(0,19));	//发表过的情况
					}
					al.add(user);
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();										//捕获异常并打印
		}
		return al;
	}
	
	public List getManageList(String sql){
		List al = new ArrayList();							//创建返回List对象			
		try{
			rl = jt.queryForList(sql);				//搜索得到结果
			if(rl.size()!=0){						//结果不为空的情况
				for(int i=0;i<rl.size();i++){		//遍历结果
					Map map=(Map)rl.get(i);				//结果List中每一行为一个LinkedHashMap
					User user = new User();							//创建返回User对象	
					user.setUid(map.get("UID").toString());	//设置User对象的uid属性
					user.setUname(new String(map.get("UName").toString()));				
					user.setRole(map.get("URole").toString());		
					al.add(user);
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();										//捕获异常并打印
		}
		return al;
	}
	
	public List getCourseList(String sql){
		List al = new ArrayList();							//创建返回List对象			
		try{
			rl = jt.queryForList(sql);				//搜索得到结果
			if(rl.size()!=0){						//结果不为空的情况
				for(int i=0;i<rl.size();i++){		//遍历结果
					Map map=(Map)rl.get(i);				//结果List中每一行为一个LinkedHashMap
					CourseItem ci = new CourseItem();		//创建返回CourseItem对象
					ci.setUid(map.get("UID").toString());	//设置User对象的uid属性
					ci.setTgid(map.get("TGID").toString());
					ci.setTgname(new String(map.get("TGName").toString()));	
					ci.setTdetail(new String(map.get("TDetail").toString()));	
					ci.setUname(new String(map.get("UName").toString()));				
					al.add(ci);
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();										//捕获异常并打印
		}
		return al;
	}
	
	public List getQuestionList(String sql){
		List al = new ArrayList();							//创建返回List对象
		try{
			rl = jt.queryForList(sql);						//搜索得到结果
			if(rl.size()!=0){								//结果不为空的情况
				for(int i=0;i<rl.size();i++){				//遍历结果
					Map map=(Map)rl.get(i);					//结果List中每一行为一个LinkedHashMap
					TopicItem ti = new TopicItem();			//创建一个TopicItem对象
					ti.setTid(map.get("TID").toString());	//设置TopicItem对象的帖子主键属性值
					ti.setFtr(new String(map.get("UName").toString()));
					ti.setTitle(new String(map.get("TTitle").toString()));
					ti.setFtsj(map.get("TDate").toString().substring(0,19));	//设置发帖时间属性值
					ti.setGname(new String(map.get("TGName").toString()));
					al.add(ti);
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();										//捕获异常并打印
		}
		return al;
	}
	
	public List getRevertList(String sql){
		List al = new ArrayList();							//创建返回List对象
		try{
			rl = jt.queryForList(sql);						//搜索得到结果
			if(rl.size()!=0){								//结果不为空的情况
				for(int i=0;i<rl.size();i++){				//遍历结果
					Map map=(Map)rl.get(i);					//结果List中每一行为一个LinkedHashMap
					RevertItem ri = new RevertItem();		//创建一个RevertItem对象
					ri.setRid(map.get("RID").toString());	//设置RevertItem对象的帖子主键属性值
					ri.setUname(new String(map.get("UName").toString()));
					String nr = map.get("RContent").toString();
					if(nr.length()>40){
						nr = nr.substring(0,40);
						nr = nr + "......";
					}
					ri.setNr(new String(nr));
					ri.setRdate(map.get("RDate").toString().substring(0,19));	//设置发帖时间属性值
					al.add(ri);
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();										//捕获异常并打印
		}
		return al;
	}
	
	public CourseItem getCourseInfo(String sql){
		CourseItem ci = new CourseItem();							//创建返回CourseItem对象	
		try{
			rl = jt.queryForList(sql);				//搜索得到结果
			if(rl.size()!=0){						//结果不为空的情况
				for(int i=0;i<rl.size();i++){		//遍历结果
					Map map=(Map)rl.get(i);				//结果List中每一行为一个LinkedHashMap
					ci.setUid(map.get("UID").toString());	//设置User对象的uid属性
					ci.setTgid(map.get("TGID").toString());
					ci.setTgname(new String(map.get("TGName").toString()));	
					ci.setTdetail(new String(map.get("TDetail").toString()));	
					ci.setUname(new String(map.get("UName").toString()));
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();										//捕获异常并打印
		}
		return ci;
	}
	
	public Map getCourse(String sql){
		Map map = new HashMap();							//创建返回Map对象		
		System.out.println(sql);
		try{
			rl = jt.queryForList(sql);				//搜索得到结果
			if(rl.size()!=0){						//结果不为空的情况
				for(int i=0;i<rl.size();i++){		//遍历结果
					Map mp=(Map)rl.get(i);			//结果List中每一行为一个LinkedHashMap
					String tgid = 					//得到课程ID
						mp.get("tgid").toString();	
					String gname = 					//得到课程名称
						new String(mp.get("gname").toString());
					map.put(tgid,gname);					
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();										//捕获异常并打印
		}
		return map;														//返回结果		
	}
	
	public String getStringInfo(String sql){
		String info = null;										//声明返回字符串引用
		try{
			info = (String)jt.queryForObject(sql,String.class);	//执行查询
		}
		catch(Exception e){
			info = null;										//有异常发生则info置为null
		}
		return info;											//返回查询结果
	}
	
	public boolean isExist(String sql){
		System.out.println("isExist "+sql);
		boolean result = false;
		rl = jt.queryForList(sql);							//执行查询
        if(rl.size()!=0){									//判断查询结果
        	result = true;									//如果存在用户则值标志位为true
        }
		return result;										//返回标志位
	}
	
	public boolean update(Vector<String> v){				//事务处理
		boolean flag = true;													//更新结果标志
		dtm = new DataSourceTransactionManager(ds);		//得到事务管理
		dtd = new DefaultTransactionDefinition();
        dtd.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus ts = dtm.getTransaction(dtd);
        try{
        	for(int i=0;i<v.size();i++){
        		System.out.println("["+i+"]"+v.get(i));
        		sql = new String(v.get(i).getBytes());
        		jt.update(sql);								//执行更新
        	}
        	dtm.commit(ts);									//无异常发生则提交事务
       }
       catch(Exception e){
           dtm.rollback(ts);								//发生异常，进行回滚
           flag = false;									//更新标志设置为false
           e.printStackTrace();
       }
		return flag;
	}
	
	public boolean update(String sql){							//执行单个SQL语句的方法
		boolean flag = false;
		try{
			int result = jt.update(sql);		//执行更新得到更新记录条数
			if(result >= 0){						//更新记录条数大于一时
				flag = true;					//将更新结果标志置为true
			}
		}
		catch(Exception e){					
			flag = false;					//更新失败
			e.printStackTrace();			
		}
		return flag;						//返回更新结果标志位
	}
}
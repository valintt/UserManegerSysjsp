//处理类（BO），封装对users表的各种操作

package bjfu.valin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserBeanCL {
	
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	private Connection conn=null;	
	int pageSize=5;
	
	//添加用户
	/**
	 * @author 燕林
	 * @param name:用户名
	 * @param passWord：密码
	 * @param mail：电子邮件
	 * @param grade：级别
	 * @return boolean：true，添加成功；false：添加失败。
	 */
	public boolean addUser(String name,String passWord,String mail,String grade) {
		
		boolean bool=false;
		
		try{
			//得到链接
			conn=new ConnDB().getConn();																										
			
			ps=conn.prepareStatement("insert into users (usersname, password, mail, grade) values(?,?,?,?);");
			ps.setString(1, name);
			ps.setString(2, passWord);
			ps.setString(3, mail);
			ps.setInt(4, Integer.parseInt(grade));
			
			
			//检测执行是否成功，返回int值，表示受影响的行数
			int temp=ps.executeUpdate();
			
			if(temp==1){
				//添加成功
				bool=true;
			}
			
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			this.Close();
		}
		
		return bool;
		
		
	}
	
	
	//删除用户
	public boolean delUserById(String userId) {																								
		
		boolean bool=false;
		
		try{
			//得到链接
			conn=new ConnDB().getConn();																										
			
			ps=conn.prepareStatement("delete from users where idusers=?");
			ps.setInt(1, Integer.parseInt(userId));
			
			
			//检测执行是否成功，返回int值，表示受影响的行数
			int temp=ps.executeUpdate();
			
			if(temp==1){
				//删除成功
				bool=true;
			}
			
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			this.Close();
		}
		
		return bool;
		
	}
	
	
	//返回pageCount，分页的总页数
	public int getPageCount() {
		int pageCount=0;
		int rowCount=0;
		
		try{
			
			//链接到数据库
			conn=new ConnDB().getConn();
			//执行查询所有结果的语句
			ps=conn.prepareStatement("select count(*) from users");
			
			rs=ps.executeQuery();
			//得到rowCount
			if(rs.next()){
				rowCount=rs.getInt(1);
			}
			//计算pageCount
			if(rowCount%pageSize==0){
				pageCount=rowCount/pageSize;
			}else{
				pageCount=rowCount/pageSize+1;
			}
			
			
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			this.Close();
		}
		
		return pageCount;
	}
	
	
	
	//得到用户需要显示的用户信息
	public 	ArrayList getUserByPage(int pageNow) {
		
		ArrayList al=new ArrayList();
		int rowCount=0;
		int pageCount=0;
		
		
		
		try{
			
			//链接到数据库
			conn=new ConnDB().getConn();
			//执行查询所有结果的语句
			ps=conn.prepareStatement("select * from users where idusers limit ?,?");
			ps.setInt(1, pageSize*(pageNow-1));
			ps.setInt(2, pageSize);
			
			rs=ps.executeQuery();
			
			//将rs封装到ArrayList 的 al
			while(rs.next()){
				
				UserBean ub=new UserBean();
				
				ub.setUserId(rs.getInt(1));
				ub.setUserName(rs.getString(2));
				ub.setPassWord(rs.getString(3));
				ub.setMail(rs.getString(4));
				ub.setGrade(rs.getInt(5));
				
				//将ub放入到al中，否则al为null
				al.add(ub);
				
			}
			
			
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			this.Close();
		}
		
		return al;
		
	}
	
	
	
	
	
	//验证用户是否存在
	public boolean checkUser(String u, String p) {
		
		boolean b=false;
		
		try{
			
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("select password from users where usersname='"+u+"';");				
			rs=ps.executeQuery();
			
			if(rs.next()){
				
				//说明用户名存在
				//判断是否合法
				if(rs.getString(1).equals(p)){
					//合法
					b=true;
				
				}
			}
		}
			
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			//关闭资源
			this.Close();
			
		}
		
		return b;
	}
	
	
	//关闭资源的函数
	public void Close() {
		
		try{
			if(rs!=null){
				rs.close();
				//rs=null，可以加速资源的释放
				rs=null;
			}
			
			if(ps!=null){
				ps.close();
				ps=null;
			}
			if(conn!=null){
				conn.close();
				conn=null;
			}
			
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		
		
	}

}

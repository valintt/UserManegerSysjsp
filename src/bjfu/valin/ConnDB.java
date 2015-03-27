//得到数据库的链接

package bjfu.valin;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;



public class ConnDB {
	
	private Connection conn=null;
	
	public Connection getConn() {
		
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/valindb","valin" , "131191");
			
			
		}
		catch(Exception ex){
			//显示错误信息
			ex.printStackTrace();
		}
		
		return conn;
	}
	
	
}

//�õ����ݿ������

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
			//��ʾ������Ϣ
			ex.printStackTrace();
		}
		
		return conn;
	}
	
	
}

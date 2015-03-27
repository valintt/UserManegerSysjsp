//�����ࣨBO������װ��users��ĸ��ֲ���

package bjfu.valin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserBeanCL {
	
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	private Connection conn=null;																																					
	
	//����pageCount����ҳ����ҳ��
	public int getPageCount(int pageSize) {
		int pageCount=0;
		int rowCount=0;
		
		try{
			
			//���ӵ����ݿ�
			conn=new ConnDB().getConn();
			//ִ�в�ѯ���н�������
			ps=conn.prepareStatement("select count(*) from users");
			
			rs=ps.executeQuery();
			//�õ�rowCount
			if(rs.next()){
				rowCount=rs.getInt(1);
			}
			//����pageCount
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
	
	
	
	//�õ��û���Ҫ��ʾ���û���Ϣ
	public 	ArrayList getUserByPage(int pageNow,int pageSize) {
		
		ArrayList al=new ArrayList();
		int rowCount=0;
		int pageCount=0;
		
		
		
		try{
			
			//���ӵ����ݿ�
			conn=new ConnDB().getConn();
			//ִ�в�ѯ���н�������
			ps=conn.prepareStatement("select * from users where idusers limit ?,?");
			ps.setInt(1, pageSize*(pageNow-1));
			ps.setInt(2, pageSize);
			
			rs=ps.executeQuery();
			
			//��rs��װ��ArrayList �� al
			while(rs.next()){
				
				UserBean ub=new UserBean();
				
				ub.setUserId(rs.getInt(1));
				ub.setUserName(rs.getString(2));
				ub.setPassWord(rs.getString(3));
				ub.setMail(rs.getString(4));
				ub.setGrade(rs.getInt(5));
				
				//��ub���뵽al�У�����alΪnull
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
	
	
	
	
	
	//��֤�û��Ƿ����
	public boolean checkUser(String u, String p) {
		
		boolean b=false;
		
		try{
			
			conn=new ConnDB().getConn();
			ps=conn.prepareStatement("select password from users where usersname='"+u+"';");				
			rs=ps.executeQuery();
			
			if(rs.next()){
				
				//˵���û�������
				//�ж��Ƿ�Ϸ�
				if(rs.getString(1).equals(p)){
					//�Ϸ�
					b=true;
				
				}
			}
		}
			
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			//�ر���Դ
			this.Close();
			
		}
		
		return b;
	}
	
	
	//�ر���Դ�ĺ���
	public void Close() {
		
		try{
			if(rs!=null){
				rs.close();
				//rs=null�����Լ�����Դ���ͷ�
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

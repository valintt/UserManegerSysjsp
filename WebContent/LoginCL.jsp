<%@page import="bjfu.valin.UserBeanCL"%>
<%@page import="java.sql.*,java.util.*,bjfu.valin.*"%>

<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>LoginCL</title>
</head>
<body>

	<%
	
	//�����û��������룬����û���֤
	String u=request.getParameter("username");
	String p=request.getParameter("password");

	
	
	//�����ݿ�����֤�û�
	//1����������
	//Class.forName("com.mysql.jdbc.Driver");
	//2���õ�����
	//Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/valindb","valin","131191");
	//��������
	
	//�����ݿ�ȥ��֤�û����轫�¼�����UserBeanCL.java����
	
	//Statement stat=conn.createStatement();
	
	//��ѯ��ִ��
	//ResultSet rs=stat.executeQuery("select password from users where usersname='"+u+"';");
	//���ݽ�����ж�
	
	
	//����UserBeanCL�ķ�������ɶ��û�����֤
	UserBeanCL ubc=new UserBeanCL();
	
	if(ubc.checkUser(u, p)){
		
		response.sendRedirect("Welcome.jsp?user="+u);
	}
	else{
		
		response.sendRedirect("Login.jsp");
	}
	
	
	
	//if(rs.next()){
		
		//˵���û�������
		//�ж��Ƿ�Ϸ�
	//	if(rs.getString(1).equals(p)){
			//�Ϸ�
	//		response.sendRedirect("Welcome.jsp?user="+u);
		
	//	}
	//	else{
			//�������
	//		response.sendRedirect("Login.jsp?err=1");
			//return ;
	//	}
		
//	}//�û�����
//	else{
//		response.sendRedirect("Login.jsp?err=2");
//	}
	
	
	//***************�򵥵���֤
	/**
	* if(u.equals("valin")&&p.equals("123456")){
		* //�Ϸ�����ת��Welcome.jsp
		* //��ν�login����õ������ݴ��ݸ���һ��ҳ��
		* //1��cookie�鷳��2��session��3��response.sendRedirect
		* 	
		* //userҪ��Welcome.jspҳ���request.getParameter("user")һ��
		* response.sendRedirect("Welcome.jsp?user="+u);
		
		* }
	* else{
		* //���Ϸ�����ת��Login.jsp
		* response.sendRedirect("Login.jsp");
		* }
	**/
	//******************�򵥵���֤������μ����ݿ���֤
	
	
	%>


</body>
</html>
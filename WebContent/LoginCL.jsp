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
	
	//接收用户名和密码，完成用户验证
	String u=request.getParameter("username");
	String p=request.getParameter("password");

	
	
	//到数据库中验证用户
	//1、加载驱动
	//Class.forName("com.mysql.jdbc.Driver");
	//2、得到连接
	//Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/valindb","valin","131191");
	//创建连接
	
	//到数据库去验证用户，需将事件交给UserBeanCL.java操作
	
	//Statement stat=conn.createStatement();
	
	//查询，执行
	//ResultSet rs=stat.executeQuery("select password from users where usersname='"+u+"';");
	//根据结果做判断
	
	
	//调用UserBeanCL的方法，完成对用户的验证
	UserBeanCL ubc=new UserBeanCL();
	
	if(ubc.checkUser(u, p)){
		
		response.sendRedirect("Welcome.jsp?user="+u);
	}
	else{
		
		response.sendRedirect("Login.jsp");
	}
	
	
	
	//if(rs.next()){
		
		//说明用户名存在
		//判断是否合法
	//	if(rs.getString(1).equals(p)){
			//合法
	//		response.sendRedirect("Welcome.jsp?user="+u);
		
	//	}
	//	else{
			//密码错误
	//		response.sendRedirect("Login.jsp?err=1");
			//return ;
	//	}
		
//	}//用户出错
//	else{
//		response.sendRedirect("Login.jsp?err=2");
//	}
	
	
	//***************简单的验证
	/**
	* if(u.equals("valin")&&p.equals("123456")){
		* //合法，跳转到Welcome.jsp
		* //如何将login处理得到的数据传递给下一个页面
		* //1、cookie麻烦；2、session；3、response.sendRedirect
		* 	
		* //user要和Welcome.jsp页面的request.getParameter("user")一样
		* response.sendRedirect("Welcome.jsp?user="+u);
		
		* }
	* else{
		* //不合法，跳转到Login.jsp
		* response.sendRedirect("Login.jsp");
		* }
	**/
	//******************简单的验证，更多参见数据库验证
	
	
	%>


</body>
</html>
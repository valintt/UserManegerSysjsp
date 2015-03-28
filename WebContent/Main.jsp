<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>main</title>
</head>
	<body bgcolor=#3F8FD2>
	<img  src="imgs/welcome.gif">

	<%
		//防止非法登录
		String u=(String)session.getAttribute("myName");
	
		//如果用户未登录
		if(u==null){
			//使用过的内置对象(request,out,response,session)
			
			//返回登录界面
			response.sendRedirect("Login.jsp?error=1");
			
			//必须
			return ;
		}
		
	
	%>
	
	
	<!-- 要和LoginCL.jsp页面的Welcome.jsp?user="+u一样 -->
	<!-- //<%//=//request.getParameter("user") //%> -->
	<%=u %>
	，登录成功！<br>
	
	<hr color=#043C6B>
	<center>
	
	<h1>请选择操作</h1>
	
	
	<a href="userCLServlet?pageNowLink=1&flag=fenye">管理用户</a><br>
	<a href="AddUser.jsp">添加用户</a><br>
	<a href="">查找用户</a><br>
	<a href="">注销用户</a><br>

	<br><br>
	
	</center>
	<hr color=#043C6B>
	<img  src="imgs/pikaqiugif1.gif">
	</body>

	
</html>
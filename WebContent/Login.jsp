<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Login</title>
</head>
	<body bgcolor=#3F8FD2>
	<img  src="imgs/welcome.gif">
	<hr color=#043C6B>
	<center>
	
	<%
		String error=request.getParameter("error");
		if(error!=null){
			if(error.equals("1")){
				
				out.println("<font color=red size=5>�û�������¼�����¼��</font>");
			}
		}
	
	%>
	
	<h1>�û���¼</h1>
	
	<br>
	<form action="loginCLServlet" method="post">
	�û�����<input type="text" name="username"><br><br>
	��&nbsp;&nbsp;�룺<input type="password" name="password"><br><br>
	<input type="submit" value="��&nbsp;¼">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="reset" value="��&nbsp;��"><br>
	 
	
	</form>
	<br>
	
	</center>
	<hr color=#043C6B>
	<img  src="imgs/pikaqiugif1.gif">
	</body>

	
</html>
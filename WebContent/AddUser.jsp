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
		//��ֹ�Ƿ���¼
		String u=(String)session.getAttribute("myName");
	
		//����û�δ��¼
		if(u==null){
			//ʹ�ù������ö���(request,out,response,session)
			
			//���ص�¼����
			response.sendRedirect("Login.jsp?error=1");
			
			//����
			return ;
		}
		
	
	%>
	
	
	<!-- Ҫ��LoginCL.jspҳ���Welcome.jsp?user="+uһ�� -->
	<!-- //<%//=//request.getParameter("user") //%> -->
	<%=u %>
	����¼�ɹ���<br>
	
	<hr color=#043C6B>
	<center>
	
	<h1>�������û���Ϣ</h1>
	
	<form action="userCLServlet?flag=addUser" method="post">
		<table border="1">
			<tr><td bgcolor=#6C8CD5>�û���</td><td><input type="text" name="userName" /></td></tr>															
			<tr><td bgcolor=#FFD073>��&nbsp;��</td><td><input type="text" name="passWord" /></td></tr>															
			
			<tr><td bgcolor=#6C8CD5>��&nbsp;��</td><td><input type="text" name="mail" /></td></tr>															
			<tr><td bgcolor=#FFD073>��&nbsp;��</td><td><input type="text" name="grade" /></td></tr>															
		
		<tr><td ><input type="submit" value="����û�"></td><td><input type="reset" value="��&nbsp;&nbsp;��" /></td></tr>															
		
		</table>

	
	</form>

	<br><br>
	
	</center>
	<hr color=#043C6B>
	<img  src="imgs/pikaqiugif1.gif">
	</body>

	
</html>
<%@page import="java.sql.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Welcome</title>
</head>
<body bgcolor=#3F8FD2 >

<center>

<br>

<!-- Ҫ��LoginCL.jspҳ���Welcome.jsp?user="+uһ�� -->
<%=request.getParameter("user") %>
����¼�ɹ���<br><br>
<hr color=#043C6B>
<h1>�û���Ϣ�б�</h1>
	<%
	
	//����4����ҳҪ�õ��ı���
	int pageSize=5;//úҵ��ʾ5����¼
	int pageNow=1;//Ĭ����ʾ��һҳ
	int rowCount=0;//�ܹ��������¼
	int pageCount=0;//��pageSize��rowCount����ó�
	
	//��pageNow�����޸ģ������û�ϣ����ʾ��ҳ��
	String s_pageNow=request.getParameter("pageNowLink");
	
	//�û���¼��֤����welcomeҳ�棬����pageNowLink
	if(s_pageNow!=null){
		//���յ�pageNow
		pageNow=Integer.parseInt(s_pageNow);
		
	}
	
	//1����ѯ���ݿ�õ�rowCount
	
	//�����ݿ�����֤�û�
	//1����������
	Class.forName("com.mysql.jdbc.Driver");
	//2���õ�����
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/valindb","valin","131191");
	//��������
	Statement stat=conn.createStatement();
	
	//��ѯ��ִ��
	ResultSet rs=stat.executeQuery("select count(*) from users");
	
	//һ��Ҫrs.next()����ʱ��rsָ�ڴ洢���ݵ��е�ǰһ��
	if(rs.next()){
		rowCount=rs.getInt(1);
				
	}
	
	//����pageCount
	if(rowCount%pageSize==0){
		pageCount=rowCount/pageSize;
	}else{
		pageCount=rowCount/pageSize+1;
	}
	
	//��ѯ��Ҫ��ʾ�ļ�¼
	//rs=stat.executeQuery("select * from users where idusers  limit 'pageSize*(pageNow-1)','pageSize';");
	
	PreparedStatement ps=conn.prepareStatement("select * from users where idusers  limit ?,?;");
	ps.setInt(1, pageSize*(pageNow-1));
	ps.setInt(2, pageSize);
	
	rs=ps.executeQuery();
	
	%>

<!-- ������� -->
<table border="1" bgcolor=#FFAE40>
<!-- ��ͷ -->
	<tr><th>�û�ID</th><th>�û���</th><th>��&nbsp;��</th><th>��&nbsp;��</th><th>��&nbsp;��</th></tr>
	
	<%
	
	while(rs.next()){																															
		%>
		
		<tr>
		<td><%=rs.getInt(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getInt(5) %></td>
		</tr>
		<%
	}
	
	%>
</table>

	<%
	//��һҳ
	if(pageNow!=1){
		out.println("<a href=Welcome.jsp?pageNowLink="+(pageNow-1)+">��һҳ</a>");
	}
	//��ʾ������
	for(int i=pageNow;i<=pageNow+4;i++){
		
		out.println("<a href=Welcome.jsp?pageNowLink="+i+">["+i+"]</a>");
		
	}
	
	//��һҳ
	if(pageNow!=pageCount){
		out.println("<a href=Welcome.jsp?pageNowLink="+(pageNow+1)+">��һҳ</a>");
	}
	
	%>
	
	
	

<br><br><a href="Login.jsp">��&nbsp;&nbsp;��</a>


</center>

</body>
</html>
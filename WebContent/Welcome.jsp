<%@page import="bjfu.valin.UserBean"%>
<%@page import="bjfu.valin.UserBeanCL"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Welcome</title>

<script type="text/javascript">
<!-- 
	function abc(){
		return window.confirm("ȷ��ִ�иò�����");

	}

 -->

 </script>
 
</head>
<body bgcolor=#3F8FD2 >
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
<h1>�û���Ϣ�б�</h1>
	<%
	
	//����4����ҳҪ�õ��ı���
//	int pageSize=5;//úҵ��ʾ5����¼
//	int pageNow=1;//Ĭ����ʾ��һҳ
	//int pageCount=0;
	
	
	
	//int rowCount=0;//�ܹ��������¼
	//int pageCount=0;//��pageSize��rowCount����ó�
	
	//��pageNow�����޸ģ������û�ϣ����ʾ��ҳ��
	//String s_pageNow=request.getParameter("pageNowLink");
	
	//�û���¼��֤����welcomeҳ�棬����pageNowLink
	//if(s_pageNow!=null){
		//���յ�pageNow
		//pageNow=Integer.parseInt(s_pageNow);
		
	//}
	
	//1����ѯ���ݿ�õ�rowCount
	
	//�����ݿ�����֤�û�
	//1����������
	//Class.forName("com.mysql.jdbc.Driver");
	//2���õ�����
	//Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/valindb","valin","131191");
	//��������3119
	//Statement stat=conn.createStatement();
	
	//��ѯ��ִ��
	//ResultSet rs=stat.executeQuery("select count(*) from users");
	
	//һ��Ҫrs.next()����ʱ��rsָ�ڴ洢���ݵ��е�ǰһ��
//	if(rs.next()){
//		rowCount=rs.getInt(1);
				
//	}
	
	//����pageCount
//	if(rowCount%pageSize==0){
//		pageCount=rowCount/pageSize;
//	}else{
//		pageCount=rowCount/pageSize+1;
//	}
	
	//��ѯ��Ҫ��ʾ�ļ�¼
	//rs=stat.executeQuery("select * from users where idusers  limit 'pageSize*(pageNow-1)','pageSize';");
	
	//PreparedStatement ps=conn.prepareStatement("select * from users where idusers  limit ?,?;");
//	ps.setInt(1, pageSize*(pageNow-1));
	//ps.setInt(2, pageSize);
	
	//rs=ps.executeQuery();
	
	
	
	%>

<!-- ������� -->
<table border="1">
<!-- ��ͷ -->
	<tr><th>�û�ID</th><th>�û���</th><th>��&nbsp;��</th><th>��&nbsp;��</th><th>��&nbsp;��</th>
	<th>�޸��û�</th><th>ɾ���û�</th></tr>
	
	<%
	
	//UserBeanCL ubc=new UserBeanCL();
	
	//************����UserBeanCL�ķ�������ɷ�ҳ��ʾ
	//ArrayList al=ubc.getUserByPage(pageNow, pageSize);
	
	//Ҫ��ʾ���û���Ϣ��request��ȡ
	ArrayList al=(ArrayList)request.getAttribute("result");
	
	
	//**********ѭ����ʾrs�Ľ����
	//while(rs.next()){	
		
		
	//ѭ����ʾArrayList�Ľ����
	String [] color={"#6C8CD5","#FFD073"};
	
	
	for(int i=0;i<al.size();i++){
		//��al��ȡ��UserBean
		
		UserBean ub=(UserBean)al.get(i);
		%>
	
		<tr bgcolor=<%=color[i%2] %>>
		<td><%=ub.getUserId() %></td>
		<td><%=ub.getUserName() %></td>
		<td><%=ub.getPassWord() %></td>
		<td><%=ub.getMail()%></td>
		<td><%=ub.getGrade() %></td>
		<td><a href="#">�޸��û�</a></td>
		<td><a href="userCLServlet?flag=delUser&userId=<%=ub.getUserId() %>" onclick="return abc()">ɾ���û�</a></td>
		</tr>																													
	
	<%
	}
	%>
	
</table>
	<br>
	<%
	
	//��request��ȡ��pageNow
	int pageNow=Integer.parseInt((String)request.getAttribute("pageNow"));
	
	//��һҳ
	if(pageNow!=1){
		out.println("<a href=userCLServlet?pageNowLink="+(pageNow-1)+"&flag=fenye>��һҳ</a>");
	}
	//��ʾ������
	for(int i=pageNow;i<=pageNow+4;i++){
		
		out.println("<a href=userCLServlet?pageNowLink="+i+"&flag=fenye>["+i+"]</a>");
		
	}
	
	//��һҳ
	
	//�õ�pageCount
	//int pageCount=Integer.parseInt((String)request.getAttribute("pageCount"));
	String s_pageCount=(String)request.getAttribute("pageCount");
	int pageCount=Integer.parseInt(s_pageCount);

	
	//pageCount=ubc.getPageCount(pageSize);
	if(pageNow!=pageCount){
		out.println("<a href=userCLServlet?pageNowLink="+(pageNow+1)+"&flag=fenye>��һҳ</a>");
	}
	
	%>
	
	
	

<br><br><a href="Login.jsp">��&nbsp;&nbsp;&nbsp;��</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="Main.jsp">������ҳ��</a>
<br><br>

</center>

<hr color=#043C6B>
<img  src="imgs/pikaqiugif1.gif">

</body>
</html>
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

<!-- 要和LoginCL.jsp页面的Welcome.jsp?user="+u一样 -->
<%=request.getParameter("user") %>
，登录成功！<br><br>
<hr color=#043C6B>
<h1>用户信息列表</h1>
	<%
	
	//定义4个分页要用到的变量
	int pageSize=5;//煤业显示5条记录
	int pageNow=1;//默认显示第一页
	int rowCount=0;//总共多少天记录
	int pageCount=0;//有pageSize和rowCount计算得出
	
	//对pageNow进行修改，接收用户希望显示的页数
	String s_pageNow=request.getParameter("pageNowLink");
	
	//用户登录验证进入welcome页面，不传pageNowLink
	if(s_pageNow!=null){
		//接收到pageNow
		pageNow=Integer.parseInt(s_pageNow);
		
	}
	
	//1、查询数据库得到rowCount
	
	//到数据库中验证用户
	//1、加载驱动
	Class.forName("com.mysql.jdbc.Driver");
	//2、得到连接
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/valindb","valin","131191");
	//创建连接
	Statement stat=conn.createStatement();
	
	//查询，执行
	ResultSet rs=stat.executeQuery("select count(*) from users");
	
	//一定要rs.next()，此时的rs指在存储数据的列的前一列
	if(rs.next()){
		rowCount=rs.getInt(1);
				
	}
	
	//计算pageCount
	if(rowCount%pageSize==0){
		pageCount=rowCount/pageSize;
	}else{
		pageCount=rowCount/pageSize+1;
	}
	
	//查询需要显示的记录
	//rs=stat.executeQuery("select * from users where idusers  limit 'pageSize*(pageNow-1)','pageSize';");
	
	PreparedStatement ps=conn.prepareStatement("select * from users where idusers  limit ?,?;");
	ps.setInt(1, pageSize*(pageNow-1));
	ps.setInt(2, pageSize);
	
	rs=ps.executeQuery();
	
	%>

<!-- 构建表格 -->
<table border="1" bgcolor=#FFAE40>
<!-- 表头 -->
	<tr><th>用户ID</th><th>用户名</th><th>密&nbsp;码</th><th>电&nbsp;邮</th><th>级&nbsp;别</th></tr>
	
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
	//上一页
	if(pageNow!=1){
		out.println("<a href=Welcome.jsp?pageNowLink="+(pageNow-1)+">上一页</a>");
	}
	//显示超链接
	for(int i=pageNow;i<=pageNow+4;i++){
		
		out.println("<a href=Welcome.jsp?pageNowLink="+i+">["+i+"]</a>");
		
	}
	
	//下一页
	if(pageNow!=pageCount){
		out.println("<a href=Welcome.jsp?pageNowLink="+(pageNow+1)+">下一页</a>");
	}
	
	%>
	
	
	

<br><br><a href="Login.jsp">退&nbsp;&nbsp;出</a>


</center>

</body>
</html>
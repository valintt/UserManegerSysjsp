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
		return window.confirm("确定执行该操作？");

	}

 -->

 </script>
 
</head>
<body bgcolor=#3F8FD2 >
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
<h1>用户信息列表</h1>
	<%
	
	//定义4个分页要用到的变量
//	int pageSize=5;//煤业显示5条记录
//	int pageNow=1;//默认显示第一页
	//int pageCount=0;
	
	
	
	//int rowCount=0;//总共多少天记录
	//int pageCount=0;//有pageSize和rowCount计算得出
	
	//对pageNow进行修改，接收用户希望显示的页数
	//String s_pageNow=request.getParameter("pageNowLink");
	
	//用户登录验证进入welcome页面，不传pageNowLink
	//if(s_pageNow!=null){
		//接收到pageNow
		//pageNow=Integer.parseInt(s_pageNow);
		
	//}
	
	//1、查询数据库得到rowCount
	
	//到数据库中验证用户
	//1、加载驱动
	//Class.forName("com.mysql.jdbc.Driver");
	//2、得到连接
	//Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/valindb","valin","131191");
	//创建连接3119
	//Statement stat=conn.createStatement();
	
	//查询，执行
	//ResultSet rs=stat.executeQuery("select count(*) from users");
	
	//一定要rs.next()，此时的rs指在存储数据的列的前一列
//	if(rs.next()){
//		rowCount=rs.getInt(1);
				
//	}
	
	//计算pageCount
//	if(rowCount%pageSize==0){
//		pageCount=rowCount/pageSize;
//	}else{
//		pageCount=rowCount/pageSize+1;
//	}
	
	//查询需要显示的记录
	//rs=stat.executeQuery("select * from users where idusers  limit 'pageSize*(pageNow-1)','pageSize';");
	
	//PreparedStatement ps=conn.prepareStatement("select * from users where idusers  limit ?,?;");
//	ps.setInt(1, pageSize*(pageNow-1));
	//ps.setInt(2, pageSize);
	
	//rs=ps.executeQuery();
	
	
	
	%>

<!-- 构建表格 -->
<table border="1">
<!-- 表头 -->
	<tr><th>用户ID</th><th>用户名</th><th>密&nbsp;码</th><th>电&nbsp;邮</th><th>级&nbsp;别</th>
	<th>修改用户</th><th>删除用户</th></tr>
	
	<%
	
	//UserBeanCL ubc=new UserBeanCL();
	
	//************调用UserBeanCL的方法，完成分页显示
	//ArrayList al=ubc.getUserByPage(pageNow, pageSize);
	
	//要显示的用户信息从request中取
	ArrayList al=(ArrayList)request.getAttribute("result");
	
	
	//**********循环显示rs的结果集
	//while(rs.next()){	
		
		
	//循环显示ArrayList的结果集
	String [] color={"#6C8CD5","#FFD073"};
	
	
	for(int i=0;i<al.size();i++){
		//从al中取出UserBean
		
		UserBean ub=(UserBean)al.get(i);
		%>
	
		<tr bgcolor=<%=color[i%2] %>>
		<td><%=ub.getUserId() %></td>
		<td><%=ub.getUserName() %></td>
		<td><%=ub.getPassWord() %></td>
		<td><%=ub.getMail()%></td>
		<td><%=ub.getGrade() %></td>
		<td><a href="#">修改用户</a></td>
		<td><a href="userCLServlet?flag=delUser&userId=<%=ub.getUserId() %>" onclick="return abc()">删除用户</a></td>
		</tr>																													
	
	<%
	}
	%>
	
</table>
	<br>
	<%
	
	//从request中取出pageNow
	int pageNow=Integer.parseInt((String)request.getAttribute("pageNow"));
	
	//上一页
	if(pageNow!=1){
		out.println("<a href=userCLServlet?pageNowLink="+(pageNow-1)+"&flag=fenye>上一页</a>");
	}
	//显示超链接
	for(int i=pageNow;i<=pageNow+4;i++){
		
		out.println("<a href=userCLServlet?pageNowLink="+i+"&flag=fenye>["+i+"]</a>");
		
	}
	
	//下一页
	
	//得到pageCount
	//int pageCount=Integer.parseInt((String)request.getAttribute("pageCount"));
	String s_pageCount=(String)request.getAttribute("pageCount");
	int pageCount=Integer.parseInt(s_pageCount);

	
	//pageCount=ubc.getPageCount(pageSize);
	if(pageNow!=pageCount){
		out.println("<a href=userCLServlet?pageNowLink="+(pageNow+1)+"&flag=fenye>下一页</a>");
	}
	
	%>
	
	
	

<br><br><a href="Login.jsp">退&nbsp;&nbsp;&nbsp;出</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="Main.jsp">返回主页面</a>
<br><br>

</center>

<hr color=#043C6B>
<img  src="imgs/pikaqiugif1.gif">

</body>
</html>
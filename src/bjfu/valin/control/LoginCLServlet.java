//这是一个控制器，主要完成对用户身份的验证，
//本身不会完成业务逻辑，通过调用model完成对数据处理

package bjfu.valin.control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bjfu.valin.UserBeanCL;

/**
 * Servlet implementation class LoginCLServlet
 */
@WebServlet("/loginCLServlet")
public class LoginCLServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCLServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//得到用户名和密码
		String u=request.getParameter("username");
		String p=request.getParameter("password");
	
		
		//使用模型完成对用户的验证
		//1、创建一个UserBeanCL对象，
		UserBeanCL ubc=new UserBeanCL();
		//2、调用方法
		if(ubc.checkUser(u, p)){
			
			System.out.println("控制器完成");
			
			
			//在跳转到Welcome.jsp页面时，就把要显示的数据准备好，给Welcome.jsp
			//准备好
			ArrayList al=ubc.getUserByPage(1 );
			int pageCount=ubc.getPageCount();
			//将al，pageCount,pageNow放入request中
			request.setAttribute("result", al);
			request.setAttribute("pageCount", pageCount+"");
			request.setAttribute("pageNow", "1");
			
			//合法
			//转向方法，效率不高	
			//response.sendRedirect("Welcome.jsp");
			
			//上述方法效率不高，常使用转发的方法
			//效率高，同事request中的对象还可以在下一个页面使用
			request.getRequestDispatcher("Welcome.jsp?user="+u).forward(request, response);

		}
		else{
			
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}

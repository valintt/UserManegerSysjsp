//这个控制器将处理用户的分页显示，删除、添加等操作

package bjfu.valin.control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.smartcardio.ATR;

import bjfu.valin.UserBean;
import bjfu.valin.UserBeanCL;

/**
 * Servlet implementation class UserCLServlet
 */
@WebServlet("/userCLServlet")
public class UserCLServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserCLServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//得到用户需要显示的页面
		//String s_pageNow=request.getParameter("pageNowLink");
		
		//String u=request.getParameter("username");
		
		try{
			
			System.out.println("分页为UserCLServlet");
			
			int pageNow=Integer.parseInt(request.getParameter("pageNowLink"));
			
			//调用UserBeanCL
			UserBeanCL ubc=new UserBeanCL();
			
			//准备好
			ArrayList al=ubc.getUserByPage(pageNow );
			int pageCount=ubc.getPageCount();
			//将al，pageCount放入request中
			request.setAttribute("result", al);
			request.setAttribute("pageCount", pageCount+"");
			request.setAttribute("pageNow", pageNow+"");
			

			//重新跳转回Welcome.jsp页面，转发
			request.getRequestDispatcher("Welcome.jsp").forward(request, response);;
			
			
		}
		catch(Exception ex){
			ex.printStackTrace();
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

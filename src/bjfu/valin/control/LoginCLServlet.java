//����һ������������Ҫ��ɶ��û���ݵ���֤��
//���������ҵ���߼���ͨ������model��ɶ����ݴ���

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
		//�õ��û���������
		String u=request.getParameter("username");
		String p=request.getParameter("password");
	
		
		//ʹ��ģ����ɶ��û�����֤
		//1������һ��UserBeanCL����
		UserBeanCL ubc=new UserBeanCL();
		//2�����÷���
		if(ubc.checkUser(u, p)){
			
			System.out.println("���������");
			
			
			//����ת��Welcome.jspҳ��ʱ���Ͱ�Ҫ��ʾ������׼���ã���Welcome.jsp
			//׼����
			ArrayList al=ubc.getUserByPage(1 );
			int pageCount=ubc.getPageCount();
			//��al��pageCount,pageNow����request��
			request.setAttribute("result", al);
			request.setAttribute("pageCount", pageCount+"");
			request.setAttribute("pageNow", "1");
			
			//�Ϸ�
			//ת�򷽷���Ч�ʲ���	
			//response.sendRedirect("Welcome.jsp");
			
			//��������Ч�ʲ��ߣ���ʹ��ת���ķ���
			//Ч�ʸߣ�ͬ��request�еĶ��󻹿�������һ��ҳ��ʹ��
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

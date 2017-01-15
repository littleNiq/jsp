package myservlet.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.data.Login;

public class PutGoodsToCar extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public PutGoodsToCar() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       request.setCharacterEncoding("utf-8");
		String goods=request.getParameter("java");
		System.out.println(goods);
		Login loginBean=null;
		HttpSession session = request.getSession(true);
		try{
			loginBean =(Login)session.getAttribute("loginBean");
		    boolean b=loginBean.getLogname().length()==0;
		    if(b)response.sendRedirect("login.jsp");
		    LinkedList<String> car=loginBean.getCar();
		    car.add(goods);
		   speakSomeMess(request,response,goods);
		
		}catch(Exception exp){
			response.sendRedirect("login.jsp");
		}
	}
public void speakSomeMess(HttpServletRequest request, HttpServletResponse response,String goods){
	response.setContentType("text/html;charset=utf-8");
	try{PrintWriter out=response.getWriter();
	out.print("<%@ include file='head.txt'%></head>");
	out.print("<html><body>");
	out.print("<h2>"+goods+"放入购物车/h2>");
	out.print("查看购物车或返回");
	out.print("<a href=lookShoppingCar.jsp>查看购物车</a>");
	out.print("<br><a href=byPageShow.jsp>主页</a>");
	out.print("</body></html>");
		
		
		
	}catch(IOException exp){}
}
	

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init(ServletConfig config) throws ServletException {
		// Put your code here
		super.init(config);
	}

}
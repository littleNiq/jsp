package myservlet.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.data.Login;
import mybean.data.Register;

public class HandleLogin extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public HandleLogin() {
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

		doPost(request,response);
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

		response.setContentType("text/html;charset=utf-8");
		Connection con;
		Statement sql;
		String logname=request.getParameter("logname").trim();
		String password=request.getParameter("password").trim();
		logname=handleString(logname);
		password=handleString(password);
		String uri="jdbc:mysql://127.0.0.1/mobileshop?user=root&password=&characterEncoding=utf-8";	
		boolean boo=(logname.length()>0)&&(password.length()>0);
		try{
			con=DriverManager.getConnection(uri);
			String condition="select * from user where logname='"+logname+"' and password='"+password+"'";
			sql=con.createStatement();
			if(boo){
				ResultSet rs=sql.executeQuery(condition);
				boolean m=rs.next();
				if(m==true){
					success(request,response,logname,password);
					RequestDispatcher dispatcher=request.getRequestDispatcher("login.jsp");
					dispatcher.forward(request, response);
				}
				else{
					String backNews="你输入的用户名不存在,或密码不匹配";
					fail(request,response,logname,backNews);
				}
			}
			else{
				String backNews="请输入用户名和密码";
				fail(request,response,logname,backNews);
			}
			con.close();
		}catch(SQLException exp){
			String backNews=""+exp;
			fail(request,response,logname,backNews);
		}
	}
	
	private void success(HttpServletRequest request,
			HttpServletResponse response, String logname, String password) {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");	
		//response.setCharacterEncoding(arg0)
		Login loginBean=null;
		HttpSession session=request.getSession(true);
		try{
			loginBean=(Login)session.getAttribute("loginBean");
			  if(loginBean==null){
				  loginBean=new Login();
				  session.setAttribute("loginBean", loginBean);
				  loginBean=(Login)session.getAttribute("loginBean");
			  }
			  String name=loginBean.getLogname();
			  if(name.equals(logname)){
				  loginBean.setBackNews(logname+"已经登陆了");
				  loginBean.setLogname(logname);
			  }
			  else{
				  loginBean.setBackNews(logname+"登陆成功");
				  loginBean.setLogname(logname);
			  }
		}catch(Exception ee){
			loginBean=new Login();
			session.setAttribute("loginBean", loginBean);
			loginBean.setBackNews(logname+"登陆成功");
			loginBean.setLogname(logname);
		}	
	}

	private void fail(HttpServletRequest request, HttpServletResponse response,
			String logname, String backNews) {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		try{
			PrintWriter out=response.getWriter();
			out.println("<html><body>");
			out.println("<h2>"+logname+"登录反馈结果<br>"+backNews+"</h2>");
			out.println("返回登录页面或主页<br>");
			out.println("<a href=login.jsp>登录页面</a>");
			out.println("<br><a href=index.jsp>主页</a>");
			out.println("</html></body>");
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
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch(Exception e){}
	}
    public String handleString(String s){
    	try{
    		byte bb[]=s.getBytes("utf-8");
    		s=new String(bb);
    	}catch(Exception ee){}
    	return s;
    }
}

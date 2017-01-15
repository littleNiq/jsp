package myservlet.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybean.data.Register;

public class HandleRegister extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public HandleRegister() {
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

		response.setContentType("text/html");
		String uri="jdbc:mysql://127.0.0.1/mobileshop?user=root&password=&characterEncoding=utf-8";
		Connection con;
		PreparedStatement sql;
		Register userBean=new Register();
		request.setAttribute("userBean", userBean);
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String logname=request.getParameter("logname").trim();
		String password=request.getParameter("password").trim();
		String again_password=request.getParameter("again_password").trim();	
		String phone=request.getParameter("phone").trim();
		String address=request.getParameter("address").trim();
		String realname=request.getParameter("realname").trim();
		if(logname==null)
			logname="";
		if(password==null)
			password="";
		if(!password.equals(again_password)){
			userBean.setBackNews("两次密码不同,注册失败.");
			RequestDispatcher dispatcher=request.getRequestDispatcher("inputRegisterMess.jsp");
			dispatcher.forward(request, response);
			return;
		}
		boolean isLD=true;
		for(int i=0;i<logname.length();i++){
		    char c=logname.charAt(i);
		    if(!((c<='z'&&c>='a')||(c<='Z'&&c>='A')||(c<='9'&&c>='0')))
		    	isLD=false;
		}		
		boolean boo=logname.length()>0&&password.length()>0&&isLD;
		String backNews="";
		try{
			
			con=DriverManager.getConnection(uri);
			String insertCondition="insert into user (logname,password,phone,address,realname) values(?,?,?,?,?)";
			sql=con.prepareStatement(insertCondition);
			if(boo){
				sql.setString(1, logname);
				sql.setString(2, password);
				sql.setString(3, phone);
				sql.setString(4, address);
				sql.setString(5, realname);
				int m=sql.executeUpdate();
				if(m!=0){
					backNews="注册成功";
					userBean.setBackNews(backNews);
					userBean.setLogname(logname);
					userBean.setPhone(phone);
					userBean.setAddress(address);
					userBean.setRealname(realname);
				}
			}
			else{
				backNews="信息填写不完整或名字中有非法字符";
				userBean.setBackNews(backNews);
			}
			con.close();
		}catch(SQLException exp){
			backNews="该会员已被使用,请你更换名字"+exp;
			userBean.setBackNews(backNews);
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher("inputRegisterMess.jsp");
		dispatcher.forward(request, response);
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

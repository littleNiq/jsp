package myservlet.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.data.DataByPage;

import com.sun.rowset.CachedRowSetImpl;

public class QueryAllRecord extends HttpServlet {
     CachedRowSetImpl rowSet=null;
	/**
	 * Constructor of the object.
	 */
	public QueryAllRecord() {
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
		request.setCharacterEncoding("utf-8");
		String idNumber=request.getParameter("fenleiNumber");
		if(idNumber==null)
			idNumber="0";
		int id=Integer.parseInt(idNumber);
		HttpSession session=request.getSession(true);
		Connection con=null;
		DataByPage dataBean=null;
		try{
			dataBean=(DataByPage)session.getAttribute("dataBean");
			if(dataBean==null){
				dataBean=new DataByPage();
				session.setAttribute("dataBean", dataBean);
			}
		}catch(Exception exp){
			dataBean=new DataByPage();
			session.setAttribute("dataBean", dataBean);
		}
		String uri="jdbc:mysql://127.0.0.1/mobileshop";
		try{
			con=DriverManager.getConnection(uri,"root","");
			Statement sql=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			ResultSet rs=sql.executeQuery("select * from mobileform where id="+id);
			rowSet=new CachedRowSetImpl();
			rowSet.populate(rs);
			dataBean.setRowSet(rowSet);
			con.close();
		}catch(SQLException exp){}
		response.sendRedirect("byPageShow.jsp");
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch(Exception e){}
	}

}

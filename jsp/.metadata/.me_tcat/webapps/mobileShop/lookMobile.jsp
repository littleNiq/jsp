<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"  %>
<html>
  <head>
   <%@ include file="head.txt"%>
  </head>
  <body bgcolor="cyan">
    <font size="2">
      <div align="center">
      <%
         try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch(Exception e){}
		String uri="jdbc:mysql://127.0.0.1/mobileshop?user=root&password=&characterEncoding=utf-8";
		Connection con;
		Statement sql;
		ResultSet rs;
		try{
		    con=DriverManager.getConnection(uri);
		    sql=con.createStatement();
		    rs=sql.executeQuery("select *from mobileclassify");
		    out.print("<form action='queryServlet' method='post'>");
		    out.print("<select name='fenleiNumber'>");
		    while(rs.next()){
		      int id=rs.getInt(1);
		      String mobileCategory=rs.getString(2);
		      out.print("<option value="+id+">"+mobileCategory+"</option>");
		    }
		    out.print("</select>");
		    out.print("<input type='submit' value='提交'>");
		    out.print("</form>");
		    con.close();
		}catch(SQLException e){
		   out.print(e);
		}
       %>
      </div>
    </font>
  </body>
</html>

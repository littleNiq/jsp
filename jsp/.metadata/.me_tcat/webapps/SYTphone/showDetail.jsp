<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="mybean.data.Login"%>
<%@ page import="java.sql.*"  %>
<html>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
  <head>
    <%@ include file="head.txt"%>
  </head>
  <body bgcolor="#99FFCC"> 
    <center>
    <%
    if(loginBean==null){
       response.sendRedirect("login.jsp");
    }else{
      boolean b=loginBean.getLogname()==null||loginBean.getLogname().length()==0;
      if(b)
         response.sendRedirect("login.jsp");
    }
    String mobileID=request.getParameter("xijie");
    out.print("<th>产品号"+mobileID+"</th>");
    if(mobileID==null){
        out.print("没有产品号，无法查看细节");
        return;
    }
    Connection con;
    Statement sql;
    ResultSet rs;
    try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch(Exception e){}
		String uri="jdbc:mysql://127.0.0.1/mobileshop";
		try{
		   con=DriverManager.getConnection(uri,"root","");
		   sql=con.createStatement();
		   String cdn="select * from mobileform where mobile_version='"+mobileID+"'";
		   rs=sql.executeQuery(cdn);
		   out.print("<table border=2>");
		   out.print("<tr>");
		   out.print("<th>产品号</th>");
		   out.print("<th>名称</th>");
		   out.print("<th>制造商</th>");
		   out.print("<th>价格</th>");
		   out.print("<th><font color=blue>放入购物车</font></th>");
		   out.print("</tr>");
		   String picture="welcome.jpg";
		   String detailMess="";
		   while(rs.next()){
		     String number=rs.getString(1);
		     String name=rs.getString(2);
		     String maker=rs.getString(3);
		     String price=rs.getString(4);
		     detailMess=rs.getString(5);
		     picture=rs.getString(6);
		     String goods="("+number+","+name+","+maker+","+price+")#"+price;
		     goods=goods.replaceAll("\\p{Blank}","");
		     String button="<form action='putGoodsServlet' method='post'>"+"<input type='hidden' name='java' value="+goods+">"+"<input type='submit' value='查看细节'></form>";
		     out.print("<tr>");
		     out.print("<th>"+number+"</th>");
		     out.print("<th>"+name+"</th>");
		     out.print("<th>"+maker+"</th>");
		     out.print("<th>"+price+"</th>");
		     out.print("<th>"+button+"</th>");
		     out.print("</tr>");
		   }
		   out.print("</table>");
		   out.print("产品详情:<br>");
		   out.println("<div align=center>"+detailMess+"</div>");
		   String pic="<img src='image/"+picture+"' width=260 height=200></img>";
		   out.print(pic);
		   con.close();
		}catch(SQLException exp){}
     %>
    </center>
  </body>
</html>

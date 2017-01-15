<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
  <head>
    <%@ include file="head.txt"%>
      <link href="style.css" rel="stylesheet" type="text/css" />
    <script src="js/rollover.js" type="text/javascript"></script>
<!--[if lt IE 7]>
	<link href="ie_style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/ie_png.js"></script>
	<script type="text/javascript">
		 ie_png.fix('.png, .box .top, .box .bottom, .box .inner');
	</script>
<![endif]-->
  </head>
  <body onload="MM_preloadImage('images/m1-act.jpg','images/m2-act.jpg','images/m3-act.jpg','images/m4-act.jpg','images/m5-act.jpg')"> 
     <div id="main">
<!-- header -->
	<div id="header">
		<div class="row-1">
			<div class="indent"><a href="home.html"><img alt="" src="images/logo.jpg" /></a></div>
		</div>
		<div class="row-2">
			<ul class="nav">
				<li><a href="home.html" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('r_1','','images/m1-act.jpg',1)"><img alt="" src="images/m1.jpg" id="r_1" /></a></li>
				<li><a href="about_us.html" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('r_2','','images/m2-act.jpg',1)"><img alt="" src="images/m2-act.jpg" id="r_2" /></a></li>
			</ul>
		</div>
	</div>
<!-- content -->
	<div id="content">
<!-- content-box begin -->
		<div class="content-box">
			<div class="top">
				<div class="bottom">
					<div class="inside">
<!-- box begin -->
						<div class="box">
							<div class="top"></div>
							<div class="inner">
    <div align="center">
      <%
        if(loginBean==null){
           response.sendRedirect("login.jsp");
        }else{
          boolean b=loginBean.getLogname()==null||loginBean.getLogname().length()==0;
          if(b)
             response.sendRedirect("login.jsp");
        }
        Connection con;
        Statement sql;
        ResultSet rs;
        try{
          Class.forName("com.mysql.jdbc.Driver");
        }catch(Exception e){}
        try{
           String uri="jdbc:mysql://127.0.0.1/mobileshop";
           String user="root";
           String password="";
           con=DriverManager.getConnection(uri,user,password);
           sql=con.createStatement();
           String cdn="select Id,mess,sum from orderform where logname='"+loginBean.getLogname()+"'";
           rs=sql.executeQuery(cdn);
           out.print("<table border=2>");
           out.print("<tr>");
           out.print("<th width=100>"+"订单号"+"</th>");
           out.print("<th width=600>"+"信息"+"</th>");
           out.print("<th width=100>"+"价格"+"</th>");
           out.print("</tr>");
           while(rs.next()){
               out.print("<tr>");
               out.print("<th width=100>"+rs.getString(1)+"</th>");
               out.print("<th width=600>"+rs.getString(2)+"</th>");
               out.print("<th width=100>"+rs.getString(3)+"</th>");
               out.print("</tr>");
           }
           out.print("</table>");
           con.close();
        }catch(SQLException e){
           out.print(e);
        }
       %>
    </div>
    </div>
							<div class="inner_copy"></div>
							<div class="bottom"></div>
						</div>
<!-- box end -->
					</div>
				</div>
			</div>
		</div>
<!-- content-box end -->
		<img alt="" src="images/magic.png" class="magic png" />
	</div>
<!-- footer -->
	<div id="footer">
		<div class="indent">
			<div class="fleft">Copyright - Type in Your Name</div>
			<div class="fright">Popular free web templates <a href="http://www.websitetemplatesonline.com" target="_blank">at www.WebsiteTemplatesOnline.com</a>. <a href="http://www.getjoomlatemplatesfree.com/" title="Joomla Templates for Websites">GetJoomlaTemplatesFree.com</a> - free Joomla themes for websites.</div>
		</div>
	</div>
</div>
  </body>
</html>

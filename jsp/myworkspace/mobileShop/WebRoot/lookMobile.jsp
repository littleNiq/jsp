<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"  %>
<html>
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

<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="mybean.data.Login"%>
<%@ page import="java.util.*"%>
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
    <font size="2">
      <div align="center">
        <%
        if(loginBean==null){
              response.sendRedirect("login.jsp");
        }else{
          boolean b=loginBean.getLogname()==null||loginBean.getLogname().length()==0;
          if(b)
             response.sendRedirect("login.jsp");
        }
        LinkedList car=loginBean.getCar();
        if(car==null)
           out.print("<h2>购物车没有物品</h2>");
        else{
            Iterator<String> iterator=car.iterator();
            StringBuffer buyGoods=new StringBuffer();
            int n=0;
            double priceSum=0;
            out.print("购物车中的物品：<table border=2>");
            while(iterator.hasNext()){
               String goods=iterator.next();
               String showGoods="";
               n++;
               int index=goods.lastIndexOf("#");
               if(index!=-1){
                  priceSum+=Double.parseDouble(goods.substring(index+1));
                  showGoods=goods.substring(0,index);
               }
               buyGoods.append(n+":"+showGoods);
               String del="<form action='deleteServlet' method='post'>"+"<input type='hidden' name='delete' value="+goods+">"+"<input type='submit' value='删除'></form>";
               out.print("<tr><td>"+showGoods+"</td>");
               out.print("<td>"+del+"</td></tr>");
            } 
            out.print("</table>");
            String orderForm="<form action='buyServlet' method='post'>"+"<input type='hidden' name='buy' value="+buyGoods+">"+"<input type='hidden' name='price' value="+priceSum+">"+"<input type='submit' value='生成订单'></form>";
            out.print(orderForm);
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

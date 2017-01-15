<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="mybean.data.Register"%>
<html>
<jsp:useBean id="userBean" class="mybean.data.Register" scope="request"/>
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
  <title>注册页面</title>
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
       <form action="registerServlet" method="post" name="form">
       <table>
         用户名由字母，数字，下划线构成，*注释的必须填写
         <tr>
           <td>*用户名称:</td><td><input type="text" name="logname"/></td>
           <td>*用户密码:</td><td><input type="password" name="password"/></td>
         </tr>
         <tr>
           <td>*重复密码:</td><td><input type="password" name="again_password"/></td>
           <td>*联系电话:</td><td><input type="text" name="phone"/></td>
         </tr>
         <tr>
           <td>*邮寄地址:</td><td><input type="text" name="address"/></td>
           <td>*真实姓名:</td><td><input type="text" name="realname"/></td>
           <td><input type="submit" name="g" value="提交"/></td>
         </tr>
       </table>
       </form>
    </div>
    <div align="center">
    <p>注册反馈:</p>
    <jsp:getProperty name="userBean" property="backNews"/>
    <table border="3">
    <tr>
       <td>会员名称:</td><td><jsp:getProperty name="userBean" property="logname"/></td>
    </tr>
    <tr>
       <td>姓名:</td><td><jsp:getProperty name="userBean" property="realname"/></td>
    </tr>
    <tr>
       <td>地址:</td><td><jsp:getProperty name="userBean" property="address"/></td>
    </tr>
    <tr>
       <td>电话:</td><td><jsp:getProperty name="userBean" property="phone"/></td>
    </tr><tr><td valign="top"><br></td><td valign="top"><br></td></tr>
    </table>
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

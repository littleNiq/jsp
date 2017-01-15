<%@ page contentType="text/html;charset=utf-8"%>
<html>
  <head>
    <%@ include file="head.txt"%>
    <link href="style.css" rel="stylesheet" type
    ="text/css" />
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
      <br>查询时可以输入书的序列号获书名称及价格。
      <br>书名称支持模糊查询
      <br>输入价格是在两个值之间的价格，格式是：价格1-价格2
      <br>例如3987-8976
      <form action="searchByConditionServlet" method="post">
        <br>输入查询信息：<input type="text" name="searchMess"/><br>
        <input type="radio" name="radio" value="mobile_version"/>书序列号
        <input type="radio" name="radio" value="mobile_name" checked="ok"/>书名称
        <input type="radio" name="radio" value="mobile_price"/>价格
        <br><input type="submit" name="g" value="提交"/>
      </form>
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

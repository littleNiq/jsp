 <%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="mybean.data.DataByPage"%>
<%@ page import="com.sun.rowset.*"%>
<jsp:useBean id="dataBean" class="mybean.data.DataByPage" scope="session"/>
<%@ include file="head.txt" %>
<html>
  <head>
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
    <center>
    <br>当前显示的内容是：
    <table border="2">
      <tr>
        <th>书序列号</th>
        <th>书名称</th>
        <th>书出版社</th>
        <th>书价格</th>
        <th>查看详情</th>
        <td><font color="blue">添加到购物车</font></td>
      </tr>
      <jsp:setProperty name="dataBean" property="pageSize" param="pageSize"/>
      <jsp:setProperty name="dataBean" property="currentPage" param="currentPage"/>
      <%
        CachedRowSetImpl rowSet=dataBean.getRowSet();
        if(rowSet==null){
          out.print("没有任何查询信息，无法浏览");
          return;
        }
        rowSet.last();
        int totalRecord=rowSet.getRow();
        out.print("全部记录数"+totalRecord);
        int pageSize=dataBean.getPageSize();
        int totalPages=dataBean.getTotalPages();
        if(totalRecord%pageSize==0)
          totalPages=totalRecord/pageSize;
          else
            totalPages=totalRecord/pageSize+1;
          dataBean.setPageSize(pageSize);
          dataBean.setTotalPages(totalPages);
          if(totalPages>=1){
            if(dataBean.getCurrentPage()<1)
                dataBean.setCurrentPage(dataBean.getTotalPages());
            if(dataBean.getCurrentPage()>dataBean.getTotalPages())
                dataBean.setCurrentPage(1);
            int index=(dataBean.getCurrentPage()-1)*pageSize+1;
            rowSet.absolute(index);
            boolean boo=true;
            for(int i=1;i<=pageSize&&boo;i++){
              String number=rowSet.getString(1);
              String name=rowSet.getString(2);
              String maker=rowSet.getString(3);
              String price=rowSet.getString(4);
              String goods="("+number+","+name+","+maker+","+price+")#"+price;
		      goods=goods.replaceAll("\\p{Blank}","");
		      String button="<form action='putGoodsServlet' method='post'>"+"<input type='hidden' name='java' value="+goods+">"+"<input type='submit' value='放入购物车'></form>";
		      String detail="<form action='showDetail.jsp' method='post'>"+"<input type='hidden' name='xijie' value="+number+">"+"<input type='submit' value='查看细节'></form>";
		      out.print("<tr>");
		      out.print("<th>"+number+"</th>");
		      out.print("<th>"+name+"</th>");
		      out.print("<th>"+maker+"</th>");
		      out.print("<th>"+price+"</th>");
		      out.print("<th>"+detail+"</th>");
		      out.print("<th>"+button+"</th>");
		      out.print("</tr>");
		      boo=rowSet.next();
            }
          }
       %>
    </table>
    <br>每页最多显示<jsp:getProperty name="dataBean" property="pageSize"/>条信息
    <br>当前显示第
    <font color="blue">
       <jsp:getProperty name="dataBean" property="currentPage"/>
    </font>页，共有
    <font color="blue">
       <jsp:getProperty name="dataBean" property="totalPages"/>
    </font>页
    <table>
      <tr>
        <td>
          <form action="" method="post">
            <input type="hidden" name="currentPage" value="<%= dataBean.getCurrentPage()-1 %>"/>
            <input type="submit" name="g" value="上一页"/>
          </form>
        </td>
        <td>
          <form action="" method="post">
            <input type="hidden" name="currentPage" value="<%= dataBean.getCurrentPage()+1 %>"/>
            <input type="submit" name="g" value="下一页"/>
          </form>
        </td>
      </tr>
      <tr>
        <td>
          <form action="" method="post">
            每页显示<input type="text" name="pageSize" value="2" size="3"/>
            条记录<input type="submit" name="g" value="确定"/>
          </form>
        </td>
        <td>
          <form action="" method="post">
            输入页码：<input type="text" name="currentPage" value="2" />
            <input type="submit" name="g" value="提交"/>
          </form>
        </td>
      </tr>
    </table>
  </center>
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


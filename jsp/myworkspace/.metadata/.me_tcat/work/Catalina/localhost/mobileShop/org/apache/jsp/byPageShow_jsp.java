package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import mybean.data.DataByPage;
import com.sun.rowset.*;

public final class byPageShow_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(1);
    _jspx_dependants.add("/head.txt");
  }

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      mybean.data.DataByPage dataBean = null;
      synchronized (session) {
        dataBean = (mybean.data.DataByPage) _jspx_page_context.getAttribute("dataBean", PageContext.SESSION_SCOPE);
        if (dataBean == null){
          dataBean = new mybean.data.DataByPage();
          _jspx_page_context.setAttribute("dataBean", dataBean, PageContext.SESSION_SCOPE);
        }
      }
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("<div align=\"center\">\r\n");
      out.write("  <h2>“智多星”智能手机销售网</h2>\r\n");
      out.write("  <table cellSpacing=\"1\" cellPadding=\"1\" width=\"660\" align=\"center\" border=\"0\">\r\n");
      out.write("    <tr valign=\"buttom\">\r\n");
      out.write("     <td><a href=\"inputRegisterMess.jsp\"><font size=\"2\" >注册</font></a></td>\r\n");
      out.write("     <td><a href=\"login.jsp\"><font size=\"2\" >登陆</font></a></td>\r\n");
      out.write("     <td><a href=\"lookMobile.jsp\"><font size=\"2\" >浏览手机</font></a></td>\r\n");
      out.write("     <td><a href=\"searchMobile.jsp\"><font size=\"2\" >查询手机</font></a></td>\r\n");
      out.write("     <td><a href=\"lookShoppingCar.jsp\"><font size=\"2\" >查看购物车</font></a></td>\r\n");
      out.write("     <td><a href=\"lookOrderForm.jsp\"><font size=\"2\" >查看订单</font></a></td>\r\n");
      out.write("     <td><a href=\"exitServlet\"><font size=\"2\" >退出</font></a></td>\r\n");
      out.write("     <td><a href=\"index.jsp\"><font size=\"2\" >主页</font></a></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("  </table>\r\n");
      out.write("</div>");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("  <head>\r\n");
      out.write("  </head> \r\n");
      out.write("  <body bgcolor=\"#66FFAA\"><center>\r\n");
      out.write("    <br>当前显示的内容是：\r\n");
      out.write("    <table border=\"2\">\r\n");
      out.write("      <tr>\r\n");
      out.write("        <th>手机标识号</th>\r\n");
      out.write("        <th>手机名称</th>\r\n");
      out.write("        <th>手机制造商</th>\r\n");
      out.write("        <th>手机价格</th>\r\n");
      out.write("        <th>查看详情</th>\r\n");
      out.write("        <td><font color=\"blue\">添加到购物车</font></td>\r\n");
      out.write("      </tr>\r\n");
      out.write("      ");
      org.apache.jasper.runtime.JspRuntimeLibrary.introspecthelper(_jspx_page_context.findAttribute("dataBean"), "pageSize", request.getParameter("pageSize"), request, "pageSize", false);
      out.write("\r\n");
      out.write("      ");
      org.apache.jasper.runtime.JspRuntimeLibrary.introspecthelper(_jspx_page_context.findAttribute("dataBean"), "currentPage", request.getParameter("currentPage"), request, "currentPage", false);
      out.write("\r\n");
      out.write("      ");

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
       
      out.write("\r\n");
      out.write("    </table>\r\n");
      out.write("    <br>每页最多显示");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((mybean.data.DataByPage)_jspx_page_context.findAttribute("dataBean")).getPageSize())));
      out.write("条信息\r\n");
      out.write("    <br>当前显示第\r\n");
      out.write("    <font color=\"blue\">\r\n");
      out.write("       ");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((mybean.data.DataByPage)_jspx_page_context.findAttribute("dataBean")).getCurrentPage())));
      out.write("\r\n");
      out.write("    </font>页，共有\r\n");
      out.write("    <font color=\"blue\">\r\n");
      out.write("       ");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((mybean.data.DataByPage)_jspx_page_context.findAttribute("dataBean")).getTotalPages())));
      out.write("\r\n");
      out.write("    </font>页\r\n");
      out.write("    <table>\r\n");
      out.write("      <tr>\r\n");
      out.write("        <td>\r\n");
      out.write("          <form action=\"\" method=\"post\">\r\n");
      out.write("            <input type=\"hidden\" name=\"currentPage\" value=\"");
      out.print( dataBean.getCurrentPage()-1 );
      out.write("\"/>\r\n");
      out.write("            <input type=\"submit\" name=\"g\" value=\"上一页\"/>\r\n");
      out.write("          </form>\r\n");
      out.write("        </td>\r\n");
      out.write("        <td>\r\n");
      out.write("          <form action=\"\" method=\"post\">\r\n");
      out.write("            <input type=\"hidden\" name=\"currentPage\" value=\"");
      out.print( dataBean.getCurrentPage()+1 );
      out.write("\"/>\r\n");
      out.write("            <input type=\"submit\" name=\"g\" value=\"下一页\"/>\r\n");
      out.write("          </form>\r\n");
      out.write("        </td>\r\n");
      out.write("      </tr>\r\n");
      out.write("      <tr>\r\n");
      out.write("        <td>\r\n");
      out.write("          <form action=\"\" method=\"post\">\r\n");
      out.write("            每页显示<input type=\"text\" name=\"pageSize\" value=\"2\" size=\"3\"/>\r\n");
      out.write("            条记录<input type=\"submit\" name=\"g\" value=\"确定\"/>\r\n");
      out.write("          </form>\r\n");
      out.write("        </td>\r\n");
      out.write("        <td>\r\n");
      out.write("          <form action=\"\" method=\"post\">\r\n");
      out.write("            输入页码：<input type=\"text\" name=\"currentPage\" value=\"2\" />\r\n");
      out.write("            <input type=\"submit\" name=\"g\" value=\"提交\"/>\r\n");
      out.write("          </form>\r\n");
      out.write("        </td>\r\n");
      out.write("      </tr>\r\n");
      out.write("    </table>\r\n");
      out.write("  </center>\r\n");
      out.write("  </body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

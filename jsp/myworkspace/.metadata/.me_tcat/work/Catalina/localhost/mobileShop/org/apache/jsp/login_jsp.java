package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\r\n");
      mybean.data.Login loginBean = null;
      synchronized (session) {
        loginBean = (mybean.data.Login) _jspx_page_context.getAttribute("loginBean", PageContext.SESSION_SCOPE);
        if (loginBean == null){
          loginBean = new mybean.data.Login();
          _jspx_page_context.setAttribute("loginBean", loginBean, PageContext.SESSION_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("  <head>\r\n");
      out.write("    ");
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
      out.write("  </head>\r\n");
      out.write("  <body bgcolor=\"#66FFAA\">\r\n");
      out.write("    <font size=\"2\">\r\n");
      out.write("       <div align=\"center\">      \r\n");
      out.write("           <tr><th>登陆</th></tr>\r\n");
      out.write("           <form action=\"loginServlet\" method=\"post\">\r\n");
      out.write("             <table border=\"2\">\r\n");
      out.write("             <tr><td>登录名称:<input type=\"text\" name=\"logname\"/></td></tr>\r\n");
      out.write("             <tr><td>输入密码:<input type=\"password\" name=\"password\"/></td></tr>\r\n");
      out.write("            \r\n");
      out.write("             </table>\r\n");
      out.write("              <input type=\"submit\" name=\"g\" value=\"提交\"/>\r\n");
      out.write("           </form>       \r\n");
      out.write("       </div>\r\n");
      out.write("       <div align=\"center\">\r\n");
      out.write("          登录反馈信息:<br>\r\n");
      out.write("          ");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((mybean.data.Login)_jspx_page_context.findAttribute("loginBean")).getBackNews())));
      out.write("\r\n");
      out.write("          <br>登录名称:<br>");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((mybean.data.Login)_jspx_page_context.findAttribute("loginBean")).getLogname())));
      out.write("\r\n");
      out.write("       </div>\r\n");
      out.write("    </font>\r\n");
      out.write("  </body>\r\n");
      out.write("</html>\r\n");
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

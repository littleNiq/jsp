<%@ page contentType="text/html;charset=utf-8"%>
<html>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
  <head>
    <%@ include file="head.txt"%>
  </head>
  <body bgcolor="#66FFAA">
    <font size="2">
       <div align="center">      
           <tr><th>登陆</th></tr>
           <form action="loginServlet" method="post">
             <table border="2">
             <tr><td>登录名称:<input type="text" name="logname"/></td></tr>
             <tr><td>输入密码:<input type="password" name="password"/></td></tr>
            
             </table>
              <input type="submit" name="g" value="提交"/>
           </form>       
       </div>
       <div align="center">
          登录反馈信息:<br>
          <jsp:getProperty name="loginBean" property="backNews"/>
          <br>登录名称:<br><jsp:getProperty name="loginBean" property="logname"/>
       </div>
    </font>
  </body>
</html>

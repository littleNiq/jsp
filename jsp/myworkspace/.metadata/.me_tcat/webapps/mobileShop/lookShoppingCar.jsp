<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="mybean.data.Login"%>
<%@ page import="java.util.*"%>
<html>
  <jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
  <head>
    <%@ include file="head.txt"%>
  </head>
  <body bgcolor="#66FFAA">
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
  </body>
</html>

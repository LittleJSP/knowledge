<%@ page contentType= "text/html;charset=gb2312" %>
<%@ page import ="mybean.data.Login" %>
<%@ page import ="java.util.*" %>
<jsp:useBean id="loginBean" class= "mybean.data.Login" scope="session"/>

<HTML>
<head>
<style type="text/css">
@import url("css/lookbookcar.css");
</style></head>
<title>登查看购物车</title>
<body>

<div class="warpper">

<div class="header">
<br/><h2 align="center">神奇书屋</h2>

<div align="center" class="daohang">
<ul>
  <li><a href="index.jsp">首页</a></li>
   <li><a href="lookBook.jsp#content">浏览书籍</a></li>
  <li><a href="searchBook.jsp#content">查询书籍</a></li>
  <li><a href="showBookReview.jsp#content">查询书评</a></li>
  <li><a href="lookShoppingCar.jsp#content">我的购物车</a></li>
  <li><a href="lookOrderForm.jsp#content">查看订单</a></li>
</ul></div>

<div class="xiaodaohang">
 <ul>
    <li><a href="exitServlet">退出</a></li>
    <li><a href="inputRegisterMess.jsp#content">注册</a></li>
    <li><a href="login.jsp#content">登录</a></li>
  </ul>
</div>
</div>


<div class="content">
<div align = "center">
<br/>
<%  if(loginBean==null){
        response.sendRedirect("login.jsp");
      }
    else {
        boolean b =loginBean.getLogname()==null||loginBean.getLogname().length() == 0;
      if(b)
        response.sendRedirect("login.jsp");
    }
    LinkedList car=loginBean.getCar();
    if(car==null)
      out.print("<h3>购物车没有物品</h3>");
    else {
    Iterator<String> iterator = car.iterator();
    StringBuffer buyGoods = new StringBuffer();
    int n = 0;
    double priceSum =0;
    out.print("<br/>");
    out.print("<h3>购物车中的物品:</h3><table border=2>");
    while(iterator.hasNext()){
        String goods = iterator.next();
        String showGoods = "";
        n++;
        int index = goods.lastIndexOf("#");
        if(index!= -1){
          priceSum += Double.parseDouble(goods.substring(index+1));
          showGoods = goods.substring(0,index);
        }
        buyGoods.append(n+":"+showGoods);
        String del = "<form action='deleteServlet' method='post'>"
          +"<input type ='hidden' name='delete' value ="+goods+">"
          +"<input type='submit' value='删除' class='shanchu'></form>";
        out.print("<tr><td>"+ showGoods+"</td>");
        out.print("<td>"+del+"</td></tr>");
    }
    out.print("</table>");
    out.print("<br/>");
    String orderForm = "<form action='buyServlet'method='post'>" +
      "<input type ='hidden'name = 'buy' value ="+buyGoods+">" +
      "<input type ='hidden'name = 'price' value="+priceSum+">" +
      "<input type ='submit' value ='下单' class='submit'></form>";
    out.print(orderForm);
}
%>
</div>


<div class="footer">
    <p align="center"><a href="index.jsp">首页</a> |
<a href="lookBook.jsp#content">浏览书籍</a>|
<a href="searchBook.jsp#content">查询书籍</a> |
<a href="showBookReview.jsp">查询书评</a> |
<a href="lookShoppingCar.jsp#content">我的购物车</a>|
<a href="lookOrderForm.jsp#content">查看订单</a>
     <br />
      Copyright &copy; &nbsp;<a href="index.jsp">神奇书屋</a>&nbsp;&nbsp;2018&nbsp;&nbsp;| &nbsp;&nbsp;热线：888-520-1314&nbsp;&nbsp;| &nbsp;&nbsp;地址：深圳市南山区华侨城暨南大学深圳旅游学院</p><br/></div>
</div>
</div>


</body></HTML>

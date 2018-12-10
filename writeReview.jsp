<%@ page contentType="text/html;charset=gb2312" %>

<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>

<%@ page import="java.sql.*" %>
<HTML>

  
<head>
  
<style type="text/css">
  
@import url("css/writereview.css");
  
</style></head>

<title>写书评</title>
  
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


  <div class="content" align="center">

<div class="writereview">
<br/>
<%
  if(loginBean== null){
    response.sendRedirect("login.jsp");     }
  else{
    boolean b= loginBean.getLogname()== null||loginBean.getLogname().length()==0;
    if(b)
      response.sendRedirect("login.jsp");     } %>
<form action="writeReview_Servlet?dataBase=knowledge&tableName=bookreview" method=post>
<h2>编写书评：</h2>
<table border=1>
<tr><td>书名：</td><td><Input type="text" name="bookName"></td></tr>
<tr><td>书评标题：</td><td><Input type="text" name="title"></td></tr>
<tr><td>书评内容：</td><td><TEXTAREA name ="messages" ROWs ="10" COLs="36" WRAP ="physical"></TEXTAREA></td></tr>
</table>
<br><input type="submit" name="submit" value="提交书评" class="submit">

<br/><a href="showBookReview.jsp#content" color=blue>查看书评</a></br></br>
</div>


<div class="footer">
<p align="center"><a href="index.jsp">首页</a> |
<a href="lookBook.jsp#content">浏览书籍</a>|
<a href="searchBook.jsp#content">查询书籍</a> |
<a href="showBookReview.jsp">查询书评</a> |
<a href="lookShoppingCar.jsp#content">我的购物车</a>|
<a href="lookOrderForm.jsp#content">查看订单</a>
<br/>
Copyright &copy; &nbsp;<a href="index.jsp">神奇书屋</a>&nbsp;&nbsp;2018&nbsp;&nbsp;| &nbsp;&nbsp;热线：888-520-1314&nbsp;&nbsp;| &nbsp;&nbsp;地址：深圳市南山区华侨城暨南大学深圳旅游学院</p>
</div>
</div>

</div>
</body></HTML>

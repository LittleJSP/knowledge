<%@ page contentType="text/html;charset=gb2312"%>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
<%@ page import="java.sql.*" %>

<HIML>
  <head>
  <style type="text/css">
  @import url("css/showbookreview.css");
  </style></head>

<title>查看书评</title>
  


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
<div class="showbookreview">
<br/>
<%
  Connection con;
  Statement sql;
  ResultSet rs;
  try{
    Class.forName("com.mysql.jdbc.Driver");
  }
  catch(Exception e){}
  try{
    String url="jdbc:mysql://127.0.0.1/knowledge?"+"user=root&password=&characterEncoding=gb2312&serverTimezone=UTC";
    con=DriverManager.getConnection(url);
    sql=con.createStatement();
    String cdn="SELECT bookName,title,messages FROM bookreview";
    rs= sql.executeQuery(cdn);
      out.print("<br>-------------------------------------<br>");
    while(rs.next()){
      out.print("评价书目："+rs.getString(1)+",");
      out.print("书评标题："+rs.getString(2)+"<br>");
      out.print("书评内容：<br>"+rs.getString(3));
      out.print("<br>-------------------------------------<br>");
    }

    con.close();
  }
  catch(SQLException e){
    out.print(e);
  }
%>
  <br/><a href="writeReview.jsp">编写书评</a>
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
</BODY></HTML>
#

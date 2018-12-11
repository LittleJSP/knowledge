<%@ page contentType="text/html;charset=gb2312"%>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
<%@ page import="java.sql.*" %>
<HIML>

<head>
<style type="text/css">
@import url("css/lookorderform.css");
</style>

<jsp:useBean id="userBean" class="mybean.data.Register" scope="request" />

<title>查看订单</title>
</head>

<body>

<div class="warpper">

<div class="header">
<br/>
<h2 align="center">神奇书屋</h2>

<div align="center" class="daohang">
<ul>
  <li><a href="index.jsp">首页</a></li>
   <li><a href="lookBook.jsp#content">浏览书籍</a></li>
  <li><a href="searchBook.jsp#content">查询书籍</a></li>
  <li><a href="showBookReview.jsp#content">查看书评</a></li>
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



<div id="content">

  <div class="dingdan" align="center">
<p style="line-height:10px"> &nbsp;</p>
<%
  if(loginBean== null){
    response.sendRedirect("login.jsp");   //重定向到登录页面
  }
  else{
    boolean b= loginBean.getLogname()== null||loginBean.getLogname().length()==0;
    if(b)
      response.sendRedirect("login.jsp");   //重定向到登录页面
  }
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
    String cdn="SELECT id,mess,sum FROM orderForm where logname='"+loginBean.getLogname()+"'";
    rs=sql.executeQuery(cdn);
    out.print("<h2>订单详情</h2>");
    out.print("<table border=2 width='850px'>");
    out.print("<tr>");
    out.print("<th width=100>"+"订单号"+"</th>");
    out.print("<th width=100>"+"信息"+"</th>");
    out.print("<th width=100>"+"价格"+"</th>");
    out.print("</tr>");
    while(rs.next()){
      out.print("<tr>");
      out.print("<td>"+rs.getString(1)+"</td>");
      out.print("<td>"+rs.getString(2)+"</td>");
      out.print("<td>"+rs.getString(3)+"</td>");
      out.print("</tr>");
    }
    out.print("</table>");
    con.close();
  }
  catch(SQLException e){
    out.print(e);
  }out.print("<br/>");
%>
<p style="line-height:10px"> &nbsp;</p>
</div>


<div class="footer">
<p align="center"><a href="index.jsp">首页</a> |
<a href="lookBook.jsp">浏览书籍</a>|
<a href="searchBook.jsp">查询书籍</a> |
<a href="showBookReview.jsp.jsp">查看书评</a> |
<a href="lookShoppingCar.jsp#content">我的购物车</a>|
<a href="lookOrderForm.jsp#content">查看订单</a>
  <br />
      Copyright &copy; &nbsp;<a href="index.jsp">神奇书屋</a>&nbsp;&nbsp;2018&nbsp;&nbsp;| &nbsp;&nbsp;热线：888-520-1314&nbsp;&nbsp;| &nbsp;&nbsp;地址：深圳市南山区华侨城暨南大学深圳旅游学院</p> </div>

</div>

</div>
</body></HTML>

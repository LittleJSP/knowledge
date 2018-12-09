<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="mybean.data.Login" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>

<HTML>
<head>
<style type="text/css">
@import url("css/showdetail.css");
</style></head>

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

<div  class="detail" align="center">
  <input type="button" name="Submit" onclick="javascript:history.back(-1);" value="返回" class="btn">
<br/><br/><br/>
<%
  if(loginBean==null){
    response.sendRedirect("login.jsp#content");
  }
  else{
    boolean b= loginBean.getLogname()==null||loginBean.getLogname().length()==0;
    if(b)
      response.sendRedirect("login.jsp#content");
  }
  String numberID=request.getParameter("xijie");
  out.print("<th>ISBN号"+numberID);
  if(numberID==null){
    out.print("没有ISBN号,无法查看细节");
    return;
  }
  Connection con;
  Statement sql;
  ResultSet rs;
  try{Class.forName("com.mysql.jdbc.Driver");}
  catch(Exception e){}
  String uri="jdbc:mysql://127.0.0.1/knowledge?"+"user=root&password=&characterEncoding=gb2312&serverTimezone=UTC";
  try{
    con=DriverManager.getConnection(uri);
    sql=con.createStatement();
    String cdn="SELECT * FROM bookForm where ISBN='"+numberID+"'";
    rs=sql.executeQuery(cdn);
    out.print("<table border=2>");
    out.print("<tr>");
    out.print("<th>ISBN号");
    out.print("<th>书名");
    out.print("<th>作者");
    out.print("<th>出版社");
    out.print("<th>价格");
    out.print("<th>放入购物车");
    out.print("</tr>");
    String picture="welcome.jpg";
    String detailMess="";
    while(rs.next()){
    String number=rs.getString(1);
    String name=rs.getString(2);
    String writer=rs.getString(3);
    String publisher=rs.getString(4);
    String price=rs.getString(5);
    detailMess=rs.getString(6);
    picture=rs.getString(7);    //便于购物车计算价格，尾缀上“#”价格值
    String goods="("+number+","+name+","+writer+","+publisher+","+price+")#"+price;
    goods=goods.replaceAll("\\p{Blank}","");
    String button="<form action='putGoodsServlet' method='post'>"
      +"<input type='hidden' name='java' value="+goods+">"
      +"<input type='submit' value='放入购物车' class='putincar'></form>";
    out.print("<br/>");
    out.print("<tr align='center'>");
    out.print("<td>"+number+"</td>");
    out.print("<td>"+name+"</td>");
    out.print("<td>"+writer+"</td>");
    out.print("<td>"+publisher+"</td>");
    out.print("<td>"+price+"</td>");
    out.print("<td>"+button+"</td>");
    out.print("</tr>");
    }
    out.print("</table>");
    out.print("<br/>");
    out.print("<h3 style='line-height:6px;'>");
    out.print("内容概要:");
    out.print("</h3>");
    out.println("<div align=center>"+detailMess+"<div>");
    String pic="<img src='image/"+picture+"' width=260 height=300></img>";
    out.print(pic);
    con.close();
  }
  catch(SQLException exp){}
%>
</div>


<div class="footer">
<p align="center"><a href="index.jsp">首页</a> |
<a href="lookBook.jsp#content">浏览书籍</a>|
<a href="searchBook.jsp#content">查询书籍</a> |
<a href="searchBookReview.jsp">查询书评</a> |
<a href="lookShoppingCar.jsp#content">我的购物车</a>|
<a href="lookOrderForm.jsp#content">查看订单</a>
<br/>
Copyright &copy; &nbsp;<a href="index.jsp">神奇书屋</a>&nbsp;&nbsp;2018&nbsp;&nbsp;| &nbsp;&nbsp;热线：888-520-1314&nbsp;&nbsp;| &nbsp;&nbsp;地址：深圳市南山区华侨城暨南大学深圳旅游学院</p>
</div>
</div>

</div>
</body></HTML>

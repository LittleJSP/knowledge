<%@page contentType="text/html;charset=gb2312" %>
<%@page import="java.sql.*" %>
<HTML>

<head>
<style type="text/css">
@import url("css/lookbook.css");
</style></head>
<title>查询书籍</title>
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

<div align="center">
<br/><br/>
<h2>书籍分类</h2>
<%  try{ Class.forName("com.mysql.jdbc.Driver");
        }
    catch(Exception e){}
    String uri="jdbc:mysql://127.0.0.1/knowledge?"+"user=root&password=&characterEncoding=gb2312&serverTimezone=UTC";

    Connection con;
    Statement sql;
    ResultSet rs;
    try{
      con=DriverManager.getConnection(uri);
      sql=con.createStatement();
      //读取classify表，获得分类;
      rs=sql.executeQuery("SELECT * FROM classify ");
      out.print("<form action='queryServlet' method='post'>");
      out.print("<select name='fenleiNumber'>");
      while(rs.next()){
        int id=rs.getInt(1);
        String name=rs.getString(2);
        out.print("<option value="+ id +">"+name+"</option>");
      }
      out.print("</select>");
      out.print("<br/>");
      out.print("<br/>");
      out.print("<input type='submit' value='提交' class='submit'>");
      out.print("</form>");
      out.print("</div>");
      con.close();
    }
    catch(SQLException e){
      out.print(e);
    }%>
</div>


<div class="footer">
    <p align="center"><a href="index.jsp">首页</a> |
<a href="lookBook.jsp">浏览书籍</a>|
<a href="searchBook.jsp#content">查询书籍</a> |
<a href="searchBookReview.jsp">查询书评</a> |
<a href="showBookReview.jsp">查询书评</a> |
<a href="lookShoppingCar.jsp#content">我的购物车</a>|
<a href="lookOrderForm.jsp#content">查看订单</a>
     <br />
      Copyright &copy; &nbsp;<a href="index.jsp">神奇书屋</a>&nbsp;&nbsp;2018&nbsp;&nbsp;| &nbsp;&nbsp;热线：888-520-1314&nbsp;&nbsp;| &nbsp;&nbsp;地址：深圳市南山区华侨城暨南大学深圳旅游学院</p></div>
</div>

</div>

</body></HTML>

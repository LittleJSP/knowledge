<%@ page contentType="text/html;charset=gb2312"%>
<HTML>
<head>
<style type="text/css">
@import url("css/searchbook.css");
</style>
</head>

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


<div id="content">
 <div align=center>
<br/>
查询时可以输入书本的ISBN号或书名及价格.<br/>
书名名称支持模糊查询<br/>
 输入价格是在2个值之间的价格,格式是:价格1-价格2<br/>
例如20-40<br/>

 <form action="searchByConditionServlet" Method="post">
    <br>输入查询信息:<Input type=text name="searchMess"><br/>

    <input type=radio name="radio" value="ISBN">ISBN号
    <Input type=radio name="radio" value="book_name" checked="ok">书名
    <Input type=radio name="radio" value="writer" checked="ok">作者
    <Input type=radio name="radio" value="book_price">书价
    <br><Input type=submit name="g" value="查询" class="submit">
 </form></div>

<div class="footer">
<p align="center"><a href="index.jsp">首页</a> |
<a href="lookBook.jsp">浏览书籍</a>|
<a href="searchBook.jsp">查询书籍</a> |
<a href="searchBookReview.jsp">查询书评</a> |
<a href="lookShoppingCar.jsp#content">我的购物车</a>|
<a href="lookOrderForm.jsp#content">查看订单</a>
  <br />
      Copyright &copy; &nbsp;<a href="yuanshishuzhai.html">神奇书屋</a>&nbsp;&nbsp;2018&nbsp;&nbsp;| &nbsp;&nbsp;热线：888-520-1314&nbsp;&nbsp;| &nbsp;&nbsp;地址：深圳市南山区华侨城暨南大学深圳旅游学院</p> </div>

</div>
</div>

</body></HTML>

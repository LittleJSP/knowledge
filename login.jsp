<%@ page contentType = "text/html;charset=gb2312" %>
<jsp:useBean id = "loginBean" class= "mybean.data.Login" scope= "session"/>
<HTML>
<head><style type="text/css">
@import url("css/login.css");
</style>
</head>
<title>登录</title>
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

   <br/><br/>
   <h1 align="center">登录</h1>
   <table border = 2 align="center">
   <form action ="loginServlet" Method ="post">
   <tr><td>登录名称：<Input type=text name="logname"></td></tr>
   <tr><td>输入密码：<Input type=password name="password"></td></tr>
   </table>
   <br/>
   <Input type=submit name="g" value ="提交" class="submit">
   </form>
   <br/><br/>
    登录反馈信息：<jsp:getProperty name="loginBean" property="backNews"/>
    <br>登录名称：<jsp:getProperty name="loginBean" property="logname"/>


 <div class="footer">
 <p align="center"><a href="index.jsp">首页</a> |
<a href="lookBook.jsp#content">浏览书籍</a>|
<a href="searchBook.jsp#content">查询书籍</a> |
<a href="showBookReview.jsp">查询书评</a> |
<a href="lookShoppingCar.jsp#content">我的购物车</a>|
<a href="lookOrderForm.jsp#content">查看订单</a>
   <br />
   Copyright &copy; &nbsp;<a href="index.jsp">神奇书屋</a>&nbsp;&nbsp;2018 &nbsp;&nbsp;| &nbsp;&nbsp;热线：888-520-1314&nbsp;&nbsp;| &nbsp;&nbsp;地址：深圳市南山区华侨城暨南大学深圳旅游学院</p></div>
</div>

</div>

</body></HTML>

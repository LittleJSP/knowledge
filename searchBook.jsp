<%@ page contentType="text/html;charset=gb2312"%>
<HTML><HEAD><%@ include file="head.txt"%></HEAD>
<BODY background=image/happy.jpg><Font size=2>
<div align=center>
<br>查询时可以输入书本的ISBN号或书名及价格.<br>
书名名称支持模糊查询
<br>输入价格是在2个值之间的价格,格式是:价格1-价格2<br>
例如20-40
<FORM action="searchByConditionServlet" Method="post">
    <br>输入查询信息:<Input type=text name="searchMess"><br>
    <input type=radio name="radio" value="ISBN">ISBN号
    <Input type=radio name="radio" value="book_name" checked="ok">书名
    <Input type=radio name="radio" value="writer" checked="ok">作者
    <Input type=radio name="radio" value="book_price">书价
    <br><Input type=submit name="g" value="查询">
</Form>
</div>
</Font></BODY></HTML>

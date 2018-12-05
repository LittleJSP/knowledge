<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="mybean.data.Login" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>

<HTML>

<head><%@ include file="head.txt" %>
<style type="text/css">
@import url("css/showdetail.css");
</style></head>
<Body>
<div class="content align="center">
  <input type="button" name="Submit" onclick="javascript:history.back(-1);" value="返回" class="btn">

<center>
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
    out.print("<th><font color=blue>放入购物车</font>");
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
    out.print("<tr>");
    out.print("<td>"+number+"</td>");
    out.print("<td>"+name+"</td>");
    out.print("<td>"+writer+"</td>");
    out.print("<td>"+publisher+"</td>");
    out.print("<td>"+price+"</td>");
    out.print("<td>"+button+"</td>");
    out.print("</tr>");
    }
    out.print("</table>");
    out.print("内容概要:<br>");
    out.println("<div align=center>"+detailMess+"<div>");
    String pic="<img src='image/"+picture+"' width=260 height=200></img>";
    out.print(pic);
    out.print(picture);
    con.close();
  }
  catch(SQLException exp){}
%>
</Center>
</div>
</BODY></HTML>

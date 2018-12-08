<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
<%@ page import="java.sql.*" %>
<HTML><body bgcolor=blue ><font size=2>
<BODY background= image/happy.jpg>
<%
  if(loginBean== null){
    response.sendRedirect("login.jsp");     }
  else{
    boolean b= loginBean.getLogname()== null||loginBean.getLogname().length()==0;
    if(b)
      response.sendRedirect("login.jsp");     } %>
<form action="writeReview_Servlet?dataBase=shop&tableName=bookreview" method=post>
编写书评：
<table border=1>
<tr><td>书名：</td><td><Input type="text" name="bookName"></td></tr>
<tr><td>书评标题：</td><td><Input type="text" name="title"></td></tr>
<tr><td>书评内容：</td><td><TEXTAREA name ="messages" ROWs ="10" COLs="36" WRAP ="physical"></TEXTAREA></td></tr>
</table>
<br><input type="submit" name="submit" value="提交书评">
<br><a href="showBookReview.jsp#content">查看书评</a></br>
</font></body></HTML>

<%@ page contentType="text/html;charset=gb2312" %>

<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>

<%@ page import="java.sql.*" %>
<HTML>

  
<head>
  
<style type="text/css">
  
@import url("css/writereview.css");
  
</style></head>

<title>д����</title>
  
<body>
  
<div class="warpper">

  
<div class="header">
  
<br/><h2 align="center">��������</h2>

  
<div align="center" class="daohang">
  
<ul>
<li><a href="index.jsp">��ҳ</a></li>
     
    <li><a href="lookBook.jsp#content">����鼮</a></li>

    <li><a href="searchBook.jsp#content">��ѯ�鼮</a></li>
    <li><a href="showBookReview.jsp#content">��ѯ����</a></li>
    <li><a href="lookShoppingCar.jsp#content">�ҵĹ��ﳵ</a></li>
    <li><a href="lookOrderForm.jsp#content">�鿴����</a></li>
  </ul></div>



  <div class="xiaodaohang">
   
<ul>

      <li><a href="exitServlet">�˳�</a></li>

      <li><a href="inputRegisterMess.jsp#content">ע��</a></li>

      <li><a href="login.jsp#content">��¼</a></li>

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
<h2>��д������</h2>
<table border=1>
<tr><td>������</td><td><Input type="text" name="bookName"></td></tr>
<tr><td>�������⣺</td><td><Input type="text" name="title"></td></tr>
<tr><td>�������ݣ�</td><td><TEXTAREA name ="messages" ROWs ="10" COLs="36" WRAP ="physical"></TEXTAREA></td></tr>
</table>
<br><input type="submit" name="submit" value="�ύ����" class="submit">

<br/><a href="showBookReview.jsp#content" color=blue>�鿴����</a></br></br>
</div>


<div class="footer">
<p align="center"><a href="index.jsp">��ҳ</a> |
<a href="lookBook.jsp#content">����鼮</a>|
<a href="searchBook.jsp#content">��ѯ�鼮</a> |
<a href="showBookReview.jsp">��ѯ����</a> |
<a href="lookShoppingCar.jsp#content">�ҵĹ��ﳵ</a>|
<a href="lookOrderForm.jsp#content">�鿴����</a>
<br/>
Copyright &copy; &nbsp;<a href="index.jsp">��������</a>&nbsp;&nbsp;2018&nbsp;&nbsp;| &nbsp;&nbsp;���ߣ�888-520-1314&nbsp;&nbsp;| &nbsp;&nbsp;��ַ����������ɽ�����ȳ����ϴ�ѧ��������ѧԺ</p>
</div>
</div>

</div>
</body></HTML>

<%@page contentType="text/html;charset=gb2312" %>
<%@page import="java.sql.*" %>
<HTML>

<head>
<style type="text/css">
@import url("css/lookbook.css");
</style></head>
<title>��ѯ�鼮</title>
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


<div class="content">

<div align="center">
<br/><br/>
<h2>�鼮����</h2>
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
      //��ȡclassify����÷���;
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
      out.print("<input type='submit' value='�ύ' class='submit'>");
      out.print("</form>");
      out.print("</div>");
      con.close();
    }
    catch(SQLException e){
      out.print(e);
    }%>
</div>


<div class="footer">
    <p align="center"><a href="index.jsp">��ҳ</a> |
<a href="lookBook.jsp">����鼮</a>|
<a href="searchBook.jsp#content">��ѯ�鼮</a> |
<a href="searchBookReview.jsp">��ѯ����</a> |
<a href="showBookReview.jsp">��ѯ����</a> |
<a href="lookShoppingCar.jsp#content">�ҵĹ��ﳵ</a>|
<a href="lookOrderForm.jsp#content">�鿴����</a>
     <br />
      Copyright &copy; &nbsp;<a href="index.jsp">��������</a>&nbsp;&nbsp;2018&nbsp;&nbsp;| &nbsp;&nbsp;���ߣ�888-520-1314&nbsp;&nbsp;| &nbsp;&nbsp;��ַ����������ɽ�����ȳ����ϴ�ѧ��������ѧԺ</p></div>
</div>

</div>

</body></HTML>

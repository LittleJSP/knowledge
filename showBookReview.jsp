<%@ page contentType="text/html;charset=gb2312"%>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
<%@ page import="java.sql.*" %>
<HIML><HEAD><%@ include file="head.txt"%></HEAD>
<BODY background= image/happy.jpg>
<div align="center">
<%
  Connection con;
  Statement sql;
  ResultSet rs;
  try{
    Class.forName("com.mysql.jdbc.Driver");
  }
  catch(Exception e){}
  try{
    String url="jdbc:mysql://127.0.0.1/shop?"+"user=root&password=&characterEncoding=gb2312&serverTimezone=UTC";
    con=DriverManager.getConnection(url);
    sql=con.createStatement();
    String cdn="SELECT bookName,title,messages FROM bookreview";
    rs= sql.executeQuery(cdn);
      out.print("<br>-------------------------------------<br>");
    while(rs.next()){
      out.print("������Ŀ��"+rs.getString(1)+",");
      out.print("�������⣺"+rs.getString(2)+"<br>");
      out.print("�������ݣ�<br>"+rs.getString(3));
      out.print("<br>-------------------------------------<br>");
    }

    con.close();
  }
  catch(SQLException e){
    out.print(e);
  }
%>
  <br><a href="writeReview.jsp#content">��д����</a></br>
</div>
</BODY></HTML>

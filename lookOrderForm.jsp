<%@ page contentType="text/html;charset=gb2312"%>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
<%@ page import="java.sql.*" %>
<HIML>

<head>
<style type="text/css">
@import url("css/lookorderform.css");
</style>

<jsp:useBean id="userBean" class="mybean.data.Register" scope="request" />

<title>�鿴����</title>
</head>

<body>

<div class="warpper">

<div class="header">
<br/>
<h2 align="center">��������</h2>

<div align="center" class="daohang">
<ul>
  <li><a href="index.jsp">��ҳ</a></li>
   <li><a href="lookBook.jsp#content">����鼮</a></li>
  <li><a href="searchBook.jsp#content">��ѯ�鼮</a></li>
  <li><a href="showBookReview.jsp#content">�鿴����</a></li>
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



<div id="content">

  <div class="dingdan" align="center">
<p style="line-height:10px"> &nbsp;</p>
<%
  if(loginBean== null){
    response.sendRedirect("login.jsp");   //�ض��򵽵�¼ҳ��
  }
  else{
    boolean b= loginBean.getLogname()== null||loginBean.getLogname().length()==0;
    if(b)
      response.sendRedirect("login.jsp");   //�ض��򵽵�¼ҳ��
  }
  Connection con;
  Statement sql;
  ResultSet rs;
  try{
    Class.forName("com.mysql.jdbc.Driver");
  }
  catch(Exception e){}
  try{
    String url="jdbc:mysql://127.0.0.1/knowledge?"+"user=root&password=&characterEncoding=gb2312&serverTimezone=UTC";
    con=DriverManager.getConnection(url);
    sql=con.createStatement();
    String cdn="SELECT id,mess,sum FROM orderForm where logname='"+loginBean.getLogname()+"'";
    rs=sql.executeQuery(cdn);
    out.print("<h2>��������</h2>");
    out.print("<table border=2 width='850px'>");
    out.print("<tr>");
    out.print("<th width=100>"+"������"+"</th>");
    out.print("<th width=100>"+"��Ϣ"+"</th>");
    out.print("<th width=100>"+"�۸�"+"</th>");
    out.print("</tr>");
    while(rs.next()){
      out.print("<tr>");
      out.print("<td>"+rs.getString(1)+"</td>");
      out.print("<td>"+rs.getString(2)+"</td>");
      out.print("<td>"+rs.getString(3)+"</td>");
      out.print("</tr>");
    }
    out.print("</table>");
    con.close();
  }
  catch(SQLException e){
    out.print(e);
  }out.print("<br/>");
%>
<p style="line-height:10px"> &nbsp;</p>
</div>


<div class="footer">
<p align="center"><a href="index.jsp">��ҳ</a> |
<a href="lookBook.jsp">����鼮</a>|
<a href="searchBook.jsp">��ѯ�鼮</a> |
<a href="showBookReview.jsp.jsp">�鿴����</a> |
<a href="lookShoppingCar.jsp#content">�ҵĹ��ﳵ</a>|
<a href="lookOrderForm.jsp#content">�鿴����</a>
  <br />
      Copyright &copy; &nbsp;<a href="index.jsp">��������</a>&nbsp;&nbsp;2018&nbsp;&nbsp;| &nbsp;&nbsp;���ߣ�888-520-1314&nbsp;&nbsp;| &nbsp;&nbsp;��ַ����������ɽ�����ȳ����ϴ�ѧ��������ѧԺ</p> </div>

</div>

</div>
</body></HTML>

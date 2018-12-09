<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="mybean.data.Login" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>

<HTML>
<head>
<style type="text/css">
@import url("css/showdetail.css");
</style></head>

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

<div  class="detail" align="center">
  <input type="button" name="Submit" onclick="javascript:history.back(-1);" value="����" class="btn">
<br/><br/><br/>
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
  out.print("<th>ISBN��"+numberID);
  if(numberID==null){
    out.print("û��ISBN��,�޷��鿴ϸ��");
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
    out.print("<th>ISBN��");
    out.print("<th>����");
    out.print("<th>����");
    out.print("<th>������");
    out.print("<th>�۸�");
    out.print("<th>���빺�ﳵ");
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
    picture=rs.getString(7);    //���ڹ��ﳵ����۸�β׺�ϡ�#���۸�ֵ
    String goods="("+number+","+name+","+writer+","+publisher+","+price+")#"+price;
    goods=goods.replaceAll("\\p{Blank}","");
    String button="<form action='putGoodsServlet' method='post'>"
      +"<input type='hidden' name='java' value="+goods+">"
      +"<input type='submit' value='���빺�ﳵ' class='putincar'></form>";
    out.print("<br/>");
    out.print("<tr align='center'>");
    out.print("<td>"+number+"</td>");
    out.print("<td>"+name+"</td>");
    out.print("<td>"+writer+"</td>");
    out.print("<td>"+publisher+"</td>");
    out.print("<td>"+price+"</td>");
    out.print("<td>"+button+"</td>");
    out.print("</tr>");
    }
    out.print("</table>");
    out.print("<br/>");
    out.print("<h3 style='line-height:6px;'>");
    out.print("���ݸ�Ҫ:");
    out.print("</h3>");
    out.println("<div align=center>"+detailMess+"<div>");
    String pic="<img src='image/"+picture+"' width=260 height=300></img>";
    out.print(pic);
    con.close();
  }
  catch(SQLException exp){}
%>
</div>


<div class="footer">
<p align="center"><a href="index.jsp">��ҳ</a> |
<a href="lookBook.jsp#content">����鼮</a>|
<a href="searchBook.jsp#content">��ѯ�鼮</a> |
<a href="searchBookReview.jsp">��ѯ����</a> |
<a href="lookShoppingCar.jsp#content">�ҵĹ��ﳵ</a>|
<a href="lookOrderForm.jsp#content">�鿴����</a>
<br/>
Copyright &copy; &nbsp;<a href="index.jsp">��������</a>&nbsp;&nbsp;2018&nbsp;&nbsp;| &nbsp;&nbsp;���ߣ�888-520-1314&nbsp;&nbsp;| &nbsp;&nbsp;��ַ����������ɽ�����ȳ����ϴ�ѧ��������ѧԺ</p>
</div>
</div>

</div>
</body></HTML>

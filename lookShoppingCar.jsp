<%@ page contentType= "text/html;charset=gb2312" %>
<%@ page import ="mybean.data.Login" %>
<%@ page import ="java.util.*" %>
<jsp:useBean id="loginBean" class= "mybean.data.Login" scope="session"/>

<HTML>
<head>
<style type="text/css">
@import url("css/lookbookcar.css");
</style></head>
<title>�ǲ鿴���ﳵ</title>
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
<div align = "center">
<br/>
<%  if(loginBean==null){
        response.sendRedirect("login.jsp");
      }
    else {
        boolean b =loginBean.getLogname()==null||loginBean.getLogname().length() == 0;
      if(b)
        response.sendRedirect("login.jsp");
    }
    LinkedList car=loginBean.getCar();
    if(car==null)
      out.print("<h3>���ﳵû����Ʒ</h3>");
    else {
    Iterator<String> iterator = car.iterator();
    StringBuffer buyGoods = new StringBuffer();
    int n = 0;
    double priceSum =0;
    out.print("<br/>");
    out.print("<h3>���ﳵ�е���Ʒ:</h3><table border=2>");
    while(iterator.hasNext()){
        String goods = iterator.next();
        String showGoods = "";
        n++;
        int index = goods.lastIndexOf("#");
        if(index!= -1){
          priceSum += Double.parseDouble(goods.substring(index+1));
          showGoods = goods.substring(0,index);
        }
        buyGoods.append(n+":"+showGoods);
        String del = "<form action='deleteServlet' method='post'>"
          +"<input type ='hidden' name='delete' value ="+goods+">"
          +"<input type='submit' value='ɾ��' class='shanchu'></form>";
        out.print("<tr><td>"+ showGoods+"</td>");
        out.print("<td>"+del+"</td></tr>");
    }
    out.print("</table>");
    out.print("<br/>");
    String orderForm = "<form action='buyServlet'method='post'>" +
      "<input type ='hidden'name = 'buy' value ="+buyGoods+">" +
      "<input type ='hidden'name = 'price' value="+priceSum+">" +
      "<input type ='submit' value ='�µ�' class='submit'></form>";
    out.print(orderForm);
}
%>
</div>


<div class="footer">
    <p align="center"><a href="index.jsp">��ҳ</a> |
<a href="lookBook.jsp#content">����鼮</a>|
<a href="searchBook.jsp#content">��ѯ�鼮</a> |
<a href="showBookReview.jsp">��ѯ����</a> |
<a href="lookShoppingCar.jsp#content">�ҵĹ��ﳵ</a>|
<a href="lookOrderForm.jsp#content">�鿴����</a>
     <br />
      Copyright &copy; &nbsp;<a href="index.jsp">��������</a>&nbsp;&nbsp;2018&nbsp;&nbsp;| &nbsp;&nbsp;���ߣ�888-520-1314&nbsp;&nbsp;| &nbsp;&nbsp;��ַ����������ɽ�����ȳ����ϴ�ѧ��������ѧԺ</p><br/></div>
</div>
</div>


</body></HTML>

<%@ page contentType= "text/html;charset=gb2312" %>
<%@ page import ="mybean.data.Login" %>
<%@ page import ="java.util.*" %>
<jsp:useBean id="loginBean" class= "mybean.data.Login" scope="session"/>
<HTML><HEAD><%@ include file ="head.txt" %>
<BODY background= image/happy.jpg><font size=2>
<div align = "center">
<%  if(loginBean==null){
        response.sendRedirect("login.jsp");
      }
    else {
        boolean b =loginBean.getLogname()==null||loginBean.getLogname().length() == 0;
      if(b)
        response.sendRedirect("login.jsp");
    }
    LinkedList car= loginBean.getCar();
    if(car==null)
      out.print("<h2>���ﳵû����Ʒ</h2>");
    else {
    Iterator<String> iterator = car.iterator();
    StringBuffer buyGoods = new StringBuffer();
    int n = 0;
    double priceSum =0;
    out.print("���ﳵ�е���Ʒ:<table border=2>");
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
          +"<input type='submit' value='ɾ��'></form>";
        out.print("<tr><td>"+ showGoods+"</td>");
        out.print("<td>"+del+"</td></tr>");
    }
    out.print("</table>");
    String orderForm = "<form action='buyServlet'method='post'>" +
      "<input type ='hidden'name = 'buy' value ="+buyGoods+">" +
      "<input type ='hidden'name = 'price' value="+priceSum+">" +
      "<input type ='submit' value ='�µ�'></form>";
    out.print(orderForm);
}
%>
</div></font>
</BODY></HTML>
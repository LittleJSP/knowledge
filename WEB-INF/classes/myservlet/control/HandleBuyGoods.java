package myservlet.control;
import mybean.data.Login;
import java.sql.*;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class HandleBuyGoods extends HttpServlet {
  public void init(ServletConfig config) throws ServletException {
      super.init(config);
      try{
          Class.forName("com.mysql.jdbc.Driver");
        }
        catch(Exception e){}
      }
      public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        request.setCharacterEncoding("gb2312");
        String buyGoodsMess = request.getParameter("buy");
        if(buyGoodsMess == null || buyGoodsMess.length()==0){
          fail(request,response,"���ﳵû����Ʒ,�޷����ɶ���");
          return;
        }
        String price = request.getParameter("price");
        if(price==null || price.length()==0){
          fail(request,response,"û�м���۸��,�޷����ɶ���");
          return;
      }
      float sum= Float.parseFloat(price);
      Login loginBean= null;
      HttpSession session = request.getSession(true);
      try{ loginBean = (Login)session.getAttribute("loginBean");
            boolean b = loginBean.getLogname()==null ||
            loginBean.getLogname().length()==0;
            if(b)
              response.sendRedirect("1ogin.jsp");
        }
        catch(Exception exp){
          response.sendRedirect("login.jsp");
        }
        String uri="jdbc:mysql://127.0.0.1/knowledge?"+"user=root&password=&characterEncoding=gb2312&serverTimezone=UTC";
        Connection con;
        PreparedStatement sql;
        try{ con= DriverManager.getConnection(uri);
              String insertCondition="INSERT INTO orderform VALUES(?,?,?,?)";
              sql = con.prepareStatement(insertCondition);
              sql.setInt(1,0);
              sql.setString(2,loginBean.getLogname());
              sql.setString(3,buyGoodsMess);
              sql.setFloat(4,sum);
              sql.executeUpdate();
              LinkedList car = loginBean.getCar();
              car.clear();
              success(request,response,"���ɶ����ɹ�");
          }
          catch(SQLException exp){
                fail(request,response,"���ɶ���ʧ��"+exp);
              }
          }
        public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
            doPost(request, response);
        }
        public void success(HttpServletRequest request,HttpServletResponse response,String backNews){
            response.setContentType("text/html;charset=GB2312");
            try {
              PrintWriter out = response.getWriter();


 out.println("<!DOCTYPE html>");
      out.println("<head><link rel='stylesheet' type='text/css' href='css/xiadanle.css'/>");
      out.println("</head>");

      out.println("<body><div class='warpper'>");
out.println("<div class='header'>");
out.println("<br/><h2 align='center'>��������</h2>");

out.println("<div align='center' class='daohang'>");
out.println("<ul><li><a href='index.jsp'>��ҳ</a></li>");
   out.println("<li><a href='lookBook.jsp#content'>����鼮</a></li>");
  out.println("<li><a href='searchBook.jsp#content'>��ѯ�鼮</a></li>");
  out.println("<li><a href='showBookReview.jsp#content'>�鿴����</a></li>");
  out.println("<li><a href='lookShoppingCar.jsp#content'>�ҵĹ��ﳵ</a></li>");
  out.println("<li><a href='lookOrderForm.jsp#content'>�鿴����</a></li></ul></div>");

out.println("<div class='xiaodaohang'><ul>");
    out.println("<li><a href='exitServlet'>�˳�</a></li>");
    out.println("<li><a href='inputRegisterMess.jsp#content'>ע��</a></li>");
    out.println("<li><a href='login.jsp#content'>��¼</a></li></ul></div></div>");

      out.println("<div class='content'>");
      out.println("<div class='xiadanle' align = 'center'>");
      out.println("<br/><br/>");
      out.println("��ϲ��������һ������~");
     out.println("<h2>"+backNews+"</h2>");
     out.println("����");
     out.println("<a href= index.jsp>��ҳ</a>");
     out.println("<br>");
     out.println("<a href= lookOrderForm.jsp>�鿴����<a>");
      out.println("<br/><br/></div>");

      out.println("<div class='footer'>");
      out.println("<p align='center'><a href='index.jsp'>��ҳ</a> |");
      out.println("<a href='lookBook.jsp#content'>����鼮</a>|");
      out.println("<a href='searchBook.jsp#content'>��ѯ�鼮</a> |");
      out.println("<a href='showBookReview.jsp'>�鿴����</a> |");
      out.println("<a href='lookShoppingCar.jsp#content'>�ҵĹ��ﳵ</a>|");
      out.println("<a href='lookOrderForm.jsp#content'>�鿴����</a><br/>");
      out.println(" Copyright &copy; &nbsp;<a href='index.jsp'>��������</a>&nbsp;&nbsp;2018&nbsp;&nbsp;| &nbsp;&nbsp;���ߣ�888-520-1314&nbsp;&nbsp;| &nbsp;&nbsp;��ַ����������ɽ�����ȳ����ϴ�ѧ��������ѧԺ</p>");

      out.println("</div></div></div></body></html>");

           
            }
              catch(IOException exp){}
          }
      public void fail(HttpServletRequest request,HttpServletResponse response,
        String backNews){
          response.setContentType("text/html;charset=GB2312");
          try {
            PrintWriter out= response.getWriter();


      out.println("<!DOCTYPE html>");
      out.println("<head><link rel='stylesheet' type='text/css' href='css/xiadanle.css'/>");
      out.println("</head>");

      out.println("<body><div class='warpper'>");
out.println("<div class='header'>");
out.println("<br/><h2 align='center'>��������</h2>");

out.println("<div align='center' class='daohang'>");
out.println("<ul><li><a href='index.jsp'>��ҳ</a></li>");
   out.println("<li><a href='lookBook.jsp#content'>����鼮</a></li>");
  out.println("<li><a href='searchBook.jsp#content'>��ѯ�鼮</a></li>");
  out.println("<li><a href='showBookReview.jsp#content'>�鿴����</a></li>");
  out.println("<li><a href='lookShoppingCar.jsp#content'>�ҵĹ��ﳵ</a></li>");
  out.println("<li><a href='lookOrderForm.jsp#content'>�鿴����</a></li></ul></div>");

out.println("<div class='xiaodaohang'><ul>");
    out.println("<li><a href='exitServlet'>�˳�</a></li>");
    out.println("<li><a href='inputRegisterMess.jsp#content'>ע��</a></li>");
    out.println("<li><a href='login.jsp#content'>��¼</a></li></ul></div></div>");

      out.println("<div class='content'>");
      out.println("<div class='xiadanle' align = 'center'>");
      out.println("<br/><br/>");
      out.println("��ȥ������ʲô�����~");
      out.println("<h2>"+backNews+"</h2>");
      out.println("����:");
      out.println("<a href= index.jsp>��ҳ</a>");
      out.println("<br/><br/></div>");

      out.println("<div class='footer'>");
      out.println("<p align='center'><a href='index.jsp'>��ҳ</a> |");
      out.println("<a href='lookBook.jsp#content'>����鼮</a>|");
      out.println("<a href='searchBook.jsp#content'>��ѯ�鼮</a> |");
      out.println("<a href='showBookReview.jsp'>�鿴����</a> |");
      out.println("<a href='lookShoppingCar.jsp#content'>�ҵĹ��ﳵ</a>|");
      out.println("<a href='lookOrderForm.jsp#content'>�鿴����</a><br/>");
      out.println(" Copyright &copy; &nbsp;<a href='index.jsp'>��������</a>&nbsp;&nbsp;2018&nbsp;&nbsp;| &nbsp;&nbsp;���ߣ�888-520-1314&nbsp;&nbsp;| &nbsp;&nbsp;��ַ����������ɽ�����ȳ����ϴ�ѧ��������ѧԺ</p>");

      out.println("</div></div></div></body></html>");

          }
          catch(IOException exp){}
        }
}

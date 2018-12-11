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
          fail(request,response,"购物车没有物品,无法生成订单");
          return;
        }
        String price = request.getParameter("price");
        if(price==null || price.length()==0){
          fail(request,response,"没有计算价格和,无法生成订单");
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
              success(request,response,"生成订单成功");
          }
          catch(SQLException exp){
                fail(request,response,"生成订单失败"+exp);
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
out.println("<br/><h2 align='center'>神奇书屋</h2>");

out.println("<div align='center' class='daohang'>");
out.println("<ul><li><a href='index.jsp'>首页</a></li>");
   out.println("<li><a href='lookBook.jsp#content'>浏览书籍</a></li>");
  out.println("<li><a href='searchBook.jsp#content'>查询书籍</a></li>");
  out.println("<li><a href='showBookReview.jsp#content'>查看书评</a></li>");
  out.println("<li><a href='lookShoppingCar.jsp#content'>我的购物车</a></li>");
  out.println("<li><a href='lookOrderForm.jsp#content'>查看订单</a></li></ul></div>");

out.println("<div class='xiaodaohang'><ul>");
    out.println("<li><a href='exitServlet'>退出</a></li>");
    out.println("<li><a href='inputRegisterMess.jsp#content'>注册</a></li>");
    out.println("<li><a href='login.jsp#content'>登录</a></li></ul></div></div>");

      out.println("<div class='content'>");
      out.println("<div class='xiadanle' align = 'center'>");
      out.println("<br/><br/>");
      out.println("恭喜你又买了一本好书~");
     out.println("<h2>"+backNews+"</h2>");
     out.println("返回");
     out.println("<a href= index.jsp>主页</a>");
     out.println("<br>");
     out.println("<a href= lookOrderForm.jsp>查看订单<a>");
      out.println("<br/><br/></div>");

      out.println("<div class='footer'>");
      out.println("<p align='center'><a href='index.jsp'>首页</a> |");
      out.println("<a href='lookBook.jsp#content'>浏览书籍</a>|");
      out.println("<a href='searchBook.jsp#content'>查询书籍</a> |");
      out.println("<a href='showBookReview.jsp'>查看书评</a> |");
      out.println("<a href='lookShoppingCar.jsp#content'>我的购物车</a>|");
      out.println("<a href='lookOrderForm.jsp#content'>查看订单</a><br/>");
      out.println(" Copyright &copy; &nbsp;<a href='index.jsp'>神奇书屋</a>&nbsp;&nbsp;2018&nbsp;&nbsp;| &nbsp;&nbsp;热线：888-520-1314&nbsp;&nbsp;| &nbsp;&nbsp;地址：深圳市南山区华侨城暨南大学深圳旅游学院</p>");

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
out.println("<br/><h2 align='center'>神奇书屋</h2>");

out.println("<div align='center' class='daohang'>");
out.println("<ul><li><a href='index.jsp'>首页</a></li>");
   out.println("<li><a href='lookBook.jsp#content'>浏览书籍</a></li>");
  out.println("<li><a href='searchBook.jsp#content'>查询书籍</a></li>");
  out.println("<li><a href='showBookReview.jsp#content'>查看书评</a></li>");
  out.println("<li><a href='lookShoppingCar.jsp#content'>我的购物车</a></li>");
  out.println("<li><a href='lookOrderForm.jsp#content'>查看订单</a></li></ul></div>");

out.println("<div class='xiaodaohang'><ul>");
    out.println("<li><a href='exitServlet'>退出</a></li>");
    out.println("<li><a href='inputRegisterMess.jsp#content'>注册</a></li>");
    out.println("<li><a href='login.jsp#content'>登录</a></li></ul></div></div>");

      out.println("<div class='content'>");
      out.println("<div class='xiadanle' align = 'center'>");
      out.println("<br/><br/>");
      out.println("快去看看有什么好书吧~");
      out.println("<h2>"+backNews+"</h2>");
      out.println("返回:");
      out.println("<a href= index.jsp>主页</a>");
      out.println("<br/><br/></div>");

      out.println("<div class='footer'>");
      out.println("<p align='center'><a href='index.jsp'>首页</a> |");
      out.println("<a href='lookBook.jsp#content'>浏览书籍</a>|");
      out.println("<a href='searchBook.jsp#content'>查询书籍</a> |");
      out.println("<a href='showBookReview.jsp'>查看书评</a> |");
      out.println("<a href='lookShoppingCar.jsp#content'>我的购物车</a>|");
      out.println("<a href='lookOrderForm.jsp#content'>查看订单</a><br/>");
      out.println(" Copyright &copy; &nbsp;<a href='index.jsp'>神奇书屋</a>&nbsp;&nbsp;2018&nbsp;&nbsp;| &nbsp;&nbsp;热线：888-520-1314&nbsp;&nbsp;| &nbsp;&nbsp;地址：深圳市南山区华侨城暨南大学深圳旅游学院</p>");

      out.println("</div></div></div></body></html>");

          }
          catch(IOException exp){}
        }
}

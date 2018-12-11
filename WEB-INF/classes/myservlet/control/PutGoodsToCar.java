package myservlet.control;
import mybean.data.Login;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class PutGoodsToCar extends HttpServlet{
  public void init(ServletConfig config) throws ServletException{
    super.init(config);
  }
  public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
    request.setCharacterEncoding("gb2312");
    String goods=request.getParameter("java");
    System.out.println(goods);
    Login loginBean=null;
    HttpSession session=request.getSession(true);
    try {
      loginBean=(Login)session.getAttribute("loginBean");
      boolean b=loginBean.getLogname()==null||loginBean.getLogname().length()==0;
      if(b)
        response.sendRedirect("login.jsp");
      LinkedList<String> car=loginBean.getCar();
      car.add(goods);
      speakSomeMess(request,response,goods);
    }
    catch(Exception exp){response.sendRedirect("login.jsp");}
  }
  public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
    doPost(request,response);
  }
  public void speakSomeMess(HttpServletRequest request,HttpServletResponse response,String goods){
    response.setContentType("text/html;charset=gb2312");
    try{
      PrintWriter out=response.getWriter();


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
      out.println("恭喜你又找到了一本好书~");
      out.println("<h2>"+goods+"放入购物车</h2>");
      out.println("<br>");
      out.println("<a href='lookShoppingCar.jsp#content'>查看购物车</a>");
      out.println("<br/><a href='byPageShow.jsp#content'>浏览书本</a>");
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

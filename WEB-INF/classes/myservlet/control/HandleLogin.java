package myservlet.control;
import mybean.data.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
public class HandleLogin extends HttpServlet{
    public void init(ServletConfig config) throws ServletException{
        super.init(config);
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch(Exception e){}
    }
    public String handleString(String s){
        try {
            byte bb[ ]=s.getBytes("iso-8859-1");
            s = new String(bb);
        }
        catch(Exception ee){}
        return s;
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        Connection con;
        Statement sql;
        String logname = request.getParameter("logname").trim();
        String password = request.getParameter("password").trim();
        logname= handleString(logname);
        password= handleString(password);
        String url="jdbc:mysql://127.0.0.1/knowledge?"+"user=root&password=&characterEncoding=gb2312&serverTimezone=UTC";
        boolean boo = (logname.length()>0) && (password.length()>0);
        try{
            con = DriverManager.getConnection(url);
            String condition = "select * from user where logname = '"+logname+"' and password='"+password+"'";
            sql = con.createStatement();
            if(boo){
                ResultSet rs= sql.executeQuery(condition);
                boolean m = rs.next();
                if(m == true){
                  //���õ�¼�ɹ��ķ���:
                  success(request,response,logname,password);
                  RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                  dispatcher.forward(request,response); //ת��
                }
                else{
                  String backNews="�����˵��û���������,�����벻ƥ��";
                  //���õ�¼ʧ�ܵķ���
                  fail(request,response,logname,backNews);
                }
            }
            else{
              String backNews="�������û���������";
              fail(request,response,logname,backNews);
            }
            con.close();
        }
        catch(SQLException exp){
          String backNews=""+exp;
          fail(request,response,logname,backNews);
        }
    }
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        doPost(request,response);
    }
    public void success(HttpServletRequest request,HttpServletResponse response,String logname,String password){
        Login loginBean = null;
        HttpSession session = request.getSession(true);
        try{
            loginBean = (Login)session.getAttribute("loginBean");
            if(loginBean == null){
                loginBean = new Login();  //�����µ�����ģ��
                session.setAttribute("loginBean",loginBean);
                loginBean = (Login)session.getAttribute("loginBean");
            }
            String name = loginBean.getLogname();
            if(name.equals(logname)){
              loginBean.setBackNews(logname+"�Ѿ���¼��");
              loginBean.setLogname(logname);
            }
            else{
              loginBean.setBackNews(logname+"��¼�ɹ�");
              loginBean.setLogname(logname);
             }
        }
        catch( Exception ee){
          loginBean = new Login();
          session.setAttribute("loginBean",loginBean);
          loginBean.setBackNews(logname+"��¼�ɹ�");
          loginBean.setLogname(logname);
        }
    }
    public void fail(HttpServletRequest request ,HttpServletResponse response,String logname, String backNews){
      response.setContentType("text/html;charset=gb2312");
      try{
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
      out.println("<h2>"+logname+"��¼�������<br/><br/>"+backNews+"</h2>");
      out.println("<br/>");
      out.println("<a href=login.jsp>���ص�¼ҳ��</a>");
      out.println("<br/><a href=index.jsp>������ҳ</a>");
      
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

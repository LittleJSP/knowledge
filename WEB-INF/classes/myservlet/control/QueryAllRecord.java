package myservlet.control;
import mybean.data.DataByPage;
import com.sun.rowset.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class QueryAllRecord extends HttpServlet{
  CachedRowSetImpl rowSet=null;
  public void init(ServletConfig config) throws ServletException{
    super.init(config);
    try{ Class.forName("com.mysql.jdbc.Driver");
    }
    catch(Exception e){}
  }
  public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
    request.setCharacterEncoding("gb2312");
    String idNumber=request.getParameter("fenleiNumber");
    if(idNumber== null)
      idNumber="0";
    int id=Integer.parseInt(idNumber);
    HttpSession session= request.getSession(true);
    Connection con= null;
    DataByPage dataBean=null;
    try{
      dataBean=(DataByPage)session.getAttribute("dataBean");
      if(dataBean==null){
        dataBean=new DataByPage();    //创建Javabean对象
        session.setAttribute("dataBean", dataBean);
      }
    }
    catch(Exception exp){
      dataBean=new DataByPage();
      session.setAttribute("dataBean",dataBean);
    }
    String uri="jdbc:mysql://127.0.0.1/knowledge?"+"user=root&password=&characterEncoding=gb2312&serverTimezone=UTC";
    try{
      con= DriverManager.getConnection(uri);
      Statement sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
      ResultSet rs=sql.executeQuery("SELECT * FROM bookform WHERE id ="+id);
      rowSet=new CachedRowSetImpl();    //创建行集对象
      rowSet.populate(rs);
      dataBean.setRowSet(rowSet);//行集数据存储到databean中
      con.close();    //关闭连接
    }
    catch(SQLException exp){}
    response.sendRedirect("byPageShow.jsp#content");//重定向到byPageshow.jsp
  }
  public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
    doPost(request,response);
  }
}

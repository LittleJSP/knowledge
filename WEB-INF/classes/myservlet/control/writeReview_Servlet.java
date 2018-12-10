package myservlet.control;
import mybean.data.writeReview_Bean;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class writeReview_Servlet extends HttpServlet{
   public void init(ServletConfig config) throws ServletException{
      super.init(config);
   }
   public void doPost(HttpServletRequest request,HttpServletResponse response)
               throws ServletException,IOException{
      writeReview_Bean resultBean=null;
      try{  resultBean=(writeReview_Bean)request.getAttribute("resultBean");
            if(resultBean==null){
                resultBean=new writeReview_Bean();
                request.setAttribute("resultBean",resultBean);
            }
      }
      catch(Exception exp){
            resultBean=new writeReview_Bean();
            request.setAttribute("resultBean",resultBean);
      }
     try{  Class.forName("com.mysql.jdbc.Driver");
     }
     catch(Exception e){}
     request.setCharacterEncoding("gb2312");
     String dataBase = request.getParameter("dataBase");
     String tableName = request.getParameter("tableName");
     String bN=request.getParameter("bookName");
     String ti=request.getParameter("title");
     String me=request.getParameter("messages");
     if(bN==null||bN.length()==0) {
        fail(request,response,"Fail to add record");
        return;
     }
     String condition = "INSERT INTO "+tableName+" VALUES"+
      "("+"'"+bN+"','"+ti+"','"+me+"')";
     Connection con;
     Statement sql;
     ResultSet rs;
     try{
          String uri="jdbc:mysql://127.0.0.1/"+dataBase+"?"+
                      "user=root&password=&characterEncoding=gb2312&serverTimezone=UTC";
          con=DriverManager.getConnection(uri);
          sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                                 ResultSet.CONCUR_READ_ONLY);
          sql.executeUpdate(condition);
          rs=sql.executeQuery("SELECT * FROM "+tableName);
          ResultSetMetaData metaData = rs.getMetaData();
          int columnCount = metaData.getColumnCount();
          String []columnName = new String[columnCount];
          for(int i=0;i<columnName.length;i++) {
             columnName[i] = metaData.getColumnName(i+1);
          }
          resultBean.setColumnName(columnName);
          rs.last();
          int rowNumber=rs.getRow();
          String [][] tableRecord=resultBean.getTableRecord();
          tableRecord = new String[rowNumber][columnCount];
          rs.beforeFirst();
          int i=0;
          while(rs.next()){
            for(int k=0;k<columnCount;k++)
              tableRecord[i][k] = rs.getString(k+1);
            i++;
          }
          resultBean.setTableRecord(tableRecord);
          con.close();
          RequestDispatcher dispatcher=
          request.getRequestDispatcher("showBookReview.jsp");
          dispatcher.forward(request,response);
     }
     catch(SQLException e){
          System.out.println(e);
          fail(request,response,"Fail to add record"+e.toString());
     }
   }
   public  void  doGet(HttpServletRequest request,HttpServletResponse response)
           throws ServletException,IOException{
       doPost(request,response);
   }
   public void fail(HttpServletRequest request,HttpServletResponse response,
                      String backNews) {
        response.setContentType("text/html;charset=GB2312");
        try {
         PrintWriter out=response.getWriter();
         out.println("<html><body>");
         out.println("<h2>"+backNews+"</h2>") ;
         out.println("return");
         out.println("<a href =writeReview.jsp>add record</a>");
         out.println("</body></html>");
        }
        catch(IOException exp){}
    }
}

<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="mybean.data.DataByPage" %>
<%@ page import="com.sun.rowset.*" %>
<jsp:useBean id="dataBean" class="mybean.data.DataByPage" scope="session"/>

<HTML>
<head><%@ include file="head.txt" %>
<style type="text/css">
@import url("css/bypageshow.css");
</style></head>
<Body>
<div class="content" align="center">
<input type="button" name="Submit" onclick="javascript:history.back(-1);" value="����" class="btn">
<center>
<BR><h4>��ǰ��ʾ�������ǣ�</h4>
<table border=2>
<tr>
    <th>ISBN��</th>
    <th>����</th>
    <th>����</th>
    <th>������</th>
    <th>�۸�</th>
    <th>�鿴����</th>
    <th>���ӵ����ﳵ</th>
</tr>
<jsp:setProperty name="dataBean" property="pageSize" param="pageSize"/>
<jsp:setProperty name="dataBean" property="currentPage" param="currentPage"/>
<%
  CachedRowSetImpl rowSet=dataBean.getRowSet();
  if(rowSet==null){
    out.print("��Ǹ��û�������Ʒ��Ϣ"+"<br/>");
    return;
  }
  rowSet.last();
  int totalRecord=rowSet.getRow();
  out.println("ȫ����¼��"+totalRecord);   //ȫ����¼��
  int pageSize=dataBean.getPageSize();    //ÿҳ��ʾ�ļ�¼��
  int totalPages=dataBean.getTotalPages();    //��ҳ��
  if(totalRecord%pageSize==0)
      totalPages=totalRecord/pageSize;
  else
     totalPages=totalRecord/pageSize+1;
  dataBean.setPageSize(pageSize);
  dataBean.setTotalPages(totalPages);
  if(totalPages>=1){
    if(dataBean.getCurrentPage()<1)
      dataBean.setCurrentPage(dataBean.getTotalPages());
    if(dataBean.getCurrentPage()>dataBean.getTotalPages())
      dataBean.setCurrentPage(1);
    int index=(dataBean.getCurrentPage()-1)*pageSize+1;
    rowSet.absolute(index);
    //��ѯλ���ƶ���currentPageҳ��ʼλ��
    boolean boo=true;
    for(int i=1;i<=pageSize&&boo;i++){
      String number=rowSet.getString(1);
      String name=rowSet.getString(2);
      String writer=rowSet.getString(3);
      String publisher=rowSet.getString(4);
      String price=rowSet.getString(5);
      String goods="("+number+","+name+","+writer+","+publisher+","+price+")#"+price;
      //���ڹ��ﳵ����۸�,β׺��"#�۸�ֵ"
      goods=goods.replaceAll("\\p{Blank}","");
      String button="<form action='putGoodsServlet' method='post'>"+
        "<input type='hidden' name='java' value="+goods+">"+
        "<input type='submit' value='���빺�ﳵ' class='putincar'></form>";
      String detail="<form action='showDetail.jsp' method='post'>"+
        "<input type='hidden' name='xijie' value="+number+">"+
        "<input type='submit' value='�鿴ϸ��' class='xijie'></form>";
      out.print("<tr align='center'>");
      out.print("<td>"+number+"</td>");
      out.print("<td>"+name+"</td>");
      out.print("<td>"+writer+"</td>");
      out.print("<td>"+publisher+"</td>");
      out.print("<td>"+price+"</td>");
      out.print("<td>"+detail+"</td>");
      out.print("<td>"+button+"</td>");
      out.print("</tr>");
      boo=rowSet.next();
    }
  }
%>
</table>
<BR>ÿҳ�����ʾ<jsp:getProperty name="dataBean" property="pageSize" />����Ϣ
<BR>��ǰ��ʾ��<Font color=brown>
  <jsp:getProperty name="dataBean" property="currentPage"/>
</Font>ҳ,����
<Font color=brown><jsp:getProperty name="dataBean" property="totalPages" />
</Font>ҳ.
<Table>
  <tr><td><FORM action="" method=post>
    <Input type=hidden name="currentPage" value="<%=dataBean.getCurrentPage()-1 %>" >
      <Input type=submit name="g" value="��һҳ" class="shangyiye"></FORM></td>
  <td><FORM action="" method=post>
     <Input type=hidden name="currentPage" value="<%=dataBean.getCurrentPage()+1 %>" >
       <Input type=submit name="g" value="��һҳ" class="xiayiye"></FORM></td></tr>
  <tr><td><FORM action="" method=post>
  ÿҳ��ʾ<Input type=text name="pageSize" value=10 size=3>
  ����¼<Input type=submit name="g" value="ȷ��" class="ok"></FORM></td>
  <td><FORM action="" method= post>
    ����ҳ��:<Input type=text name="currentPage" size=2>
    <Input type=submit name="g" value ="�ύ" class="tijiao"></FORM></td></tr>
</Table>
</Center>
</div>


<div class="footer">
<p align="center"><a href="index.jsp">��ҳ</a> |
<a href="lookCosmetic.jsp#content">����鼮</a>|
<a href="searchCosmetic.jsp#content">��ѯ�鼮</a> |
<a href="lookOrderForm.jsp#content">�鿴����</a> |
<a href="lookShoppingCar.jsp#content">�ҵĹ��ﳵ</a>
<br/><br />
Copyright &copy; &nbsp;<a href="index.jsp">��������</a>&nbsp;&nbsp;2018&nbsp;&nbsp;| &nbsp;&nbsp;���ߣ�888-520-1314&nbsp;&nbsp;| &nbsp;&nbsp;��ַ����������ɽ�����ȳ����ϴ�ѧ��������ѧԺ</p>
</div>
</div>


</BODY ></HTML>
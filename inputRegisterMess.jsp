<%@ page contentType="text/html;charset=gb2312" %>
<HTML>

<head>
<style type="text/css">
@import url("css/inputRegisterMess.css");
</style>


<jsp:useBean id="userBean" class="mybean.data.Register" scope="request" />

<title>ע��ҳ��</title>
</head>

<body>

<div class="warpper">

<div class="header">
<br/>
<h2 align="center">��������</h2>

<div align="center" class="daohang">
<ul>
  <li><a href="index.jsp">��ҳ</a></li>
   <li><a href="lookBook.jsp#content">����鼮</a></li>
  <li><a href="searchBook.jsp#content">��ѯ�鼮</a></li>
  <li><a href="lookOrderForm.jsp#content">�鿴����</a></li>
  <li><a href="lookShoppingCar.jsp#content">�ҵĹ��ﳵ</a></li>
</ul></div>

<div class="xiaodaohang">
 <ul>
    <li><a href="exitServlet">�˳�</a></li>
    <li><a href="inputRegisterMess.jsp#content">ע��</a></li>
    <li><a href="login.jsp#content">��¼</a></li>
  </ul>
</div>
</div>


<div id="content"> 
  <div class="zhuce" align="center">
    <FORM action="registerServlet" method="post" name=form>
    <table>
<br/>
    �û�������ĸ�����֡��»��߹��ɣ�*ע�͵��������д
    <h2 align="center">ע��</h2>
    <tr><td>*�û����ƣ�</td>
        <td><input type=text name="logname" ></td>
        <td>*�û����룺</td>
        <td><input type=password name="password"></td>
    </tr>
    <tr><td>*�ظ����룺</td>
        <td><input type=password name="again_password"></td>
        <td>&nbsp;&nbsp;��ϵ�绰��</td>
        <td><input type=text name="phone"></td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;�ʼĵ�ַ��</td><td><input type=text name="address"></td>
        <td>&nbsp;&nbsp;��ʵ������</td><td><input type=text name="realname"></td>
        
        <td><input type=submit name="g" value="�ύ" class="submit"></td>
    </tr></table></Form>

   <br/>


    <p><h2>ע�ᷴ��</h2>
    <jsp:getProperty name="userBean" property="backNews"/>
    <table border=3>
    <tr><td>��Ա���ƣ�</td>
    <td><jsp:getProperty name="userBean" property="logname" /></td></tr>
    <tr><td>������</td>
    <td><jsp:getProperty name="userBean" property="realname" /></td></tr>
    <tr><td>��ַ��</td>
    <td><jsp:getProperty name="userBean" property="address" /></td></tr>
    <tr><td>�绰��</td>
    <td><jsp:getProperty name="userBean" property="phone" /></td></tr>
    </table>
<br/>
</div>


<div class="footer">
<p align="center"><a href="index.jsp">��ҳ</a> | 
<a href="lookBook.jsp">����鼮</a>| 
<a href="searchBook.jsp">��ѯ�鼮</a> | 
<a href="lookOrderForm.jsp">�鿴����</a> | 
<a href="lookShoppingCar.jsp">�ҵĹ��ﳵ</a>
  <br />
      Copyright &copy; &nbsp;<a href="yuanshishuzhai.html">��������</a>&nbsp;&nbsp;2018&nbsp;&nbsp;| &nbsp;&nbsp;���ߣ�888-520-1314&nbsp;&nbsp;| &nbsp;&nbsp;��ַ����������ɽ�����ȳ����ϴ�ѧ��������ѧԺ</p> </div>

</div>

</div>

</body></HTML>

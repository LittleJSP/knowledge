<%@ page contentType="text/html;charset=gb2312"%>
<HTML>
<head>
<style type="text/css">
@import url("css/searchbook.css");
</style>
</head>

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


<div id="content">
 <div align=center>
<br/>
��ѯʱ���������鱾��ISBN�Ż��������۸�.<br/>
��������֧��ģ����ѯ<br/>
 ����۸�����2��ֵ֮��ļ۸�,��ʽ��:�۸�1-�۸�2<br/>
����20-40<br/>

 <form action="searchByConditionServlet" Method="post">
    <br>�����ѯ��Ϣ:<Input type=text name="searchMess"><br/>

    <input type=radio name="radio" value="ISBN">ISBN��
    <Input type=radio name="radio" value="book_name" checked="ok">����
    <Input type=radio name="radio" value="writer" checked="ok">����
    <Input type=radio name="radio" value="book_price">���
    <br><Input type=submit name="g" value="��ѯ" class="submit">
 </form></div>

<div class="footer">
<p align="center"><a href="index.jsp">��ҳ</a> |
<a href="lookBook.jsp">����鼮</a>|
<a href="searchBook.jsp">��ѯ�鼮</a> |
<a href="searchBookReview.jsp">��ѯ����</a> |
<a href="lookShoppingCar.jsp#content">�ҵĹ��ﳵ</a>|
<a href="lookOrderForm.jsp#content">�鿴����</a>
  <br />
      Copyright &copy; &nbsp;<a href="yuanshishuzhai.html">��������</a>&nbsp;&nbsp;2018&nbsp;&nbsp;| &nbsp;&nbsp;���ߣ�888-520-1314&nbsp;&nbsp;| &nbsp;&nbsp;��ַ����������ɽ�����ȳ����ϴ�ѧ��������ѧԺ</p> </div>

</div>
</div>

</body></HTML>

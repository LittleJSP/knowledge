<%@ page contentType="text/html;charset=gb2312"%>
<HTML><HEAD><%@ include file="head.txt"%></HEAD>
<BODY background=image/happy.jpg><Font size=2>
<div align=center>
<br>��ѯʱ���������鱾��ISBN�Ż��������۸�.<br>
��������֧��ģ����ѯ
<br>����۸�����2��ֵ֮��ļ۸�,��ʽ��:�۸�1-�۸�2<br>
����20-40
<FORM action="searchByConditionServlet" Method="post">
    <br>�����ѯ��Ϣ:<Input type=text name="searchMess"><br>
    <input type=radio name="radio" value="ISBN">ISBN��
    <Input type=radio name="radio" value="book_name" checked="ok">����
    <Input type=radio name="radio" value="writer" checked="ok">����
    <Input type=radio name="radio" value="book_price">���
    <br><Input type=submit name="g" value="��ѯ">
</Form>
</div>
</Font></BODY></HTML>

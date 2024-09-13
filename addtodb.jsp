<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DB</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body background="Images/book_lib.jpeg">
<form action="addbooks.jsp" method="get">
<%
String a=request.getParameter("bname");
String b=request.getParameter("aname");
String c=request.getParameter("bcost");
String d=request.getParameter("a_copy");
String e=request.getParameter("i_copy");
String f=request.getParameter("t_copy");

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sysdba","admin@123");
PreparedStatement ps=con.prepareStatement("insert into book values(book_sequence.NEXTVAL,?,?,?,?,?,?)");

ps.setString(1, a);
ps.setString(2, b);
ps.setInt(3, Integer.parseInt(c));
ps.setInt(4, Integer.parseInt(d));
ps.setInt(5, Integer.parseInt(e));
ps.setInt(6, Integer.parseInt(f));

ps.executeUpdate();
ps.close();
%>
</form>
<jsp:forward page="addbooks.jsp"></jsp:forward>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Returning a Book</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body background="Images/book_lib.jpeg">
<div class="container">
<h1>Return a Book</h1>
<form action="return2.jsp" method="post">
<%
String uname=(String)session.getAttribute("uname");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sysdba","admin@123");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select*from book b join issue_book ib on b.bid=ib.book_id where ib.uname='"+uname+"'");
%>
<p>Select Book name to :
<select name="bname">
<option>--select book--</option>
<%
while(rs.next())
{
	String bname=rs.getString("book_name");
	int copies=rs.getInt("AVAILABLE_COPIES");
	if(copies>0){%>	
	<option><%= bname %><%} %></option>
<%}%>
</select></p>
<p><input type="submit" value="Return"/></p>
</form>
<form action="home.jsp" method="post">
<p><input type="submit" value="Go to Home"/></p>
</form>
</div>
</body>
</html>
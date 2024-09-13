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
<title>Issue a Book</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body background="Images/book_lib.jpeg">
<div class="container">
<h1>Issue a Book</h1>
<form action="addrecord.jsp" method="post">
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sysdba","admin@123");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select book_name,available_copies from book");
%>
<p>Select Book name to :
<select name="bname">
<option>--select book--</option>
<%
while(rs.next())
{
	String bname=rs.getString(1);
	int copies=rs.getInt(2);
	if(copies>0){%>	
	<option><%= bname %><%} %></option>
<%}%>
</select></p>
<p><input type="submit" value="Issue"/></p>
</form>
<form action="home.jsp" method="post">
<p><input type="submit" value="Go to Home"/></p>
</form>
</div>
</body>
</html>
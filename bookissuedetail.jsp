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
<title>Book Issue Details</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body background="Images/book_lib.jpeg">
<div class="container">
<form action="details.jsp" method="post">
<h1>Select book name for book issue details</h1>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sysdba","admin@123");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select book_name from book");
%>
<p>Select here:</p>
<p><select name="bnameissue">
<option>--select book--</option>
<%
while(rs.next())
{
	String bname=rs.getString(1);%>
	<option><%= bname %></option>
<%} %>
</select></p>
<p><input type="submit" value="Show Details"></p>
</form>
<form action="home.jsp" method="post">
<p><input type="submit" value="Go to Home"/></p>
</form>
</div>
</body>
</html>
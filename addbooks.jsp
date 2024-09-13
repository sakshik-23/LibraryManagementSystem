<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Book</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h1>Add Books Here</h1>
<form action="addtodb.jsp" method="post">
<div style="margin-left:5px; border:5px solid black; width:fit-content;">
<p><b>Enter book name:</b><input type="text" name="bname"/></p>
<p><b>Enter author name:</b><input type="text" name="aname"/></p>
<p><b>Enter cost of book:</b><input type="text" name="bcost"/></p>
<p><b>Enter number of available copies:</b><input type="number" name="a_copy"/></p>
<p><b>Enter number of issued copies:</b><input type="number" name="i_copy"/></p>
<p><b>Enter number of total copies:</b><input type="number" name="t_copy"/></p>
<p><input type="submit" value="Add Book"/></p>
</div>
</form>
<form action="home.jsp" method="post">
<p><input type="submit" value="Go to Home"/></p>
</form>
<form action="logout.jsp" method="post">
<p><input type="submit" value="Logout"/></p>
</form>
</body>
</html>
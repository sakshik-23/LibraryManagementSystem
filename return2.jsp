<%@page import="java.sql.PreparedStatement"%>
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
<title>Book Returned</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<%
String uname=(String)session.getAttribute("uname");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sysdba","admin@123");
Statement stmt=con.createStatement();
String bname=request.getParameter("bname");
ResultSet rs=stmt.executeQuery("select bid from book where book_name='"+bname+"'");
rs.next();
int id=rs.getInt(1);
PreparedStatement ps=con.prepareStatement("delete from issue_book where book_id='"+id+"' and uname='"+uname+"'");
ps.executeUpdate();
ResultSet rs2=stmt.executeQuery("select available_copies, issued_copies from book where book_name='"+bname+"'");
rs2.next();
int a=rs2.getInt(1);
int x=a+1;
int b=rs2.getInt(2);
int y=b-1;
PreparedStatement ps2=con.prepareStatement("update book set available_copies='"+x+"',issued_copies='"+y+"' where book_name='"+bname+"'");
ps2.executeUpdate();
ps.close();
%>
<h1>Book Returned Successfully !!!</h1>
<form action="returnbook.jsp" method="post">
<p><input type="submit" value="Go back">
</form>
</body>
</html>
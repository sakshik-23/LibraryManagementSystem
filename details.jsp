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
<title>Book Details</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h1>Book Issue Details:</h1> <br><br>
<%
String bname=request.getParameter("bnameissue");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sysdba","admin@123");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select bid from book where book_name='"+bname+"'");
rs.next();
int bid=rs.getInt(1);
ResultSet rs2=stmt.executeQuery("select uname,date_of_issue from issue_book where book_id='"+bid+"'");
%>
<table border='1'><thead><th>USERNAME</th><th>DATE_OF_ISSUE</th></thead>
<tbody>
<%while(rs2.next()){ %>
<tr>
<td><%=rs2.getString(1) %></td>
<td><%=rs2.getString(2) %></td>
</tr>
<%} %>
</tbody></table>
<form action="bookissuedetail.jsp" method="post">
<p><input type="submit" value="Go back">
</form>
</body>
</html>
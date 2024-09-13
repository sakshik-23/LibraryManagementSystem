<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of All Available Books</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h1>List of All Available Books</h1><br><br>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sysdba","admin@123");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select*from book");
%>
<table border='1'><thead><th>BID</th><th>BOOK_NAME</th><th>AUTHOR_NAME</th><th>COST_OF_BOOK</th><th>AVAILABLE_COPIES</th><th>ISSUED_COPIES</th><th>TOTAL_COPIES</th></thead>
<tbody>
<%while(rs.next()){ %>
<tr>
<td><%=rs.getInt(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getInt(4) %></td>
<td><%=rs.getInt(5) %></td>
<td><%=rs.getInt(6) %></td>
<td><%=rs.getInt(7) %></td>
</tr>
<%} %>
</tbody></table><br><br>
<form action="home.jsp" method="post">
<input type="submit" value="Go to Home Page"/>
</form> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<form action="logout.jsp" method="post">
<input type="submit" value="Logout"/>
</form>
</body>
</html>
<%@page import="java.util.HashMap"%>
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
<title>User Login</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body background="Images/book_lib.jpeg">
<div class="container">
<h1 align="center">Enter Login Credentials!</h1>
<form action="login.jsp" method="post" align="center">
<div style="margin-left:120px; border:5px solid black; width: 600px;">
<p>Enter username:<input type="text" name="uname" required></p>
<p>Enter password:<input type="password" name="pass" required></p>
<p><input type="submit" value="Verify" required></p>
</form>
</div>
</div>
<form method="get">
<%
String uname=request.getParameter("uname");
String pass=request.getParameter("pass");
if(uname!=null && pass!=null){
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sysdba","admin@123");
Statement stmt=con.createStatement();
HashMap<String,String> users=new HashMap<String,String>();
ResultSet rs=stmt.executeQuery("select uname, password from library_user");
String msg=null;
while(rs.next())
{
	String u=rs.getString(1);
	String p=rs.getString(2);
	users.put(u, p);
}
if(users.containsKey(uname) && users.get(uname).equals(pass)){%>
	<jsp:forward page="home.jsp"></jsp:forward>
<% }
else{
	msg="Invalid Login Credentials, LOGIN AGAIN!";
}%>
<%
if(msg!=null){%>
	<p style='color:black'><%=msg %></p>
<% 
}
}%>
</form>
</body>
</html>
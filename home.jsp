<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body background="Images/book_lib.jpeg">
<div class="container">
<% 
String uname=(String)session.getAttribute("uname");
if(uname==null){
session.setAttribute("uname", request.getParameter("uname")); 
}
%>
<h1>Welcome to Home Page <%= session.getAttribute("uname") %></h1>
<form>
<p><a href="availablebooks.jsp">List of All Available Books</a></p>
<p><a href="addbooks.jsp">Add a new Book</a></p>
<p><a href="issuebook.jsp">Issue a Book</a></p>
<p><a href="returnbook.jsp">Return a Book</a></p>
<p><a href="bookissuedetail.jsp">Book issued Details</a></p>
</form>
<form action="logout.jsp" method="post">
<p><input type="submit" value="Logout"/></p>
</form>
</div>
</body>
</html>
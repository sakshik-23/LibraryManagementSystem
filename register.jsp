<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Library User Registration</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body background="Images/book_lib.jpeg">
<h1 align="center">Register Here!</h1>
<form action="insert.jsp" method="post" align="center">
<div style="margin-left:200px; border:5px solid black; width: 600px;">
<div class="container">
<p><b>Enter first name:</b><br><input type="text" name="fname" required/></p>
<p><b>Enter last name:</b><br><input type="text" name="lname" required/></p>
<p><b>Enter DOB:</b><br><input type="date" name="dob" required/></p>
<p><b>Enter email:</b><br><input type="email" name="email" required/></p>
<p><b>Enter phone number:</b><br><input type="number" name="pnumber" required/></p>
<p><b>Create Username:</b><br><input type="text" name="uname" required/></p>
<p><b>Create password:</b><br><input type="password" name="pass" required/></p>
<input type="submit" value="Register User"/>
</form><br>
<form action="library.jsp" method="post" align="center">
<input type="submit" value="Go Back"/>
</form>
</div>
</div>
</body>
</html>
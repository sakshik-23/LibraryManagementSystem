<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<% 
String a=request.getParameter("fname");
String b=request.getParameter("lname");
String c=request.getParameter("dob");
String d=request.getParameter("email");
String e=request.getParameter("pnumber");
String f=request.getParameter("uname");
String g=request.getParameter("pass");

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sysdba","admin@123");
PreparedStatement ps=con.prepareStatement("insert into library_user values(lib_sequence.NEXTVAL,?,?,to_date(?,'YYYY-MM-DD'),?,?,?,?)");

ps.setString(1, a);
ps.setString(2, b);
ps.setString(3, c);
ps.setString(4, d);
ps.setString(5, e);
ps.setString(6, f);
ps.setString(7, g);

ps.executeUpdate();
ps.close();
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h1>User Registered Successfully!</h1><br><br>
<p><a href="register.jsp">Click Here to Register Another User</a></p>
<p><a href="login.jsp">Click Here to Login</a></p>
</body>
</html>
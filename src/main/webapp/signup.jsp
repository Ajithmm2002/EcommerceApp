<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <link rel="stylesheet" href="css/signupstyle.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div id='container'>
<div class='signup'>
				<form action="SignupAction.jsp" method="post">
					<input type="text" name="name" placeholder="Enter Name" required>
					<input type="email" name="email" placeholder="Enter Email" required>
					<input type="number" name="mobileNumber" placeholder="Enter Mobile Number" required>
					
				<select name="securityQuestion">
					<option value="what was your first Car ?">What was your first Car ?</option> 
					<option value="what is the name of your first pet?">What is the name of your first pet?</option> 
			
					<option value="What elementary school did you attend?">What elementary school did you attend?</option>
					<option value="what is the name of the town where you were born?">What is the name of the town where you were born?</option>
				</select>
	<input type="text" name="answer" placeholder="Enter Answer" required> 
	<input type="password" name="password" placeholder="Enter Password" required>
	<input type="submit" value="signup">
</form>

<h2><a href="Login.jsp">Login</a></h2>
</div>

<div class='whysign'>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{%>
<h1> Successfully registered</h1>
<% }%>
<%
if("invalid".equals(msg))
{%>
<h1> Something went wrong try again later</h1>
<% }%>

<h2>Online shopping</h2>
</div>
</div>
</body>
</html>
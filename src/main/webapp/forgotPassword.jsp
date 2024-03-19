<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/forgotpasswordstyle.css">
<title>ForgotPassword</title>
</head>
<body>
	<div id='container'>
		<div class='signup'>
			<form action="ForgotPasswordAction.jsp" method="post">
				<input type="email" name="email" placeholder="Enter Email" required="required"> 
				<input type="number" name="mobileNumber" placeholder="Enter Mobile Number" required="required"> 
				<select name="securityQuestion">
					<option value="what was your first Car ?">What was your first Car ?</option> 
					<option value="what is the name of your first pet?">What is the name of your first pet?</option> 
			
					<option value="What elementary school did you attend?">What elementary school did you attend?</option>
					<option value="what is the name of the town where you were born?">What is the name of the town where you were born?</option>
				</select> 
				<input type="text" name="answer" placeholder="Enter answer" required="required"> 
				<input type="password" name="newPassword" placeholder="Enter Your New Password to set" required="required"> 
				<input type="submit" value="Save">
			</form>
			<h2>
				<a href="Login.jsp">Login</a>
			</h2>
		</div>
		<div class='whyforgotPassword'>
			<%
			String msg = request.getParameter("msg");
			if ("done".equals(msg)) {
			%>
			<h1>Password Changed Successfully!</h1>
			<%
			}
			%>
			<%
			if ("invalid".equals(msg)) {
			%>
			<h1>Some thing Went Wrong! Try Again !</h1>
			<%
			}
			%>
			<h4>Online Shopping</h4>
			<h5>The online shopping system is the application that allows
				the user to shop online without going to the shops to buy them.</h5>
		</div>
	</div>
</html>
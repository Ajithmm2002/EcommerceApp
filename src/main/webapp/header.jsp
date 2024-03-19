<%@page errorPage="error.jsp" %> 
<!DOCTYPE html> 
<html> 
<head> 
<link rel="stylesheet" href="css/headerstyle.css"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
<script src='https://kit.fontawesome.com/a076d05399.js'></script> 
</head> 
<!--Header--> 
<br> 
<div class="topnav sticky"> 
<% String email=session.getAttribute("email").toString(); %> 
<center><h2>Online shopping </h2></center> 
<h2><a href=""><%out.println(email);%></a></h2> 
 <a href="Home.jsp">Home</a> 
<a href="">My Cart</a>  
<a href="">My Orders</a> 
 
<a href="">Change Details </a> 
<a href="">Message Us</a>  
<a href="">About</a> 
<a href="logout.jsp">Logout </a> 
<div class="search-container"> 
<form action="SearchHome.jsp" method="post">
<input type="text" name="search" placeholder="search here">
<button type="submit"><i class="fa fa-search"></i> </button>
</form>
 
	
</div> 
</div> 
</html>
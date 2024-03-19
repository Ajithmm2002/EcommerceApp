<%@ page import="com.jsp.conn.ConnectionProvider" %> 
<%@ page import="java.sql.*"%> 
<%@ include file="adminHeader.jsp"%> 
<%@ include file="../footer.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 

<link rel="stylesheet" href="../css/allproducteditproduct.css">  
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> 
<title>Home</title> 
<style> 
 h3 
{ 
color: yellow; 
text-align: center; 
} 
</style> 
</head> 
<body> 
<div style="color: black; text-align: center; font-size:30px;">All Products & Edit Products</div> 
<% 
String msg=request.getParameter("msg"); 
if("done".equals(msg)) 
{ 
%> 
<h3 class="alert">Product Successfully Updated!</h3> 
<%} %> 
<%if("invalid".equals(msg)) 
{%> 
<h3 class="alert">Some thing went wrong! Try again!</h3>  
 <%}%> 
<table> 
		<thead> 
		<tr> 
		<th scope="col">ID</th> 
		<th scope="col">Name</th> 
		<th scope="col">Category</th> 
		<th scope="col">Price</th> 
		<th>Status</th> 
		<th scope="col">Edit</th> 
		</tr> 
		</thead> 
		<tbody> 
		<tr> 
		<% 
		try 
		{  
		Connection con=ConnectionProvider.getCon();  
		Statement stmt=con.createStatement(); 
		ResultSet rs=stmt.executeQuery("select * from product"); 
		while(rs.next()) 
		{ 
		%> 
		<td><%=rs.getString(1) %></td> 
		<td><%=rs.getString(2) %></td> 
		<td><%=rs.getString(3) %></td> 
		<td><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
  <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z"/>
</svg><%=rs.getString(4) %></td> 
		<td><%=rs.getString(5) %></td> 
		<td><a href="editProduct.jsp?id=<%=rs.getString(1) %>">Edit</a></td> 
		</tr> 
		<% 
		} 
		} 
		catch(Exception e) 
		{ 
		System.out.println(e); 
		} 
		%> 
		</tbody> 
</table> 
<br> 
<br> 
<br> 
</body> 
</html>
<%@page errorPage="error.jsp" %> 
<!DOCTYPE html> 
<html> 
<head> 
<link rel="stylesheet" href="../css/adminheaderstyle.css">  

<script src='https://kit.fontawesome.com/a076d05399.js'> </script> 
</head> 
<!--Header--> 
<br> 
 <div class="topnav sticky"> 
 <% String email=session.getAttribute("email").toString(); 
 %> 
 <h2>Online shopping </h2>
 <a href="addNewProduct.jsp">Add New Product</a> 
 <a href="allProductEditProduct.jsp">All Products & Edit Products</a> 
 <a href="">Messages Received </a> 
 <a href="">Orders Received </a>  
 <a href="">Cancel Orders</a>  
 <a href="">Delivered Orders</a> 
 <a href="../logout.jsp">Logout</a> 
 </div> 
 <br> 
<!--table-->
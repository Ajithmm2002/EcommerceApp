<%@page import="org.hibernate.internal.build.AllowSysOut"%> 
<%@page import="com.jsp.conn.ConnectionProvider"%> 
<%@page import="java.sql.*" %> 
<%@ include file="adminHeader.jsp"%> 
<%@ include file="../footer.jsp" %> 
<html> 
<head> 
<link rel="stylesheet" href="../css/editproduct.css"> 
<title>Edit Product</title> 
<style> 
.back { 
    color: black; 
    margin-left: 2.5%;
} 
</style> 
</head> 
<body> 

<%  
try { 
    String id = request.getParameter("id"); 
    Connection con = ConnectionProvider.getCon(); 
    Statement stmt = con.createStatement(); 
    ResultSet rs = stmt.executeQuery("select * from product where id='" + id + "'"); 
    while(rs.next()) { 
%> 
<form action="editProductAction.jsp" method="post">  
    <input type="hidden" name="id" value="<%= rs.getString(1) %>"> 
    <div class="left-div"> 
        <h3>Enter Name</h3> 
        <input class="input-style" type="text" name="name" value="<%= rs.getString(2) %>" required="required"> 
        <hr> 
    </div> 

    <div class="right-div"> 
        <h3>Enter Category</h3> 
        <input class="input-style" type="text" name="category" value="<%= rs.getString(3) %>" required="required"> 
        <hr> 
    </div> 

    <div class="left-div"> 
        <h3>Enter Price</h3> 
        <input class="input-style" type="text" name="price" value="<%= rs.getString(4) %>" required="required"> 
        <hr> 
    </div> 

    <div class="right-div"> 
        <h3>Active</h3> 
        <select class="input-style" name="active"> 
            <option value="yes" <%= rs.getString(5).equals("yes") ? "selected" : "" %>>yes</option> 
            <option value="no" <%= rs.getString(5).equals("no") ? "selected" : "" %>>no</option> 
        </select> 
        <hr> 
    </div> 

    <button class="button">Save</button> 
    
  <h1><a id="b" href="allProductEditProduct.jsp">Back</a></h1>
</form> 
<%  
    }
} catch(Exception e) { 
    System.out.println(e); 
} 
%> 
</body> 
<br><br><br> 
</body> 
</html>
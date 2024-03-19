<%@ page import="com.jsp.conn.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ include file="header.jsp"%>
<%@ include file="footer.jsp"%>

<%
String emailid = session.getAttribute("email").toString();
String product_id = request.getParameter("id");
int quantity = 1;
int product_price = 0;
int product_total = 0;
int cart_total = 0;
int z = 0;
try {
	Connection con = ConnectionProvider.getCon();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from product where id='" + product_id + "'");
	while (rs.next()) {
		product_price = rs.getInt(4);
		product_total = product_price;
	}
	ResultSet rs1 = stmt.executeQuery(
	"select * from cart where product_id='" + product_id + "' and email='" + emailid + "' and address is NULL");
	while (rs1.next()) {
		cart_total = rs1.getInt(5);
		cart_total = cart_total + product_total;
		quantity = rs1.getInt(3);
		quantity = quantity + 1;
		z = 1;
	}
	if (z == 1) {
		stmt.executeUpdate("update cart set total='" + cart_total + "', quantity='" + quantity + "' where product_id='"
		+ product_id + "' and email='" + email + "'");
		response.sendRedirect("Home.jsp?msg=exist");
	}
	if (z == 0) {
		PreparedStatement stsmt = con.prepareStatement("insert into cart(email,product_id,quantity,price,total)values(?,?,?,?,?)");
		stsmt.setString(1, emailid);
		stsmt.setString(2, product_id);
		stsmt.setInt(3, quantity);
		stsmt.setInt(4, product_price);
		stsmt.setInt(5, product_total);
		stsmt.executeUpdate();
		response.sendRedirect("Home.jsp?msg=added");
	}
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("Home.jsp?msg=invalid");
}
%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page import="com.jsp.conn.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String email = request.getParameter("email");
String mobileNumber = request.getParameter("mobileNumber");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String newPassword = request.getParameter("newPassword");
int check = 0;

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    con = ConnectionProvider.getCon();
    

    pstmt = con.prepareStatement("SELECT * FROM users WHERE email=? AND mobileNumber=? AND securityQuestion=? AND answer=?");
    pstmt.setString(1, email);
    pstmt.setString(2, mobileNumber);
    pstmt.setString(3, securityQuestion);
    pstmt.setString(4, answer);
    
    rs = pstmt.executeQuery();
    
    while (rs.next()) {
        check = 1;
    
        pstmt = con.prepareStatement("UPDATE users SET password=? WHERE email=?");
        pstmt.setString(1, newPassword);
        pstmt.setString(2, email);
        pstmt.executeUpdate();
        
     
        response.sendRedirect("forgotPassword.jsp?msg=done");
    }
    
    if (check == 0) {
        
        response.sendRedirect("forgotPassword.jsp?msg=invalid");
    }
} catch (SQLException e) {

    e.printStackTrace();
    response.sendRedirect("forgotPassword.jsp?msg=error");
} finally {

    try {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (con != null) con.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*"%>
<%@ include file="dbConn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String u_book = request.getParameter("book_name");
	String sql = "UPDATE books set bor_name = null, borrow = 0 WHERE b_name = ?";

	PreparedStatement sm = conn.prepareStatement(sql);
	sm.setString(1, u_book);
	
	int count = sm.executeUpdate();
	if(count == 1){
		response.sendRedirect("returnSuccess.jsp");
	}else{
		response.sendRedirect("returnErr.jsp");
	}
	sm.close();
	conn.close();	
%>
</body>
</html>
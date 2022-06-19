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
	String u_name = (String)session.getAttribute("memberId");
	String b_name = request.getParameter("book_name");
	String sql = "UPDATE books SET borrow = 1, bor_name = ? where b_name = ?";
	PreparedStatement sm = conn.prepareStatement(sql);
	sm.setString(1, u_name);
	sm.setString(2, b_name);
	int count = sm.executeUpdate();
	
	if(count == 1){
		response.sendRedirect("borrowSuccess.jsp");
	}
	else{
		response.sendRedirect("borrowErr.jsp");
	}
%>
</body>
</html>
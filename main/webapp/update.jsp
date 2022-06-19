<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*"%>
<%@ include file="dbConn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 하기</title>
</head>
<body>
<%
	String sessionID = (String)session.getAttribute("memberId");
	String u_pw = request.getParameter("userPW");
	String u_name = request.getParameter("userNAME");
	String u_mail = request.getParameter("userMAIL");
	String u_book = request.getParameter("wantBOOK");
	
	String sql = "UPDATE member SET passwd = ?, name = ?, email = ?, hope_d = ? where id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, u_pw);
	pstmt.setString(2, u_name);
	pstmt.setString(3, u_mail);
	pstmt.setString(4, u_book);
	pstmt.setString(5, sessionID);
	int count = pstmt.executeUpdate();
	
	if(count == 1){
		response.sendRedirect("main.jsp");
	}else{
		response.sendRedirect("returnErr.jsp");
	}
pstmt.close();
conn.close();
%>
</body>
</html>
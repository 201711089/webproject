<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*" %>

<%@ include file = "dbConn.jsp" %>
<% 
	String u_id = request.getParameter("userID");
	String u_pw = request.getParameter("userPW");
	String u_name = request.getParameter("userNAME");
	String u_mail = request.getParameter("userMAIL");
	int member = 0;
	int n;
	String sql = "INSERT INTO member(id, passwd, email, name, manager) VALUES(?, ?, ?, ?, ?)";
	PreparedStatement preparedStatement = null;
	
	preparedStatement = conn.prepareStatement(sql);
	preparedStatement.setString(1, u_id);
	preparedStatement.setString(2, u_pw);
	preparedStatement.setString(3, u_mail);
	preparedStatement.setString(4, u_name);
	preparedStatement.setInt(5, member);
	
	n = preparedStatement.executeUpdate();
	
	if(n == 1){
		response.sendRedirect("signupSuccess.jsp");
	}else{
		out.println("회원가입 실패!");
		response.sendRedirect("signup.jsp");
	}
	conn.close();	
%>
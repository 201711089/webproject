<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> Members List </title>
</head>
<body>
	Home > 등록 회원 관리
	<hr>
	<% 
		String u_id = request.getParameter("userID");
		String u_pw = request.getParameter("userPW");
		String u_mail = request.getParameter("userMAIL");
		String u_name = request.getParameter("userNAME");
		Statement sm = conn.createStatement();
		ResultSet rs = sm.executeQuery("SELECT name, id, email, signuptime, manager FROM member");
		int sessionman = (int)session.getAttribute("man");
		if(sessionman == 1){
		int count = 1;
	%>
	<table border="1">
			<th>No.</th>
			<th>이름</th>
			<th>ID</th>
			<th>email</th>
			<th>관리자여부</th>
			<th>삭제</th>
		<% 
		while(rs.next()){
		%>
		<tr>
			<td><center><%= count %></center></td>
			<td><center><%= rs.getString("name") %></center></td>
			<td><center><%= rs.getString("id") %></center></td>
			<td><center><%= rs.getString("email") %></center></td>
			<td><center><%= rs.getInt("manager") %></center></td>
			<td><center><A href="drawCheck.jsp?userID=<%=rs.getString("id")%>">x</A></center>
			</td>
		</tr>
		<% 
			count++;
		}
		}
		else{
			%>
			올바른 접근이 아닙니다..
			<%
		}
		rs.close();
		sm.close();
		conn.close();	
	%>
	</table>
	<hr>
	<table border="0">
		<tr>
			<td>
				<form action="logout.jsp" method="post" >
					<input type="submit" value=" 로그 아웃 ▶" >
				</form>
			</td>
		</tr>
	</table>  		
</body>
</html>	
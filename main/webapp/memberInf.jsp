<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
</head>
<body>
	<%
	String sql = "SELECT * FROM member WHERE id = ? && passwd = ?";
	ResultSet rs = null;
	String sessionID = (String)session.getAttribute("memberId");
	String sessionPW = (String)session.getAttribute("memberPw");
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, sessionID);
	pstmt.setString(2, sessionPW);
	int n;
	rs = pstmt.executeQuery();
	
	while(rs.next()){
	%>
	<table border="1">
	<tr>
		<td><center> 이름 </center></td>
		<td><center><%= rs.getString("name") %></center></td>
	</tr>
	<tr>
		<td><center> ID </center></td>
		<td><center><%= rs.getString("id") %></center></td>
	</tr>
	<tr>
		<td><center> E-mail </center></td>
		<td><center><%= rs.getString("email") %></center></td>
	</tr>
	<tr>
		<td><center> 원하는 책 </center></td>
		<td><center> <%= rs.getString("hope_d") %></center></td>
	</tr>
	</table>
	<%
	}
	%>
	<table border="0">
		<tr>
			<td>
				<form action="infUpdate.jsp" method="post" >
					<input type="submit" value=" 수정하기 " >
				</form>
			</td>
			<td>
				<form action="membership.jsp" method="post" >
					<input type="submit" value=" 회원 메인화면 이동 " >
				</form>
			</td>
	</tr>
	</table>
</body>
</html>
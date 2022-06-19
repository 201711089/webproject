<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*"%>
<%@ include file="dbConn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빌린책 반납</title>
</head>
<body>
<%
	String u_name = (String)session.getAttribute("memberId");
	String sql = null;
	ResultSet rs = null;
	
	sql = "SELECT * FROM books WHERE bor_name = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, u_name);
	rs = pstmt.executeQuery();
	
	int count = 1;
	
%>	
	
	<table border="1">
		<tr>
			<th>No.</th>
			<th>책 이름</th>
			<th>저자</th>
			<th>출판사</th>
			<th>반납</th>
		</tr>
		<%
		if (rs.next() == true) {
			do {
				int man = rs.getInt("borrow");
		%>
		<tr>
			<td><%=count%></td>
			<td><%=rs.getString("b_name")%></td>
			<td><%=rs.getString("writer")%></td>
			<td><%=rs.getString("publisher")%></td>
			<%
			if (man == 1) {
				String link = "returnCheck.jsp?book_name=" + rs.getString("b_name");
			%>
			<td><a href=<%=link%>>반납</a></td>
			<%
			} else {
			%>
			<td>반납불가</td>
			<%
			}
			%>
		</tr>
		<%
		count++;
		} while (rs.next());
		}
		pstmt.close();
		conn.close();
		%>
	</table>
	<form action="membership.jsp" name="w_form" method="post" >
		<p>
		<input type="submit" value=" 회원 메인회면 이동 ▶" >
	</form> 
</body>
</html>
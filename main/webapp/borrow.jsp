<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*"%>
<%@ include file="dbConn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출 가능 책 목록</title>
</head>
<body>
	<%
	String field_ =(String)request.getParameter("f") ;
	String serch_ = (String)request.getParameter("serch");
	String sql = "select * from books";
	ResultSet rs = null;

	String field = null;
	if (field_ != null) {
		field = field_;
	}
	String serch = null;
	if (serch_ != null) {
		serch = "%" + serch_ + "%";
	}
	if (field == null) {
		sql = "SELECT * FROM books";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
	} else if (field.equals("b_name")){
		sql = "SELECT * FROM books WHERE b_name LIKE ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);	
		pstmt.setString(1, serch);
		rs = pstmt.executeQuery();
	} else if (field.equals("writer")){
		sql = "SELECT * FROM books WHERE writer LIKE ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);	
		pstmt.setString(1, serch);
		rs = pstmt.executeQuery();
	} else if(field.equals("publisher")){
		sql = "SELECT * FROM books WHERE publisher LIKE ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);	
		pstmt.setString(1, serch);
		rs = pstmt.executeQuery();
	}

	int count = 1;
	%>

	<table border="1">
		<tr>
			<th>No.</th>
			<th>책 이름</th>
			<th>저자</th>
			<th>출판사</th>
			<th>대출여부</th>
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
			if (man == 0) {
				String link = "borrowUpdate.jsp?book_name=" + rs.getString("b_name");
			%>
			<td><a href=<%=link%>>대출</a></td>
			<%
			} else {
			%>
			<td>대출불가</td>
			<%
			}
			%>
		</tr>
		<%
		count++;
		} while (rs.next());
		}
		%>
	</table>
	<div>
		<form action="borrow.jsp" method="post">
			<fieldset>
				<select id=	"f" name = "f">
					<option value="b_name">책 제목</option>
					<option value="writer">저자</option>
					<option value="publisher">출판사</option>
				</select>
				 <label>검색어</label> <input type="text" name="serch"> <input
					type="submit" value="검색">

			</fieldset>
		</form>
	</div>
		<form action="membership.jsp" name="w_form" method="post" >
		<p>
		<input type="submit" value=" 회원 메인회면 이동 ▶" >
	</form> 
	<%

	%>
</body>
</html>
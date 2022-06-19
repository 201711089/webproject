<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>  
     <%@ include file = "dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> 관리자 로그인 </title>
</head>
<body>
	Home > 관리자 로그인
	<hr>
	<%	

		String u_id = request.getParameter("uID");
		String u_pw = request.getParameter("uPW");
		String sql = "SELECT * FROM member WHERE id = ? && passwd = ?";
		ResultSet rs = null;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, u_id);
		pstmt.setString(2, u_pw);
		int n;
		rs = pstmt.executeQuery();
		

		if(rs.next())
		{
			int mana = rs.getInt(6);
			session.setAttribute("memberId", u_id);
			session.setAttribute("memberPw", u_pw);
			session.setAttribute("man", mana);
			out.println("새로운 세션 생성 성공 ! <br>");

		}
		else
		{
			out.println("오류");
		}
		String sessionId = (String)session.getAttribute("memberId");
		

		if(sessionId != null){
			int x = (int)session.getAttribute("man");
			if(x == 1){
			response.sendRedirect("membersList.jsp");
			}
			else{
				response.sendRedirect("membership.jsp");
			}
		}
		else{
			response.sendRedirect("loginErr.jsp");
		}

	%>
	<table border="0">
		<tr>
			<td>
				<form action="membersList.jsp" method="post" >
					<input type="submit" value=" ◀ 등록 회원 관리하기 " >
				</form>
			</td>
			<td>
				<form action="logout.jsp" method="post" >
					<input type="submit" value=" 로그 아웃 ▶" >
				</form>
			</td>
	</table>  		
</body>
</html>
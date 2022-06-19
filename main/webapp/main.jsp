<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> 메인 화면 </title>
</head>
<body>
	<center>
	도서 관리 프로그램<br>
	<img src="book.jpg" width="300" height="200">

	<p>
	<table border="0">
		<tr>
			<td>
				<form action="login.jsp" method="post" >
					<input type="submit" value=" ◀ 로그인 " >
				</form>
			</td>
			<td>	
				<form action="signup.jsp" method="post" >
					<input type="submit" value=" 회원가입 ▶" >
				</form>
			</td>
		</tr>	
	</table>	
	</center> 	
</body>
</html>
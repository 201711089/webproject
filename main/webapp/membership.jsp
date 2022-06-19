<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원 전용 공간 </title>
</head>
<body>
	Home > 회원 전용 공간
	<hr>
	반갑습니다.<br>
	여기는 회원 전용 공간입니다.<br>
	<center>
	<table border="0">
		<tr>
			<td>
				<form action="memberInf.jsp" method="post" >
					<input type="submit" value=" 내 정보 " >
				</form><br>
			</td>
		</tr>
		<tr>
			<td>	
				<form action="borrow.jsp" method="post" >
					<input type="submit" value=" 책 대출하기 " >
				</form><br>
			</td>
		</tr>
		<tr>
			<td>	
				<form action="return.jsp" method="post" >
					<input type="submit" value=" 책 반납하기 " >
				</form><br>
			</td>
		</tr>
		<tr>
			<td>
				<form action="logout.jsp" method="post" >
					<input type="submit" value=" 로그아웃 " >
				</form><br>
			</td>
		</tr>
		<tr>
			<td>	
				<form action="withdraw.jsp" method="post" >
					<input type="submit" value=" 회원 탈퇴하기 " >
				</form>
			</td>
		</tr>	
	</table>
	
	</center>	 	
</body>
</html>
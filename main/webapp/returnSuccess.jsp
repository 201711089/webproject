<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>반납 성공</title>
</head>
<body>
> 성공적으로 반납이 완료되었습니다.
<table>
		<tr>
			<td>
				<form action="membership.jsp" method="post" >
					<input type="submit" value=" ◀ 사용자 화면 " >
				</form>
			</td>
			<td>
				<form action="logout.jsp" method="post" >
					<input type="submit" value=" 로그 아웃 ▶" >
				</form>
			</td>
		</tr>
	</table>
</body>
</html>
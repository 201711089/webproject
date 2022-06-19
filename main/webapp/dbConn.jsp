<%@ page import = "java.sql.*" %>    
<%
	Connection conn = null;
	
	String url = "jdbc:mysql://localhost:3306/odbo?serverTimezone=UTC";
	String user = "root";
	String passwd = "1380";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, passwd);
%>    
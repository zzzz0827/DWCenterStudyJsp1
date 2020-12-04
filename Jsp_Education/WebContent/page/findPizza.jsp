<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<td>피자 이름</td>
		<td>피자 가격</td>
	</tr>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "sdh_19", "1234");
		if (conn != null) {
			out.println("Database Connected!");
		}
		else {
			out.println("Database Connect Fail!");
		}
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT PIZZA.PNAME, SUM(PIZZA.COST * SALELIST.AMOUNT " +
				  "FROM TBL_PIZZA_01 PIZZA, TBL_SALELIST_01 SALELIST " +
				  "WHERE PIZZA.PCODE = SALELIST.PCODE " +
				  "GROUP BY PIZZA.PCODE, PIZZA.PNAME");
		while (rs.next()) {
%>
		<tr>
			<td><%= rs.getString(1) %> </td>
			<td><%= rs.getInt(2) %> </td>
		</tr>
<%
		}
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>
</table>
</body>
</html>
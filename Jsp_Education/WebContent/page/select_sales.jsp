<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
</head>
<h3>SELECT</h3>
<body>
<table border="1">
	<tr>
		<td>피자 코드</td>
		<td>피자 이름</td>
		<td>가격</td>
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
		ResultSet rs = stmt.executeQuery("SELECT " +
			    "SHOP.SCODE, SHOP.SNAME, " +
			    "SUM(PIZZA.COST * SALELIST.AMOUNT)  AS TOTAL_COST " +
				"FROM " +
			    "TBL_SALELIST_01 SALELIST, " +
			    "TBL_SHOP_01 SHOP, " +
			    "TBL_PIZZA_01 PIZZA " +
				"WHERE " +
			    "SALELIST.SCODE = SHOP.SCODE " +
			    "AND SALELIST.PCODE = PIZZA.PCODE " +
				"GROUP BY " +
			    "SHOP.SCODE, SHOP.SNAME " +
				"ORDER BY TOTAL_COST DESC");
		while (rs.next()) {
%>
	<tr>
		<td><%= rs.getString(1) %> </td>
		<td><%= rs.getString(2) %> </td>
		<td><%= rs.getInt(3) %> </td>
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

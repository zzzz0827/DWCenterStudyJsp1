<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	
</head>
<h3 class="h3title">상품별 매출 현황</h3>
<body>
<table border="1">
	<tr>
		<td>상품명</td>
		<td>총 판매 금액</td>
		<td>판매 개수</td>
	</tr>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost:1521/xe", "pizza", "1234");

	
		String query = "SELECT PRODUCT.NAME, SUM(SALE.SALE_PRICE), SUM(SALE.AMOUNT) " +
				  "FROM PRODUCT, SALE " +
				  "WHERE PRODUCT.PRODUCT_ID = SALE.PRODUCT_ID " +
				  "GROUP BY product.PRODUCT_id, PRODUCT.NAME";
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		
		while (rs.next()) {
%>
	<tr>
		<td><%= rs.getString(1) %> </td>
		<td><%= rs.getInt(2) %> </td>
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
		String productName = request.getParameter("productName");
		String amount = request.getParameter("amount");
		String purchaseDate = request.getParameter("purchaseDate");
		
		try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
				("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "sdh_19", "1234");
		Statement stmt = conn.createStatement();
		
		String query = "INSERT INTO SALE VALUES (SALE_SEQ.NEXTVAL, '%d', '%s', '%d', '%d)";
		
		ResultSet rs = stmt.executeQuery(String.format(query, productName, amount, purchaseDate));
		while (rs.next()) {
			System.out.println("Today date : " + rs.getString(1) + " And " + rs.getInt(2));
		}
		stmt.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>
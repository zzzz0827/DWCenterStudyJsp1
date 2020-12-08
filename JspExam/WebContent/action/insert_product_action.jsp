<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
int productId = Integer.parseInt(request.getParameter("productId"));
int amount = Integer.parseInt(request.getParameter("amount"));
String purchaseDate = request.getParameter("purchaseDate");
	
// 쓰레기같은 이클립스 ㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗ

try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection
			("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "sdh_19", "1234");
	Statement stmt = conn.createStatement();
	
	String query = "SELECT PRICE FROM PRODUCT WHERE PRODUCT_ID = " + productId;
	ResultSet rs = stmt.executeQuery(query);
	rs.next();
	int price = rs.getInt(1);
	rs.close();
	
	String insert_query = "INSERT INTO SALE(SALE_ID, PRODUCT_ID, PURCHASE_DATE, SALE_PRICE, AMOUNT) " +
						  "VALUES(SALE_SEQ.NEXTVAL, %d, '%s', %d, %d)";
	
	stmt.executeQuery(String.format(insert_query, productId, purchaseDate, price * amount, amount));
	conn.commit();
	
	stmt.close();
	conn.close();
} catch (Exception e) {
	e.printStackTrace();
}

response.sendRedirect("../index.jsp?section=total_purchase_lookup");
%>
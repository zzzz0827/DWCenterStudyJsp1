<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String pizza_code = request.getParameter("pizza_code");
	String pizza_name = request.getParameter("pizza_name");
	int cost = Integer.parseInt(request.getParameter("cost"));
	
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
			("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "sdh_19", "1234");

		Statement stmt = conn.createStatement();
		
		String query = "INSERT INTO TBL_PIZZA_01(PCODE, PNAME, COST) VALUES('%s', '%s', '%d')";
		ResultSet rs = stmt.executeQuery(String.format(query, pizza_code, pizza_name, cost));

		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}



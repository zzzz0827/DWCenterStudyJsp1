<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
<title>이정훈</title>
<link rel="stylesheet" href="css/css.css">
</head>
<%
String section = request.getParameter("section") != null ? request.getParameter("section") : "";
%>
<body>
	<%@ include file="static/header.jsp" %>
	<%@ include file="static/nav.jsp" %>
	
	
	<%
		switch(section) {
		case "insert_product":
			%><%@include file="page/insert_product.jsp" %><%
			break;
		case "total_purchase_lookup":
			%><%@include file="page/total_purchase_lookup.jsp" %><%
			break;
		case "total_purchase_each_product":
			%><%@include file="page/total_purchase_each_product.jsp" %><%
			break;
		case "total_purchase_each_category":
			%><%@include file="page/total_purchase_each_category.jsp" %><%
			break;
		}
	%>
	
	<%@ include file="static/footer.jsp" %>
</body>
</html>
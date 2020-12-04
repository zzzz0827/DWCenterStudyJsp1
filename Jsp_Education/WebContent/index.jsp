<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
<title>이정훈</title>
<link rel="stylesheet" href="../css/css.css">
</head>
<%
String section = request.getParameter("section") != null ? request.getParameter("section") : "";
%>
<body>
	<%@ include file="static/header.jsp" %>
	<%@ include file="static/nav.jsp" %>
	<%@ include file="static/footer.jsp" %>
	
	<%
	switch(section){
	case "insert":
		%><%@include file="page/insert.jsp" %><%
		break;
	case "select":
		%><%@include file="page/select.jsp" %><%
		break;
	case "select_sales":
		%><%@include file="page/select_sales.jsp" %><%
		break;
	case "findPizza" :
		%><%@include file="page/findPizza.jsp" %><%
	default:
		%><%@include file="static/index.jsp" %><%
	}
	%>
</body>
</html>
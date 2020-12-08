<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%
String section = request.getParameter("section") != null ? request.getParameter("section") : "";
%>

<body>
	
	<a href="index.jsp?section=a">a</a>
	<a href="index.jsp?section=b">b</a>
	<a href="index.jsp?section=c">c</a>

<%
	switch(section) {
	case "a":
		%><%@include file="page/a.jsp" %><%
		break;
	case "b":
		%><%@include file="page/b.jsp" %><%
		break;
	case "c":
		%><%@include file="page/c.jsp" %><%
		break;
	default:
		%> <h3>Main</h3> <%
	}
%>

<table border="1">
<tr>
<% 
int[] array = {1, 2, 3, 11, 12, 13, 21, 22, 23, 31, 32, 33, 41, 42, 43};
int count = 0;
for(int number : array) {
	count += 1;
	%>
		<td><%= number %></td> <%
		if(count % 3 == 0) {
			%></tr><tr> <%
		}	
		%>
		
	<%
}	
%>
</tr>
</table>
</body>
</html>
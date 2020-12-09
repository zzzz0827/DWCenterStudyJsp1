<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<h3 class="h3title">판매 등록</h3>

<script>
	function reset_form() {
		document.input_form.reset()
	}
	
	function submit_form() {
		if(document.input_form.amount.value === "") {
			alert("수량을 입력해 주세요.")
			document.input_form.amount.focus()
			return
		}
		if(document.input_form.purchaseDate.value === "") {
			document.input_form.purchaseDate.focus()
			alert("날짜를 입력해 주세요.")
			return
		}
		
		alert("등록 완료.")
		document.input_form.submit()
	}
</script>

<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
			("jdbc:oracle:thin:@//localhost:1521/xe", "pizza", "1234");

		Statement stmt = conn.createStatement();
%>

<form action="action/insert_product_action.jsp" method="post" name="input_form">
	<table border="1">
		<tr>
			<td>판매한 상품</td>
			<td>
				<select name="productId">
					<%
						Statement stmt_product = conn.createStatement();
						ResultSet rs = stmt_product.executeQuery("SELECT PRODUCT_ID, name FROM PRODUCT");
						while (rs.next()) {
							%>
								<option value="<%=rs.getInt(1) %>"> <%=rs.getString(2) %></option>
							<%
						}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td>수량</td>
			<td><input type="number" name="amount"></td>
		</tr>
		<tr>
			<td>판매 날짜</td>
			<td><input type="date" name="purchaseDate"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="등록하기" onclick="submit_form()"/>
				<input type="button" value="다시쓰기" onclick="reset_form()"/>
			</td>
		</tr>
	</table>
</form>

<%
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>
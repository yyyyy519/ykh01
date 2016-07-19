<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#itemUpdateBtn').click(function(){
			if($('#itemUpdateName').val()=='') {
				$('#nameHelper').text('상품명을 입력하세요');
			} else if($('#itemUpdatePrice').val=='' || isNaN($('#itemUpdatePrice').val())){
				$('#priceHelper').text('상품가격을 숫자로 입력하세요');
			} else if($('itemUpdateRate').val()=='' || isNaN($('#itemUpdateRate').val())) {
				$('#rateHelper').text('할인율을 숫자로 입력하세요');
			} else {
				$('#itemUpdateForm').submit();
			}
		});
	});
</script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;	
		
	int itemNo = Integer.parseInt(request.getParameter("item_no"));
	System.out.println(itemNo);
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
	String dbUser = "root";
	String dbPass="java0000";
	
	Class.forName(driver);
	conn = DriverManager.getConnection(url,dbUser,dbPass);
	String sql = "SELECT item_no,item_name,item_price,item_rate from item where item_no=?";
	stmt = conn.prepareStatement(sql);
	stmt.setInt(1, itemNo);
	rs = stmt.executeQuery();

	if(rs.next()) {
		itemNo = rs.getInt("item_no");
		String itemName = rs.getString("item_name");
		int itemPrice = rs.getInt("item_price");
		int itemRate = rs.getInt("item_rate");
		System.out.println(itemNo+", "+itemName+", "+itemPrice+", "+itemRate);	
%>

<form id="itemUpdateForm" action="<%=request.getContextPath()%>/admin/item/itemUpdatePro.jsp" method="post">
<table>
	<tr>
		<td>상품번호</td>
		<td><input id="itemUpdateNo" name="itemUpdateNo" type="text" value="<%= itemNo %>" readonly="readonly"></td>
		<td></td>
	</tr>
	<tr>
		<td>상품명</td>
		<td><input id="itemUpdateName" name="itemUpdateName" value="<%= itemName %>" type="text"></td>
		<td><samp id="nameHelper"> </samp></td>
	</tr>
	<tr>
		<td>가격</td>
		<td><input id="itemUpdatePrice" name="itemUpdatePrice" value="<%= itemPrice %>" type="text" ></td>
		<td><samp id="priceHelper"> </samp></td>
	</tr>
	<tr>
		<td>할인율</td>
		<td><input id="itemUpdateRate" name="itemUpdateRate" value="<%= itemRate %>" type="text"></td>
		<td><samp id="rateHelper"> </samp></td>
	</tr>
	<tr>
		<td colspan="2">
			<input id="itemUpdateBtn" name="itemUpdateBtn" type="button" value="수정">
		</td>
	</tr>
<%
	}
%>
</table>
</form>
</body>
</html>
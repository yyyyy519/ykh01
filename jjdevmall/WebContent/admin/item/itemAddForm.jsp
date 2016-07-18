<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#itemAddBtn').click(function(){
			if($('#itemName').val()=='') {
				$('#nameHelper').text('상품명을 입력하세요.');
			}else if($('#itemPrice').val()=='') {
				$('#priceHelper').text('가격을 입력하세요');
			}else if(isNaN($('#itemPrice').val())) {
				$('#priceHelper').text('가격은 숫자로 입력하세요');
			}else if($('#itemRate').val()=='') {
				$('#rateHelper').text('할인율을 입력하세요');
			}else if(isNaN($('#itemRate').val())) {
				$('#rateHelper').text('할인율을 입력하세요');
			}else{
				$('#itemAddForm').submit();
			}
		});
	});
</script>
</head>
<body>
<form action="<%=request.getContextPath()%>/admin/item/itemAddAction.jsp" id="itemAddForm" method="post">
<h1>상품등록</h1>
<table>
	<tr>
		<td>상품명</td>
		<td><input type="text" id="itemName" name="itemName"></td>
		<td><samp id="nameHelper"></samp></td>
	</tr>
	<tr>
		<td>가격</td>
		<td><input type="text" id="itemPrice" name="itemPrice"></td>
		<td><samp id="priceHelper"></samp></td>
	</tr>
	<tr>
		<td>할인율</td>
		<td><input type="text" id="itemRate" name="itemRate"></td>
		<td><samp id="rateHelper"></samp></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" id="itemAddBtn" name="itemAddBtn" value="상품등록">
		</td>
	</tr>
</table>
</form>
</body>
</html>
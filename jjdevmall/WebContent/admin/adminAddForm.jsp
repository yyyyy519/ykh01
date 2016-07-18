<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#admAddBtn').click(function(){
			if($('#adminId').val()=='') {
				$('#idHelper').text('아이디를 입력하세요.');
			}else if($('#adminPw').val()=='') {
				$('#pwHelper').text('패스워드를 입력하세요.');
			}else if($('#adminLevel').val()=='') {
				$('#levelHelper').text('권한을 입력하세요.');
			}else if(isNaN($('#adminLevel').val())) {
				$('#levelHelper').text('숫자만 입력하세요.');
			}else{
				$('#adminAddForm').submit();
			}
		});
	});
</script>
</head>
<body>
<form id="adminAddForm" action="<%=request.getContextPath()%>/admin/adminAddAction.jsp" method="post">
<h1>직원등록</h1>
<table>
	<tr>
		<td>아이디 : </td>
		<td><input type="text" id="adminId" name="addinId"></td>
		<td><samp id="idHelper"></samp></td>
	</tr>
		<tr>
		<td>비밀번호 : </td>
		<td><input type="password" id="adminPw" name="adminPw"></td>
		<td><samp id="pwHelper"></samp></td>
	</tr>
		<tr>
		<td>권한 : </td>
		<td><input type="text" id="adminLevel" name="adminLevel"></td>
		<td><samp id="levelHelper"></samp></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" id="admAddBtn" value="직원등록">
		</td>
	</tr>
</table>
</form>
</body>
</html>
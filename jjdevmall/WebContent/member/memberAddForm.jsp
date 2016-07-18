<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#addBtn').click(function(){
			if($('#memberId').val()==''){
				$('#idHelper').text('아이디를 입력하세요.');
			}else if($('#memberPw').val()==''){
				$('#pwHelper').text('패스워드를 입력하세요.');
			}else if($('#memberName').val()==''){
				$('#nameHelper').text('이름을 입력하세요.');
			}else if(!isNaN($('#memberName').val())){
				$('#nameHelper').text('이름을 확인해주세요.');
			}else if($('.memberSex:checked').length == 0){
				$('#sexHelper').text('성별을 선택하세요.');
			}else if(isNaN($('#memberAge').val())){
				$('#ageHelper').text('나이는 숫자만 가능합니다.');
			}else if($('#memberAge').val()==''){
				$('#ageHelper').text('나이를 입력하세요.');
			}else{
				$('#addForm').submit();
			}
		});
	});
</script>
</head>
<body>
<form id="addForm" action="./memberAddAction.jsp" method="post">
<h1>회원가입</h1>
<table>
	<tr>
		<td>아이디 : </td>
		<td><input type="text" id="memberId" name="memberId"></td>
		<td><samp id="idHelper"></samp></td>
	</tr>
	<tr>
		<td>패스워드 : </td>
		<td><input type="password" id="memberPw" name="memberPw"> </td>
		<td><samp id="pwHelper"></samp></td>
	</tr>
	<tr>
		<td>이름 : </td>
		<td><input type="text" id="memberName" name="memberName"></td>
		<td><samp id="nameHelper"></samp></td>
	</tr>
	<tr>
		<td>성별 : </td>
		<td>
			<input type="radio" class="memberSex" name="memberSex" value="여자">여자
			<input type="radio" class="memberSex" name="memberSex" value="남자">남자
		</td>
		<td><samp id="sexHelper"></samp></td>
	</tr>
	<tr>
		<td>나이 : </td>
		<td><input type="text" id="memberAge" name="memberAge"></td>
		<td><samp id="ageHelper"></samp></td>
	</tr>
	<tr>
		<td colspan="2">
			<input id="addBtn" type="button" value="회원가입">
		</td>
	</tr>
</table>
</form>
</body>
</html>
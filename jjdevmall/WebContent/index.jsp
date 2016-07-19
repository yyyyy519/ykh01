<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#loginBtn').click(function(){
			if($('#loginId').val()=='') {
				$('#idHelper').text('아이디를 입력하세요');
			} else if($('#loginPw').val()=='') {
				$('#pwHelper').text('패스워드를 입력하세요.');
			} else {
				$('#loginForm').submit();
			}
		});
	});
</script>
</head>
<body>
<h1>index</h1>
<%
	String sessionMemberId = (String)session.getAttribute("sessionMemberId");
	if(sessionMemberId == null){
%>
		<form id="loginForm" action="<%= request.getContextPath() %>/member/loginAction.jsp">
		<table>
			<tr>
				<td>아이디 : </td>
				<td><input id="loginId" name="loginId" type="text"></td>
				<td><samp id=idHelper></samp></td>
			</tr>
			<tr>
				<td>패스워드 : </td>
				<td><input id="loginPw" name="loginPw" type="password"></td>
				<td><samp id=pwHelper></samp></td>
			</tr>
			<tr>
				<td colspan="2">
					<input id="loginBtn" type="button" value="로그인">
				</td>
			</tr>
		</table>
		</form>
<%
	} else {
%>
		<%= sessionMemberId %>님 반갑습니다.
		<a href=""> 회원정보 </a>
		<a href="<%= request.getContextPath() %>/admin/member/adminLogout.jsp">로그아웃</a>
<%
	}
%>
</body>
</html>
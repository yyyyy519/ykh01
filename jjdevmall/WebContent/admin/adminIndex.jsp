<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#adminLoginBtn').click(function(){
			if($('#adminLoginId').val()=='') {
				$('#idHelper').text('아이디를 입력하세요');
			} else if($('#adminLoginPw').val()=='') {
				$('#pwHelper').text('패스워드를 입력하세요.');
			} else {
				$('#adminLoginForm').submit();
			}
		});
	});
</script>
</head>
<body>
<h1>admin index</h1>
<%
	String sessionMemberId = (String)session.getAttribute("sessionMemberId");
	if(sessionMemberId == null){
%>
		<form id="adminLoginForm" action="<%= request.getContextPath() %>/admin/member/adminLoginAction.jsp">
		<table>
			<tr>
				<td>아이디 : </td>
				<td><input id="adminLoginId" name="adminLoginId" type="text"></td>
				<td><samp id=idHelper></samp></td>
			</tr>
			<tr>
				<td>패스워드 : </td>
				<td><input id="adminLoginPw" name="adminLoginPw" type="password"></td>
				<td><samp id=pwHelper></samp></td>
			</tr>
			<tr>
				<td colspan="2">
					<input id="adminLoginBtn" type="button" value="로그인">
				</td>
			</tr>
		</table>
		</form>
<%
	} else {
%>
		<ol>
			<li><a href="">상품관리</a>
			<li><a href="">주문관리</a>
			<li><a href="">회원관리</a>
			<li><a href="<%= request.getContextPath() %>/admin/member/adminLogout.jsp">로그아웃</a>
		</ol>
<%
	}
%>

</body>
</html>
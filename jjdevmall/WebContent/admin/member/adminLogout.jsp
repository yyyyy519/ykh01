<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	session.invalidate();	//세션삭제_로그아웃
	response.sendRedirect(request.getContextPath()+"/admin/member/adminIndex.jsp");	//로그아웃 후 admin/index.jsp로 이동
%>
</body>
</html>
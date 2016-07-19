<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int itemNo = Integer.parseInt(request.getParameter("itemNo"));
	String itemName = request.getParameter("itemName");
	int itemPrice = Integer.parseInt(request.getParameter("itemPrice"));
	int itemRate = Integer.parseInt(request.getParameter("itemRate"));
%>
</body>
</html>
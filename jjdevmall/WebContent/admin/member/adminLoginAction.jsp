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
	Connection connection = null;
	PreparedStatement statement = null;
	ResultSet resultSet = null;
	
	request.setCharacterEncoding("UTF-8");
	String loginId = request.getParameter("loginId");
	String loginPw = request.getParameter("loginPw");
	
	System.out.println(loginId + " / " + loginPw);
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
	String dbUser = "root";
	String dbPass="java0000";

	Class.forName(driver);
	connection = DriverManager.getConnection(url,dbUser,dbPass);
	
	String sql = "SELECT member_id,member_pw from member where member_id=? AND member_pw=?";
	statement = connection.prepareStatement(sql);
	statement.setString(1, loginId);
	statement.setString(2, loginPw);
	System.out.println(statement);
	resultSet = statement.executeQuery();
	
	
	try{
		if(resultSet.next()) {
			System.out.println("로그인 성공");
			System.out.println(resultSet.getString("member_id"));
			session.setAttribute("sessionMemberId", resultSet.getString("member_id"));	//세션에 아이디값 적용
			
		} else {
			System.out.println("로그인 실패");
		}
	} catch (Exception e) {
		
	} finally {
		
	}
	response.sendRedirect("/adminIndex.jsp");	//로그인성공,실패와 관련없이 index.jsp파일로 이동
	System.out.println("로그인 성공 인덱스페이지로 이동");
%>
</body>
</html>
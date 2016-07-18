<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	table, td { border: 1px solid #000000;
				border-collapse: collapse;
	}
</style>
</head>
<body>
<!-- 모든멤버출력<일단요거부터 / 멤버이름을 클릭하면 해당멤버의 (배송지)주소 추가할 수 있도록 -->
<%
	request.setCharacterEncoding("UTF-8");
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
	String dbUser = "root";
	String dbPass="java0000";
	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,dbUser,dbPass);
	
	String sql1 = "SELECT member_no,member_id,member_pw,member_name,member_sex,member_age from member";
	PreparedStatement stmt1 = conn.prepareStatement(sql1);
	ResultSet rs1 = stmt1.executeQuery();
%>
	<table>
		<tr>
			<td>NO.</td>
			<td>아이디</td>
			<td>패스워드</td>
			<td>이름</td>
			<td>성별</td>
			<td>나이</td>
		</tr>
<%
	while(rs1.next()) {
%>
		<tr>
			<td><%= rs1.getInt("member_no") %></td>
			<td><%= rs1.getString("member_id") %></td>
			<td><%= rs1.getString("member_pw") %></td>
			<td><%= rs1.getString("member_name") %></td>
			<td><%= rs1.getString("member_sex") %></td>
			<td><%= rs1.getInt("member_age") %></td>
		</tr>
<%
	}
%>
	</table>
</body>
</html>
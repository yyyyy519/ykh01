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
String memberId = request.getParameter("memberId");
String memberPw = request.getParameter("memberPw");
String memberName = request.getParameter("memberName");
String memberSex = request.getParameter("memberSex");
int memberAge = Integer.parseInt(request.getParameter("memberAge"));

System.out.println("memberId: "+memberId);
System.out.println("memberPw: "+memberPw);
System.out.println("memberName: "+memberName);
System.out.println("memberSex: "+memberSex);
System.out.println("memberAge: "+memberAge);

String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/jjdev?useUnicode=true&characterEncoding=euckr";
String dbUser = "root";
String dbPass="java0000";

Class.forName(driver);
Connection conn = DriverManager.getConnection(url,dbUser,dbPass);
String sql = "INSERT INTO member(member_id, member_pw, member_name, member_sex, member_age) VALUES(?, ?, ?, ?, ?)";
PreparedStatement stmt = conn.prepareStatement(sql);
stmt.setString(1,memberId);
stmt.setString(2,memberPw);
stmt.setString(3,memberName);
stmt.setString(4,memberSex);
stmt.setInt(5, memberAge);
stmt.executeUpdate();
%>
</body>
</html>
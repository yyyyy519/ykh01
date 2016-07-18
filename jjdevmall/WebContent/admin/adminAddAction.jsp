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
String addinId = request.getParameter("addinId");
String adminPw = request.getParameter("adminPw");
int adminLevel = Integer.parseInt(request.getParameter("adminLevel"));

System.out.println("addinId: "+addinId);
System.out.println("adminPw: "+adminPw);
System.out.println("adminLevel: "+adminLevel);

String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
String dbUser = "root";
String dbPass="java0000";

Class.forName(driver);
Connection conn = DriverManager.getConnection(url,dbUser,dbPass);
String sql = "INSERT INTO admin(admin_id,admin_pw,admin_level) VALUES (?,?,?)";
PreparedStatement stmt = conn.prepareStatement(sql);
stmt.setString(1, addinId);
stmt.setString(2, adminPw);
stmt.setInt(3, adminLevel);
System.out.println(sql);
stmt.executeUpdate();
%>
</body>
</html>
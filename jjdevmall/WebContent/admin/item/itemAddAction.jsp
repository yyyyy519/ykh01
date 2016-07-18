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
String itemName = request.getParameter("itemName");
int itemPrice = Integer.parseInt(request.getParameter("itemPrice"));
int itemRate = Integer.parseInt(request.getParameter("itemRate"));

System.out.println("itemName: "+itemName);
System.out.println("itemPrice: "+itemPrice);
System.out.println("itemRate: "+itemRate);

String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
String dbUser = "root";
String dbPass="java0000";

Class.forName(driver);
Connection conn = DriverManager.getConnection(url,dbUser,dbPass);

String sql1 = "INSERT INTO item(item_name,item_price,item_rate) VALUES(?,?,?)";
PreparedStatement stmt = conn.prepareStatement(sql1);
stmt.setString(1, itemName);
stmt.setInt(2, itemPrice);
stmt.setInt(3, itemRate);
stmt.executeUpdate();
%>
</body>
</html>
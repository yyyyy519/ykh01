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
String memberAdr = request.getParameter("memberAdr");

System.out.println("memberId: "+memberId);
System.out.println("memberPw: "+memberPw);
System.out.println("memberName: "+memberName);
System.out.println("memberSex: "+memberSex);
System.out.println("memberAge: "+memberAge);
System.out.println("memberAdr: "+memberAdr);

Connection conn = null;
ResultSet rs = null;
PreparedStatement stmt1 = null;
PreparedStatement stmt2 = null;

try{
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
	String dbUser = "root";
	String dbPass="java0000";

	Class.forName(driver);
	conn = DriverManager.getConnection(url,dbUser,dbPass);
	conn.setAutoCommit(false);
	String sql1 = "INSERT INTO member(member_id, member_pw, member_name, member_sex, member_age) VALUES(?, ?, ?, ?, ?)";
	stmt1 = conn.prepareStatement(sql1,Statement.RETURN_GENERATED_KEYS);
	stmt1.setString(1,memberId);
	stmt1.setString(2,memberPw);
	stmt1.setString(3,memberName);
	stmt1.setString(4,memberSex);
	stmt1.setInt(5, memberAge);
	System.out.println(sql1);
	stmt1.executeUpdate();
	rs = stmt1.getGeneratedKeys();
	int key = 0;
	if(rs.next()){
		key = rs.getInt(1);
	}
	System.out.println("key: "+key);
	int lastKey = 0;
	String sql2 = "INSERT INTO address(member_no, member_address) VALUES(?,?)";
		stmt2 = conn.prepareStatement(sql2);
		stmt2.setInt(1, lastKey);
		stmt2.setString(2, memberAdr);
		stmt2.executeUpdate();
	conn.commit();
}catch(Exception e) {
	conn.rollback();		//이전 상태로 되돌리기(바로 이전 커밋 후까지)
	e.printStackTrace();	//에러메시지 그대로 출력
}finally{
	rs.close();
	stmt1.close();
	stmt2.close();
	conn.close();
}
%>
</body>
</html>
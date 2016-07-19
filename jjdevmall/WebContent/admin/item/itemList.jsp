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
<%
	request.setCharacterEncoding("UTF-8");

	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
	String dbUser = "root";
	String dbPass="java0000";
	
	Class.forName(driver);
	conn = DriverManager.getConnection(url,dbUser,dbPass);
	
	System.out.println("conn:"+conn);
	if(conn !=null) {
		System.out.println("디비연결성공");
	}else{
		System.out.println("디비연결실패");
	}
	
	String sql = "SELECT item_no,item_name,item_price,item_rate from item";
	stmt = conn.prepareStatement(sql);
	rs = stmt.executeQuery();
%>
	<label>추가 : </label>

	<table>		<!-- 추가 삭제 수정 -->
		<tr>
			<td>No.</td>
			<td>상품명</td>
			<td>가격</td>
			<td>할인율</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
<%
	try{
		while(rs.next()) {
%>
		<tr>
			<td><%= rs.getInt("item_no") %></td>
			<td><%= rs.getString("item_name") %></td>
			<td><%= rs.getInt("item_price") %></td>
			<td><%= rs.getInt("item_rate") %></td>
			<td><a href="<%= request.getContextPath() %>/admin/item/itemUpdateForm.jsp?item_no=<%= rs.getInt("item_no") %>">수정</a></td>
			<td><a href="">삭제</a></td>
		</tr>
<%
		}
	}catch(SQLException ex) {
        out.println(ex.getMessage());
        ex.printStackTrace();
	} finally {
		  if (rs != null) try { rs.close(); } catch(SQLException ex) {}
          if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
          if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
%>
</table>
</body>
</html>
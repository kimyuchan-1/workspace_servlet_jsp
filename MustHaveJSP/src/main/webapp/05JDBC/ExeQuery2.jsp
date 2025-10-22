<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="common.JDBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
<style>
		table {
			border: 1px solid;
			border-collapse: collapse;
		}
		td, tr, th {
			border: 1px solid;
			padding: 4px 10px;
		}
		th {
			text-align: center;
			background-color: lightgray;
		}
	</style>
</head>
<body>
	<h2>회원 목록 조회 테스트(executeQuery() 사용)</h2>
	<table>
		<tr>
			<th>id</th>
			<th>pwd</th>
			<th>name</th>
			<th>regidate</th>
		</tr>
		

	<%
	JDBConnect jdbc = new JDBConnect();
	
	String sql = "select id, pass, name, regidate from member";
	jdbc.stmt = jdbc.con.createStatement();
	
	jdbc.rs = jdbc.stmt.executeQuery(sql);
	
	while (jdbc.rs.next()) {
		String id = jdbc.rs.getString(1);
		String pw = jdbc.rs.getString(2);
		String name = jdbc.rs.getString("name");
		java.sql.Date regidate = jdbc.rs.getDate("regidate");
	%>	
		<tr>
			<td><%=id %></td>
			<td><%=pw %></td>
			<td><%=name %></td>
			<td><%=regidate %></td>
		</tr>
	
	<%
	}
	
	jdbc.close();
	 %>
	 </table>
</body>
</html>
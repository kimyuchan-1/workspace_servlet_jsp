<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB Mission 04</title>
<style type="text/css">
	#body-align {
		width: 50%;
		margin: 0 auto;
		text-align: left;
	}

	table {
		border: 1px solid;
		border-collapse: collapse;
	}
	
	th, td, tr {
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
	<table>
		<tr>
			<th>대륙</th>
			<th>국가명</th>
		</tr>
		<%
		Connection con = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/world";
			String id="musthave";
			String pwd="tiger";
			con = DriverManager.getConnection(url,id,pwd);
			
			String continent = request.getParameter("continent") == null ? "Asia" : request.getParameter("continent"); 
			String sql = "select continent, name from country where continent like ?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1,continent);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				String ctnt = rs.getString(1);
				String ctry = rs.getString(2);
		%>
			<tr>
				<td><%=ctnt %></td>
				<td><%=ctry %></td>
			</tr>
		<%
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (psmt != null) {
					psmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		%>
	</table>
</body>
</html>
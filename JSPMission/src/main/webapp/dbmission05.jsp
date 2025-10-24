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
<title>DB Mission 05</title>
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
			<th>국가</th>
			<th>면적</th>
		</tr>
		<%
		Connection con = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/world";
			String id = "musthave";
			String pwd = "tiger";
			con = DriverManager.getConnection(url, id, pwd);
			
			Double area = request.getParameter("area") == null ? 10002 : Double.parseDouble(request.getParameter("area"));
			String sql = "select name, surfacearea from country where surfacearea < ? order by surfacearea desc";
			psmt = con.prepareStatement(sql);
			psmt.setDouble(1, area);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				String ctry = rs.getString(1);
				Double surfaceArea = rs.getDouble(2);
			%>
				<tr>
					<td><%=ctry %></td>
					<td><%=surfaceArea %></td>
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
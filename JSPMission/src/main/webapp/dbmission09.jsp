<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB Mission 09</title>
</head>
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
<body>
	<table>
		<tr>
			<th>국가 코드</th>
			<th>언어</th>
			<th>비율</th>
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
			
			Double rate = request.getParameter("rate") == null ? 50.0 : Double.parseDouble(request.getParameter("rate"));
			String sql = "select countrycode, language, Percentage from countrylanguage where Percentage >= ? order by percentage";
			psmt = con.prepareStatement(sql);
			psmt.setDouble(1, rate);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				String code = rs.getString(1);
				String lang = rs.getString(2);
				double langRate = rs.getDouble(3);
				%>
					<tr>
						<td><%= code %></td>
						<td><%= lang %></td>
						<td><%= langRate %></td>
					</tr>
				<%
			}
			
			
		} catch(Exception e) {
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
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		%>
		
	</table>
</body>
</html>
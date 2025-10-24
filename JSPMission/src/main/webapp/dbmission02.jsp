<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB Mission 02</title>
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
			<th>국가코드</th>
			<th>도시</th>
			<th>인구 수</th>
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
		
		String code = request.getParameter("code")== null ? "KOR" : request.getParameter("code");
		String sql = "select CountryCode, Name, Population from city where countrycode like ?";
		
		psmt = con.prepareStatement(sql);
		psmt.setString(1, code);
		rs = psmt.executeQuery();
		
		while (rs.next()) {
			String countryCode = rs.getString(1);
			String city = rs.getString(2);
			int population = rs.getInt(3);
			%>
			<tr>
				<td><%=countryCode %></td>
				<td><%=city %></td>
				<td><%=population %></td>
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
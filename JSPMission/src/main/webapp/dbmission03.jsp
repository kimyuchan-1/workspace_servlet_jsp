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
<title>DB Mission 03</title>
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
			<th>도시</th>
			<th>인구수</th>
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
		
		String ctry = request.getParameter("ctry") == null ? "korea" : request.getParameter("ctry");
		String sql = "select c1.name, c2.name, c2.population from country c1, city c2 where c1.name like ? and c1.code = c2.countrycode";
		
		psmt = con.prepareStatement(sql);
		psmt.setString(1, "%"+ctry+"%");
		rs = psmt.executeQuery();		
		
		while (rs.next()){
			String country = rs.getString(1);
			String city = rs.getString(2);
			int population = rs.getInt(3);
		%>
			<tr>
				<td><%=country %></td>
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
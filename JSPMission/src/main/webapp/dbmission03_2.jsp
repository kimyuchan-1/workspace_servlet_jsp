<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "common.JDBConnect" %>
<%@ page import = "common.MyUtil" %>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB Mission 03_2</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body id = "body-align">
<%
	String ctry = request.getParameter("ctry") == null ? "kor" : request.getParameter("ctry");
	JDBConnect jdbc = new JDBConnect();
	
	String sql = "select c1.name, c2.name, c2.population from country c1, city c2 where c1.name like ? and c1.code = c2.countrycode";
	jdbc.psmt = jdbc.con.prepareStatement(sql);
	jdbc.psmt.setString(1, "%"+ctry+"%");
	jdbc.rs = jdbc.psmt.executeQuery();
	
	MyUtil.writeSQL(out, jdbc.psmt);
	
	MyUtil.writeTableFromResultSet(out, jdbc.rs);

%>
</body>
</html>
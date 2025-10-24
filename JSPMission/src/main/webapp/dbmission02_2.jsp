<%@page import="common.JDBConnect"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="common.MyUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB Mission 02_2</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body id = "body-align">
<%
	String code = request.getParameter("code") == null ? "kor" : request.getParameter("code");
	JDBConnect jdbc = new JDBConnect();
	try {
		String sql = "select countrycode, name, population from city where countrycode like ?";
		jdbc.psmt = jdbc.con.prepareStatement(sql);
		
		jdbc.psmt.setString(1, "%"+ code+"%");
		
		MyUtil.writeSQL(out, jdbc.psmt);
		
		jdbc.rs = jdbc.psmt.executeQuery();

		MyUtil.writeTableFromResultSet(out, jdbc.rs);
	}
	catch(Exception e) {
		out.println("Error:" + e.getMessage());
	}
	finally {
		jdbc.close();
	}
%>	
</body>
</html>
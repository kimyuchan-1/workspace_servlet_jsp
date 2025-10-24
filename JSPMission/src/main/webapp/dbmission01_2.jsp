<%@page import="common.JDBConnect"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="common.MyUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB Mission 01_2</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<div id="body-align">
<%
	//요청 URL에서 파라미터 "name"의 값을 읽어온다.
	int population = request.getParameter("population") == null ? 1000000 : Integer.parseInt(request.getParameter("population"));
	
	// 데이터베이스 연결 객체 생성
	JDBConnect jdbc = new JDBConnect();
	try {
		// 질의 객체 생성
		String sql = "select name, population from city where population > ?";
		jdbc.psmt = jdbc.con.prepareStatement(sql);
		
		// 질의 객체 파라미터 설정
		jdbc.psmt.setInt(1, population);
		
		// 요청 URL을 실행하기 위한 SQL문을 출력한다.(Optional)
		MyUtil.writeSQL(out, jdbc.psmt);
		
		// 질의 실행
		jdbc.rs = jdbc.psmt.executeQuery();

		// 질의 결과 출력
		MyUtil.writeTableFromResultSet(out, jdbc.rs);
	}
	catch(Exception e) {
		// 예외 발생 시 메시지 출력
		out.println("Error:" + e.getMessage());
	}
	finally {
		// 리소스 해제 및 연결 종료
		jdbc.close();
	}
%>
</div>
</body>
</html>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd");

long currentTime = System.currentTimeMillis();
String currentTimeStr = dateFormat.format(new Date(currentTime));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - UseBean</title>
</head>
<body>
	<h2>액션 태그로 폼값 한 번에 받기</h2>
	<form method = "post" action ="UseBeanAction1.jsp">
		아이디 : <input type = "text" name = "id" /><br />
		패스워드 : <input type = "text" name = "pass" /><br />
		이름 : <input type = "text" name = "name" /><br />
		등록일 : <input type = "text" name = "regidate" value = <%= currentTimeStr%> readonly/><br />
		<input type = "submit" value = "폼값 전송"/>
	</form>
</body>
</html>
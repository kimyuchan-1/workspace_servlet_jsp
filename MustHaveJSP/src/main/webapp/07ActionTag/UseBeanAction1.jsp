<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - UseBean</title>
</head>
<body>
	<h3>액션 태그로 폼값 한 번에 받기</h3>
	<jsp:useBean id = "dto" class = "membership.MemberDTO" />
	<jsp:setProperty property = "*" name = "dto" />
	<ul>
		<li>아이디 : <jsp:getProperty name = "dto" property = "id" /></li>
		<li>패스워드 : <jsp:getProperty name = "dto" property = "pass" /></li>
		<li>이름 : <jsp:getProperty name = "dto" property = "name" /></li>
		<li>등록일 : <jsp:getProperty name = "dto" property = "regidate" /></li>
	</ul>
</body>
</html>
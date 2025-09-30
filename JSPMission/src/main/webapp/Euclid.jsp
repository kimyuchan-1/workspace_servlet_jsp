<%@ page import ="utils.CookieManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
int x = Integer.parseInt(CookieManager.readCookie(request, "x"));
int y = Integer.parseInt(CookieManager.readCookie(request, "y"));
int gcd = 0;
int lcm = 0;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Euclid</title>
<style>
	#sub {
	background-color : lightgray;
	border : 1px solid black;
	width : 100%;
	}
	table {
	padding : 5px;
	margin: 5px;
	border : 1px solid gray;
	}
</style>
</head>
<body>
	<form action = "Calculate.jsp" method = "get">
	<table>
		<tr><td>숫자1 : </td><td><input type = "text" placeholder ="숫자를 입력해주세요." name ="x" value ="<%=x%>"/></td></tr>
		<tr><td>숫자2 : </td><td><input type = "text" placeholder ="숫자를 입력해주세요." name ="y" value ="<%=y%>"/></td></tr>
		<tr><td>최대공약수 : </td><td><input type = "text" value ="<%=gcd %>>" name ="gcd" readonly/></td></tr>
		<tr><td>최소공배수 : </td><td><input type = "text" value ="<%=lcm %>" name ="lcm" readonly/></td></tr>
		<tr><td colspan = "2"><input type = "submit" value = "실행" id = "sub"/></td></tr>
	</table>
	</form>
</body>
</html>
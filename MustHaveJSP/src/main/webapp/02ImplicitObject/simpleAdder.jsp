<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
int num1 = 0;
int num2 = 0;
String s1 = request.getParameter("num1");
String s2 = request.getParameter("num2");
if (s1 != null && s2 != null) {
	num1 = Integer.parseInt(s1);
	num2 = Integer.parseInt(s2);
}
int sum = num1 + num2;
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>간단한 계산기</title>
</head>
<body>
	<form method = "post"> <!-- form 안에 파라미터가 아무것도 없다면 자기자신이 호출됨  -->
		num1 : <input type = "text" name = "num1" value = "<%= num1 %>" /><br />
		num2 : <input type = "text" name = "num2" value = "<%= num2 %>" /><br />
		sum : <input type = "text" name = "sum" value = "<%= sum %>" readonly/><br />
		<input type = "submit" value = "계산" />
	</form>
</body>
</html>
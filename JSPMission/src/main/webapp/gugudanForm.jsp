<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gugudan Form</title>
</head>
<body>
	<form method="get" action ="gugudanProc.jsp">
		<input type="radio" name = "type" value = "1"/>Type1 : 세로<br/>
		<input type="radio" name = "type" value = "2"/>Type2 : 가로<br/>
		<input type="radio" name = "type" value = "3"/>Type3 : 하나만 출력<br/>
		<input type="radio" name = "type" value = "4"/>Type4 : 여러개씩 묶어서 출력<br/>
		<input type="text" name = "val" value = ""/>단수/열수<br/>
		<input type="submit" value = "선택"/>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gugudan3</title>
</head>
<body>
<%
try {
	int val = Integer.parseInt(request.getParameter("val"));
	if (val >= 2 && val <= 9) {
		out.println("<table>");
		out.println("<tr><h2>"+val + "단</h2></tb>");
		for (int i = 1; i < 10; i++) {
			out.println("<tb>"+val + " x " + i + " = "+ val * i + "</tb>"+"</br>");
		}
		out.println("</table>");
	} else {
		throw new Exception();
	}
} catch(Exception e) {
	int val = 2;
	out.println("<table>");
	out.println("<tr><h2>"+val + "단</h2></tb>");
	for (int i = 1; i < 10; i++) {
		out.println("<tb>"+val + " x " + i + " = "+ val * i + "</tb>"+"</br>");
	}
	out.println("</table>");
}
%>
</body>
</html>
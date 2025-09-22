<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan</title>
</head>
<body>
<%
for (int i = 2; i < 10; i++) {
	out.println("<h2>"+i+"단"+"</h2>");
	for (int j = 1; j < 10; j++) {
		out.println(i+" x "+j+" = "+i*j+"</br>");
	}
	out.println();
}
%>

<% for (int i = 2; i < 10; i++) { %>
	<h2><%= i%>단</h2>
<%	 	for (int j = 1; j < 10; j++) { %>
			<p><%= i%> x <%= j %> = <%= i*j%></p>	
<%		} %>
<%} %>


</body>
</html>
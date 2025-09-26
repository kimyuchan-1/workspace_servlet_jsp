<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gugudan2</title>
	<style>
		table {
			border: 1px solid;
			border-collapse: collapse;
		}
		td, tr {
			border: 1px solid;
			padding: 4px 10px;
		}
		.title {
			text-align: center;
			background-color: lightgray;
		}
	</style>
</head>
<body>
	<table>
	<%
		for (int i = 0; i < 10; i++) {
			out.print("<tr>");
			for (int j = 2; j < 10; j++) {
				if (i == 0) {
					out.print("<td class = \'title\'>"+j+"단</td>");
				} else {
					out.print("<td>"+j+" x "+i+" = "+j*i+"</td>");
				}
			}
			out.print("</tr>");
		}
	%>
	</table>
</body>
</html>
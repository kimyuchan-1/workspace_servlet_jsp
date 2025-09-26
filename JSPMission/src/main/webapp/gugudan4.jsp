<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>gugudan4</title>
	<style type="text/css">
		td {
		padding: 5px;
		}
	</style>
</head>
<body>
	<table>
	<%
	try {
		int val = Integer.parseInt(request.getParameter("val"));
		if (val >= 1 && val <= 8) {
			int startNum = 2;
			int finishNum = 2 + val;
			while (finishNum <= 10) {
				for (int i = 0; i < 10; i++) {
					out.print("<tr>");
					for (int j = startNum; j < finishNum; j++) {
						if (i == 0) {
							out.print("<td><h2>"+j+"단</h2></td>&emsp;");
						} else {
							out.print("<td>"+j+" x "+i+" = "+j*i+"</td>&emsp;");
						}
					}
					out.println("</tr>");
				} 
				
				startNum = startNum + val;
				finishNum = (finishNum+val >= 10) ? 10 : finishNum+val;

			}
		} else {
			throw new Exception();
		}
	} catch(Exception e) {
		
		int val = 3;
		int startNum = 2;
		int finishNum = 2 + val;

		while (finishNum <= 10) {
			for (int i = 0; i < 10; i++) {
				out.print("<tr>");
				for (int j = startNum; j < finishNum; j++) {
					if (i == 0) {
						out.print("<td><h2>"+j+"단</h2></td>&emsp;");
					} else {
						out.print("<td>"+j+" x "+i+" = "+j*i+"</td>&emsp;");
					}
				}
				out.println("</tr>");
			}
			startNum = startNum + val;
			finishNum = (finishNum+val >= 10) ? 10 : finishNum+val;
	
		}
	}
	%>
	</table>
</body>
</html>
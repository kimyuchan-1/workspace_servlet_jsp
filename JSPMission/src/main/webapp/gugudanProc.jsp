<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gugudan Proc</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	int type = Integer.parseInt(request.getParameter("type"));
	int val = Integer.parseInt(request.getParameter("val") == "" ? "0" : request.getParameter("val") );
	
	if (type == 1) {
		request.getRequestDispatcher("gugudan1.jsp").forward(request,response);
	} else if (type == 2) {
		request.getRequestDispatcher("gugudan2.jsp").forward(request,response);
	} else if (type == 3) {
		request.getRequestDispatcher("gugudan3.jsp?val="+val).forward(request,response);
	} else {
		request.getRequestDispatcher("gugudan4.jsp?val="+val).forward(request,response);
	}
	
	%>
</body>
</html>
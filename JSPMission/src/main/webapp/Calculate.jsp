<%@ page import ="utils.CookieManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
public int GCD(int x, int y) {
	
	while (y != 0) {
		int temp = y;
		y = x % y;
		x = temp;
	}
	return x;
}

public int LCM(int x, int y) {
	int lcm = (x * y) / GCD(x, y);
	return lcm;
}
 %>    

<%
	int x = Integer.parseInt(request.getParameter("x"));
	int y = Integer.parseInt(request.getParameter("y"));
	int gcd = GCD(x,y);
	int lcm = LCM(x,y);
	
	CookieManager.makeCookie(response, "x", x, 86400);
	CookieManager.makeCookie(response, "y", y, 86400);
	
	request.getRequestDispatcher("Euclid.jsp?gcd="+gcd+"&lcm="+lcm).forward(request,response);
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
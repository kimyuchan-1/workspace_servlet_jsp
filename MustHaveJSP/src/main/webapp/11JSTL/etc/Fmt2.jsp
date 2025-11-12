<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="jakarta.tags.core " %>
<%@ taglib prefix ="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - fmt 2</title>
</head>
<body>
	<c:set var = "today" value="<%= new java.util.Date() %>" />
	<h4>날짜 포맷</h4>
	<fmt:setLocale value="ko_kr"/>
	full : <fmt:formatDate value="${ today }" type = "date" dateStyle="full"/><br />
	short : <fmt:formatDate value="${ today }" type = "date" dateStyle="short"/><br />
	long : <fmt:formatDate value="${ today }" type = "date" dateStyle="long"/><br />
	medium : <fmt:formatDate value="${ today }" type = "date" dateStyle="medium"/><br />
	default : <fmt:formatDate value="${ today }" type = "date" dateStyle="default"/>
	
	<h4>시간 포맷</h4>
	full : <fmt:formatDate value = "${ today }" type="time" timeStyle="full" /><br />
	short : <fmt:formatDate value = "${ today }" type="time" timeStyle="short" /><br />
	long : <fmt:formatDate value = "${ today }" type="time" timeStyle="long" /><br />
	medium : <fmt:formatDate value = "${ today }" type="time" timeStyle="medium" /><br />
	default : <fmt:formatDate value = "${ today }" type="time" timeStyle="default" />
</body>
</html>
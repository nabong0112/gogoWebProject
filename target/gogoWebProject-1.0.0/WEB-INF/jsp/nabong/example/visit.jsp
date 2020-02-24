<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:out value="${today.getTodayCount }"></c:out>
	<br>?
	<c:out value="${total.getTotalCount }"></c:out>
	<br>
	<c:forEach var="get" items="${get}" varStatus="i">
		${get.visitDate}<br>
		${get.visitId }
	</c:forEach>
</body>
</html>
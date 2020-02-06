<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>        
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="lodgingList" items="${lodgingList}" varStatus="i">
	<fieldset>
		<a href="lodgingItem.do?lodgingSeq=${lodgingList.lodgingSeq}">${lodgingList.name}</a> <br>
		${lodgingList.contents1} <br>
	</fieldset>	
	</c:forEach>
	<div>
		<a href="lodgingList.do?numOfRows=6&pageNo=1">1</a>
		<a href="lodgingList.do?numOfRows=6&pageNo=2">2</a>
	</div>
</body>
</html>
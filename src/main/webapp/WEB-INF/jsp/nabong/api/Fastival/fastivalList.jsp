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
<c:forEach var="fastivalList" items="${fastivalList}" varStatus="i">
	<fieldset>
		<a href="fastivalItem.do?ntatcSeq=${fastivalList.ntatcSeq}">${fastivalList.title}</a> <br>
		${fastivalList.homepageUrl} <br>
	</fieldset>	
	</c:forEach>
	<div>
		<a href="fastivalList.do?numOfRows=6&pageNo=1">1</a>
		<a href="fastivalList.do?numOfRows=6&pageNo=2">2</a>
	</div>
</body>
</html>
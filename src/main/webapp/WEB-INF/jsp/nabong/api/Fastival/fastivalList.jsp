<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="/css/egovframework/tourHompageHeader.css">
<title>페스티벌 목록</title>
</head>
<body>
<p>총 페이지 : ${paging.totalPage}</p>
<c:forEach var="fastivalList" items="${fastivalList}" varStatus="i">
	<fieldset>
		<a href="fastivalItem.do?ntatcSeq=${fastivalList.ntatcSeq}">${fastivalList.title}</a> <br>
		${fastivalList.homepageUrl} <br>
	</fieldset>	
	</c:forEach>
	<div class="paging" align="center">
		<c:if test="${1 != paging.pageNo}">
			<a href="fastivalList.do?pageNo=${1}" style="text-decoration: none;">
				<img alt="처음으로" src="/images/egovframework/button/first.png"
				width="100px" height="50px">
			</a>
			<a href="fastivalList.do?pageNo=${paging.pageNo - 1}"
				style="text-decoration: none;"> <img alt="이전"
				src="/images/egovframework/button/pre.png" width="100px"
				height="50px">
			</a>
		</c:if>
		<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
				<a href="fastivalList.do?pageNo=${i}" style="text-decoration: none;">
					<img alt="번호" src="/images/egovframework/number/no${i}.png"
					width="50px" height="50px">
				</a>
		</c:forEach>
		<c:if test="${paging.pageNo < paging.totalPage}">
			<a href="fastivalList.do?pageNo=${pageNo + 1}"
				style="text-decoration: none;"> <img alt="다음"
				src="/images/egovframework/button/next.png" width="100px"
				height="50px">
			</a>
		</c:if>
		<c:if test="${paging.pageNo != paging.totalPage}">
			<a href="fastivalList.do?pageNo=${paging.totalPage}"
				style="text-decoration: none;"> <img alt="끝으로"
				src="/images/egovframework/button/end.png" width="100px"
				height="50px">
			</a>
		</c:if>
	</div>
</body>
</html>
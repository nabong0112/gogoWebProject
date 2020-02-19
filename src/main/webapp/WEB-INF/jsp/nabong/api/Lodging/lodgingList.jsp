<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>        
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="/css/egovframework/tourHompageHeader.css">
<title>숙박업소 목록</title>
</head>
<body>
<p>총 페이지 : ${paging.totalPage}</p>
<c:forEach var="lodgingList" items="${lodgingList}" varStatus="i">
	<fieldset>
		<a href="lodgingItem.do?lodgingSeq=${lodgingList.lodgingSeq}">${lodgingList.name}</a> <br>
		${lodgingList.contents1} <br>
	</fieldset>	
	</c:forEach>
	<div class="paging" align="center">
		<c:if test="${1 != paging.pageNo}">
			<a href="lodgingList.do?pageNo=${1}" style="text-decoration: none;">
				<img alt="처음으로" src="/images/egovframework/button/first.png"
				width="100px" height="50px">
			</a>
		</c:if>
		<c:if test="${1 != paging.pageNo}">
			<a href="lodgingList.do?pageNo=${paging.pageNo - 1}"
				style="text-decoration: none;"> <img alt="이전"
				src="/images/egovframework/button/pre.png" width="100px"
				height="50px">
			</a>
		</c:if>
		<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
				<a href="lodgingList.do?pageNo=${i}" style="text-decoration: none;">
					<%-- <img alt="번호" src="/images/egovframework/number/no${i}.png"
					width="50px" height="50px"> --%>${i}
				</a>
		</c:forEach>
		<c:if test="${paging.pageNo < paging.totalPage}">
			<a href="lodgingList.do?pageNo=${pageNo + 1}"
				style="text-decoration: none;"> <img alt="다음"
				src="/images/egovframework/button/next.png" width="100px"
				height="50px">
			</a>
		</c:if>
		<c:if test="${paging.pageNo != paging.totalPage}">
			<a href="lodgingList.do?pageNo=${paging.totalPage}"
				style="text-decoration: none;"> <img alt="끝으로"
				src="/images/egovframework/button/end.png" width="100px"
				height="50px">
			</a>
		</c:if>
	</div>
</body>
</html>
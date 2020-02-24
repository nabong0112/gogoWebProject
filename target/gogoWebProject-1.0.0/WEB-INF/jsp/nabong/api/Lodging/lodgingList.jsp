<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>        
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="/css/egovframework/tourHompageHeader.css">
<link type="text/css" rel="stylesheet" href="/css/egovframework/table.css">
<title>숙박업소 목록</title>
</head>
<body>
<div class="count" align="center">
		<div class="alignLeft">총 페이지 : ${paging.totalPage}</div>
		<div class="alignCenter">총 갯수 : ${paging.totalCount}</div>
		<div class="alignRight">현재페이지 : ${paging.pageNo}</div>
	</div>
<div align="center">
<table class="type2">
			<thead>
				<tr>
					<th>이름</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="lodgingList" items="${lodgingList}" varStatus="i">
					<c:choose>
						<c:when test="${lodgingList != null}">
							<tr>
								<td>
								<a href="lodgingItem.do?lodgingSeq=${lodgingList.lodgingSeq}">${lodgingList.name}</a>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="3" align="center">목록이 없습니다.
							</tr>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tbody>
		</table>
</div>
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
					<img alt="번호" src="/images/egovframework/number/no${i}.png"
					width="50px" height="50px">
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
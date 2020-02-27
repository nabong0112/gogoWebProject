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
<link type="text/css" rel="stylesheet" href="/css/egovframework/layout.css">
<title>음식점 목록</title>
</head>
<script type="text/javascript">
	function goSearch() {
		document.getElementById('goSearch').submit();
	}
</script>
<body>
	<div id="container">
		<%@ include file="../include/tourHompageHeader.jsp"%>
		<%@ include file="../include/navi.jsp"%>
		<div id="content" align="center">
			<div class="count" align="center">
				<div class="alignLeft">총 페이지 : ${paging.totalPage}</div>
				<div class="alignCenter">총 갯수 : ${paging.totalCount}</div>
				<div class="alignRight">현재페이지 : ${paging.pageNo}</div>
			</div>
			<div align="left">
				<table class="type2">
					<thead>
						<tr>
							<th>구역</th>
							<th>이름</th>
							<th>항목 구분</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="foodList" items="${foodList}" varStatus="i">
							<c:choose>
								<c:when test="${foodList != null}">
									<tr>
										<td>${foodList.dGuNm}</td>
										<td><a href="foodItem.do?foodSeq=${foodList.foodSeq}">${foodList.name}</a>
										</td>
										<td>${foodList.dCodeNm}</td>
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
					<a href="foodList.do?pageNo=${1}" style="text-decoration: none;">
						처음으로 </a>
					<a href="foodList.do?pageNo=${paging.pageNo - 1}"
						style="text-decoration: none;"> 이전 </a>
				</c:if>
				<c:forEach var="i" begin="${paging.startPage}"
					end="${paging.endPage}">
					<a href="foodList.do?pageNo=${i}" style="text-decoration: none;">
						${i} </a>
				</c:forEach>
				<c:if test="${paging.pageNo < paging.totalPage}">
					<a href="foodList.do?pageNo=${paging.pageNo + 1}"
						style="text-decoration: none;"> 다음 </a>
				</c:if>
				<c:if test="${paging.pageNo != paging.totalPage}">
					<a href="foodList.do?pageNo=${paging.totalPage}"
						style="text-decoration: none;"> 끝으로 </a>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>
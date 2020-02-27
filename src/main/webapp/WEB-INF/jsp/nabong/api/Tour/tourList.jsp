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
<body>
<div id="container">
		<%@ include file="../include/tourHompageHeader.jsp"%>
		<%@ include file="../include/navi.jsp"%>
	<div id="content">
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
				<c:forEach var="tourList" items="${tourList}" varStatus="i">
					<c:choose>
						<c:when test="${tourList != null}">
							<tr>
								<td>
								<a href="/Tour/tourItem.do?tourSeq=${tourList.tourSeq}">${tourList.name}</a>
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
			<a href="/Tour/tourList.do?pageNo=${1}" style="text-decoration: none;">
				처음으로
			</a>
			<a href="/Tour/tourList.do?pageNo=${paging.pageNo - 1}" style="text-decoration: none;">이전
			</a>
		</c:if>
		<c:forEach var="i" begin="${paging.startPage}"
			end="${paging.endPage}">
			<c:if test="${i - 1 < paging.totalPage}">
				<a href="/Tour/tourList.do?pageNo=${i}" style="text-decoration: none;">
					${i}
				</a>
			</c:if>
		</c:forEach>
		<c:if test="${paging.pageNo < paging.totalPage}">
			<a href="/Tour/tourList.do?pageNo=${paging.pageNo + 1}"
				style="text-decoration: none;"> 다음
			</a>
		</c:if>
		<c:if test="${paging.pageNo != paging.totalPage}">
			<a href="/Tour/tourList.do?pageNo=${paging.totalPage}"
				style="text-decoration: none;"> 끝으로
			</a>
		</c:if>
	</div>
	
</div>
	</div>
</body>
</html>
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
<script type="text/javascript">
	function goSearch(){
		
	}
</script>
<body>
	<div>
<!-- <form action="searchGu.do">
	<select name="selectGu">
		<option value="">전체</option>
		<option value="C0605">중구</option>
		<option value="C0603">서구</option>
		<option value="C0602">동구</option>
		<option value="C0604">유성구</option>
		<option value="C0601">대덕구</option>
	</select>
	<input type="text" class="searchForm" placeholder="검색어를 입력하세요">
	<button onclick="javascript:goSearch();">검색</button>
	</div>
</form> -->
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
								<a href="/Tour/tourItem.do?foodSeq=${tourList.tourSeq}">${tourList.name}</a>
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
				<img alt="처음으로" src="/images/egovframework/button/first.png"
				width="100px" height="50px">
			</a>
			<a href="/Tour/tourList.do?pageNo=${paging.pageNo - 1}"
				style="text-decoration: none;"> <img alt="이전"
				src="/images/egovframework/button/pre.png" width="100px"
				height="50px">
			</a>
		</c:if>
		<c:forEach var="i" begin="${paging.startPage}"
			end="${paging.endPage}">
			<c:if test="${i - 1 < paging.totalPage}">
				<a href="/Tour/tourList.do?pageNo=${i}" style="text-decoration: none;">
					<img alt="번호" src="/images/egovframework/number/no${i}.png"
					width="50px" height="50px">
				</a>
			</c:if>
		</c:forEach>
		<c:if test="${paging.pageNo < paging.totalPage}">
			<a href="/Tour/tourList.do?pageNo=${paging.pageNo + 1}"
				style="text-decoration: none;"> <img alt="다음"
				src="/images/egovframework/button/next.png" width="100px"
				height="50px">
			</a>
		</c:if>
		<c:if test="${paging.pageNo != paging.totalPage}">
			<a href="/Tour/tourList.do?pageNo=${paging.totalPage}"
				style="text-decoration: none;"> <img alt="끝으로"
				src="/images/egovframework/button/end.png" width="100px"
				height="50px">
			</a>
		</c:if>
	</div>
</body>
</html>
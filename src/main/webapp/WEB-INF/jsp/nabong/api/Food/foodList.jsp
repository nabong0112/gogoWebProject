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
<script type="text/javascript">
	function goSearch(){
		document.getElementById('go').submit();
	}
</script>
<body>
	<c:forEach var="foodList" items="${foodList}" varStatus="i">
	<fieldset>
		<a href="foodItem.do?foodSeq=${foodList.foodSeq}">${foodList.name}</a> <br>
		${foodList.dGuNm} <br>
		${foodList.contents1} 
		
	</fieldset>	
	</c:forEach>
	
	<form action="foodList.do" id="go" method="post">
	<select name="dGu">
		<option>전체</option>
		<option value="C0605">중구</option>
		<option value="C0603">서구</option>
		<option value="C0602">동구</option>
		<option value="C0604">유성구</option>
		<option value="C0601">대덕구</option>
	</select>
	<input type="hidden" name="dGu" value="${searchVo.dGu}">
	<input type="hidden" name="searchCondition" value="${searchVo.searchCondition}">
	<select name="searchCondition">
		<option>전체</option>
		<option value="1">업소명</option>
		<option value="2">전화번호</option>
		<option value="3">대표메뉴</option>
		<option value="4">상세정보</option>
	</select>
	<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요">
	<button onclick="javascript:goSearch();">검색</button>
	</div>
</form>
	<div class="pageing" align="center">
		<c:if test="${1 != pageNo}">
			<a href="foodList.do?pageNo=${1}" style="text-decoration:none;">
			<img alt="처음으로" src="/images/egovframework/button/first.png" width="100px" height="50px">
			</a>
		</c:if>
		<c:if test="${1 != pageNo}">
			<a href="foodList.do?pageNo=${pageNo - 1}" style="text-decoration:none;">
				<img alt="이전" src="/images/egovframework/button/pre.png" width="100px" height="50px">
			</a>
		</c:if>
		<c:forEach var="i" begin="${pageNo}" end="${pageNo + 4}">
				<c:choose>
				<c:when test="${i - 1 < totalPage}">
				<a href="foodList.do?pageNo=${i}" style="text-decoration:none;">
				<img alt="번호" src="/images/egovframework/number/no${i}.png" width="50px" height="50px">
				</a>
				</c:when>
				<c:otherwise>
				</c:otherwise>
				</c:choose>
			
		</c:forEach>
		<c:if test="${pageNo < totalPage}">
			<a href="foodList.do?pageNo=${pageNo + 1}" style="text-decoration:none;">
				<img alt="다음" src="/images/egovframework/button/next.png" width="100px" height="50px">
			</a>
		</c:if>
		<c:if test="${pageNo != totalPage}">
		<a href="foodList.do?pageNo=${totalPage}" style="text-decoration:none;">
			<img alt="끝으로" src="/images/egovframework/button/end.png" width="100px" height="50px">
		</a>
		</c:if>
		
	</div>
</body>
</html>
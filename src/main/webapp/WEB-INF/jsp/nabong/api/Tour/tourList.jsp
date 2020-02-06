<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>        
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="/css/egovframework/tourHompageHeader.css">
<script type="text/javascript">
	function goSearch(){
		
	}
</script>
<body>
	<c:forEach var="tourList" items="${tourList}" varStatus="i">
	<fieldset>
		<a href="tourItem.do?tourSeq=${tourList.tourSeq}">${tourList.name}</a> <br>
	</fieldset>	
	</c:forEach>
	<div>
<form action="searchGu.do">
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
</form>
	<div>
		<a href="tourList.do?numOfRows=6&pageNo=1">1</a>
		<a href="tourList.do?numOfRows=6&pageNo=2">2</a>
	</div>
</body>
</html>
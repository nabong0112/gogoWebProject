<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link type="text/css" rel="stylesheet" href="/css/egovframework/layout.css">
<style>
a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: blue;
	text-decoration: none;
}
</style>
</head>
<body>
	<div id="sidebar">
		<c:choose>
			<c:when test="${menu eq 'fastival'}">

				<h2>소개해유</h2>
				<ul class="mylist">
					<li><a href="/Tour/tourList.do">대전의 역사</a></li>
					<li><a href="/Tour/tourList.do">대전 시티투어</a></li>
					<li><a href="/Tour/tourList.do">축제 목록</a></li>
				</ul>
			</c:when>
			<c:when test="${menu eq 'tour'}">
				<div id="jb-sidebar">
					<h2>놀러가유</h2>
					<ul class="mylist">
						<li><a href="/Tour/tourList.do">관광지 목록</a></li>
					</ul>
				</div>
			</c:when>
			<c:when test="${menu eq 'food'}">
				<div id="jb-sidebar">
					<h2>먹어봐유</h2>
					<ul class="mylist">
						<li><a href="/Tour/foodList.do">음식점 목록</a></li>
					</ul>
				</div>
			</c:when>
			<c:when test="${menu eq 'lodging'}">
				<div id="jb-sidebar">
					<h2>쉬다가유</h2>
					<ul class="mylist">
						<li><a href="/Tour/lodgingList.do">숙박업소 목록</a></li>
					</ul>
				</div>
			</c:when>
			<c:otherwise>
				<div id="jb-sidebar">
					<h2>소통해유</h2>
					<ul class="mylist">
						<li><a href="/Talk/notice.do">공지사항</a></li>
						<li><a href="/Talk/board.do">후기 게시판</a></li>
						<li><a href="/Talk/question.do">문의사항</a></li>
					</ul>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<nav>
<c:choose>
	<c:when test="${menu eq 'info'}">
	<h2>소개해유</h2>
  		<ul class="infomation_s submenu">
       		<li><a href="/info/daejeonHistory.do" >대전의 역사</a></li>
       		<li><a href="/info/fastivalList.do">대전의 축제</a></li>
            <li><a href="대전시티투어 링크">대전 시티투어</a></li>
        </ul>
	</c:when>
	<c:when test="${menu eq 'tour'}">
	<h2>놀러가유</h2>
        <ul class="tour_s submenu">
            <li><a href="/tour/bestTourList.do">명소 12선</a></li>
            <li><a href="/tour/culturalTourList.do">문화 명소</a></li>
            <li><a href="/tour/scienceTourList.do">과학 명소</a></li>
            <li><a href="/tour/tourList.do">관광지 목록</a></li>
        </ul>   
	</c:when>
	<c:when test="${menu eq 'food'}">
	<h2>먹어봐유</h2>
       	<ul class="food_s submenu">
            <li><a href="/food/bestFoodList.do">대표 음식</a></li>
           	<li><a href="/food/featuredFoodList.do">특화 음식</a></li>
            <li><a href="/food/foodList.do">음식점 목록</a></li>
        </ul>   
	</c:when>
	<c:when test="${menu eq 'lodging'}">
	<h2>쉬다가유</h2>
     	<ul class="lodging_s submenu">
            <li><a href="/lodging/touristHotelList.do">관광 호텔</a></li>
            <li><a href="/lodging/lodgingList.do">숙박 업소 목록</a></li>
        </ul>  
	</c:when>
	<c:otherwise>
	<ul>
	<h2>소통해유</h2>
     	<ul class="board_s submenu">
            <li><a href="/board/notice.do">공지사항</a></li>
            <li><a href="">후기 게시판</a></li>
            <li><a href="">갤러리</a></li>
            <li><a href="QnA.do">문의사항</a></li>
        </ul>
	</c:otherwise>
</c:choose>
</nav>
</body>
</html>
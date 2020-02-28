<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="/css/egovframework/tourHompageHeader.css">
<style type="text/css">
#header {
	height: 10%;
	padding: 20px;
	margin-bottom: 20px;
}
.button {
    width:100px;
    background-color: #1b5ac2;
    border: none;
    color:#fff;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
}
</style>
</head>
<body>
<header>
	<div class="header">
		<div class="mainIcon">
			<img width="200px" height="150px" alt="index.do" title="메인" src="/images/egovframework/daejeonMainLogo.jpg">
			<c:choose>
				<c:when test="${sessionScope.userId != null}">
					<b>${sessionScope.userId}</b>님 안녕하세요
					<input type="button" value="마이페이지" class="button" style="float: right" onclick="location.href='/mypaging.do'">
				</c:when>
				<c:otherwise>
					<input type="button" value="회원가입" class="button" style="float: right" onclick="location.href='/signform.do'">
					<input type="button" value="로그인" class="button" style="float: right" onclick="location.href='/login1.do'">
				</c:otherwise>
			</c:choose>
		</div>
		<div class="selectMenu" align="center">
			<ul class="myMenu">
    			<li class="infomation"><a href="/Tour/daejeonHistory.do">소개해유</a>
  					<ul class="infomation_s submenu">
            			<li><a href="/Tour/daejeonHistory.do" >대전의 역사</a></li>
           				<li><a href="/Tour/fastivalList.do">대전의 축제</a></li>
            			<li><a href="/Tour/daejeonTourBus.do">대전 시티투어</a></li>
        			</ul>   
    			</li>
    			<li class="tour"><a href="/Tour/tourList.do">놀러가유</a>
        			<ul class="tour_s submenu">
            			<li><a href="/Tour/tourList.do">관광지 목록</a></li>
        			</ul>   
    			</li>
    			<li class="food"><a href="/Tour/bestFoodList.do">먹어봐유</a>
       				<ul class="food_s submenu">
            			<li><a href="/Tour/foodList.do">음식점 목록</a></li>
        			</ul>   
    			</li>
    			<li class="lodging"><a href="/Tour/touristHotelList.do">쉬다가유</a>
     				<ul class="lodging_s submenu">
            			<li><a href="/Tour/lodgingList.do">숙박 업소 목록</a></li>
        			</ul>  
    			</li>
    			<!-- <li class="board"><a href="/Talk/notice.do">소통해유</a>
     				<ul class="board_s submenu">
            			<li><a href="/Talk/notice.do">공지사항</a></li>
            			<li><a href="/Talk/board.do">후기 게시판</a></li>
            			<li><a href="/Talk/qestion.do">문의사항</a></li>
        			</ul>  
     			</li>    -->
			</ul>
		</div>
		</div>
</header>
</body>
</html>
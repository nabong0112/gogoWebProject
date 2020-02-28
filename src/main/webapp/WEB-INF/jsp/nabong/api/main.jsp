<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Step 1) Load D3.js -->
<script src="https://d3js.org/d3.v5.min.js"></script>

<!-- Step 2) Load billboard.js with style -->
<script src="/css/egovframework/billboard.js"></script>

<!-- Load with base style -->
<link rel="stylesheet" href="/css/egovframework/billboard.css">

<!-- Or load different theme style -->
<link rel="stylesheet" href="/css/egovframework/insight.css">
<style>
.myBgClass { transform: scale(0.9) translate(15px, -10px); opacity: 0.1; }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.goDaejeon {
    width: 300px;
    background-color: #1b5ac2;
    border: none;
    color: #fff;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
}
  a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: blue; text-decoration: none;}
 /* 기본 레이아웃 구성 */
#container {
	width: 1500px;
	margin: 0px auto;
	padding: 20px;
}
#content {
	padding: 20px;
	margin-bottom: 20px;
}
</style>
<title>대전광역시 소개 홈페이지 메인</title>
</head>
<body>
	<div id="container">
		<%@ include file="./include/tourHompageHeader.jsp"%>
		<div id="content" align="center">
		<img alt="대전광역시 사진" src="/images/egovframework/daejeon.jpg" style="width: 80%;">
		<div style="float: left; width: 45%; height: 350px;">
				<h5> 대전광역시의 역사가 궁금하시다면?</h5>
				<img alt="대전광역시 사진" src="/images/egovframework/daejeonMark.jpg">
				<input type="button" width="300px" class="goDaejeon" value="대전의 역사바로가기" onclick="location.href='/Tour/daejeonHistory.do'">
		</div>
		<div style="float: right; width: 45%; height: 250px;">
				<h5> 대전광역시의 음식점이 궁금하시다면?</h5>
				<img alt="대전광역시 사진" src="/images/egovframework/daejeonMark.jpg">
				<input type="button" width="300px" class="goDaejeon" value="음식점 목록 바로가기" onclick="location.href='/Tour/foodList.do'">
		</div>
		</div>
	</div>
</body>
</html>
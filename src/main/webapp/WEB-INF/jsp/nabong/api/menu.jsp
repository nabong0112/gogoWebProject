<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<body>
<head>
<meta charset="utf-8" />
<title>Menu</title>

<style>
body, div, h1, h2, h3, h4, h5, h6, p, ul, ol, li, dl, dt, dd, img, form, fieldset, input, textarea, blockquote {
	margin: 0; padding: 0; border: 0;
}

body {
	background: #ffffff;
	font-family: Helvetica, sans-serif; font-size: 15px; line-height: 24px; padding: 20px; text-align: center;
}

nav {
	margin: auto; 
	text-align: center;
}

nav ul ul {
	display: none;
}

	nav ul li:hover > ul {
		display: block;
	}


nav ul {
	
	list-style: none;
	position: relative;
	display: inline-table;
}
	nav ul:after {
		content: ""; clear: both; display: block;
	}

	nav ul li {
		float: left;
	}
		nav ul li:hover {
			background: #4b545f;
			background: linear-gradient(top, #4f5964 0%, #5f6975 40%);
			background: -moz-linear-gradient(top, #4f5964 0%, #5f6975 40%);
			background: -webkit-linear-gradient(top, #4f5964 0%,#5f6975 40%);
		}
			nav ul li:hover a {
				color: #fff;
			}
		
		nav ul li a {
			display: block; padding: 10px 50px 10px 50px;
			color: #757575; text-decoration: none;
		}
			
		
	nav ul ul {
		background: #5f6975; border-radius: 0px; padding: 0;
		position: absolute; top: 100%;
	}
		nav ul ul li {
			float: none; 
			border-top: 1px solid #6b727c;
			border-bottom: 1px solid #575f6a; position: relative;
		}
			nav ul ul li a {
				padding: 10px 50px 10px 50px;
				color: #fff;
			}	
				nav ul ul li a:hover {
					background: #4b545f;
				}
		
	nav ul ul ul {
		position: absolute; left: 100%; top:0;
	}
		

</style>



<a href="/gogoWebProject"><img src="images/egovframework/대전로고.jpg"  width="190px" height="100px" align="center"></a>

<style type="text/css">
span {width: 100px; height: 20px; padding: 10px; color: #ffffff; font:돋움; font-size: 10px; align:right;}
#span1 {background-color: #657181; border-radius: 10px; font-color: #ffffff;}
#span2 {background-color: #657181; border-radius: 10px; font-color: #ffffff;}
#span3 {background-color: #657181; border-radius: 10px; font-color: #ffffff;}
</style>
</head>
<body>
<a href="/gogoWebProject"><span id="span1">HOME</span></a>
<a href="/gogoWebProject/join.do"><span id="span2">로그인</span></a>
<a href="/gogoWebProject/join.do"><span id="span3">회원가입</span></a>
</body>
</html>


<nav>
	<ul>
		<li><a href="/gogoWebProject/join1.do">소개해유</a>
			<ul class="submenu">
				<li><a href="#">대전역사</a></li>
				<li><a href="#">축제</a></li>
				<li><a href="#">시티투어</a></li>
				<li><a href="#"></a></li>
			</ul>
			
		</li>
		<li><a href="/gogoWebProject/join2.do">놀러가유</a>
			<ul class="submenu">
				<li><a href="#">관광명소</a></li>
				<li><a href="#">문화</a></li>
				<li><a href="#">과학</a></li>
				<li><a href="#">관광지</a></li>
				</li>
			</ul>
		</li>
		<li><a href="/gogoWebProject/join3.do">먹어봐유</a>
			<ul class="submenu">
				<li><a href="#">대표음식</a></li>
				<li><a href="#">특화음식</a></li>
				<li><a href="#">음식점</a></li>
				<li><a href="#"></a></li>
			</ul>
		</li>
	
	<li><a href="/gogoWebProject/join4.do">쉬다가유</a>
			<ul class="submenu">
				<li><a href="#">관광호텔</a></li>
				<li><a href="#">숙박업소</a></li>
				<li><a href="#">캠핑장</a></li>
				<li><a href="#"></a></li>
			</ul>
		</li>
		
		<li><a href="/gogoWebProject/join5.do">소통해유</a>
			<ul class="submenu">
				<li><a href="#">공지사항</a></li>
				<li><a href="#">게시판</a></li>
				<li><a href="#">갤러리</a></li>
				<li><a href="#">문의사항</a></li>
			</ul>
		</li>
		
	<li><a href="#"><img src="images/egovframework/검색.png" align="right" width="30px" height="30px"></a></li>
</nav>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$("nav > ul > li").mouseenter(function(){
  $(".submenu").stop().slideDown(400);
});
$("nav > ul > li").mouseleave(function(){
  $(".submenu").stop().slideUp(100);
});
</script>
</body>
<body>

<img src="images/egovframework/대전2.jpg" align="center" border="20px" width="1000px" height="400px">

<div style="float:left; border:1.5px solid; padding:15px; margin:22px 10px 10px 10px; width:46.2%; height:200px;">
<style>
#test_btn1{ margin-right:2px; }
#test_btn2{ margin-left:-3px; }
#btn_group button{ border: 1.5px solid   #0099ff; border-radius: 20px; background-color: rgba(0,0,0,0);
color:   #0099ff; padding: 7px 10px 7px 10px; float:left;}
</style>
<div id="btn_group">
<button id="test_btn1">+ 공지사항</button>
</div>
</div>

<div style="float:right; border:1.5px solid; padding:15px; margin:22px 10px 10px 10px; width:46.2%; height:200px;">
<style>
#test_btn1{ margin-right:2px; }
#test_btn2{ margin-left:-3px; }
#btn_group button{ border: 1.5px solid   #0099ff;  border-radius: 20px; background-color: rgba(0,0,0,0);
color:   #0099ff; padding: 7px 10px 7px 10px; float:left;}
</style>
<div id="btn_group">
<button id="test_btn1">+ 자유게시판</button>
</div>
</div>
</body>
</html>
<footer>
<div style="float:left; border:1.5px solid; padding:15px; margin:13px 10px 10px 10px; width:97%; height:20px;">
무종특별자치도 나현시 지원동 190701-200228 000)000-0000</div>
</footer>
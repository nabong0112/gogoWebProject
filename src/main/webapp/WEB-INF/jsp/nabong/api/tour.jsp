<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>놀러가유</title>

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


<style>
*{margin:0;padding:0;}
h1 {font-family:tahoma; color:#999; font-size:25px; float:center;}
P{font-family:돋움; font-size:15px; letter-spacing:1px; margin-bottom:40px; float:center;}

/*검색폼 스타일*/
.search-box {
    background: url("/data/201012/IJ12928451425892/searchbar.png") no-repeat scroll left top transparent;
    height: 30px;
    margin-top: 5px;
    overflow: hidden;
    border:2px solid #d9d9d9;
    width: 600px;
	background-image : url('images/egovframework/검색.png');
	background-position: right;
	background-repeat: no-repeat;
	background-size: 30px;
}

input.search-field {
    background: none repeat scroll 0 0 transparent;
    border: 0 none;
    color: #000000;
    float: left;
	font-family:돋움;
    height: 30px;
    line-height: 26px;
    padding: 0px 0px 0px 15px;
    margin: 0;
    width: 600px;
}
input.search-go {
    background: url("/data/201012/IJ12928451425892/searchbar.png") no-repeat scroll right 0 transparent;
    border: 0 none;
    cursor: pointer;
    float: right;
    height: 40px;
    margin: 0;
    padding: 0;
    width: 50px;
}

</style>
</head>

<body>
	<div class="search-box">
		<form method="get">
			<input size="15" class="search-field" name="s" id="s" value="Search_" onfocus="if(this.value == 'Search..') {this.value = '';}"
			onblur="if (this.value == '') {this.value = 'Search..';}" type="text">
			<input value="" class="search-go" type="submit"> 
		</form>
	</div>
</body>




<style>
table.type1 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    margin: 20px 10px;
}
table.type1 th {
    width: 155px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #0099ff ;
}
table.type1 td {
    width: 155px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #eee;
}
</style>
<table class="type1">
    <thead>
    <tr>
        <th scope="cols">놀러가유</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>관광명소</th>
    </tr>
        <tr>
        <td>문화</th>
    </tr>
        <tr>
        <td>과학</th>
    </tr>
         <tr>
        <td>관광지</th>
    </tr>
    </tbody>
</table>


</div>
</body>
</html>

<footer>
<div style="float:left; border:1.5px solid; padding:15px; margin:13px 10px 10px 10px; width:97%; height:20px;">
무종특별자치도 나현시 지원동 190701-200228 000)000-0000</div>
</footer>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<title>search</title>
<html>
<head>
<style>
*{margin:0;padding:0;}
h1 {font-family:tahoma; color:#999; font-size:25px;}
P{font-family:돋움; font-size:15px; letter-spacing:1px; margin-bottom:40px;}

/*검색폼 스타일*/
.search-box {
    background: url("/data/201012/IJ12928451425892/searchbar.png") no-repeat scroll left top transparent;
    height: 45px;
    margin-top: 5px;
    overflow: hidden;
    border:2px solid #d9d9d9;
    width: 350px;
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
	font-family:tahoma;
    height: 45px;
    line-height: 26px;
    padding: 0px 0px 0px 15px;
    margin: 0;
    width: 350px;
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

</html>

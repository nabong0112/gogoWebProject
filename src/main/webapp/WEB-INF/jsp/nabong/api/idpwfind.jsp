<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>MS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Righteous&amp;subset=latin-ext" rel="stylesheet">

<style>
*{
	font-size: 20px;
	font-family: 'BMHANNAPro';
}
input{
	font-family: sans-serif;
}
html, body {
	height: 100%;
}
body {
	margin: 0;
}
.container {
	height: 50%;
	position: relative;
}
.full {
	background-color: white;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	height: 100%;
}
.area_inputs {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
	width: 30%;
	height: 30%;
}
.sub_title {
	padding-bottom: 2px;
	margin-bottom: 15px;
	font-size: 23px;
	border-bottom: 1px solid #cecece;
}
.select_pick{
	display:inline;
    width: 70%;
    height: 40px;
    padding: 6px 12px;
    font-size: 17px;
    line-height: 1.0;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 15px;
}
.layout_search{
	mar
}
</style>

</head>
<body>
<%@ include file="include/idfind.jsp" %>
<div class="full">
		<div class="container">
			<div class="area_inputs wow fadeIn">
				<div class="sub_title font-weight-bold text-black">
					<h3>아이디/비밀번호 찾기</h3>
					<p>인증된 이메일로 비밀번호가 전송됩니다</p>
				</div>
				<div style="margin-bottom: 10px;"
					class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
					<label class="custom-control-label font-weight-bold text-white"	for="search_1">아이디 찾기</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
					<label class="custom-control-label font-weight-bold text-white" for="search_2">비밀번호 찾기</label>
				</div>
				<div id="searchI">
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputName">이름</label>
						<div>
							<input type="text" class="form-control" id="userName" name="userName" placeholder="ex) 홍길동">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputBirth">생년월일</label>
						<div>
							<input type="text" class="form-control" id="userBirth" name="userBirth" placeholder="ex) 19940101">
						</div>
					</div>
					<div class="form-group">
						<button id="searchBtn" type="button" onclick="idSearch_click()" class="btn btn-primary btn-block">확인</button>
					<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
					</div>
				</div>
				<div id="searchP" style="display: none;">
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputId">아이디</label>
						<div>
							<input type="text" class="form-control" id="userId" name="userId" placeholder="ex) godmisu">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputEmail_2">이메일</label>
						<div>
							<input type="email" class="form-control" id="userEmail"	name="userEmail" placeholder="ex) E-mail@gmail.com">
						</div>
					</div>
					<div class="form-group">
						<button id="searchBtn2" type="button" class="btn btn-primary btn-block">확인</button>
					<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
				</div>
				</div>
			</div>
		</div>
	</div>
	
</body>

<script>
	//체크 버튼에 따라 아이디/비밀번호 기능이 달라진다
	function search_check(num) {
		if (num == '1') {
			document.getElementById("searchP").style.display = "none";
			document.getElementById("searchI").style.display = "";
			
		} else {
			document.getElementById("searchI").style.display = "none";
			document.getElementById("searchP").style.display = "";
		}
	}

	// 비밀번호 찾기 이메일로 보내기
	$('#searchBtn2').click(function(){
		console.log("패스워드 찾기 : ajax 들어가기 전");
		console.log($('#userId').val());
		console.log($('#userEmail').val());
		$.ajax({
			type : "get",
			url : "${pageContext.request.contextPath}/pwfind.do?userId="
					+ $('#userId').val() + "&userEmail=" + $('#userEmail').val(),
			success : function(data){	
						alert("해당 이메일로 임시 비밀번호를 발송하였습니다.");
						location.href = '<%=request.getContextPath()%>'
			}
		});	
	});
	
</script>
</html>
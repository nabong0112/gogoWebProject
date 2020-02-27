<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
*{
	font-size: 20px;
	font-family: 'BMHANNAPro';
}
input{
	font-family: sans-serif;
}
/* modal창 감싸고 있는 배경 Div */
.background_modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
/* 아이디 출력창(실제 내용) */
.modal_contents {
	background-color: #fefefe;
	margin: auto;
	margin-top: 5%;
	padding: 15px;
	border: 1px solid #888;
	border-radius: 20px;
	width: 30%;
	text-align: center;
}
/* close 버튼 */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	font-size: 28px;
}
.selectedInfo {
	font-size: 24px;
}
</style>
</head>
<body>
<div id="background_modal" class="background_modal">
	<div class="modal_contents">
		<h4>
			<b>회원님 아이디는?</b><span class="close">&times;</span>
		</h4><br>
			<h2 id="id_value"></h2>
		<br>
	</div>
	</div>
</body>
<script>
	$(document).ready(function() {
		/////////모///달///기///능///////////
		// 1. 모달창 히든 불러오기
		$('#searchBtn').click(function() {
			console.log("modal1");
			$('#background_modal').show();
		});
		// 2. 모달창 닫기 버튼
		$('.close').on('click', function() {
			console.log("modal2");
			$('#background_modal').hide();
		});
		// 3. 모달창 위도우 클릭 시 닫기
		$(window).on('click', function() {
			console.log("modal3");
			if (event.target == $('#background_modal').get(0)) {
	            $('#background_modal').hide();   
	         }
		});	
	});
	
var idSearch_click = function(){
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/idfind.do?userName="
				+$('#userName').val()+"&userBirth="+$('#userBirth').val(),
				
		success:function(data){
		
			if(data == 0){
				$('#id_value').text("회원 정보를 확인해주세요!");	
			} else {
				$('#id_value').text(data);
				// 아이디값 별도로 저장
			}
		}
	});
}
</script>
</html>
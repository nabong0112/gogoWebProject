<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/css/mdb.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Righteous&amp;subset=latin-ext" rel="stylesheet">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/js/mdb.min.js"></script>
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
	min-height: 100%;
	width: 28.9%;
}
.titleStyle {
	padding: 30px;
	margin-top: 10px;
	margin-bottom: 10px;
	/* color: #2E64FE; */
	color: black;
}
.container h1 {
	font-family: "Righteous";
	font-size: 80px;
	text-align: center;
}
.reg_button {
	padding: 20px;
	text-align: center;
}
.select_pick{
	display:inline;
    width: 35%;
    height: 40px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.0;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 15px;
}
</style>
</head>
<body>
<div class="container">
<form method="POST" action="reg.do">
<!--  아이디 -->
	<div class="form-group">
				<label for="userId">아이디</label>
<input type="text" id="userId" name="userId" placeholder="ID" maxlength="12">
<div class="check_font" id= "idcheck"></div>
</div>

<!-- 비밀번호 -->  

			<div class="form-group">
				<label for="userPw">비밀번호</label>
					<input type="password" class="form-control" id="userPw" name="userPw" placeholder="PASSWORD">
				<div class="check_font" id="Pwcheck"></div>
			</div>
			<!-- 비밀번호 재확인 -->
			<div class="form-group">
				<label for="userPw2">비밀번호 확인</label>
					<input type="password" class="form-control" id="userPw2" name="userPw2" placeholder="Confirm Password">
				<div class="check_font" id="Pw2check"></div>
			</div>
			
			<!-- 이름 -->
			<div class="form-group">
				<label for="userName">이름</label>
					<input type="text" class="form-control" id="userName" name="userName" placeholder="Name">
				<div class="check_font" id="namecheck"></div>
			</div>
			
			 <div class="form-group">
				<label for="userJender">성별</label><br>
				여성<input type="radio" class="form-control" id="userJender" name="userJender" value='여'/>
				남성<input type="radio" class="form-control" id="userJender" name="userJender" value='남'/>
			</div>

			
	<div class="form-group">
				<label for="email">이메일 (인증을 해야 로그인이 가능합니다)</label>
					<input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="email">
				<div class="check_font" id="emailcheck"></div>
			</div>
			
			<!-- 휴대전화 -->
			<div class="form-group">
				<label for="userPhone">휴대전화 ('-' 없이 번호만 입력해주세요)</label>
				<input type="text" class="form-control" id="userPhone" name="userPhone" placeholder="Phone Number" required>
				<div class="check_font" id="phonecheck"></div>
				</div>
				
				<!-- 생년월일 -->
			<div class="form-group required">
				<label for="userBirth">생년월일</label>
					<input type="text" class="form-control" id="userBirth" name="userBirth" placeholder="ex) 19990415" required>
				<div class="check_font" id="birthcheck"></div>
			</div>
			
		
<div class="reg_button">

<button class="btn btn-primary px-3" id="reg_submit">
					가입하기
				</button>
				<a class="btn btn-danger px-3" href="${pageContext.request.contextPath}">
					취소하기
				</a>&emsp;&emsp;


			</div>
		</form>
		</div>
<script>
var idck = /^[a-z0-9]{4,12}$/;
var pwck = /^[A-Za-z0-9]{4,12}$/;
var emailck=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
var nameck = /^[0-9a-zA-Z가-힣]{2,20}$/;
var phoneck = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

	
$('#userEmail').blur(function() {
	if(emailck.test($('#userEmail').val())) {
		$('#emailcheck').text('');
	}else {
		$('#emailcheck').text('올바른이메일형식이 아닙니다');
		$('#emailcheck').css('color', 'red');
	}
});

$("#userId").blur(function() {
	var userId = $('#userId').val();
$.ajax({
	type : 'get',
	url:"<c:url value='/idcheck.do?userId='/>"+userId,
	success : function(data) {
		console.log("1=중복,0=중복x:"+data);
		if(data==1) {
			$("#idcheck").text("중복된 아이디입니다.");
			$("#idcheck").css("color","red");
			$("#reg_submit").attr("disabled", true);
		}else {
			if(idck.test(userId)) {
				$("#idcheck").text("");
				$("#reg_submit").attr("disabled",false);
			}else if(userId == ""){
				$('#idcheck').text("아이디를 입력해주세요");
				$('#idcheck').css('color','red');
				$("#reg_submit").attr("disabled",true);
			}else{
				$('#idcheck').text("아이디는 소문자와 숫자 4~12자리만가능");
				$('#idcheck').css('color','red');
				$("#reg_submit").attr("disabled",true);
		}
	}
},error : function(error) {
				console.log("실패");
			}
});
});

$('#userPw').blur(function() {
	if (pwck.test($('#userPw').val())) {
		console.log('true');
		$('#Pwcheck').text('');
	} else {
		console.log('false');
		$('#Pwcheck').text('숫자 or 문자로만 4~12자리 입력');
		$('#Pwcheck').css('color', 'red');
	}
});

// 1-2 패스워드 일치 확인
$('#userPw2').blur(function() {
	if ($('#userPw').val() != $(this).val()) {
		$('#Pw2check').text('비밀번호가 일치하지 않습니다');
		$('#Pw2check').css('color', 'red');
	} else {
		$('#Pw2check').text('');
	}
});

//이름에 특수문자 들어가지 않도록 설정
$("#userName").blur(function() {
	if (nameck.test($(this).val())) {
			console.log(nameck.test($(this).val()));
			$("#namecheck").text('');
	} else {
		$('#namecheck').text('이름을 확인해주세요');
		$('#namecheck').css('color', 'red');
	}
});
var birthck = false;

// 생년월일	birthck 유효성 검사
$('#userBirth').blur(function(){
	var dateStr = $(this).val();		
    var year = Number(dateStr.substr(0,4)); 
    var month = Number(dateStr.substr(4,2));
    var day = Number(dateStr.substr(6,2));
    var today = new Date(); // 날짜 변수 선언
    var yearNow = today.getFullYear();
	
    if (dateStr.length <=8) {
		
	    if (year < 1900 || year > yearNow){
	    	
	    	$('#birthcheck').text('생년월일을 확인해주세요 :)');
			$('#birthcheck').css('color', 'red');
	    	
	    }else if (month < 1 || month > 12) {
	    		
	    	$('#birthcheck').text('생년월일을 확인해주세요 :)');
			$('#birthcheck').css('color', 'red'); 
	    
	    }else if (day < 1 || day > 31) {
	    	
	    	$('#birthcheck').text('생년월일을 확인해주세요 :)');
			$('#birthcheck').css('color', 'red'); 
	    	
	    }else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
	    	 
	    	$('#birthcheck').text('생년월일을 확인해주세요 :)');
			$('#birthcheck').css('color', 'red'); 
	    	 
	    }else if (month == 2) {
	    	 
	       	var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
	       	
	     	if (day>29 || (day==29 && !isleap)) {
	     		
	     		$('#birthcheck').text('생년월일을 확인해주세요 :)');
				$('#birthcheck').css('color', 'red'); 
	    	
			}else{
				$('#birth_check').text('');
				birthck = true;
			}//end of if (day>29 || (day==29 && !isleap))
	     	
	    }else{
	    	
	    	$('#birthcheck').text(''); 
			birthck = true;
		}//end of if
		
		}else{
			//1.입력된 생년월일이 8자 초과할때 :  auth:false
			$('#birthcheck').text('생년월일을 확인해주세요 :)');
			$('#birthcheck').css('color', 'red');  
		}
	}); //End of method /*

//휴대전화
$('#userPhone').blur(function(){
	if(phoneck.test($(this).val())){
		console.log(nameck.test($(this).val()));
		$("#phonecheck").text('');
	} else {
		$('#phonecheck').text('휴대폰번호를 확인해주세요 :)');
		$('#phonecheck').css('color', 'red');
	}
});

var inval_Arr = new Array(4).fill(false);
$('#reg_submit').click(function(){
	// 비밀번호가 같은 경우 && 비밀번호 정규식
	if (($('#userPw').val() == ($('#userPw2').val()))
			&& pwck.test($('#userPw').val())) {
		inval_Arr[0] = true;
	} else {
		inval_Arr[0] = false;
	}
	// 이름 정규식
	if (nameck.test($('#userName').val())) {
		inval_Arr[1] = true;	
	} else {
		inval_Arr[1] = false;
	}
	// 이메일 정규식
	if (emailck.test($('#userEmail').val())){
		console.log(emailck.test($('#userEmail').val()));
		inval_Arr[2] = true;
	} else {
		inval_Arr[2] = false;
	}
 	// 휴대폰번호 정규식
	if (phoneck.test($('#userPhone').val())) {
		console.log(phoneck.test($('#userPhone').val()));
		inval_Arr[3] = true;
	} else {
		inval_Arr[3] = false;
	}
 	
	if (birthck) {
		console.log(birthck);
		inval_Arr[4] = true;
	} else {
		inval_Arr[4] = false;
	}
	
	var validAll = true;
	for(var i = 0; i < inval_Arr.length; i++){
		
		if(inval_Arr[i] == false){
			validAll = false;
		}
	}
	
	if(validAll){ // 유효성 모두 통과
		alert('이메일에서 인증 메일을 확인해주세요!');
		 
	} else{
		alert('입력한 정보들을 다시 한번 확인해주세요 :)')
		return false;
	}
});
</script>

</html>

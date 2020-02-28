<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<style>
*{
    margin: 0;
    padding: 0;
    text-decoration: none;
    font-family: arial;
    box-sizing: border-box;
}
body {
    background: #ddd;
}
#login-form {
    width: 450px;
    background: #fff;
    padding: 80px 40px;
  
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%,-50%);
    margin: 20px 0px;
}
#login-form h1 {
    text-align: center;
    margin-bottom: 60px;
    color: #00bcd4;
    font-size: 30px;
}
#login-form p {
    font-size: 16px;
    color: #333;
}
#login-form p a {
    color: #00bcd4;
}
#login-form label {
    color: #848484;
}
.input-box{
    border-bottom: 2px solid #adadad;
    position: relative;
    margin: 30px 0;
}
.input-box input{
    font-size: 15px;
    color: #333;
    border: none;
    width: 100%;
    outline: none;
    background: none;
    padding: 0 5px;
    height: 40px;
}
.input-box span::before{
    content: attr(data-placeholder);
    position: absolute;
    top: 50%;
    left: 5px;
    color: #adadad;
    transform: translateY(-50%);
    z-index: -1;
    transition: .5s;
}
.input-box span::after{
    content: '';
    position: absolute;
    width: 0%;
    height: 2px;
    background: linear-gradient(120deg,#2196F3,#FF5722);
    transition: .5s;
}
.focus + span::before{
    top: -5px;
}
.focus + span::after{
    width: 100%;
}
.login-btn {
    display: block;
    width: 100%;
    height: 50px;
    border: none;
    background: linear-gradient(70deg,#2196F3,#03bcd4,#2196F3);
    background-size: 200%;
    color: #fff;
    outline: none;
    cursor: pointer;
    margin: 20px 0px 0px;
    border-radius: 50px;
    transition: .5s;
    font-size: 18px;
    letter-spacing: 1px;
}

.cancel-btn {
    display: block;
    width: 100%;
    height: 50px;
    border: none;
    background: linear-gradient(70deg,#2196F3,#03bcd4,#2196F3);
    background-size: 200%;
    color: #fff;
    outline: none;
    cursor: pointer;
    margin: 20px 0px 0px;
    border-radius: 50px;
    transition: .5s;
    font-size: 18px;
    letter-spacing: 1px;
    text-align: center;
    
    }

}
.login-btn:hover{
    background-position: right;
}
.bottom-links{
    margin-top: 30px;
    text-align: center;
    font-size: 13px;
}

/*--For Small Devices CSS--*/
@media (max-width: 575px){
#login-form {
    width: 300px;
}
}
</style>
</head>
<div class="container">
<form method="POST" action="reg.do" id= login-form>
<h1>회원가입</h1>
<!--  아이디 -->
   <div class="input-box">
            <label for="userId">아이디</label>
<input type="text" id="userId" name="userId" placeholder="ID" maxlength="12">
</div>
<div class="check_font" id= "idcheck"></div>

<!-- 비밀번호 -->  

         <div class="input-box">
            <label for="userPw">비밀번호</label>
               <input type="password" class="form-control" id="userPw" name="userPw" placeholder="PASSWORD">
         </div>
         <div class="check_font" id="Pwcheck"></div>
         <!-- 비밀번호 재확인 -->
         <div class="input-box">
            <label for="userPw2">비밀번호 확인</label>
               <input type="password" class="form-control" id="userPw2" name="userPw2" placeholder="Confirm Password">
         </div>
            <div class="check_font" id="Pw2check"></div>
         
         <!-- 이름 -->
         <div class="input-box">
            <label for="userName">이름</label>
               <input type="text" class="form-control" id="userName" name="userName" placeholder="Name">
         </div>
            <div class="check_font" id="namecheck"></div>
         
          <div class="input-box">
            <label for="userJender">성별</label><br>
            <input type="radio" style="width:13px;height:13px;border:1px" id="female" name="userJender" value='여'/>여성
            <input type="radio" style="width:13px;height:13px;border:1px"  id="male" name="userJender" value='남'/>남성
         </div>

         
   <div class="input-box">
            <label for="email">이메일 (인증을 해야 로그인이 가능합니다)</label>
               <input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="email">
         </div>
            <div class="check_font" id="emailcheck"></div>
         
         <!-- 휴대전화 -->
         <div class="input-box">
            <label for="userPhone">휴대전화 ('-' 없이 번호만 입력해주세요)</label>
            <input type="text" class="form-control" id="userPhone" name="userPhone" placeholder="Phone Number" required>
            </div>
            <div class="check_font" id="phonecheck"></div>
            
            <!-- 생년월일 -->
         <div class="input-box">
            <label for="userBirth">생년월일</label>
               <input type="text" class="form-control" id="userBirth" name="userBirth" placeholder="ex) 19990415" required>
         </div>
            <div class="check_font" id="birthcheck"></div>
         
      
<div class="reg_button">

<button class="login-btn" id="reg_submit">
               가입하기
            </button>
         </div>
         <a class="cancel-btn" href="${pageContext.request.contextPath}">취소하기</a>
      </form>
      </div>
      </body>
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

// 생년월일   birthck 유효성 검사
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
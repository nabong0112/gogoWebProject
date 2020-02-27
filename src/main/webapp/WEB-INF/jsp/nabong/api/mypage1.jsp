<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MS</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
.userMyPage_userInfo {
   margin: 30px 20px;
   position : relative;
}
.userMyPage_userTable th {
   color: black;
   width : 240px;
   height : 80px;
   font-size : 25px;
   padding : 10px 40px;
   border-top : 2px solid darkgray;
   border-bottom : 2px solid darkgray;
   border-right : 2px solid darkgray;
}
.userMyPage_userTable td {
   width : 600px;
   color: black;
   border-top: 2px solid darkgray;
   border-bottom: 2px solid darkgray;
   background-color: #white;
}
.userMyPage_userTable input[type=text]{
   width : 400px;
   height : 50px;
   margin-left : 70px;
   border-radius : 7px;
   border : 1px solid ivory;
   background-color : #eee;
   padding-left : 20px;
   font-size : 20px;
}
.userMyPage_title{
   margin-top : 30px;
}
.userMyPage_deleteBtn {
   border : none;
   background-color : #212121;
   width : 130px;
   height : 50px;
   color : white;
   margin-left : 190px;
   font-size : 20px;
   border-radius: 10px;
   background-color : red;
}
.userMyPage_deleteBtn:hover{
   background-color : palevioletred;
   cursor : pointer;
}
.userMyPage_deleteModal{
   position : fixed;
   width : 100%;
   height : 100%;
   left : 0px;
   top : 0px;
   z-index : 1;
   background-color : rgba(0, 0, 0, 0.4);
   display : none;
}
.userMyPage_deleteDiv{
   position : absolute;
   top : 20%;
   left : 35%;
   width : 500px;
   height : 200px;
   background-color : #eee;
   text-align : center;
   border-radius: 10px;
}
.userMyPage_deleteDiv p{
   margin-top : 30px;
   margin-bottom : 30px;
   font-size : 35px;
}
.userMyPage_deleteOkBtn, .userMyPage_deleteCancelBtn{
   background-color : red;
   border : none;
   width : 130px;
   height : 50px;
   color : white;
   margin-left : 30px;
   margin-right : 30px;
   font-size : 18px;
   border-radius: 10px;
}
.userMyPage_deleteCancelBtn{
   background-color : black !important;
}
.userMyPage_deleteOkBtn:hover{
   background-color : palevioletred;
    cursor : pointer;
}
.userMyPage_deleteCancelBtn:hover{
   background-color : #8e8e8e !important;
    cursor : pointer;
}
.edit:hover {
   color : red;
   cursor : pointer;
}
@media (max-width:570px){
   .container {
      min-width : 100% !important;
   }
   .userMyPage_userTable th{
      padding : 10px 10px;
      width : 100px;
   }
   .userMyPage_userTable td{
      width : 350px;
   }
   .userMyPage_deleteBtn{
      width : 80px;
      margin-left : 115px;
      font-size : 15px;
      height : 35px;
   }
}
@media (max-width:770px){
   .container {
      width : 500px !important;
   }
   .userMyPage_userTable th{
      font-size : 15px;
      padding : 10px 10px;
   }
   .userMyPage_userTable input[type=text]{
      font-size : 15px ;
      width : 200px !important;
      margin-left : 40px;
   }
   .edit{
      font-size : 13px !important;
   }
   .userMyPage_deleteBtn{
      width : 100px;
      margin-left : 115px;
      font-size : 20px;
      height : 40px;
   }
}
@media (max-width:980px){
   .container {
      width : 720px !important;
   }
   .userMyPage_userTable th{
      font-size : 15px;
   }
   .userMyPage_userTable input[type=text]{
      font-size : 15px ;
      width : 300px;
   }
}
</style>
</head>
<body>
<%@ include file="include/userdelete.jsp"%>
   
   <div class="container">
      <h1 class = "userMyPage_title">마이 페이지</h1><a href="#" style = "float : right; font-size : 18px;  margin-right : 250px;" onClick="history.back(); return false ; "> 뒤로가기 </a>

      <div class ="userMyPage_userInfo">
         <form action="" id = "mypage_form">
            <table class ="userMyPage_userTable">
               <tr id = "userMyPage_userIdTr">
                  <th>회원아이디</th>
                  <td><input type = "text" name = "userId" id = "mypage_id" value = "${user.userId }" readonly></td>
               </tr>
               <tr>
                  <th>이름</th>
                  <td><input type = "text" name = "userName" id = "mypage_name" value = "${user.userName }(${user.userJender})" readonly></td>
               </tr>
               <tr>
                  <th>비밀번호</th>
                  <td><input type = "text" name = "userPw" id = "mypage_pw" value = "${user.userPw }" readonly>
                  <p id = "edit_pw" class = "edit" style = "float : right; font-size : 18px; margin-top : 10px; margin-right : 30px;" onclick ="edit('pw')">수정하기</p>
                  <p id = "errorPw" style = "display : none; margin-left : 70px; color : red; font-size : 15px; margin-bottom : 0px;"></p></td>
               </tr>
               <tr>
                  <th>핸드폰번호</th>
                  <td><input type = "text" name = "userPhone" id = "mypage_phone" value = "${user.userPhone }" readonly>
                  <p id = "edit_phone" class = "edit" style = "float : right; font-size : 18px; margin-top : 10px; margin-right : 30px;" onclick ="edit('phone')">수정하기</p>
                  <p id = "errorPhone" style = "display : none; margin-left : 70px; color : red; font-size : 15px; margin-bottom : 0px;"></p></td>
               </tr>
               <tr>
                  <th>생년월일</th>
                  <td><input type = "text" name = "userBirth" id = "mypage_birth" value = "${user.userBirth }" readonly>
                  <p id = "edit_birth" class = "edit" style = "float : right; font-size : 18px; margin-top : 10px; margin-right : 30px;" onclick ="edit('birth')">수정하기</p>
                  <p id = "errorBirth" style = "display : none; margin-left : 70px; color : red; font-size : 15px; margin-bottom : 0px;"></p></td>
               </tr>
               <tr>
                  <th>회원이메일</th>
                  <td><input type = "text" name = "userEmail" id = "mypage_email" value = "${user.userEmail }" readonly>
                  <p id = "edit_email" class = "edit" style = "float : right; font-size : 18px; margin-top : 10px; margin-right : 30px;" onclick ="edit('email')">수정하기</p>
                  <p id = "errorEmail" style = "display : none; margin-left : 70px; color : red; font-size : 15px; margin-bottom : 0px;"></p></td>
               </tr>
               <tr>
                  <th>회원정보관리</th>
                  <td class = "mypage_btnTd"><input type="button" id="mypage_deleteBtn" value="탈퇴" class ="userMyPage_deleteBtn"></td>
               </tr>
            </table>
         </form>


      </div>
     
</div>  
</body>
<script>

      
   ///////////// 수정버튼을 눌렀을 경우 //////////////
   function edit(e){ //수정하기 버튼을 눌렀을 경우
      if(e == "pw"){
          $('#mypage_' + e).val("");
      }
          $('#mypage_' + e).focus();
          $('#mypage_' + e).css("border","3px solid red").attr("readonly", false);
          $('#edit_' + e).text("수정완료").attr("id", "edit_" + e + "Ok").attr("onclick", "editOk(" + "'" + e + "'" + ")");
        }
   
   // 유효성검사 정규식
   var nameP =  /^[0-9a-zA-Z가-힣]{2,20}$/;
   var phoneP = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
   var emailP = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
   var birthP = /^[0-9]{8}$/;
   var pwP = /^[A-Za-z0-9]{4,12}$/;
   
   ///////////수정확인 버튼을 눌렀을 경우/////////////
   function editOk(e){ 
       if(e == "name"){
          if(nameP.test($('#userMyPage_name').val())){
             $('#errorName').css("display","none");
             editFinish(e);
          } else{
             console.log(($('#userMyPage_name').val()));
             $('#errorName').show().html("한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
          }
       } else if (e == "phone"){
          if(phoneP.test($('#mypage_phone').val())){
             editFinish(e);
             $('#errorPhone').css("display","none");
             
          } else {
             $('#errorPhone').show().html("형식에맞지 않는 번호입니다.");
          }
       } else if (e == "email"){
          if(emailP.test($('#mypage_email').val())){
             EeditFinish(e);
             $('#errorEmail').css("display","none");   
          } else {
             $('#errorEmail').show().html("이메일 주소를 다시 확인해주세요.");
          }
       } else if (e == "birth"){
          if(birthP.test($('#mypage_birth').val())){
             editFinish(e);
             $('#errorBirth').css("display","none");          
          } else {
             $('#errorBirth').show().html("ex)19931104 의 형식으로 입력하세요.");
          }
       } else if (e == "pw"){
            if(pwP.test($('#mypage_pw').val())){
            editFinish(e);
            $('#erroPw').css("display","none");
            }else {
               $('#errorPw').show().html("4글자이상 12글자 이하로 입력해주세요.")
            }       
         }
   }
   ////////// 수정에서 유효성검사를 통과했을경우 메서드 ///////////
   function editFinish(e){
       $.ajax({
         url : '${pageContext.request.contextPath}' + '/edit'+ e +'.do',
         type : 'post',
         data : $('#mypage_form').serialize(),
            success : function(data){
                console.log(e+"데이터:"+data);
             alert("수정을 완료했습니다.");
             $('#mypage_' + e).css("border","none").attr("readonly", true);
             $('#edit_' + e + 'Ok').text("수정하기").attr("id", "edit_" + e ).attr("onclick", "edit(" + "'" + e + "'" + ")");
            }
         });
   }
   
 
   function EeditFinish(e){
       $.ajax({
         url : '${pageContext.request.contextPath}' + '/edit'+ e +'.do',
         type : 'post',
         data : $('#mypage_form').serialize(),
            success : function(data){
             alert("수정을 완료했습니다. 이메일 인증 후 로그인페이지로 이동하여 다시 로그인해주세요");
             $('#mypage_' + e).css("border","none").attr("readonly", true);
             $('#edit_' + e + 'Ok').text("수정하기").attr("id", "edit_" + e ).attr("onclick", "edit(" + "'" + e + "'" + ")");
             location.href = '${pageContext.request.contextPath}/loginform.do';
            }
         });
   }
   </script>
</html>
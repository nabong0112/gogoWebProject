<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<title>Insert title here</title>
<style type="text/css">

body{
      padding: 0;
      margin: 0;
      background: #ddd;
   }
   .btn{
      margin-top: 10px;
      padding: 1px 90px;

   }
   .container{
      margin:100px auto;
      width: 35%;

   }
   @media(max-width: 952px){
      .container{
         width: 60%;
      }
   }
      @media(max-width: 475px){
      .container{
         width: 80%;
      }
   }
  </style>
</head>
<body>


   <div class="container">
   <div class="row card hoverable">
      <div class="card-content ">
      <h4 class="center blue-text">로그인</h4>
      <form class="row s12">
      <div class="col s12">
         <div class="input-field">
            <input type="text" class="form-control" id="userId" name="userId" placeholder="Username*">
         </div>
      </div>
         <div class="col s12">
         <div class="input-field">
            <input type="password" class="form-control" id="userPw"
                  name="userPw" placeholder="Password*">
            <a href="${pageContext.request.contextPath}/idpwfind.do">&nbsp;
                  아이디 / 비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <a href="${pageContext.request.contextPath}/signform.do">회원가입</a>
         </div>
      </div>
      <div class="form-group">
            <span class="font-weight-bold text-white bg-dark"
               id="spanLoginCheck"></span>
               </div>
      <div class="col s12">
         <p><label><input type="checkbox"></label></p>
      </div>
      <div class="col s12 center">
         <button id="loginBtn" type="button" class="btn btn-large waves-effect waves-light blue">로그인</button>
         <%@ include file="include/naverLogin.jsp" %>
      </div>
   
   </form>
   </div>
   
</div>
   
</div>
</body>
            <script>
$('#loginBtn').click(function() {
      var id = $('#userId').val();
      var pw = $('#userPw').val();
         $.ajax({
         type : 'post',
         url : "<c:url value='/loginck.do'/>",
         data : {
            userId : id,
            userPw : pw,
            },
            success : function(data) {
               if (data == 0) { //로그인 실패시
                  console.log(data);
                  $('#spanLoginCheck').text('로그인 정보를 정확히 입력해주세요.');
               } else if (data == -1) { //인증하지 않았다면?
                  console.log(data);
                  $('#spanLoginCheck').text('이메일 인증을 해주셔야 합니다!');               
               } else { //로그인 성공시
                  console.log(data);
                  location.href = '${pageContext.request.contextPath}/main.do';
               }
            }
         });
      });
</script>
</html>
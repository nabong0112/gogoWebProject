<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/css/mdb.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Righteous&amp;subset=latin-ext" rel="stylesheet">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/js/mdb.min.js"></script>

<title>Insert title here</title>
  <style type="text/css">
  html, div, body,h3{
    margin: 0;
    padding: 0;
  }
  h3{
    display: inline-block;
    padding: 0.6em;
  }
  </style>
</head>
<body>
	<div class="container">
		<div class="area_inputs wow fadeIn">
			<div class="form-group">
				<label class="font-weight-bold text-white" for="inputId">아이디</label>
				<div>
					<input type="text" class="form-control" id="userId" name="userId" placeholder="아이디">
				</div>
			</div>
			<div class="form-group">
				<label class="font-weight-bold text-white" for="inputPassword">비밀번호</label>
				<div>
					<input type="password" class="form-control" id="userPw"
						name="userPw" placeholder="비밀번호">
				</div>
			</div>
			<div class="form-group">
				<span class="font-weight-bold text-white bg-dark"
					id="spanLoginCheck"></span>
			</div>
	
				<div class="interval_height a_none">
					<a href="${pageContext.request.contextPath}/idpwfind.do">&nbsp;
						아이디 / 비밀번호 찾기</a>
				</div>
				<div>
					<button id="loginBtn" type="button"
						class="btn btn-primary btn-block">로그인</button>
				</div>
			</div>
			<div class="form-group">
				<a class="btn btn-deep-orange btn-block"
					href="${pageContext.request.contextPath}/signform.do">회원가입</a>
			</div>
		</div>
		<%@ include file="include/naverLogin.jsp" %>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<link type="text/css" rel="stylesheet" href="/css/egovframework/mainStyle.css">
</head>
<body>
<!-- header ------------------------------------------ -->
	<%@ include file="include/fixingheader.jsp"%>
	<!-- //header -->
	<!-- nav --------------------------------------------- -->
	<%@ include file="include/fixingNav.jsp" %>
	<!-- //nav -->
	  <div align="center" style="line-height: 2.3em">
		<form name="join" action="joinCheck.do" method="post">
			<h3>회원가입</h3>
			<fieldset style="width: 550px">
				<legend>입력사항</legend>
				<label for="userId">아이디 : </label> 
				<input type="text" size="20" id="userId" name="userId" placeholder="4글자 이상 10글자 이하" maxlength="10"><br>
				<label for="loginID">이름 : </label> 
				<input type="text" size="20" id="userName" name="userName" placeholder="2글자 이상 6글자 이하" maxlength="6"><br>
				<label for="userJender">성별</label> 
				<input type="radio" name="userJender" value="Male" checked="checked" /> 남자
				<input type="radio" name="userJender" value="Female" />여자<br>
				<label for="loginPW">비밀번호 :</label> 
				<input type="password" size="20" id="userPw" name="userPw" placeholder="5글자 이상 12글자 이하" maxlength="12"><br>
				<label for="loginPwCheck">비밀번호 확인 :</label> 
				<input type="password" size="20" id="checkPw" name="checkPw" placeholder="비밀번호와 똑같이 입력" maxlength="12"><br>
				<label for="userIdQustion">계정찾기 질문 : </label> 
				<input type="text" size="25" id="userIdQustion" name="userIdQustion" placeholder="계정을 찾을 때 질문을 적어주세요" maxlength="30"><br>	
				<label for="userIdAnswer">답 : </label> 
				<input type="text" size="25" id="userIdAnswer" name="userIdAnswer" placeholder="질문에 맞는 답을 적어주세요" maxlength="20"><br>	
				<input type="button" value="   가입하기   " onclick="javascript:check();">
				<c:if test ="${check eq 'overlepId'}">
						<br><p style="color: red">중복된 아이디입니다! 다른 아이디를 입력해주세요!</p>
				</c:if>
				<br> <b>앗 !</b> 생각해보니 이미 계정이 있으신가요?<a href="login.do"><b>로그인 하러 가기</b></a><br>
				<script type="text/javascript">
				function check() {
				    var form = document.join;
				    if(!form['userId'].value || !form['userPw'].value || !form['checkPw'].value ||!form['userName'].value ) {
				        alert("빈 공간이 있습니다");
				        return false;
				    }else if(form['userPw'].value != form['checkPw'].value){
				    	alert("비밀번호를 정확히 입력해 주십시오");
				    } else{
				    	form.submit();
				    }
				   }
				
				</script>
			</fieldset>
		</form>
	</div>
</body>
</html>
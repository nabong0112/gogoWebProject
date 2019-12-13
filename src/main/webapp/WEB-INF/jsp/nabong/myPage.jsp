<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보</title>
<link type="text/css" rel="stylesheet" href="/css/egovframework/loginStyle.css">
     <link type="text/css" rel="stylesheet" href="/css/egovframework/mainStyle.css">
</head>
<body>
<!-- header ------------------------------------------ -->
	<%@ include file="include/fixingheader.jsp"%>
	<!-- //header -->
	<!-- nav --------------------------------------------- -->
	<%@ include file="include/fixingNav.jsp" %>
	<!-- //nav -->
<form action="updateUser.do" method="post">
<section id="section2">
        <div class="container">
            <div>
                <div>
                    <div class="box">
                        <div class="logo">
                            <h1>내 가입 정보</h1>
                        </div>
                        <table class="type5">
                        	<tbody>
                        		<tr>
                        			<th>가입 날짜 </th>
                        			<td><c:out value="${info.joinTime }"/></td>
                        			<td rowspan="5">
                        		<c:choose>
									<c:when test="${info.userJender == 'Male'}">
										<img width="180px" height="290px" alt="#" src="/images/egovframework/my_Page_Img.png">
									</c:when>
									<c:otherwise>
										<img width="180px" height="290px" alt="#" src="/images/egovframework/my_Page_Img_girl.png">
									</c:otherwise>
								</c:choose>
                        			</td>
                        		</tr>	
                        		<tr>
                        			<th>아이디 </th>
                        			<td><input type="text" name="" id="" value="<c:out value="${info.userId }"/>"></td>
                        		</tr>
                        		<tr>
                        			<th>비밀번호 </th>
                        			<td><input type="text" name="" id="" value=""></td>
                        		</tr>
                        		<tr>
                        			<th>이름 </th>
                        			<td><input type="text" name="" id="" value="<c:out value="${info.userName }"/>"></td>
                        		</tr>
                        		<tr>
                        			<th>성별 </th>
                        			<td><input type="text" name="" id="" value="<c:out value="${info.userJender }"/>"></td>
                        		</tr>
                        		<tr>
                        			<th>질문 </th>
                        			<td><input type="text" name="" id="" value="<c:out value="${info.userIdQustion }"/>"></td>
                        		</tr>
                        		<tr>
                        			<th>답 </th>
                        			<td><input type="text" name="" id="" value="<c:out value="${info.userIdAnswer }"/>"></td>
                        		</tr>
                        	</tbody>
                        </table>
                    </div>
                    <div class="clear"></div>
                    <div class="alert">
                        <h1>계정 설정하기</h1>
                        <p>
                            <button type="submit">수정</button>
                            <button type="button" onclick="deleteUser();">회원 탈퇴</button>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</form>    
<script type="text/javascript">
function deleteUser(){
	jConfirm('회원을 탈퇴하시겠습니까?', function() {
		var options = {
				type : 'post',
				dataType : 'json',
				success : updateNatRuleResultHandler,
				beforeSend : function() {
					$.ncmsLoding.startFullScreen();
				},
				complete : function() {
					$.ncmsLoding.remove();
				},
				error : function(xhr, textStatus, errorThrown) {
					jAlert('오류가 발생하였습니다.');
				}
			};
		$('#natRuleVo').attr('action', '<c:url value="deleteUser.do"/>');
		$('#natRuleVo').ajaxSubmit(options);
	});
	
}

</script>
</body>
</html>
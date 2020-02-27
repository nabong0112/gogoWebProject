<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/css/mdb.min.css" rel="stylesheet">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/js/mdb.min.js"></script>
<script src="http://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>

<%-- <!-- 폰트 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR" rel="stylesheet">
 
<!-- 셀렉트 플러그인 -->
<script src="${pageContext.request.contextPath}/select/select-mania.js"></script>
<link href="${pageContext.request.contextPath}/select/select-mania.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/select/themes/select-mania-theme-red.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/select/themes/select-mania-theme-square.css" rel="stylesheet"> --%>
<style>
 *{
	font-family: 'Noto Sans KR', sans-serif;
	font-family: 'Do Hyeon', sans-serif;
 }
 .navbar-nav li {
   	margin-left: 20px;
   	font-size: 24px;
} 
 
/* {
	font-size: 20px;
	font-family: 'BMHANNAPro';
} */
input{
	font-family: sans-serif;
}
/* modal창 감싸고 있는 배경 Div */
.mypage_deleteModal {
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

.mypage_deleteDiv {
	background-color: #fefefe;
	margin: auto;
	margin-top: 5%;
	padding: 15px;
	border: 1px solid #888;
	border-radius: 20px;
	width: 30%;
	text-align: center;
}
</style>

<script>


 //////////삭제버튼 클릭시 삭제확인 모달창이 뜸///////////
$('#mypage_deleteBtn').click(function(){
	 $('#mypage_deleteModal').show();
});

/////////모달창에서 삭제확인버튼클릭시 로그인페이지로 이동////////
$('#mypage_deleteOkBtn').click(function(){
	 $.ajax({
      url : '${pageContext.request.contextPath}' + '/userdelete.do',
      type : 'post',
      data : $('#mypage_myform').serialize(),
      success : function(data){
         alert("탈퇴처리 되었습니다.");
         location.href = '<%=request.getContextPath()%>'
      }
   });
   $('#mypage_mainModal').hide();
});

/* /////////모달창에서 취소버튼 클릭시 다시 마이페이지이동//////////
$('#mypage_deleteCancelBtn').click(function(){
	 
	 $('#mypage_deleteModal').hide();

});

	//////////모달창 밖의 영역을 누르면 띄워져 있는 모달창을 닫음//////////
$(window).on('click', function() {
   //jquery는 dom 객체를 jquery 객체로 한 번 감싸 리턴하므로 dom 객체를 얻어와야 비교 가능
   if (event.target == $('#mypage_mainModal').get(0)) {
       $('#mypagee_mainModal').hide();
    }
});
$(window).on('click', function() {
   //jquery는 dom 객체를 jquery 객체로 한 번 감싸 리턴하므로 dom 객체를 얻어와야 비교 가능
   if (event.target == $('#mypage_deleteModal').get(0)) {
       $('#mypage_deleteModal').hide();
    }
});
	
//////////닫기버튼을 누르면 수정모달창 닫음//////////
$('#mypage_close').click(function(){
   $('#mypage_mainModal').hide();

});
 */
$(document).ready(function() {
	/////////모///달///기///능///////////
	// 1. 모달창 히든 불러오기
	$('#mypage_deleteBtn').click(function() {
		console.log("modal1");
		$('#mypage_deleteModal').show();
	});
	// 2. 모달창 닫기 버튼
	$('.mypage_deleteCancelBtn').on('click', function() {
		console.log("modal2");
		$('#mypage_deleteModal').hide();
	});
	// 3. 모달창 윈도우 클릭 시 닫기
	$(window).on('click', function() {
		console.log("modal3");
		if (event.target == $('#mypage_deleteModal').get(0)) {
            $('#mypage_deleteModal').hide();   
         }
	});	
});

</script>
<body>
		<div id = "mypage_deleteModal" class = "mypage_deleteModal">
   			<div class = "mypage_deleteDiv"><p>정말 탈퇴하시겠습니까?</p>
   				<input type = "button" id = "mypage_deleteOkBtn" class = "mypage_deleteOkBtn" value = "탈퇴하기">
   				<input type = "button" id = "mypagee_deleteCancelBtn" class = "mypage_deleteCancelBtn" value = "취소하기">
   			</div>
   		</div>

</body>
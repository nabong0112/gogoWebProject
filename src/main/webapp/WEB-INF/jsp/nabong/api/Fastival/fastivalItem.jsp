<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title></title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=x1s1s82sfg"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=x1s1s82sfg&submodules=geocoder"></script>
<title>Insert title here</title>
<style type="text/css">
.button {

    width:100px;

    background-color: #1b5ac2;

    border: none;

    color:#fff;

    padding: 15px 0;

    text-align: center;

    text-decoration: none;

    display: inline-block;

    font-size: 15px;

    margin: 4px;

    cursor: pointer;

}
</style>
</head>
<body>
<div class="info" style="width:50%; border : 1px solid #1b5ac2;min-width: 800px;background-color: white;" align="center"; >
		<table style="text-align: center;">
		<thead>
			<tr>
				<th colspan="2">축제 상세 정보</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>이름</td>
			</tr>
			<tr>
				<td><c:out value="${fastivalItem.title}"></c:out></td>
			</tr>
			<tr>
				<td>개최 장소</td>
			</tr>
			<tr>
				<td><c:out value="${fastivalItem.openPlace}"></c:out></td>
			</tr>
			<tr>
				<td>개최 기간</td>
			</tr>
			<tr>
				<td><c:out value="${fastivalItem.opnStrtDt}"></c:out>~<c:out value="${fastivalItem.opnEndDt}"></c:out></td>
			</tr>
			<tr>
				<td>전화번호</td>
			</tr>
			<tr>
				<td><c:out value="${fastivalItem.tel}"></c:out></td>
			</tr>
			<tr>
				<td>설명</td>
			</tr>
			<tr>
				<td><c:out value="${fastivalItem.content}"></c:out></td>
			</tr>
			<tr>
				<td>관련 링크</td>
			</tr>
			<tr>
				<td><c:out value="${fastivalItem.homepageUrl}"></c:out></td>
			</tr>
		</tbody>
	</table>
</div>
<input type="button" class="button" value="뒤로가기" onclick="history.back(-1);">
</body>
</html>
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
<div id="map1" style="width: 50%; height: 400px; min-width: 800px"></div>
<div class="info" style="width:50%; border : 1px solid #1b5ac2;min-width: 800px" align="center" >
	<table style="text-align: center;" >
		<thead>
			<tr>
				<th colspan="2">음식점 상세 정보</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>이름</td>
				<td><c:out value="${foodItem.name}"></c:out></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><c:out value="${foodItem.addr1}"></c:out>,<c:out value="${foodItem.addr2}"></c:out></td>
			</tr>
			<tr>
				<td>영업 시간</td>
				<td><c:out value="${foodItem.openTime}"></c:out> ~ <c:out value="${foodItem.closeTime}"></c:out></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><c:out value="${foodItem.telCode}"></c:out>-<c:out value="${foodItem.telKuk}"></c:out>-<c:out value="${foodItem.telNo}"></c:out></td>
			</tr>
			<tr>
				<td>설명</td>
				<td><c:out value="${foodItem.contents1}"></c:out></td>
			</tr>
			<tr>
				<td>대표메뉴</td>
				<td><c:out value="${foodItem.title}"></c:out></td>
			</tr>
		</tbody>
	</table>
	<table style="text-align: center;">
			<tr>
				<td>오시는 길(자동차)</td>
			</tr>
			<tr>
				<td><c:out value="${foodItem.ownerDriver}"></c:out></td>
			</tr>
			<tr>
				<td>오시는 길(대중교통)</td>
			</tr>
			<tr>
				<c:choose>
					<c:when test="${foodItem.publicTraffic1 ne null}">
						<td><c:out value="${foodItem.publicTraffic1}"></c:out></td>
						<td><c:out value="${foodItem.publicTraffic2}"></c:out></td>
					</c:when>
					<c:otherwise>
						<td>해당 내용이 존재하지 않습니다.</td>
					</c:otherwise>
				</c:choose>
			</tr>
	</table>
</div>
<script>
var add = "${foodItem.addr1}";
var map = new naver.maps.Map('map1', {
    center: new naver.maps.LatLng(37.3595704, 127.105399),
    zoom: 18
});
naver.maps.Service.geocode({address: add}, function(status, response){
	if(status !== naver.maps.Service.Status.OK){
		return alert(add + '에러');
	}
	var result = response.result;
	var myaddr1 = new naver.maps.Point(result.items[0].point.x,result.items[0].point.y);
	map.setCenter(myaddr1); //검색된 좌표로 지도 이동
	//마커 표시
	var marker = new naver.maps.Marker({
	    position: new naver.maps.Point(result.items[0].point.x,result.items[0].point.y),
	    map: map
	});
});
</script>	
</body>
</html>
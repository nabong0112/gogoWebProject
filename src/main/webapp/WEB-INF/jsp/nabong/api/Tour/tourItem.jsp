<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>        
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=x1s1s82sfg"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=x1s1s82sfg&submodules=geocoder"></script>
<title>상세 정보</title>
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
<body bgcolor="#ffffff">
<div id="map1" style="width: 50%; height: 400px; min-width: 800px"></div>
<div class="info" style="width:50%; border : 1px solid #1b5ac2;min-width: 800px;background-color: white;" align="center"; >
	<table style="text-align: center;" >
		<thead>
			<tr>
				<th colspan="2">관광지 상세 정보</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>이름</td>
				<td><c:out value="${tourItem.name}"></c:out></td>
			</tr>
			<tr>
				<td>영업시간</td>
				<td><c:out value="${tourItem.openTime}"></c:out> ~ <c:out value="${tourItem.closeTime}"></c:out></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><c:out value="${tourItem.addr1}"></c:out>,<c:out value="${tourItem.addr2}"></c:out></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><c:out value="${tourItem.telCode}"></c:out>-<c:out value="${tourItem.telKuk}"></c:out>-<c:out value="${tourItem.telNo}"></c:out></td>
			</tr>
			<tr>
				<td>설명</td>
			</tr>
			<tr>
				<td><c:out value="${tourItem.contents1}"></c:out></td>
			</tr>
			<tr>
				<td>관련 링크</td>
				<td><c:out value="${tourItem.homepage}"></c:out></td>
			</tr>
			<tr>
				<td>오시는 길(대중교통)</td>
			</tr>
			<tr>
				<td><c:out value="${tourItem.publicTraffic1}"></c:out></td>
				<td><c:out value="${tourItem.publicTraffic2}"></c:out></td>
			</tr>
		</tbody>
	</table>
</div>
	<input type="button" class="button" value="뒤로가기" onclick="history.back(-1);">
<script>
var add = "${tourItem.addr1}";
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
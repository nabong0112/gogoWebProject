<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=x1s1s82sfg"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=x1s1s82sfg&submodules=geocoder"></script>
<title>Insert title here</title>
</head>
<body>
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
				<td><c:out value="${lodgingItem.name}"></c:out></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><c:out value="${lodgingItem.addr1}"></c:out>,<c:out value="${lodgingItem.addr2}"></c:out></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><c:out value="${lodgingItem.telCode}"></c:out>-<c:out value="${lodgingItem.telKuk}"></c:out>-<c:out value="${lodgingItem.telNo}"></c:out></td>
			</tr>
			<tr>
				<td>설명</td>
				<td><c:out value="${lodgingItem.contents1}"></c:out></td>
			</tr>
			<tr>
				<td colspan="2">오시는 길(대중교통)</td>
			</tr>
			<tr>
				<td><c:out value="${lodgingItem.publicTraffic1}"></c:out></td>
				<td><c:out value="${lodgingItem.publicTraffic2}"></c:out></td>
			</tr>
		</tbody>
	</table>
</div>
<script>
var add = "${lodgingItem.addr1}";
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
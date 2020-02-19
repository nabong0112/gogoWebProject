<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<%@ include file="api/include/naverMap.jsp"%>
<div id="map" style="width:100%;height: 350px"></div>
		${foodItem.name}<br>
		${foodItem.foodSeq} <br>
		${foodItem.addr1} <br>
		${foodItem.addr2} <br>
		${foodItem.openTime} <br>
		${foodItem.closeTime} <br>
		${foodItem.telKuk}
	
</body>
</html>
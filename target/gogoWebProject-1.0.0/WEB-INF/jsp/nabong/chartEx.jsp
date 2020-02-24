<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Step 1) Load D3.js -->
<script src="https://d3js.org/d3.v5.min.js"></script>

<!-- Step 2) Load billboard.js with style -->
<script src="/css/egovframework/billboard.js"></script>

<!-- Load with base style -->
<link rel="stylesheet" href="/css/egovframework/billboard.css">

<!-- Or load different theme style -->
<link rel="stylesheet" href="/css/egovframework/insight.css">
</head>
<body>
<div id="dataName"></div>
</body>
<script type="text/javascript">
var chart = bb.generate({
	  data: {
	    columns: [
		["data1", 30, 200, 100, 400, 150, 250],
		["data2", 50, 20, 10, 40, 15, 25]
	    ],
	    names: {
	      data1: "남자",
	      data2: "여자"
	    }
	  },
	  bindto: "#dataName"
	});
</script>
</html>
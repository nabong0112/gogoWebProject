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
<script type="text/javascript">
var total="${total}";
var today="${today}";
var male="${jender.totalMale}";
var female="${jender.totalFemale}";
var dayArr = new Array();
var day = "${chart[2].start}" + "~" + "${chart[2].end}";
var day2 ="${chart[3].start}" + "~" + "${chart[3].end}";
var day3 ="${chart[4].start}" + "~" + "${chart[4].end}";
var day4 ="${chart[5].start}" + "~" + "${chart[5].end}";
var day5 ="${chart[6].start}" + "~" + "${chart[6].end}";
var chart = bb.generate({
	 size: {
		    height: 240,
		    width: 900
		  },
	  data: {
	    x: "x",
	    columns: [
		["x", day, day2, day3, day4, day5],
		["총 방문자 수", ${chart[0].count}, ${chart[0].count + chart[1].count}, ${chart[0].count + chart[1].count + chart[2].count}, 
			${chart[0].count + chart[1].count + chart[2].count + chart[3].count}, ${chart[0].count + chart[1].count + chart[2].count + chart[3].count + chart[4].count}],
		["주간 별 방문자 수", ${chart[0].count}, ${chart[1].count}, ${chart[2].count}, ${chart[3].count}, ${chart[4].count}]
	    ],
	    groups: [
	      [
	    	  "총 방문자 수",
	        "주간 별 방문자 수"
	      ]
	    ],
	    type: "bar"
	  },
	  axis: {
	    x: {
	      type: "category"
	    }
	  },
	  background: {
		    class: "myBgClass",
		    imgUrl: "https://www.djjunggu.go.kr/upload/kr/_main_swap/kr_main_swap_0_1581136279.jpg"
		  },
	  bindto: "#categoryData"
	});
	</script>
</body>
</html>
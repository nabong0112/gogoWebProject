<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대전의 역사</title>
<style type="text/css">
.button {
    width:50%;
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
    float: left;
}
table.type1 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    margin: 20px 10px;
}
table.type1 th {
    width: 155px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #0099ff ;
}
table.type1 td {
    width: 155px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #eee;
}
</style>
</head>
<body bgcolor="#ffffff">
<table class="type1">
    <thead>
    <tr>
        <th scope="cols">소개해유</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>대전역사</th>
    </tr>
        <tr>
        <td>축제</th>
    </tr>
        <tr>
        <td>시티투어</th>
    </tr>
    </tbody>
</table>
	<div>
		<input type="button" class="button" value="조선시대 대전의 역사 ▽" onclick="javascript:josunDaejeon();">
		<div id="josunDaejeon" style="display: none; float: left; line-height: 2em; ">
			<img alt="조선시대의 대전" src="/images/egovframework/조선시대 대전.jpg" align="left">
			<div>
				<h2 style="color: blue;">조선시대의 대전</h2>
				조선시대에 들어 회덕군/진잠군으로 개칭되었다.<br> 현 대전 중심부는 고려시대부터 조선시대까지는
				공주목(公州牧)에 속한 작은 농촌이었고, 조선 초기부터 '한밭'을 한자로 옮긴<br> <b>'대전(大田)'</b>이라는
				지명이 등장하면서 지금까지 쓰이고 있다.<br> 한때 '태전(太田)'으로도 불렸다는 속설이 있었으나,
				실제로 태전은 1904년에 처음 등장한 명칭으로, 근대에 잠깐 사용되다 사라진 지명이다.<br> 다만 등장한
				시대가 현재와 비교적 가까운 시기이다보니, 80대 이상의 어르신들은 종종 태전이라고도 부르곤 한다.
			</div>
		</div>
		<input type="button" class="button" value="일제시대 대전의 역사 ▽" onclick="javascript:iljaeDaejeon();">
		<div id="iljaeDaejeon" style="display: none; float:left;  position:inherit; line-height: 2em;">
			<img alt="일제강점기의 대전" src="/images/egovframework/일제강점기 대전.jpg" align="left">
			<div>
				<h2 style="color: blue;">일제강점기의 시대의 대전</h2>
				대전의 역사를 바꾸어놓은 것은 1900년에 확정된 경부선 철도 노선이었다.<br> 
				1904년 공주군 산내면 대전리에 대전역이 설치된 이후로 인구가 유입되고 도시화가 시작되었으며<br> 
				1906년 산내면이 회덕군에 편입됨과 동시에 회덕군청 역시 기존 회덕읍내에서 대전시가지로 이전하였다.<br> 
				단순히 기차역이 있던 동네 이름인 '대전'이 기존 고을 이름인 '회덕'을 대신해 새로운 고을 이름으로 채택된 것이다. 
				이 때 대전역 일대의 시가지(중구 은행동, 동구 정동, 중동, 원동, 인동)를 '대전면'으로, <br>
				그 외곽지역을 '외남면'으로 대전면을 둘러싸는 도넛 모양으로 편제했다.1917년 내남면이 회덕면으로 개칭되었다. <br>
				대전은 계속 성장하여 충청권의 중심 도시가 되었고, 1931년 대전군 대전면이 대전읍으로 승격되었다. <br>
				1932년에는 공주에 있던 충청남도청이 대전으로 이전되었다.<br>
				1935년 대전군 대전읍이 대전부(大田府)로 승격됨으로서 본격적인 도시로서의 역사가 시작되었다. <br>
				이 때 대전군의 잔여 지역은 대덕군(大德郡)으로 개칭되었다. <br>
				'대'전과 회'덕'에서 한 글자씩 따서 지은 것. 1940년 대덕군의 외남면과 유천면 일부를 대전부에 편입하였다. <br>
				대전역부터 구 충청남도청까지의 중앙로를 카스가초도리(春日町通)라고 불렸으며,<br>
				대전역에서 목척교 일대가 카스가초 잇초메(春日町一丁目), 은행동이 카스가초 니초메(春日町二丁目), <br>
				선화동이 카스가초 산초메(春日町三丁目)라고 불렸다. <br>
				구 충청남도청이 완성되자, 카스가초 니초메와 산초메의 땅값이 급격히 오르며 고급주택가가 형성되었다고 한다.<br>
			</div>
		</div>
		<input type="button" class="button" value="대한민국 대전의 역사 ▽" onclick="javascript:koreaDaejeon();">
		<div id="koreaDaejeon" style="display: none; float: left; line-height: 2em;">
			<img alt="대한민국의 대전1" src="/images/egovframework/대한민국 대전.jpg" align="left">
			<img alt="대한민국의 대전2" src="/images/egovframework/대한민국 대전2.jpg" align="left">
			<img alt="대한민국의 대전3" src="/images/egovframework/대한민국 대전3.jpg" align="left">
				<h2 style="color: blue;">대한민국 시대의 대전</h2>
				첫번째 사진은 1945년 8.15 해방 당시 대전부와 대덕군의 행정구역 상황.<br>
				1949년 대전부를 대전시로 개칭하고, 1950년 북한군이 서울이 점령하자 매우 짧은 기간동안 임시수도가 되기도 했다. <br>
				7월 14일부터 20일까지 미 24사단이 지연전을 수행하다 심각한 피해를 입은 대전 전투의 와중에 시가지가 심하게 파괴되었기 때문에<br>
				현재의 대전시는 한국전쟁 이전의 모습을 찾기 쉽지 않다. 결국 북한군은 7월 20일 대전을 점령했다.<br>
				1963년 대덕군 유천면 전역, 산내·회덕면의 각 일부를 편입하여 대전시의 영역이 확장되었다.<br>
				1973년 대덕군 북면과 유성면이 각각 신탄진읍과 유성읍으로 승격되었고, <br>
				1977년에는 대전시에 구제(區制)가 실시되어 중구와 동구의 2개 구가 설치되었다.<br>
				1983년 대덕군 유성읍과 회덕면 전역, 탄동·구즉·진잠·기성면 각 일부를 편입하여 대전시의 영역이 확장되었다.  <br>
				이때 대덕군은 2쪽으로 나뉘어진 상태로 1989년 대덕군 폐지 및 대전직할시 승격 때까지 이어졌다.  <br>
				직할시 승격 직전인 1988년에는 중구에서 서구가 분구되었다. 1989년 대덕군을 폐지하고,  <br>
				대전시에 병합하여 통합된 충청남도 대전시가 대전직할시로 승격되었다.  <br>
				동시에 서구에서 유성구가, 동구에서 대덕구가 분구되어 현재의 5구 체제가 완성되었다.
			</div>
		</div>
	<script type="text/javascript">
function josunDaejeon() {
	if(document.getElementById('josunDaejeon').style.display == "none"){
		document.getElementById('josunDaejeon').style.display = "block";
	} else{
		document.getElementById('josunDaejeon').style.display = "none";
	}
}
function iljaeDaejeon() {
	if(document.getElementById('iljaeDaejeon').style.display == "none"){
		document.getElementById('iljaeDaejeon').style.display = "block";
	} else{
		document.getElementById('iljaeDaejeon').style.display = "none";
	}
}
function koreaDaejeon() {
	if(document.getElementById('koreaDaejeon').style.display == "none"){
		document.getElementById('koreaDaejeon').style.display = "block";
	} else{
		document.getElementById('koreaDaejeon').style.display = "none";
	}
}
	
</script>
</body>
</html>
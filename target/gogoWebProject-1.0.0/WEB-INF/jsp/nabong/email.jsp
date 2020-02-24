<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<span style="color:green; font-weight:bold;">이메일인증</span> <br> <br>

<div style="text-align:center;">
<tr>
<td>

<form action="mail.do" method="post">
<br>
<div>
이메일:<input type="email" name="email"
placeholder="이메일주소입력해">
</div>
<br> <br>
<button type="submit" name="submit"> 이메일 인증받아라"</button>
</form>
</td>
</tr>

</div>
</body>
</html>

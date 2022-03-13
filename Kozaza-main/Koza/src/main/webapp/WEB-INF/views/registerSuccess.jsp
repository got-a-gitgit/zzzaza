<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Koza! 환영합니다</title>
</head>
<body>
<div style="margin: 100px;">
		<a><img src="${pageContext.request.contextPath}/img/Koza.png"	style="height: 100px; height: 150px; margin-left: 10px;" /></a> <br>
		<br>
		<h3>안녕하세요, ${param.user_id} 님</h3>
		<br>
		<p>환영합니다!</p>
		<br>
		<p>회원가입이 정상적으로 이루어 졌습니다.</p>
		<br>
		<p>로그인 하시면 홈페이지 내의 모든 서비스를 이용하실 수 있습니다.</p>
		<br> <a href="${pageContext.request.contextPath}/loginForm">로그인 페이지로 이동하기</a>
	</div>



</body>
</html>
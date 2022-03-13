<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kozaza! 회원 가입을 해 주세요</title>
<style>
#wrap_box {
	width: 420px;;
	height: auto;
	margin: auto;
	text-align: center;
}

#logo {
	width: 360px;
	height: 260px;
	margin-left: 30px;
	margin-right: 30px;
	margin-bottom: -25px;
}
</style>

</head>
<body>
	<!--네비 바-->
	<div id="nav-placeholder">
		<jsp:include page="navbar.jsp" flush="false" />
	</div>
	<!--네비 바 끝-->
	<article id="wrap_box">
		<a href="./"><img src=".\img\Koza.png" id="logo"></a>
		<p>
			<b>안녕하세요 Kozaza입니다.</b><br> <br> 강등 회원은 해당 서비스를 이용하실 수
			없습니다.<br> <br> 강등관련 문의 사항이 있으신 분은<br> <br>
			semp1048@korea.ac.kr이나<br> <br> ahae91@yonsei.ac.kr로 연락 주시면
			감사하겠습니다.
		</p>
		<a href="./">홈으로</a>
	</article>
</body>


</body>
</html>
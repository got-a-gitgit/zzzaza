<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kozaza! 회원 인증을 해 주세요</title>
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
			<b>안녕하세요 Kozaza입니다.</b><br>
			<br> 해당 서비스는 인증된 회원만 할 수 있는 서비스입니다.<br>
			<br> 가입하실 때 기입하신 메일을 확인해 주세요<br>
			<br> (메일이 안 보일 시 스팸 메일함을 확인해 주세요.)
		</p>
		<a href="./">홈으로</a>
	</article>
</body>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한이 없습니다.</title>
<style>
#wrap_box {
	width: 420px;;
	height: auto;
	margin: auto;
	text-align : center;
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
		<p>페이지 접근 권한이 없습니다.</p>
		<a href="./">홈으로 돌아가기</a>
	</article>

</body>
</html>
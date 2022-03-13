<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>후기 작성</title>
<style>
#middle {
	margin-left: 280px;
	margin-top: 18px;
	width: 100%;
	height: 900px;
	float: left;
	position: absolute;
}

.container {
	margin-left: -15px;
}

body {
    padding-top: 45px;
}
</style>

</head>
<body>

	<!--네비 바-->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand active" href="./">KOZAZA</a>
			</div>


			<c:choose>

				<c:when test="${!empty sessionData}">
					<ul class="nav navbar-nav navbar-right">
					<c:if test="${sessionData.memberRank == '운영자'}">
						<li><a href="./adminsPage">관리 페이지</a></li>
					</c:if>
						<li><a href='#'><strong>${sessionData.nick }님</strong></a></li>
						<li><a href="./PostBoard">후기 열람</a></li>
						<li><a href="./mypage">My Page</a></li>
						<li><a href="./logoutAction"
							onclick="document.getElementById('id01').style.display='block'"
							style="width: auto;"><span
								class="glyphicon glyphicon-log-out"></span> Logout</a></li>
					</ul>
				</c:when>

				<c:otherwise>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="./PostBoard">후기 열람</a></li>
						<li><a href="./registerForm"> <span class="glyphicon glyphicon-user" ></span> Sign Up</a></li>
						<li><a href="./loginForm"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
	</nav>
	<!--네비 바 끝-->

<!-- 	include loginModal-->

<!-- 	<div id="nav-placeholder"> -->
<%-- 		<jsp:include page="loginForm.jsp" flush="false"/> --%>
<!-- 	</div> -->

<!-- 	<!--include registerModal-->
<!-- 	<div id="nav-placeholder"> -->
<%-- 		<jsp:include page="registerForm.jsp" flush="false"/> --%>
<!-- 	</div> -->


</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
        #wrap_box{
            width:  420px;;
            height: auto;
            margin: auto;
            text-align : center;
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

		<p>안녕하세요<br>
		관리자 페이지 입니다.</p>
		<table class="table table-hover text-center">

			<thead style="background-color: rgb(255, 204, 122); text-align:left">
				<tr>
					<th scope="col"></th>
					<th scope="col">오늘</th>
					<th scope="col">어제</th>
					<th scope="col">증감</th>
				</tr>
			</thead>
			<tbody style="text-align:left">
				<tr>
					<td>회원 수</td>
					<td>${dailyData.currentMemberCount }</td>
					<td>${dailyData.yesterdayMemberCount }</td>
					<td>${dailyData.memberChanged }</td>
				</tr>
				<tr>
					<td>게시글 수</td>
					<td>${dailyData.currentContentCount }</td>
					<td>${dailyData.yesterdayContentCount }</td>
					<td>${dailyData.contentChanged }</td>
				</tr>
			</tbody>

		</table>

		<a href="./adminMemberForm">회원 관리&nbsp;&nbsp;</a> <a href="./adminContentForm">&nbsp;&nbsp;글 관리</a>
	</article>
</body>


</body>
</html>
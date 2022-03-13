<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 페이지</title>

<style>
#wrap_box {
	width: auto;
	height: auto;
	margin-left : 20px;
	text-align: center;
	align-content: center;
}
</style>
</head>


<body>
	<!--네비 바-->
		<div id="nav-placeholder">
			<jsp:include page="navbar.jsp" flush="false"/>
		</div>
	<!--네비 바 끝-->
		<article id="wrap_box">
	<div class="container">
		<form action="./adminMemberRankChangeProcess" method="post">
			<table class="table table-hover text-center">

				<thead style="background-color: rgb(255, 204, 122)">
					<tr>
						<th scope="col">선택</th>
						<th scope="col">회원 번호</th>
						<th scope="col">회원 닉네임</th>
						<th scope="col">회원 아이디</th>
						<th scope="col">회원 등급</th>
						<th scope="col">회원 포인트</th>
						<th scope="col">회원 이메일</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="member" items="${memberData }">
						<tr style="cursor: pointer;" id="readPostForm">
							<td><input type="checkbox" name="memberID"
								value=${member.memberID } /></td>
							<td>${member.memberIndex }</td>
							<td>${member.memberNick }</td>
							<td>${member.memberID }</td>
							<td>${member.memberRank }</td>
							<td>${member.memberPoint }</td>
							<td>${member.memberEmail }</td>
						</tr>
					</c:forEach>

				</tbody>

			</table>
			<input type="submit" name="changeType" id="right_content" value="강등" style="float:right">
			<input type="submit" name="changeType" id="right_content" value="인증" style="float:right">
		</form>
		<div class="container">
			<div class="row">
				<div class="col">
					<form class="form-inline mt-3 justify-content-center" method="get"
						action="./adminMemberForm">
						<select class="custom-select my-1 mr-sm-2" style="width: 15%"
							name="searchTarget">
							<option selected value="회원 닉네임">회원 닉네임</option>
							<option value="회원 아이디">회원 아이디</option>
							<option value="회원 번호">회원 번호</option>
							<option value="회원 등급">회원 등급</option>
						</select>
						<input type="text" class="form-control w-25" name="searchWord"
							placeholder="검색할 내용을 입력하세요">
						<button type="submit" class="btn btn-lg text-light ml-3"
							style="background-color: chocolate; width: 20%">검색</button>
					</form>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-12">
					<a href="./writePostForm"><button type="button"
							style="background-color: rgb(143, 86, 48); color: white"
							class="btn btn-lg btn-block mt-3" id="writePostForm">글쓰기</button></a>
				</div>
			</div>
		</div>

	</div>
	</article>
</body>
</html>
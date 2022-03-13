<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kozaza! 개인 스크랩 페이지입니다</title>
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
	
		<form action="./adminContentDeleteProcess"  method="post">
			<table class="table table-hover text-center" style="table-layout: fixed">

				<thead style="background-color: rgb(255, 204, 122)">
					<tr>
						<th scope="col" style="width: 5%; text-align:center">선택</th>
						<th scope="col" style="width: 10%; text-align:center">게시글 번호</th>
						<th scope="col" style="width: 10%; text-align:center">게시글 종류</th>
						<th scope="col" style="width: 25%; text-align:center">게시글 제목</th>
						<th scope="col" style="width: 40%; text-align:center">게시글 내용</th>
						<th scope="col" style="width: 10%; text-align:center">작성자 닉네임</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="content" items="${contentData }">
						<tr id="readPostForm">
							<td style="width: 5%;"><input type="checkbox"
								name="contentIndexes" value=${content.contentIndex } /></td>
							<td onclick="location.href='./readPostForm?contentIndex='+${content.contentIndex }" style="cursor: pointer; width: 10%;">${content.contentIndex }</td>
							<td onclick="location.href='./readPostForm?contentIndex='+${content.contentIndex }" style="cursor: pointer; width: 10%;">${content.contentType }</td>
							<td onclick="location.href='./readPostForm?contentIndex='+${content.contentIndex }" style="cursor: pointer; width: 10%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${content.contentTitle }</td>
							<td onclick="location.href='./readPostForm?contentIndex='+${content.contentIndex }" style="cursor: pointer; width: 10%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${content.contentContent }</td>
							<td onclick="location.href='./readPostForm?contentIndex='+${content.contentIndex }" style="cursor: pointer; width: 10%;">${content.memberNick}</td>
						</tr>
					</c:forEach>

				</tbody>

			</table>
			<input type="submit" name="changeType" onclick="button_event()" value="삭제">
		</form>
		<div class="btn-toolbar justify-content-center bg-warning"
			role="toolbar" aria-label="Toolbar with button groups">
			<div class="btn-group mr-2" role="group" aria-label="First group">
				<button type="button" class="btn btn-danger">&laquo;</button>
				<button type="button" class="btn btn-danger">1</button>
				<button type="button" class="btn btn-danger">2</button>
				<button type="button" class="btn btn-danger">3</button>
				<button type="button" class="btn btn-danger">4</button>
				<button type="button" class="btn btn-danger">&raquo;</button>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col">
					<form class="form-inline mt-3 justify-content-center" method="post"
						action="./adminContentForm">
						<select class="custom-select my-1 mr-sm-2" style="width: 15%"
							name="searchTarget">
							<option selected value="제목">제목</option>
							<option value="내용">내용</option>
							<option value="게시글 종류">게시글 종류</option>
							<option value="작성자">작성자</option>
						</select> <input type="text" class="form-control w-25" name="searchWord"
							placeholder="검색할 내용을 입력하세요">
						<button type="submit" class="btn btn-lg text-light ml-3"
							style="background-color: chocolate; width: 20%">검색</button>
					</form>
				</div>
			</div>
		</div>

	</div>
	</article>
</body>
</html>
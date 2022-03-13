<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#menu_bar {
	border: 1px solid black;
	/*             width: 900px; */
	height: 150px;
	background-color: rgb(255, 206, 133);
}

.menu {
	width: 24%;
	height: 150px;
	float: left;
	border-right: 0.5px dotted gray;
	text-align: center;
	margin: auto;
	padding-top: 10px;
	font-size: 12px;
	cursor: pointer;
}

#content {
	margin-top: 20px;
	width: 900px;
	height: 900px;
	float: left;
}

/*회원정보수정*/
#info {
	padding: 20px 180px 50px 180px;
}

.input_box {
	height: 90px;
}
/*회원정보수정 끝*/
.genre_wrap {
	margin-top: 5px;
	padding: 15px 15px 15px 15px;
	border: 0.5px grey;
	border-style: dashed;
	font-size: 18px;
	border-radius: 0.5px;
}

#buttons {
	margin-top: 10px;
	float: right;
}

#wrap_box {
	width: auto;
	height: auto;
	margin-left: 20px;
	text-align: center;
	align-content: center;
}
/*링크 텍스트*/
a:link {
	text-decoration: none;
	color: grey;
}

a:visited {
	text-decoration: none;
	color: grey;
}

a:active {
	text-decoration: none;
	color: grey;
}
</style>
    <script>
            function change_page(num) {
                if (num == '1') {
                    document.getElementById("info").style.display = "";
              
					document.getElementById("mywrite").style.display = "none";
							document.getElementById("wishlist").style.display = "none";
							document.getElementById("mymovie").style.display = "none";
						} else if (num == '2') {
							document.getElementById("info").style.display = "none";
							document.getElementById("mywrite").style.display = "";
							document.getElementById("wishlist").style.display = "none"
							document.getElementById("mymovie").style.display = "none";

						} else if (num == '3') {
							document.getElementById("info").style.display = "none";
							document.getElementById("mywrite").style.display = "none";
							document.getElementById("wishlist").style.display = "";
							document.getElementById("mymovie").style.display = "none";
						} else {
							document.getElementById("info").style.display = "none";
							document.getElementById("mywrite").style.display = "none";
							document.getElementById("wishlist").style.display = "none";
							document.getElementById("mymovie").style.display = "";
						}
					}
				</script>
<title>Kozaza! 마이페이지</title>
</head>
<body>
	<!--네비 바-->
		<div id="nav-placeholder">
			<jsp:include page="navbar.jsp" flush="false"/>
		</div>
	<!--네비 바 끝-->
  <!--메뉴 바 시작-->
	<div id="menu_bar">
		<div class="menu" name="search_total" onclick="change_page(1)">
			<div class="icon">
				<img src=".\img\changeInfo.png" width="50px" height="50px;">
			</div>
			<h6>회원정보수정</h6>
			보완을 위해<br> 주기적으로 변경해주세요!
		</div>
		<div class="menu" name="search_total" onclick="change_page(2)">
			<div class="icon">
				<img src=".\img\writing.png" width="50px" height="50px;">
			</div>
			<h6>내가 쓴 글</h6>
			내가 쓴 글만 보고 싶다면?

		</div>
		<div class="menu" name="search_total" onclick="change_page(3)">
			<div class="icon">
				<img src=".\img\wish.png" width="50px" height="50px;">
			</div>
			<h6>위시리스트</h6>
			보고싶은 영화들을 <br>한눈에 보고 싶다면?
		</div>
		<div class="menu" name="search_total" onclick="change_page(4)">
			<div class="icon">
				<img src=".\img\movie.png" width="50px" height="50px;">
			</div>
			<h6>My Movie설정</h6>
			장르 취향이 바뀌었다면?
		</div>
	</div>
		<!--메뉴 끝 시작-->
		<!--메뉴 내용 시작-->
	<div id="content">
		<!--회원정보 수정 누를 시 나타날 화면-->
		<form action="./mypageAction" method="post">
			<c:if test="${sessionData.user_id != null }">
				<div id="info" style="display: none;">
					<div class="input_box">
						<label for="id">아이디</label><br> <input type="text"
							class="form-control" name="memberId" id="id"
							value="${sessionData.user_id }" disabled>
					</div>
					<div class="input_box">
						<label for="pw">비밀번호</label><br> <input type="password"
							class="form-control" name="memberPw" id="pw"><br>
					</div>
					<div class="input_box">
						<label for="name">이름</label><br> <input type="text"
							class="form-control" name="memberName" id="name"
							value="${member.memberName }" disabled>
					</div>
					<div class="input_box">
						<label for="nick">닉네임</label><br> <input type="text"
							class="form-control" name="memberNick" id="nick"
							value="${sessionData.nick}">
					</div>
					<div class="input_box">
						<label for="phone">연락처</label><br>
						<div class="row">
							<!--<select class="form" name="phone1" id="phone">
                                <option>010</option>
                                <option>011</option>
                                <option>012</option>
                            </select>-->
						</div>
						<input type="tel" class="form-control" name="memberPhone"
							id="phone" width="100px" placeholder="'-' 없이 입력해주세요">
					</div>
					<div class="input_box">
						<label for="email">이메일</label><br> <input type="email"
							class="form-control" name="memberEmail" id="email">
					</div>

					<div class="row">
						<div class="col-6">
							<button type="submit" class="btn btn-warning btn-block"
								value="submit">변경</button>
						</div>
						<div class="col-6">
							<button type="submit" class="btn btn-danger btn-block"
								value="submit">취소</button>
						</div>
					</div>
				</div>
			</c:if>
		</form>
		<!--회원정보 수정 누를 시 나타날 화면 끝-->
		<!--내가 쓴 글 확인하기-->
		<div class="container">
			<article id="wrap_box">
				<div id="mywrite" style="display: none;">
					<table class="table table-hover text-center"
						style="table-layout: fixed">

						<thead style="background-color: rgb(255, 204, 122)">
							<tr>
								<th scope="col" style="width: 5%; text-align: center">선택</th>
								<th scope="col" style="width: 10%; text-align: center">게시글
									번호</th>
								<th scope="col" style="width: 10%; text-align: center">게시글
									종류</th>
								<th scope="col" style="width: 25%; text-align: center">게시글
									제목</th>
								<th scope="col" style="width: 40%; text-align: center">게시글
									내용</th>
								<th scope="col" style="width: 10%; text-align: center">작성자
									닉네임</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="myContent" items="${myContentData }">
								<tr id="readPostForm">
									<td style="width: 5%;"><input type="checkbox"
										name="contentIndexes" value=${myContent.contentIndex } /></td>
									<td
										onclick="location.href='./readPostForm?contentIndex='+${myContent.contentIndex }"
										style="cursor: pointer; width: 10%;">${myContent.contentIndex }</td>
									<td
										onclick="location.href='./readPostForm?contentIndex='+${myContent.contentIndex }"
										style="cursor: pointer; width: 10%;">${myContent.contentType }</td>
									<td
										onclick="location.href='./readPostForm?contentIndex='+${myContent.contentIndex }"
										style="cursor: pointer; width: 10%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${myContent.contentTitle }</td>
									<td
										onclick="location.href='./readPostForm?contentIndex='+${myContent.contentIndex }"
										style="cursor: pointer; width: 10%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${myContent.contentContent }</td>
									<td
										onclick="location.href='./readPostForm?contentIndex='+${myContent.contentIndex }"
										style="cursor: pointer; width: 10%;">${myContent.memberNick}</td>
								</tr>
							</c:forEach>

						</tbody>

					</table>

				</div>
			</article>
		</div>

		<!--내가 쓴 글 확인하기 끝-->
			<!--위시리스트-->
		<div class="container">
			<article id="wrap_box">
				<div id="wishlist" style="display: none;">
					<table class="table table-hover text-center"
						style="table-layout: fixed">

						<thead style="background-color: rgb(255, 204, 122)">
							<tr>
								<th scope="col" style="width: 5%; text-align: center">선택</th>
								<th scope="col" style="width: 10%; text-align: center">게시글
									번호</th>
								<th scope="col" style="width: 10%; text-align: center">게시글
									종류</th>
								<th scope="col" style="width: 25%; text-align: center">게시글
									제목</th>
								<th scope="col" style="width: 40%; text-align: center">게시글
									내용</th>
								<th scope="col" style="width: 10%; text-align: center">작성자
									닉네임</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="content" items="${contentData }">
								<tr id="readPostForm">
									<td style="width: 5%;"><input type="checkbox"
										name="contentIndexes" value=${content.contentIndex } /></td>
									<td
										onclick="location.href='./readPostForm?contentIndex='+${content.contentIndex }"
										style="cursor: pointer; width: 10%;">${content.contentIndex }</td>
									<td
										onclick="location.href='./readPostForm?contentIndex='+${content.contentIndex }"
										style="cursor: pointer; width: 10%;">${content.contentType }</td>
									<td
										onclick="location.href='./readPostForm?contentIndex='+${content.contentIndex }"
										style="cursor: pointer; width: 10%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${content.contentTitle }</td>
									<td
										onclick="location.href='./readPostForm?contentIndex='+${content.contentIndex }"
										style="cursor: pointer; width: 10%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${content.contentContent }</td>
									<td
										onclick="location.href='./readPostForm?contentIndex='+${content.contentIndex }"
										style="cursor: pointer; width: 10%;">${content.memberNick}</td>
								</tr>
							</c:forEach>

						</tbody>

					</table>

				</div>
			</article>
		</div>

		<!--위시리스트 끝-->

			<!--메뉴 내용 끝-->


		</div>
</body>
</html>
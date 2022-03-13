<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDIwfP0fdhKOtQXGWMcu7LxUJmdmImFnLw&libraries=places"></script>


	<title>Kozaza! 원룸과 하숙집 정보의 메카!</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}

body{
	background-color: rgb(248, 248, 248);
  	}

#header_part{
	grid-area : header;
	padding-left : 30px;
}

#imgButton_part{
	gird-area : imgButton;
	padding-left : 30px;
}
#paragraph_part{
	grid-area : paragraph;
	padding-left : 30px;
}


/*grid 템플릿 설정*/
#grid_container {
	display: grid;
/* 	background-color: rgb(248, 248, 248); */


}

#text_template_part{
	display: grid;
	grid : 'header' 'imgButton' 'paragraph';
}
.imgButton{
width : 50px;
height : 50px;
}

#nickname{
padding-top:5px;
padding-bottom:10px;
font-size : 20px
}

#text_paragraph{
font-size : 18px;
min-height: 200px
}




#logo_part{
text-align: center;
grid-area : logo;
background-color: rgb(248,248,248);
}

#box1{
display: inline;
}


.imgButton{
width : 50px;
height : 50px;
}
	</style>

</head>
<body>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

		  <!--네비 바-->
			<div id="nav-placeholder">
			<jsp:include page="navbar.jsp" flush="false"/>
			</div>
		<!--네비 바 끝-->

	    <div class="grid_container">
	    <!-- 로고 -->
	      <div id="logo_part" class="gird_contents">
            <span id="box1">
            <a href="./"><img src=".\img\Koza_Grey.png" id="logo"></a>
            </span>
        	</div>

		<a href="./PostBoard" style="float: right;">
			<button type="button" id="PostBoard" class="btn btn-sm"
			style="background-color: #A9A9A9; color: white;">게시글 더 보기
			</button>
		</a>
		<br><br>
		<c:forEach var="boardData" items="${boardDataList }" varStatus="status">
		<div id="text_template_part" class="grid_container" style="border:3px solid grey;">
    		<!-- header 시작 :제목, 닉네임, 작성일, 스크랩, 글수정, 글삭제, 조회수, 추천수-->
			<div id="header_part" class="grid-contents">
				<hr style="background-color: rgb(248, 233, 27)">
				 <!--추천수  -->
		 		<span style="float:right; margin-right :10px;">
				추천수:${boardData.contentVO.contentRecommend }
				</span>

				<div>
					<!--살아봤어요 + 글제목 -->
					<h3>[${contentTypeStringList[status.index]}] ${boardData.contentVO.contentTitle }</h3>
				</div>

				<div>
					<!-- 닉네임 + 게시일 -->
					<div id = "nickname">
	  				${boardData.contentVO.memberNick} &nbsp;&nbsp;
		 		    ${boardData.contentVO.contentWritedate}
		 		</div>

				</div>
				<hr style="background-color: rgb(248, 248, 248)">

			</div>

			<!-- header 끝 -->

			<!-- image button 시작 -->

			<div id="imgButton_part" class="grid-contents">
						<c:choose>
							<c:when test="${boardData.rateVO.rateBug==true}">
								<img src=".\img\bug_true.png" class="imgButton">
							</c:when>
							<c:otherwise>
								<img src=".\img\bug_false.png" class="imgButton">
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${boardData.rateVO.rateNoise==true}">
								<img src=".\img\noise_true.png" class="imgButton">
							</c:when>
							<c:otherwise>
								<img src=".\img\noise_false.png" class="imgButton">
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${boardData.rateVO.rateLeak==true}">
								<img src=".\img\leak_true.png" class="imgButton">
							</c:when>
							<c:otherwise>
								<img src=".\img\leak_false.png" class="imgButton">
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${boardData.rateVO.rateFungi==true}">
								<img src=".\img\fungi_true.png" class="imgButton">
							</c:when>
							<c:otherwise>
								<img src=".\img\fungi_false.png" class="imgButton">
							</c:otherwise>
						</c:choose>

			<hr style="background-color: rgb(248, 233, 27)">
			</div>
			<!-- image button 끝 -->

			<!--본문 내용 -->
			<div id="paragraph_part" class="grid-contents">
				<!--글 내용 위치-->
				<p id =text_paragraph >${boardData.contentVO.contentContent }</p>

			</div>
				<hr style="background-color: rgb(248, 248, 248)">
			</div>
			
			</c:forEach>
		<a href="./PostBoard" style="float: right;">
			<button type="button" id="PostBoard" class="btn btn-sm"
			style="background-color: #A9A9A9; color: white;">게시글 더 보기
			</button>
		</a>
			
		</div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>




</html>

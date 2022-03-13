<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<title>Kozaza! 안암지역 원룸, 하숙 정보 게시판</title>
<script>
	var replyCnt = 0;
	</script>
<style>


#writeRow_part{
	padding-left : 30px;
	margin-bottom : 15px;
	background-color : gray;
	grid-area: bar;
}

#list_part{
	grid-area:list;
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

#like_part{
	grid-area : like;
	padding-left : 30px;
	padding-top: 20px;
	padding-bottom: 20px;
	background-color : #A9A9A9;
}
#comment_display_part{
	grid-area : commentDisplay;
	padding-left : 30px;
}
#comment_part{
	grid-area : comment;
	padding-left : 30px;
}
/*grid 템플릿 설정*/
.grid-container {
	display: grid;
	grid: 'bar' 'list' 'header' 'imgButton' 'paragraph' 'like' 'commentDisplay' 'comment';

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

#commentWriter, #commentText{
font-size : 20px
}


</style>
<script type="text/javascript"
		src="http://code.jquery.com/jquery-latest.min.js"></script>


</head>

<body>


		<!--네비 바-->
		<div id="nav-placeholder">
			<jsp:include page="navbar.jsp" flush="false" />
		</div>
		<!--네비 바 끝-->

		<!--중앙 시작-->
		<div class="grid-container">

			<div id="writeRow_part" class="grid-contents">
				<!--후기 열람 바 -->
				<h2>후기 열람</h2>
			</div>

			<!-- 목록으로 돌아가기 -->
			<span id="list_part" class="grid-contents">
					<!-- 목록으로 돌아가기 -->
							<a href="./PostBoard" style="float: right;"><button type="button" id="PostBoard"
									class="btn btn-sm"
									style="background-color: #A9A9A9; color: white;">목록으로
									돌아가기</button></a>
				</span>

			<!-- header 시작 :제목, 닉네임, 작성일, 스크랩, 글수정, 글삭제, 조회수, 추천수 -->
			<div id="header_part" class="grid-contents">
				<hr style="background-color: rgb(248, 233, 27)">
				<div>
					<!-- 글 제목 -->
					<h3>[${contentTypeString}] ${boardData.contentVO.contentTitle }</h3>
				</div>

				<div>
					<!-- 닉네임, 게시일 -->
					<div id = "nickname">
	  				${boardData.contentVO.memberNick} &nbsp;&nbsp;
		 		    ${boardData.contentVO.contentWritedate}
		 		    </div>

				<span class="buttons">

				<!-- 스크랩 -->
				<button id="scrap_button" type="button" class="btn btn-sm"
				style="background-color: #A9A9A9; color :white;">
				스크랩</button>


					<!--글 수정 및 삭제 버튼-->
						<c:if
							test="${sessionData.nick == boardData.contentVO.memberNick }">
							<form action="./updatePostForm" style="display:inline">
									<input type="hidden" name="contentIndex" value="${boardData.contentVO.contentIndex}"/>
									<input type="hidden" name="contentType" value="${boardData.contentVO.contentType}"/>
									<input type="hidden" name="contentTitle" value="${boardData.contentVO.contentTitle}"/>
									<input type="hidden" name="memberIndex" value="${boardData.contentVO.memberIndex}"/>
									<input type="hidden" name="memberNick" value="${boardData.contentVO.memberNick}"/>
									<input type="hidden" name="contentContent" value="${boardData.contentVO.contentContent}"/>
									<input type="hidden" name="contentWritedate" value="${boardData.contentVO.contentWritedate}"/>
									<input type="hidden" name="contentCount" value="${boardData.contentVO.contentCount}"/>
									<input type="hidden" name="houseIndex" value="${boardData.contentVO.houseIndex}"/>
									<input type="hidden" name="contentRecommend" value="${boardData.contentVO.contentRecommend}"/>
									<input type="hidden" name="contentReplyNum" value="${boardData.contentVO.contentReplyNum}"/>
									<input type="hidden" name="contentRoomNum" value="${boardData.contentVO.contentRoomNum}"/>
									<button	type="submit" class="btn btn-sm" style="background-color: #05445E; color: white;">글 수정</button>
								</form>
								<a
									href="./deletePostAction?contentIndex=${boardData.contentVO.contentIndex}"><button
										type="button" class="btn btn-sm"
										style="background-color: #a0d2ba; color: white;">글
										삭제</button></a>
						</c:if>

				</span>

				<!-- 조회수, 추천수 -->
		 		    <span style="float:right; margin-right :10px;">
					조회수:${boardData.contentVO.contentCount } &nbsp;&nbsp;
					추천수:${boardData.contentVO.contentRecommend }
					</span>
			</div>
				<hr style="background-color: rgb(248, 233, 27)">

			</div>
			<!-- header 끝 -->
			<!-- image button 시작 -->
			<script>

			</script>
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

			<!--본문 내용-->
			<div id="paragraph_part" class="grid-contents">
				<!-- 글 내용 -->
				<p id =text_paragraph >${boardData.contentVO.contentContent }</p>

			</div>
				<hr style="background-color: rgb(248, 233, 27)">

			<!--좋아요-->
			<div id="like_part" class="grid-contents" style="text-align:center;">
				<span style=" display: inline-block;">
				<i class="fas fa-thumbs-up fa-lg "
				style="cursor: pointer; color: #a0d2ba" id="thumbs_up_icon" >
				<span id="thumbs_up">&nbsp;&nbsp;좋아요!</span>
				</i></span>

			</div>
			<hr  style="background-color: rgb(248, 233, 27)">

			<!-- 댓글 띄우는 부분인듯 -->
			<div id= comment_display_part>
					<c:forEach var="replyData" items="${replyList}" varStatus="status">
						<script>
							replyCnt++;
						</script>
						<div id="reply_content_Box" style="min-height: 100px">
							<div>
							<div id="commentWriter">작성자:${replyData.memberNick} 작성일:${replyData.replyWritedate}</div>
							<div id="commentText">${replyData.replyContent}</div>
							<hr style="background-color: rgb(248, 233, 27)">
							</div>
						</div>
						<div id="replyUpdateDiv${status.index }">
							<form id="replyUpdateForm${status.index}"
								action="./updateReplyAction" method="post"></form>
						</div>
					</c:forEach>
			</div>

			<!--댓글 -->
			<div id="comment_part" class="grid-contents">
				<form method="POST" action="./replyContentAction">
				<c:if test="${sessionData.nick != null }">
				<div class="row form-group mb-3" id="reply_box">
					<div class="col-10 form-group">
						<textarea name="replyContent" rows="5" style="resize: none"
						class="form-control flex-auto mt-3 mb-2"
						placeholder="댓글 내용을 입력하세요."></textarea>
						<input type="hidden" name="contentIndex"
						value="${param.contentIndex}">
						<input type="hidden" name="memberNick"
						value="${sessionData.nick}">
					</div>

					<div class="col-2 form-group mt-4 mb-2">
						<button type="submit" class="btn btn-lg btn-block" style="background-color: #D4F1F4">작성완료</button>
					</div>
				</div>
				</c:if>
			</form>
			</div>
	</div>

			<script>
            $(document).ready(function(){
        		$("#thumbs_up_icon").on('click',function(){
        			$.ajax({
        				url: "./thumbsupProcess",
                        type: "POST",
                        dataType: "text",
                        data: {
                            contentIndex: ${boardData.contentVO.contentIndex},
                            memberID: '${sessionData.user_id}'
                        },
                        success: function (result) {
                        	alert(result);
                        }
        			})
        		})

        		$("#scrap_button").on('click',function(){
        			$.ajax({
        				url: "./scrapProcess",
                        type: "POST",
                        dataType: "text",
                        data: {
                            contentIndex: ${boardData.contentVO.contentIndex},
                            memberID: '${sessionData.user_id}'
                        },
                        success: function (result) {
                        	alert(result);
                        }
        			})
        		})



                $("#toggle_reply_form").click(function(){
                    $("#reply_box").slideToggle("fast");
                    $(this).toggleClass("text-warning bg-warning text-white");
                });
                $(this).on("contextmenu dragstart selectstart",function(e){
                return false;
                });

                //목록으로
                $("#PostBoard").click(function(){

        			$("#middle").load("./PostBoard");
        			});
            });
        </script>
		<!--중앙 끝-->


		<script>
    		$(document).ready(function(){
    			var link= document.location.href; // 현재접속 url
    			var tab = link.split("/").pop();
    			console.log(tab);
    			$(tab).trigger("click");
    		});
    </script>

		<script src="https://kit.fontawesome.com/f3b5a4f329.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
			integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
			integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
			crossorigin="anonymous"></script>

</body>
</html>

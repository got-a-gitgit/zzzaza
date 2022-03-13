<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Kozaza! 방 정보 게시판</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    	<style>


      #writeRow_part{
      	padding-left : 20px;
      	padding-top : 1px;
      	padding-bottom : 1px;
      	margin-top : 60px;
      	margin-bottom : 30px;
      	background-color : gray;
      }
	#writePostForm{
 		float: right;
		}
	#paging_part, #search_part{
	magin-left : auto;
	magin-right : auto;
	text-align : center;
	}

	#nav_page{
	display: inline;
	}

	#table_part{
	margin_top:20px;
	}
</style>

    </head>
    <body>
    	<!--네비 바-->
		<div id="nav-placeholder">
			<jsp:include page="navbar.jsp" flush="false"/>
		</div>
	    <!--네비 바 끝-->
          <!--방정보 게시판 -->
          <div id="writeRow_part" class="page-header">
         	  <h1>방정보 게시판</h1>
          </div>

              <div id="upperButton_part">
                  <a href="./writePostForm"><button type="button" style="background-color: #A9A9A9; color: white" class="btn btn-sm mt-3" id="writePostForm">글쓰기</button></a>
             </div>



             <div id="table_part">
            <table class="table table-hover text-center">
                    <thead style="background-color: #a0d2ba">
                      <tr>
                        <th scope="col" style="text-align:center";>글 번호</th>
                        <th scope="col" style="text-align:center">제목</th>
                        <th scope="col" style="text-align:center">작성자</th>
                        <th scope="col" style="text-align:center">작성일</th>
                        <th scope="col" style="text-align:center">조회수</th>
                        <th scope="col" style="text-align:center">추천수</th>
                      </tr>
                    </thead>
                    <tbody>

	                     <c:forEach var="boardData" items="${boardDataList }">
								<tr style="cursor: pointer;" onclick="location.href='./readPostForm?contentIndex='+${boardData.contentVO.contentIndex }" id="readPostForm">
									<td>${boardData.contentVO.contentIndex }</td>
									<td>${boardData.contentVO.contentTitle } [${boardData.contentVO.contentReplyNum}]</td>
									<td>${boardData.memberVO.memberNick }</td>
									<td>${boardData.contentVO.contentWritedate }</td>
									<td>${boardData.contentVO.contentCount }</td>
									<td>${boardData.contentVO.contentRecommend }</td>
								</tr>
						</c:forEach>

                    </tbody>
                  </table>
                  </div>

                    <div id="lowerButton_part">
                            <a href="./writePostForm"><button type="button" style="background-color: #A9A9A9 ; color: white" class="btn btn-sm mt-3" id="writePostForm">글쓰기</button></a>
                    </div>

				 	<div id="paging_part">
          <nav aria-label="Page navigation" id="nav_page">
            <ul class="pagination">
              <li>
                <a href="#" aria-label="Previous" style="background-color : #D4F1F4">
                  <span aria-hidden="true" >&laquo;</span>
                </a>
              </li>
              <li><a href="#" style="background-color : #D4F1F4">1</a></li>
              <li><a href="#" style="background-color : #D4F1F4">2</a></li>
              <li><a href="#" style="background-color : #D4F1F4">3</a></li>
              <li><a href="#" style="background-color : #D4F1F4">4</a></li>
              <li><a href="#" style="background-color : #D4F1F4">5</a></li>
              <li>
                <a href="#" aria-label="Next"style=" background-color : #D4F1F4">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
          </nav>


                    <div id="search_part">

                            <form class="form-inline mt-3 justify-content-center" method="post" action="./PostBoard">
                                <select class="custom-select my-1 mr-sm-2" style="width: 15%" name="searchTarget">
                                  <option selected value="제목">제목</option>
                                  <option value="내용">내용</option>
                                  <option value="제목+내용">제목+내용</option>
                                  <option value="작성자">작성자</option>
                                </select>
                                  <input type="text" class="form-control w-25" name="searchWord" placeholder="검색할 내용을 입력하세요">
                                  <button type="submit" class="btn btn-lg text-light ml-3" style="background-color: #05445E; color: white">검색</button>
								</form>
                        </div>
                      </div>

                    </div>
			</div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>

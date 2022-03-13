<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Koza! 공지사항</title>
        <style>
    		.container{
    			
    			margin-left: -15px;
    		}
    	</style>
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    </head>
    <body>
        <div class="container">
            <table class="table table-hover text-center">
                <thead class="bg-danger text-white">
                  <tr>
                    <th scope="col">글 번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">작성일</th>
                    <th scope="col">조회수</th>
                    <th scope="col">추천수</th>
                  </tr>
                </thead>
                <tbody>
                  <tr class="cursor">
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                    <td>0</td>
                    <td>0</td>
                  </tr>
                  <tr class="cursor">
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td>0</td>
                    <td>0</td>
                  </tr>
                  <tr class="cursor">
                    <th scope="row">3</th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                    <td>0</td>
                    <td>0</td>
                  </tr>
                  <tr class="cursor">
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                    <td>0</td>
                    <td>0</td>
                  </tr>
                  <tr class="cursor">
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td>2</td>
                    <td>0</td>
                  </tr>
                  <tr class="cursor">
                    <th scope="row">3</th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                    <td>5</td>
                    <td>0</td>
                  </tr>
                </tbody>
              </table>
                <div class="btn-toolbar justify-content-center bg-danger" role="toolbar" aria-label="Toolbar with button groups">
                    <div class="btn-group mr-2" role="group" aria-label="First group">
                      <button type="button" class="btn btn-warning">&laquo;</button>
                      <button type="button" class="btn btn-warning">1</button>
                      <button type="button" class="btn btn-warning">2</button>
                      <button type="button" class="btn btn-warning">3</button>
                      <button type="button" class="btn btn-warning">4</button>
                      <button type="button" class="btn btn-warning">&raquo;</button>
                    </div>
                </div>
                  <div class="row">
                    <div class="col">
                        <form class="form-inline mt-3 justify-content-center" method="GET" action="">
                            <select class="custom-select my-1 mr-sm-2" style="width: 15%">
                              <option selected>제목</option>
                              <option value="1">내용</option>
                              <option value="2">제목+내용</option>
                              <option value="3">작성자</option>
                            </select>
                              <input type="text" class="form-control w-25" placeholder="검색할 내용을 입력하세요">
                              <button type="submit" class="btn btn-lg text-light ml-3" style="background-color: chocolate; width: 20%">검색</button>
                        </form>    
                    </div>
                  </div>
                  <div class="row justify-content-center">
                      <div class="col-12">
                          <a href="#writePostForm"><button type="button" style="background-color: rgb(143, 86, 48); color: white" class="btn btn-lg btn-block mt-3" id="writePostForm">글쓰기</button></a>
                      </div>
                  </div>
                
          </div>
          
          <script>
	        $(document).ready(function(){
				$("#writePostForm").click(function(){
		
				$(".container").load("./writePostForm");
				});
			});
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
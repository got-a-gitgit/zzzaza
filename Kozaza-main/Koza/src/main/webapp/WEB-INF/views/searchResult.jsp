<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link href="resources/css/bootstrap_litera.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    </head>
    <body>
        <div class="container-fluid mt-3">
            <div class="row">
                <div class="col justify-content-center text-center">
                    <a href="./"><img src="./img/Koza.png" style="width: 270px; height: 200px"></a>
                </div>
            </div>
            <div class="row">
                <div class="col text-center">
                    <nav class="navbar navbar-light bg-warning" style="position: sticky; top:0px">
                        <h4 class="text-white">검색결과</h4>
                        <form class="form-inline w-75" action="./searchResult" method="post" id="searchForm">
                            <select class="custom-select" name="searchTarget">
                                <option value="movieNm">제목</option>
                                <option value="synopsis">줄거리</option>
                                <option value="genreAlt">장르</option>
                                <option value="actor">배우</option>
                                <option value="directors">감독</option>
                            </select>
                            <input class="form-control mr-sm-2 w-50 ml-2" type="search" placeholder="검색할 내용을 입력하세요" aria-label="Search" name="searchWord">
                            <button class="btn btn-lg btn-danger my-2 my-sm-0 ml-2" type="button" onclick="checksearchWord()">&nbsp;검색&nbsp;</button>
                        </form>
                    </nav>
                </div>
            </div>
        </div>
        
            <hr class="bg-warning">
        <div class="container-fluid">
            <div class="row mt-3">
                <div class="col">
                    <h3 class="font-weight-light mb-5" style="font-family: -apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,'Helvetica Neue',Arial,'Noto Sans',sans-serif,'Apple Color Emoji','Segoe UI Emoji','Segoe UI Symbol','Noto Color Emoji'">SearchResult</h3>
                </div>
            </div>
            <c:forEach items="${movie}" var="movie" begin="0" end="9">
            <div class="row justify-content-center">
                <div class="col-10">

                    <div class="card mb-3" style="cursor: pointer;" onclick="location.href='./movieInfo?movieCd=${movie.movieCd}'">
                        <div class="row no-gutters">
                            <div class="col-1-auto">
                                <img src="${movie.imgUrl}" class="card-img" alt="..." style=" height: 100%">
                            </div>
                            <div class="col-11-auto">
                                <div class="card-body">
                                    <h5 class="card-title">${movie.movieNm }</h5>
                                    <p class="card-text">
                                    	개봉날짜 : ${movie.openDt }<br>
										영화종류 : ${movie.genreAlt }<br>
										영화길이 : ${movie.showTime }분<br>
										감독 : ${movie.directors }<br>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            </c:forEach>
            
        </div>
        <script type="text/javascript">
        function checksearchWord(){
			
			
			var searchWord = document.getElementById("searchWordInput").value;
			
			var checkSearchWord = searchWord.split(" ");
			
			if(searchWord == ""){
				alert("검색어를 입력하세요");
				return;
			}
			document.getElementById("searchForm").submit();
			
		}
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
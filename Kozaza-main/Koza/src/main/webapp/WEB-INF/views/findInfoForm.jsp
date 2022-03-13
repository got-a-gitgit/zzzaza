<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link href="resources/css/bootstrap_litera.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
    <title>Kozaza! 아이디/비밀번호 찾기</title>  
    <style>
        body{
            background-color: rgb(253, 253, 253);
        }
        
        p{
            font-family: 맑은 고딕;
        }
        #findIdnPw_box{
            width: 400px;
            height: auto;
            margin: auto;
            
            
        }

        .sub_title{
            color: grey;
        }

        .form-group{
            color: grey;
		}
		
		#logo{
            width: 300px;
			height: 220px;
			margin-top: -20px;
            margin-left: 30px;
            margin-right: 25px;
        }

    </style>

    <script>
    //체크 버튼에 따라 아이디/비밀번호 기능이 달라진다
	function search_check(num) {
		if (num == '1') {
			document.getElementById("searchP").style.display = "none";
			document.getElementById("searchI").style.display = "";	
		} else {
			document.getElementById("searchI").style.display = "none";
			document.getElementById("searchP").style.display = "";
		}
    }
    
	// 아이디 & 스토어 값 저장하기 위한 변수
	// 아이디 값 받고 출력하는 ajax
	var idSearch_click = function(){
		console.log("findId호출됨");
		
		// 이름과 전화번호 입력 양식에 입력된 값 가져오기
		var memberName = document.getElementById("memberName").value;
		var memberPhone = document.getElementById("memberPhone").value;
		
		// AJAX 호출
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.open("post", "./findId", true);
		xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xmlhttp.send("memberName="+memberName+"&memberPhone="+memberPhone);
		
		xmlhttp.onreadystatechange = function(){
			
			// readyState==4는 요청한 처리가 완료되어 응답할 준비도 완료 200은 서버에 문서가 있음
			if(xmlhttp.readyState==4 && xmlhttp.status == 200){
				var alertText = JSON.parse(xmlhttp.responseText);
				console.log(alertText);
				
				if (alertText.memberID != null){
					
					alert("회원님의 아이디는 \[ " + alertText.memberID + " \] 입니다");
					
				}else{
					
					alert("입력하신 정보와 일치하는 데이터가 없습니다.");
				}
			}
		}
	}

	var pwSearch_click = function(){
		console.log("pwSearch_click호출됨");
		
		// 아이디와 이메일 입력 양식에 입력된 값 가져오기
		var memberID = document.getElementById("memberID").value;
		var memberEmail = document.getElementById("memberEmail").value;
		
		// AJAX 호출
		var xmlhttp2 = new XMLHttpRequest();
		
		xmlhttp2.open("post", "./findPw", true);
		xmlhttp2.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xmlhttp2.send("memberID="+memberID+"&memberEmail="+memberEmail);
		
		xmlhttp2.onreadystatechange = function(){
			
			// readyState==4는 요청한 처리가 완료되어 응답할 준비도 완료 200은 서버에 문서가 있음
			if(xmlhttp2.readyState==4 && xmlhttp2.status == 200){
				var alertText2 = JSON.parse(xmlhttp2.responseText);
				console.log(alertText2);
				
				if (alertText2.memberPW != null){
					
					alert("회원님의 비밀번호는 \[ " + alertText2.memberPW + " \] 입니다");
					
				}else{
					
					alert("입력하신 정보와 일치하는 데이터가 없습니다.");
				}
			}
		}
	}
	
    </script>

</head>
<body>
	<%@include file = "userSearch.jsp" %>
    <article id="findIdnPw_box">
			<a href="./"><img src=".\img\Koza.png" id="logo"></a>
            <div class="sub_title">
					<h3>아이디/비밀번호 찾기</h3>
					<p>인증된 이메일만 정보 찾기가 가능합니다 :)</p>
                </div><br>
                
                <!--radio box-->
                <div style="margin-bottom: 10px;" class="custom-control custom-radio custom-control-inline">
                <input type="radio" class="custom-control-input" id="find_id" name="search_total" onclick="search_check(1)" checked="checked">
                <label class="custom-control-label font-weight-bold"	for="find_id">아이디 찾기</label>
            </div>
            <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" class="custom-control-input" id="find_pw" name="search_total" onclick="search_check(2)"> 
                <label class="custom-control-label font-weight-bold" for="find_pw">비밀번호 찾기</label>
            </div>
            <!--아이디 찾기-->
            <div id="searchI">
					<div class="form-group">
						<label class="font-weight-bold text-grey" for="memberName">이름</label>
						<div>
							<input type="text" class="form-control" id="memberName" name="memberName" placeholder="이름">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-grey" for="memberPhone">휴대폰번호</label>
						<div>
							<input type="text" class="form-control" id="memberPhone" name="memberPhone" placeholder="ex) 01012345678">
						</div>
					</div><br>
					<div class="form-group">
						<button type="button" id="searchBtn" onclick="idSearch_click()" class="btn btn-primary btn-block" >확인</button>
					<a class="btn btn-secondary btn-block"	href="loginForm">취소</a><!--취소 누르면 다시 로그인 페이지로-->
					</div>
                </div>
                
                
                
                

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">아이디 찾기 결과</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

                <!--비밀번호 찾기 선택 시 나타날 화면-->
				<div id="searchP" style="display: none;">
					<div class="form-group">
						<label class="font-weight-bold text-grey" for="memberID">아이디</label>
						<div>
							<input type="text" class="form-control" id="memberID" name="memberID" placeholder="아이디">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-grey" for="memberEmail">이메일</label>
						<div>
							<input type="email" class="form-control" id="memberEmail" name="memberEmail" placeholder="ex) E-mail@korea.ac.kr">
						</div>
					</div><br>
					<div class="form-group">
						<button id="searchBtn2" type="button" onclick="pwSearch_click()" class="btn btn-primary btn-block">확인</button>
					<a class="btn btn-secondary btn-block"	href="loginForm">취소</a> <!--취소 누르면 다시 로그인 페이지로-->
				</div>
				</div>
			</div>
		</div>
	</div>













    </article>
        
        





<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
<html>
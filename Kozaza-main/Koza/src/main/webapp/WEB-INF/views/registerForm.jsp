<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kozaza! 회원가입 페이지입니다</title>
	<link href="resources/css/bootstrap_litera.css" rel="stylesheet" type="text/css">

	<style>
        body{
            background-color:  rgb(253, 253, 253);
        }
        #register_box{
            width: 420px;
            height: auto;
            margin: auto;

        }

        .btn overlap{
            margin-right: 0px;
            margin-top: 10px;
        }

        .input_box{
            width: 420px;
            height: 120px;
        }

        .genre_wrap{
            border: 1px solid grey;
            border-style:dotted;
            font-size: 15px;

        }

        #logo{
                width: 360px;
                height: 260px;
                margin-left: 30px;
                margin-right: 30px;
                margin-bottom: -10px;
            }
/*       .modal { */
/*         		  display: none; /* Hidden by default */ */
/*         		  position: fixed; /* Stay in place */ */
/*         		  z-index: 1; /* Sit on top */ */
/*         		  left: 0; */
/*         		  top: 0; */
/*         		  width: 100%; /* Full width */ */
/*         		  height: 100%; /* Full height */ */
/*         		  overflow: auto; /* Enable scroll if needed */ */
/*         		  background-color: rgb(0,0,0); /* Fallback color */ */
/*         		  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */ */
/*         		  padding-top: 60px; */
/*         		} */

      .register_background{
                width:  480px;;
                height: auto;
                margin: auto;
                background-color: rgb(253, 253, 253)
            }
</style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	function confirmNick(){
		console.log("confirmNick 호출됨");

		var nick = document.getElementById("nick").value;

		var xmlhttp = new XMLHttpRequest();

		xmlhttp.open("post", "./isExistedNick", true);
		xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

		xmlhttp.send("memberNick=" + nick);

		// 호출 후 값을 받았을 때 처리 로직
		xmlhttp.onreadystatechange = function(){

			// readyState==4는 요청한 처리가 완료되어 응답할 준비도 완료 200은 서버에 문서가 있음
			if(xmlhttp.readyState==4 && xmlhttp.status == 200){

				//alert(xmlhttp.responseText);
        //ID의 result와 변수명이 겹쳐서 resultForNick으로 바꿔주었다.
				var resultForNick = JSON.parse(xmlhttp.responseText);


				//로직 처리 및 UI 처리
				var result_boxForNick = document.getElementById("result_boxForNick");

				if(resultForNick.exist == true){
					//alert("이미 존재하는 아이디입니다.");
					result_boxForNick.style.color = "red";
					result_boxForNick.innerText="이미 존재하는 닉네임입니다.";
					$("#register_btn").prop("disabled",true);

				}else{
					result_boxForNick.style.color="green";
					result_boxForNick.innerText="사용 가능한 닉네임 입니다."
						$("#register_btn").prop("disabled",false);
				}

					//alert("사용 가능한 아이디 입니다.");
				}

		};

	}
	function confirmID(){
		console.log("confirmID 호출됨");

		// ID 입력 양식에 입력된 값 가져오기
		var id = document.getElementById("input_ID").value;

		// AJAX 호출...
		var xmlhttp = new XMLHttpRequest();

		xmlhttp.open("post", "./isExistedID", true);
		xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

		xmlhttp.send("memberID=" + id);

		// 호출 후 값을 받았을 때 처리 로직
		xmlhttp.onreadystatechange = function(){

			// readyState==4는 요청한 처리가 완료되어 응답할 준비도 완료 200은 서버에 문서가 있음
			if(xmlhttp.readyState==4 && xmlhttp.status == 200){

				//alert(xmlhttp.responseText);
				var result = JSON.parse(xmlhttp.responseText);


				//로직 처리 및 UI 처리
				var result_box = document.getElementById("result_box");

				if(result.exist == true){
					//alert("이미 존재하는 아이디입니다.");
					result_box.style.color = "red";
					result_box.innerText="이미 존재하는 아이디입니다.";
					$("#register_btn").prop("disabled",true);

				}else{
					result_box.style.color="green";
					result_box.innerText="사용 가능한 아이디 입니다."
						$("#register_btn").prop("disabled",false);
				}

					//alert("사용 가능한 아이디 입니다.");
				}

		};


	}

	// 정규식
  // /patter/modifiers;
  //   /i: case-insensitive matching
  //test(). test for a match in a string. Return true or false
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9]{4,12}$/; // a~z, 0~9로 시작하는 4~12자리 아이디를 만들 수 있음
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/;  // A~Z, a~z, 0~9로 시작하는 4~12자리 비밀번호를 설정할 수 있음
	// 이름 정규식
	var nameJ = /^[가-힣]{2,6}$/; // 가~힣, 한글로 이뤄진 문자만으로 2~6자리 이름을 만들수있음
	// 이메일 검사 정규식
	// 특수문자 가능 밑 중앙에 @ 필수, .뒤에 2~3글자 필요
	var mailJ = /^[0-9a-zA-Z]([-_0-9a-zA-Z]*)@korea\.ac\.kr$/i;
	var mailJ2 = /^[0-9a-zA-Z]([-_0-9a-zA-Z]*)@yonsei\.ac\.kr$/i;
	// 휴대폰 번호 정규식
	// - 생략하고 01?(3글자) 방식으로 나머지 적용.
  // n? Matches any string that contains zero or one occurences of n
  // n* matches any string that contains zero or more occurrences of n
	var phoneJ = /^01[0|1|6|7|8|9]([0-9]{7,8})$/;



	$(document).ready(function(){
		//아이디 검사
    $("#input_ID").blur(function(){
      if (idJ.test($(this).val())) {
        console.log(idJ.test($(this).val()));
        $("#id_check").text('');
    } else {
      $('#id_check').text('아이디 규정을 확인해주세요');
      $('#id_check').css('color', 'red');
    }
    });

		//비밀번호 검사
		$("#pw").blur(function(){
			if (pwJ.test($(this).val())) {
				console.log(pwJ.test($(this).val()));
				$("#pw_check").text('');
		} else {
			$('#pw_check').text('비밀번호 규정을 확인해주세요');
			$('#pw_check').css('color', 'red');
		}
		});


		// 이름 정규식 검사
		$("#realName").blur(function() {
			if (nameJ.test($(this).val())) {
					console.log(nameJ.test($(this).val()));
					$("#name_check").text('');
			} else {
				$('#name_check').text('이름을 확인해주세요');
				$('#name_check').css('color', 'red');
			}
		});

		//연락처
		$('#phone').blur(function(){
			if(phoneJ.test($(this).val())){
				console.log(phoneJ.test($(this).val()));
				$("#phone_check").text('');
			} else {
				$('#phone_check').text('휴대폰번호를 확인해주세요');
				$('#phone_check').css('color', 'red');
			}
		});

		//이메일
		$('#email').blur(function(){
			if(mailJ.test($(this).val())||mailJ2.test($(this).val())){
				console.log(mailJ.test($(this).val()));
				console.log(mailJ2.test($(this).val()));
				$("#email_check").text('');
			} else {
				$('#email_check').text('이메일을 확인해주세요');
				$('#email_check').css('color', 'red');
			}
		});



			var inval_Arr = new Array(5).fill(false);
		$('#register_btn').click(function(){

      // id 정규식
      if (idJ.test($('#input_ID').val())) {
        inval_Arr[0] = true;
      } else {
        inval_Arr[0] = false;
      }

			// 비밀번호가 같은 경우 && 비밀번호 정규식
			if (pwJ.test($('#pw').val())) {
				inval_Arr[1] = true;
			} else {
				inval_Arr[1] = false;
			}
			// 이름 정규식
			if (nameJ.test($('#realName').val())) {
				inval_Arr[2] = true;
			} else {
				inval_Arr[2] = false;
			}
			// 이메일 정규식
			if (mailJ.test($('#email').val())||mailJ2.test($('#email').val())){
				console.log(mailJ.test($('#email').val()));
				console.log(mailJ2.test($('#email').val()));
				inval_Arr[3] = true;
			} else {
				inval_Arr[3] = false;
			}
			// 휴대폰번호 정규식
			if (phoneJ.test($('#phone').val())) {
				console.log(phoneJ.test($('#phone').val()));
				inval_Arr[4] = true;
			} else {
				inval_Arr[4] = false;
			}

			var validAll = true;
			for(var i = 0; i < inval_Arr.length; i++){

				if(inval_Arr[i] == false){
					validAll = false;
				}
			}

			if(validAll){ // 유효성 모두 통과
				alert('Kozaza에서 인증 이메일을 보냈으니 확인해주세요!');
				$("#register_btn").prop("disabled",false);
			} else{
				alert('입력한 정보들을 다시 한번 확인해주세요 :)')
				$("#register_btn").prop("disabled",true);
			}
		});




	});

 //ID의 result_box와 check_font <div> 하나씩만 화면에 표시하기
if(result_box.style.color="red" ||result_box.style.color=="green") {
	document.getElementById("id_check").style.display="none";
}
else {
  result_box.sytle.display="none";
  document.getElementById("id_check").style.display="display";
}


</script>
</head>
<body>

	<!--  <button onclick="document.getElementById('registerModal').style.display='block'" style="width:auto;">회원가입</button>-->
 <!--   <div id="registerModal" class="modal">-->
    <!-- 회원가입 페이지 코드 전체-->
    <div class="register_background">
    	<article id="register_box">
        <a href="./"><img src=".\img\Koza.png" id="logo" alt="Koza_logo"></a>
        <form method="post" action="./registerProcess">
        <div class="input_box">
            <label for="id">아이디</label><br>
            <input type="text" class="form-control" name="memberID" id="input_ID" onblur="confirmID()" placeholder="ex)4~12자리 숫자와 알파벳 소문자 조합">
            <div id="result_box"></div>
            <div class="check_font" id="id_check"></div>
        </div>

        <div class="input_box">
            <label for="pw">비밀번호</label><br>
            <input type="password" class="form-control" name="memberPW" id="pw" placeholder="4~12자리 이하의 숫자와 알파벳 조합">
        	<div class="check_font" id="pw_check"></div>
        </div>

        <div class="input_box">
                <label for="name">이름</label><br>
                <input type="text" class="form-control" name="memberName" id="realName" placeholder="한글 이름을 적어주세요 ex)박은빈">
                <div class="check_font" id="name_check"></div>

        </div>

        <div class="input_box">
            <label for="nick">닉네임</label><br>
            <input type="text" class="form-control" name="memberNick" id="nick" onblur="confirmNick()" placeholder="사용하실 닉네임을 적어주세요.">
            <div id="result_boxForNick"></div>
        </div>

        <div class="input_box">
            <label for="phone">연락처</label><br>
            <input type="tel" class="form-control" name="memberPhone" id="phone" width="100px" placeholder="'-' 없이 입력해주세요">
        	<div class="check_font" id="phone_check"></div>
        </div>

        <div class="input_box">
            <label for="email">고려대학교 이메일</label><br>
            <input type="email" class="form-control" name="memberEmail" id="email" placeholder="ex)hello@korea.ac.kr">
        	<div class="check_font" id="email_check"></div>
        </div>


        <br>
        <button type="submit" class="btn btn-primary btn-block" value="submit" id="register_btn">회원가입</button>
        <button type="button" class="btn btn-secondary btn-block" onclick="document.getElementById('registerModal').style.display='none'">취  소</button>
        <br><br>

        </form>
        </article>
      </div>
<!--  </div> -->


    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link href="resources/css/bootstrap_litera.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<title>Kozaza! 로그인을 해 주세요</title>

    <style>
        body{
            background-color: rgb(253, 253, 253);
        }
        #login_box{
            width:  420px;;
            height: auto;
            margin: auto;
        }

        .getInfo{
            width: 420px;;
            height: auto;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;

        }

        #findInfoForm{
            float: left;
        }

        #registerForm{
            float: right;
        }

        .form_group{
            font-family: 맑은 고딕;
            width: 420px;
            height: 80px;

        }

        .snsLogin{
            font-family: Arial, Helvetica, sans-serif;
            margin: auto;
            width: 300px;
            height: auto;
        }


/* 		.modal { */
/* 		  display: none; /* Hidden by default */ */
/* 		  position: fixed; /* Stay in place */ */
/* 		  z-index: 1; /* Sit on top */ */
/* 		  left: 0; */
/* 		  top: 0; */
/* 		  width: 100%; /* Full width */ */
/* 		  height: 100%; /* Full height */ */
/* 		  overflow: auto; /* Enable scroll if needed */ */
/* 		  background-color: rgb(0,0,0); /* Fallback color */ */
/* 		  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */ */
/* 		  padding-top: 60px; */
/* 		} */

        .login_background{
            width:  480px;;
            height: auto;
            margin: auto;
            background-color: rgb(253, 253, 253)
        }

        #logo{
            width: 360px;
            height: 260px;
            margin-left: 30px;
            margin-right: 30px;
            margin-bottom: -25px;
        }

        a:link{text-decoration: none; color: grey;}
        a:visited{text-decoration: none; color: grey;}
        a:active{text-decoration: none; color: grey;}

    </style>



</head>
<body>
	<!--  <button onclick="document.getElementById('loginModal').style.display='block'" style="width:auto;">로그인</button>-->
<!--	<div id="loginModal" class="modal">-->
		<!-- 로그인 페이지 코드 전체-->
		<div class="login_background">
			<article id="login_box">
				<a href="./"><img src=".\img\Koza.png" id="logo"></a>
				<form action="./loginProcess">
					<div class="form_group">
						<label for="InputID"></label> <input type="text"
							class="form-control form-control-lg" name="memberID" id="inputID"
							placeholder="아이디를 입력하세요">
						<div class="check_font" id="id_check"></div>
						<!--경고문 들어갈 자리-->
					</div>
					<div class="form_group">
						<label for="InputPW"></label> <input type="password"
							class="form-control form-control-lg" name="memberPW" id="inputPW"
							placeholder="비밀번호를 입력하세요">
					</div>
					<br>
					<button type="submit" class="btn btn-primary btn-block"
						value="submit">로그인</button>
				</form>

				<div class="getInfo">
					<div id="findInfoForm">
						<a href="findInfoForm">아이디/비밀번호찾기</a>
					</div>
					<div id="registerForm">
						<a href="registerForm">회원가입</a>
					</div>
				</div>
				<br>
				<br>

			</article>
		</div>
<!--  	</div> -->

<!--modal
	<script>
		// Get the modal
		var modal = document.getElementById('loginModal');

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
-->
<!--BOOTSTRAP JS 스크립트-->
<!--
Many of our components require the use of JavaScript to function.
Specifically, they require jQuery, Popper.js, and our own JavaScript plugins.
Place the following <script>s near the end of your pages, right before the closing
</body> tag, to enable them. jQuery must come first, then Popper.js,
and then our JavaScript plugins.
-->
<!--
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
-->
</body>

</html>

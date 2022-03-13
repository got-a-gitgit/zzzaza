<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link href="resources/css/bootstrap_litera.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


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
    <div id="login_box" class="modal">

        <form class="modal-content animate" action="./loginProcess" method="post">
            <div class="imgcontainer">
              <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
              <img src="Koza.png" alt="Koza" class="avatar">
            </div>

            <div class="form_group">
              <!--ID textbox for Login -->
                <label for="InputID"></label>
                <input type="text" class="form-control form-control-lg" name="user_id" id="inputID" placeholder="아이디를 입력하세요" required>

              <!--Password textbox for Login -->
                <label for="InputPW"></label>
                <input type="password" class="form-control form-control-lg" name="pw" id="inputPW" placeholder="비밀번호를 입력하세요" required>
            </div>
            <button type="submit" class="btn btn-lg btn-primary" value="submit">로그인</button>
            <button type="submit" class="btn btn-secondary btn-lg" value="submit"></button>

            </form>

            <div class="getInfo">
                <div id="findInfoForm">
                    <a href="findInfoForm">아이디나 비밀번호를 잊으셨나요?</a>
                </div>
                <div id="registerForm">
                    <a href="registerForm">아직 회원이 아니신가요?</a>
                </div>
            </div>
            <br><br>


<!--스크립트-->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" -->
<href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<title>후기 작성</title>
<style>
/*grid area 설정*/
#writeRow_part {
	grid-area: header;
}

#textArea_part {
	grid-area: textArea;
	padding-left: 30px;
	padding-right: 30px;
	border-right: solid 1px #ECECEC;
	padding-right: 30px
}

#imageButton_part {
	grid-area: imageButton;
}

#imageUpload_part {
	grid-area: imageUpload;
	padding-left: 30px
}

#submit_part {
	grid-area: submit;
}

/*grid 템플릿 설정*/
.grid-container {
	display: grid;
	grid: 'header header header' 'textArea textArea imageButton'
		'imageUpload imageUpload submit';
}

/*반응형 웹사이트 설정*/
@media ( max-width :800px) {
	.grid-container {
		display: block;
	}
}

/*라디오버튼에 따라 날짜가 다르게 표현되도록*/
#Date_visited, #Date_residencePeriod {
	display: none;
}

/*다중 첨부 사진 크기 및 그리드 설정*/
#result {
	width: 140px;
	display: grid;
	grid-template-columns: auto auto auto auto auto;
	grid-gap: 10px;
}

/* HIDE RADIO */
.imgInput {
	position: absolute;
	opacity: 0;
	width: 0;
	height: 0;
}

/* IMAGE STYLES */
.imgButton {
	cursor: pointer;
	width: 100px;
	height: 100px;
	margin: 0 auto;
}

/* CHECKED STYLES */
.imgInput:checked+img {
	outline: 2px solid #0275d8;
}
/*각 이미지 라디오 버튼의 제목 가운데 정렬*/
.radio_title {
	text-align: center;
}

.radio_label {
	display: inline-block;
	margin-left: auto;
	margin-right: auto;
}

.radio_container {
	width: 100%;
	text-align: center;
}

#writeRow_part{
	padding-left : 30px;
	margin-bottom : 15px;
	background-color : gray;
}

h2{

}
</style>
</head>
<body>
	<script>
		function handleFileSelect(event) {
			//Check File API support
			if (window.File && window.FileList && window.FileReader) {

				var files = event.target.files; //FileList object
				var output = document.getElementById("result");

				for (var i = 0; i < files.length; i++) {
					var file = files[i];
					//Only pics
					if (!file.type.match('image'))
						continue;

					var picReader = new FileReader();
					picReader
							.addEventListener(
									"load",
									function(event) {
										var picFile = event.target;
										var div = document.createElement("div");
										div.style.width = "100px";
										div.style.height = "100px";
										div.innerHTML = "<img class='thumbnail' height='100px' width='100px' margin='0px' padding='0px' src='" + picFile.result + "'" + "title='" + file.name + "'/>";
										output.insertBefore(div, null);
									});
					//Read the image
					picReader.readAsDataURL(file);
				}
			} else {
				console.log("Your browser does not support File API");
			}
		}

		document.getElementById('exampleInputFile').addEventListener('change',
				handleFileSelect, false);
	</script>


	<!--네비 바-->
	<div id="nav-placeholder">
		<jsp:include page="navbar.jsp" flush="false" />
	</div>
	<!--네비 바 끝-->


	<!--중앙 시작-->
	<%-- <div id="middle"> --%>
	<form method="post" id="writeForm" action="./writePostAction">
		<div class="grid-container">

			<div id="writeRow_part" class="grid-contents">
				<!--후기 작성 바 -->
				<h2>후기 작성</h2>
			</div>

			<div id="textArea_part" class="grid-contents">
				<label for="postTitle">제목</label>
				<input type="text" id = "postTitle" name="contentTitle" class="form-control"
					placeholder="제목을 입력하세요.">

				<div>
					<label for="disabledInput">주소</label>
					<input class="form-control"	id="disabledInput" type="text"
						placeholder="Disabled input here..."
						value="${houseVO.houseAddress} ${houseVO.houseSpecificAddress}" disabled>
				</div>

				<label for="livnigCategory">거주 경험
					<div id=livingCategory>

						<input type="radio" id="livedBefore" name="contentType" value="1">
						<label for="livedBefore">살아봤어요</label>
						
						<input type="radio"	id="friendHome" name="contentType" value="2">
						<label for="friendHome">친구집이예요</label>
						
						<input type="radio"	id="visitedOnce" name="contentType" value="3">
						<label for="visitedOnce">방문해봤어요</label>
					</div>
				</label>

				<div id=Date_residencePeriod>
					<label for="fromDate">거주 시작시기 <input type="month"
						name="rateStartLiving" id="fromDate" class="form-control"></label>
					<label for="toDate">거주 종료시기 <input type="month"
						name="rateEndLiving" id="toDate" class="form-control"></label>

				</div>

				<div id=Date_visited>
					<label for="visitDate">방문시기 <input type="month"
						name="rateVisitedTime" id="visitDate" class="form-control"></label>
				</div>

				<script>
					$(document).ready(function() {
						$("input[type='radio']").on("change", function() {
							showDateInput(this);
						});
					});

					function showDateInput(obj) {
						if (obj.value == "1") {
							$("#Date_residencePeriod").show("medium");
							$("#Date_visited").hide("medium");
						} else if (obj.value == "2" || obj.value == "3") {
							$("#Date_residencePeriod").hide("medium");
							$("#Date_visited").show("medium");
						}
					}
				</script>
				<hr style="color:#ECECEC">
				<label for="exampleFormControlTextarea1">내용</label>
				<textarea style="resize: none" name="contentContent"
					class="form-control flex-auto" id="exampleFormControlTextarea1"
					rows="15" placeholder="내용을 입력하세요."></textarea>
			</div>

			<div id="imageButtons_part" class="grid-contents">
				<div id="radio_bug" class="radio_container">
					<div class="radio_title"  font-family="Helvetica">벌레가 있나요?</div>
					<label class="radio_label">
						<input type="radio"	class="imgInput" name="rateBug" value="true" checked> 
						<img class="imgButton" title="벌레가 있어요" src=".\img\bug_true.png">
					</label>
						<label class="radio_label" class="radio_container">
						<input type="radio" class="imgInput" name="rateBug" value="false">
					<img class="imgButton" title="벌레가 없어요" src=".\img\bug_false.png">
					</label>
				</div>

				<div id="radio_noise" class="radio_container">
					<div class="radio_title" font-family= "Helvetica">소음이 있나요?</div>
					<label class="radio_label">
						<input type="radio"	class="imgInput" name="rateNoise" value="true" checked>
						<img class="imgButton" title="소음이 있어요" src=".\img\noise_true.png">
					</label>
					<label class="radio_label" class="radio_container">
						<input type="radio" class="imgInput" name="rateNoise" value="false">
						<img class="imgButton" title="조용해요" src=".\img\noise_false.png">
					</label>
				</div>

				<div id="radio_leak" class="radio_container">
					<div class="radio_title" font-family="Helvetica">누수가 있나요?</div>
					<label class="radio_label">
						<input type="radio"	class="imgInput" name="rateLeak" value="true" checked>
						<img class="imgButton" title="누수가 있어요" src=".\img\leak_true.png">
					</label>
					<label class="radio_label">
						<input type="radio"	class="imgInput" name="rateLeak" value="false">
						<img class="imgButton" title="누수가 없어요" src=".\img\leak_false.png">
					</label>
				</div>

				<div id="radio_fungi" class="radio_container">
					<div class="radio_title" font-family="Helvetica">곰팡이가 있나요?</div>
					<label class="radio_label">
						<input type="radio"	class="imgInput" name="rateFungi" value="true" checked>
						<img class="imgButton" title="곰팡이가 잘 생겨요" src=".\img\fungi_true.png">
					</label> <label class="radio_label">
						<input type="radio" class="imgInput" name="rateFungi" value="false">
						<img class="imgButton" title="곰팡이 없어요" src=".\img\fungi_false.png">
					</label>
				</div>

			</div>

			<div id="imageUpload_part" class="grid-contents">
				<hr width="95%" style="color: #ECECEC">
				<div class="input-group mt-4 mb-3">
				<div  class="custom-file">
				<label for="exampleInputFile" class="custom-file-label">파일을 선택하세요.</label>
				<input id="exampleInputFile" type="file" class="custom-file-input"
					multiple="multiple" name="rateImages"/>
				</div>
				</div>
				<output id="result" />
			</div>


			<div id="submit_part" class="grid-contents">
				<button type="submit" class="btn btn-primary btn-lg btn-block">후기
					게시</button>
				<a href="./" class="btn btn-lg btn-block active" style="background-color : grey; color:white" >취소</a>
			</div>
			<input type="hidden" name="houseAddress" value="${houseVO.houseAddress}"/>
			<input type="hidden" name="houseSpecificAddress" value="${houseVO.houseSpecificAddress}"/>
			<input type="hidden" name="houseImages" value="${houseVO.houseImages}"/>	
			<input type="hidden" name="houseLatitude" value="${houseVO.houseLatitude}"/>
			<input type="hidden" name="houseLongitude" value="${houseVO.houseLongitude}"/>
			<input type="hidden" name="contentRoomNum" value="${houseVO.houseSpecificAddress }"/>
		</div>
	</form>

	<!--중앙 끝-->



</body>
</html>

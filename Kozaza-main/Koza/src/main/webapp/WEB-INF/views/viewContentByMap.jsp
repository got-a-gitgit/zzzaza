<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Koza! 지도로 게시글 보기 페이지</title>
    
</head>
<body>

<h1> 지도로 게시글 보기 페이지 입니다</h1>
<h5> 지도 위의 마커를 클릭하시면, 해당 주소의 게시글들을 볼 수 있습니다. </h5>

<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoKey}&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.5887034223667, 127.031698331241), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

/*===== 마커 관련 시작 =====*/
//마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

// 마커 이미지의 이미지 크기 입니다
var imageSize = new kakao.maps.Size(24, 35); 

// 마커 이미지를 생성합니다    
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 


    <c:forEach var="houseData" items="${houseList}" varStatus="status">
    // 마커를 생성합니다
    var marker${houseData.houseIndex} = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: new kakao.maps.LatLng(${houseData.houseLatitude},${houseData.houseLongitude}), // 마커를 표시할 위치
        image : markerImage // 마커 이미지 
    });

    
    /*===== 마커 이벤트 관련 시작 =====*/

    // 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
    var iwContent${houseData.houseIndex} = '<div style="padding:5px;">'+'${houseData.houseAddress}'+'</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

    // 인포윈도우를 생성합니다
    var infowindow${houseData.houseIndex} = new kakao.maps.InfoWindow({
        content : iwContent${houseData.houseIndex}
    });

    // 마커에 마우스오버 이벤트를 등록합니다
    kakao.maps.event.addListener(marker${houseData.houseIndex}, 'mouseover', function() {
      // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
        infowindow${houseData.houseIndex}.open(map, marker${houseData.houseIndex});
    });

    // 마커에 마우스아웃 이벤트를 등록합니다
    kakao.maps.event.addListener(marker${houseData.houseIndex}, 'mouseout', function() {
        // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
        infowindow${houseData.houseIndex}.close();
    });


	 // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker${houseData.houseIndex}, 'click', function() {
          // 마커 위에 인포윈도우를 표시합니다
         infowindow${houseData.houseIndex}.open(map, marker${houseData.houseIndex});

		 loadSearchedPage('${houseData.houseAddress}');
          
    });
    
    /*===== 마커 이벤트 관련 끝 =====*/

    </c:forEach>
    
/*===== 마커 관련 끝 =====*/

function loadSearchedPage(houseAddress){
	$.ajax({
		url: "./searchByHouseAddress?houseAddress=" + houseAddress,
        type: "POST",
        dataType: "html",
        data: {
            houseIndex: houseIndex1,
        },
        success: function (result) {
 //       	$(#resultPage).load(result);
        }
	})
};




/*===== 보낼 데이터 관련 시작 =====*/
function postData(){
	
    var form = document.userform;
    
    var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hide");
    hiddenField.setAttribute("name", "houseLatitude");
    hiddenField.setAttribute("value", latitude);

    var hiddenField2 = document.createElement("input");
    hiddenField2.setAttribute("type", "hide");
    hiddenField2.setAttribute("name", "houseLongitude");
    hiddenField2.setAttribute("value", longitude);

    form.appendChild(hiddenField);
    form.appendChild(hiddenField2);

    
    form.submit();
}
/*===== 보낼 데이터 관련 끝 =====*/




</script>
<form action="./toWritePostForm" method="post" name="userform">
	<div class="input_box">
		<label for="houseAddress">도로명 주소 검색</label><br> 
		<input type="text" id="search_word" name="houseAddress" oninput="change_search_word()">
	</div>
	<div class="input_box">
		<label for="houseSpecificAddress">집 상세주소</label><br> 
		<input type="text" class="form-control" id="houseSpecificAddress" name="houseSpecificAddress">
	</div>
		<button onclick="postData()">전송</button>
</form>

<div id="resultPage"/>
</body>
</html>







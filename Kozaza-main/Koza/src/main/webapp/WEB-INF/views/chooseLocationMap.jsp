<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Koza! 글쓰기 - 주소 찾기 페이지</title>
    
</head>
<body>

<h1> 글쓰기 - 주소 찾기 페이지 입니다</h1>
<h5> 아이콘 위에 마우스를 올려 놓으시면 주소가 보입니다. </h5>

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

    
    /*===== 마커에 표시할 인포 윈도우 관련 시작 =====*/

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
    /*===== 마커에 표시할 인포 윈도우 관련 끝 =====*/


    </c:forEach>

    
/*===== 마커 관련 끝 =====*/


/*===== 검색 관련 시작 =====*/
var searchWord;
var latitude;
var longitude;

function change_search_word(){
	var word = document.getElementById("search_word").value;

	searchWord = word;

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(searchWord, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        latitude = Number(coords.getLat());
	        longitude = Number(coords.getLng());

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">선택하신 장소</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});  
}
/*===== 검색 관련 끝 =====*/

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
</body>
</html>







<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#gray_box{
            width: 1200px;
            height: 470px;
            padding-top: 3px;
            background-color:rgb(255, 204, 109);
            position:initial;
            border-radius: 5px;
            
            
        }

        li .small1{
            margin-top: 10px;
            margin-right: 10px;
            margin-left: 10px;
            width: 200px;
            height: 283px;
            
            float: left;
        }
        
        .small2{
            margin-top: 15px;
            margin-right: 5px;
            margin-left: 22px;
            width: 200px;
            height: 330px;
            background-color:orange;
            float: left;
            z-index: -2;
        }

        .movie_img{
            width: 200px;
            height: 250px;
            margin-left: 49.99px;
            display: block;
            -ms-transform: translate(-50px, 0); /* IE 9*/
            -webkit-transform: translate(-50px, 0); /* Safari */
            transform: translate(-50px, 0);
            
        }

        
        .movie_img1{
            width: 200px;
            height: 270px;
        }



        #choice{
            margin-top: 5px;
            width: 100%;
            font-size: 15px;
            color: white;
            text-align: right;
        }

        .overlay{
            width: 100%;
            height: 88%;
            background-color: rgba(92, 91, 91, 0.2);
            cursor: pointer;
            margin-top: 24px;
            
        }

        .poster{
            width: 200px;
            height: 270px;
            border-radius: 10px;
        }

        .poster1{
            margin-top: 90px;
            margin-left: 50px;
            width: 220px;
            height: 290px;
            
        }

       
        .timetable{
            width: 70%;
            height: 72%;
            border: 1px solid rgb(92, 91, 91, 0.5);
            padding: 8px 32px;
            border-radius: 10px;
            margin-top: -27%;
            margin-left: 27%;
        }
        
        .text {
			color: rgb(92, 91, 91);
			font-family: sans-serif;
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			font-size: 18px;
			border: 1px solid rgb(92, 91, 91);
			padding: 8px 32px;
			border-radius: 5px;
        }
        
        .col-4{
            text-align: center;
        }

        /*?????? ?????????*/
        .container{
            position: relative;
			width: 200px;
            height: 270px;
			
		}
		.container:hover > .thecard {
			transform: rotateY(180deg);
			cursor: pointer;
		}
		.thecard{
			position: absolute;
			width: 100%;
			height: 100%;
			transform-style: preserve-3d;
			transition: all 0.5s ease;
		}
		/*.thecard:hover{
			transform: rotateY(180deg);
		}*/
		.thefront{
			position: absolute;
			width: 200px;
			height: 270px;
			backface-visibility: hidden;
			margin-left: -15px;
			color: #D35400;
			text-align: center;
			font-family: ?????? ??????;
			border-radius: 10px;
			font-size: 20spx;
			font-weight: bold;
		}
		.thefront p {
			font-size: 65px;
            line-height: 65px;
            font-family: ?????? ??????;
		}
		
		.theback{
			position: absolute;
			width: 220px;
            height: 330px;
            margin-right: 500px;
			backface-visibility: hidden;
			background: #fafafa;
			color: rgb(66, 64, 64);
            text-align: center;
            line-height: 25px;
			font-family: ?????? ??????;
			border-radius: 10px;
			text-align: left;
            transform: rotateY(180deg);
            z-index: 5;
            border: 0.5px solid rgb(189, 188, 188);
            padding: 10px 10px 10px 10px;
        }

        .theback h5{
            line-height: 25px;
        }
        
        .theback p{
            margin-top: 10px;
            line-height: 30px;
            font-family: ?????? ??????;
        }

        #star{
            float:left;
        }

		.cardContent{
            font-size: 16px;
            font-family: ?????? ??????;
            color:black;
            line-height: 30px;
        }
        
        #board{
            margin-top: 20px;
            width: 1200px;
            height: 470px;
            
            
        }
        

        #table{    
            width: 100%;
            border: 0.5px solid rgb(59, 51, 50);
            color: gray;
            background-color: white;
        }

        #theater_type{
            width: 100%;
            height: 40px;
            background-color: white;
        }

        .theater_box{
            width: 120px;
            height: 40px;
            padding-top: 5px;
            float: right;
            color: rgb(73, 73, 73);
        }

        #cgv_icon{
            margin-top: 8px;
            margin-left: 10px;
            width: 15px;
            height: 15px;
            background-color: rgb(223, 52, 0);
            float: left;
            text-align:center;
        }

        #mega_icon{
            margin-top: 8px;
            margin-left: 10px;
            width: 15px;
            height: 15px;
            background-color: rgb(29, 4, 70);
            float: left;
            text-align:center;
        }

        #lotte_icon{
            margin-top: 8px;
            margin-left: 10px;
            width: 15px;
            height: 15px;
            background-color: crimson;
            float: left;
            text-align:center;
        }
        
        /*?????? css*/
        span.star-prototype, span.star-prototype > * {

			    height: 16px; 
			    background: url(http://i.imgur.com/YsyS5y8.png) 0 -32px repeat-x;
			    width: 80px;
			    display: inline-block;
			
			}

			span.star-prototype > * {
			    background-position: 0 0;
			    max-width:80px; 
			}
			        
        /*???????????? css */
        *{margin:0;padding:0;}
                ul,li{list-style:none;}
                .slide{height: 455px;overflow:hidden;position:relative;}
                .slide ul{width:calc(125% * 4);display:flex;transition:1s;}
                .slide li{width:calc(16% / 4);height:283px;}
                .slide input{display:none;}
                .slide .bullet{position:absolute;bottom:20px;left:0;right:0;text-align:center;z-index:10;}
                .slide .bullet label{width:10px;height:10px;border-radius:10px;border:2px solid rgb(165, 164, 164);display:inline-block;font-size:0;transition:0.5s;cursor:pointer;}
        /* ???????????? ?????? */
        #pos1:checked ~ ul{margin-left:0;}
        #pos2:checked ~ ul{margin-left:-100%;}
        #pos3:checked ~ ul{margin-left:-200%;}
        #pos4:checked ~ ul{margin-left:-300%;}
        /* bullet ?????? */
        #pos1:checked ~ .bullet label:nth-child(1),
        #pos2:checked ~ .bullet label:nth-child(2),
        #pos3:checked ~ .bullet label:nth-child(3),
        #pos4:checked ~ .bullet label:nth-child(4){background:rgb(104, 99, 99);}
        

</style>

    <!--???????????? ????????????-->
    <script> 
            $(document).ready(function(){
              $("movie_img").mouseenter(function(){
                var div = $("div");
                div.animate({width: '300px', opacity: '0.8'}, "slow");
                
              });
            });
            
            $(document).ready(function(){
                $("movie_img").mouseleave(function(){
                  var div = $("div");
                  div.animate({width: '0px', opacity: '0.8'}, "slow");
                });
              });

            // ???????????? ??????
        $(document).ready(function(){
            $(".megabox").mouseover(function(){
                $(this).css('background-color', 'rgb(29, 4, 70)').css('color', 'white');

            });
        });
        $(document).ready(function(){
            $(".megabox").mouseleave(function(){
                $(this).css('background-color', 'white').css('color', 'gray');

            });
        });

        //CGV ??????
        $(document).ready(function(){
            $(".cgv").mouseover(function(){
                $(this).css('background-color', 'rgb(223, 52, 0)').css('color', 'white');

            });
        });
        $(document).ready(function(){
            $(".cgv").mouseleave(function(){
                $(this).css('background-color', 'white').css('color', 'gray');

            });
        });
        //??????????????? ??????
        $(document).ready(function(){
            $(".lotte").mouseover(function(){
                $(this).css('background-color', 'crimson').css('color', 'white');

            });
        });
        $(document).ready(function(){
            $(".lotte").mouseleave(function(){
                $(this).css('background-color', 'white').css('color', 'gray');

            });
        });
        
        //?????? ????????????
        $.fn.generateStars = function() {
	    return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
		};

		// ?????? ????????? ?????? ??????????????? ???????????? ??????

		// ?????? ??????
		$(function() {
			$('.star-prototype').generateStars();
		});
            </script>
       
</head>
<body>

        <!--Gray Box ??????-->
        <div id="gray_box">
            <div class="overlay" id="overlay">
                    <div id="choice">
                            ????????? | ????????? | ???????????? &nbsp; &nbsp;
                    </div>
            <dl>
                <dt class="movie_1">

                </dt>
                <!--???????????? ??????-->
                <div class="slide">
                <dd class="movie_list1" style="left: 0%; display: block;">
                    <input type="radio" name="pos" id="pos1" checked>
                    <input type="radio" name="pos" id="pos2">
                    <!--??? ???????????? ??????-->
                    <ul style="list-style-type: none;">
                    <c:forEach var="rank" begin="0" end="20" items="${rankList }">
                        <li class="small1">
                            <div class="small2">
                                <div class="poster">
                                    <!--?????? ????????????1 ??????-->
                                        <div class="container">
                                                <div class="thecard">
                                                    <div class="thefront">
                                                        <span><img src="${rank.imgUrl }" class="movie_img1" alt="???????????????"></span>
                                                    </div>
                                                    <div class="theback">
                                                        <div class="cardContent">
                                                            <h5>${rank.movieNm }</h5>
                                         					??????: <span class="star-prototype" >3.5</span>(3.5)
                                                                 <br>
                                                            <p id="content">
								                                                                ???????????? : ${rank.openDt }<br>
								                                                                ???????????? : ${rank.genreAlt }<br>
								                                                                ???????????? : ${rank.showTime }???<br>
								                                                                ?????? : ${rank.directors }<br>
								                                                                ?????? : ${rank.actor}<br>
								                                                                
								                                  <a href="./movieInfo?movieCd=${rank.movieCd }"><button type="button" id="movieInfo" class="btn btn-outline-success" style="float:right;">More</button></a>        
                                                            </p>
                                                        </div>
                                                        
                                                    </div>	
                                                </div>
                                                        
                                        
                                            </div>
                                          
                                    
                                       
                                </div>
									<div id="title" style="text-align: center;"><strong>${rank.movieNm }</strong></div>
                            </div>
                            <!--?????? ????????????1 ???--> 
                            
                    
                        </li>
                        </c:forEach>
                    </ul>
                    <!--??? ???????????? ???-->
                    <p class="bullet">
                        <label for="pos1">1</label>
                        <label for="pos2">2</label>
                    </p>
                </dd>
                </div>
            <!--???????????? ???-->
            </dl>        
            </div>   
        </div>
        <!--Gray Box ???-->
        <!--?????????-->
        <div id="board">
            <div id="theater_type">
	            	<select id = "districtName" onchange="showTimeTableView()">
	            	<option value='?????????' selected>?????????</option>
	            	<option value='?????????'>?????????</option>
	            	<option value='?????????'>?????????</option>
	            	<option value='?????????'>?????????</option>
	            	<option value='?????????'>?????????</option>
	            	<option value='?????????'>?????????</option>
	            	<option value='?????????'>?????????</option>
	            	<option value='?????????'>?????????</option>
	            	<option value='?????????'>?????????</option>
	            	<option value='?????????'>?????????</option>
	            	<option value='????????????'>????????????</option>
	            	<option value='?????????'>?????????</option>
	            	<option value='?????????'>?????????</option>
	            	<option value='????????????'>????????????</option>
	            	<option value='?????????'>?????????</option>
	            	<option value='?????????'>?????????</option>
	            	<option value='?????????'>?????????</option>
	            	<option value='?????????'>?????????</option>
	            	<option value='?????????'>?????????</option>
	            	<option value='????????????'>????????????</option>
	            	<option value='?????????'>?????????</option>
	            	<option value='?????????'>?????????</option>
	            	<option value='?????????'>?????????</option>
	            	<option value='??????'>??????</option>
	            	<option value='?????????'>?????????</option>
	            	</select>
	            	<select id = "openDate" onchange="showTimeTableView()">
	            	<option value = 0>??????</option>
	            	<option value = 1>??????</option>
	            	</select>
                <div class="theater_box"><div id="cgv_icon"></div> &nbsp; CGV</div>
                <div class="theater_box"><div id="mega_icon"></div> &nbsp; MEGABOX &nbsp;</div>
                <div class="theater_box"><div id="lotte_icon"></div> &nbsp; ??????????????? &nbsp;</div>
               
            </div>

                <div id="table" style="width: 400px; float:left">
                        <table class="table">
                                <thead>
                                  <tr>	
                                    <th scope="col" style="width: 400px;"><h5>CGV</h5></th>
                                  </tr>
                                </thead>
                                <tbody>
                                 <c:forEach var="TimeTable" items="${showList }" varStatus="status">
	                                 		<c:if test="${TimeTable.theaterIdentifier == 'C'}">
	                                 			<tr>
		                                 			<td>
		                                 				${TimeTable.movieName}<br>
		                                 				${TimeTable.theater_name}<br>
		                                 				${TimeTable.showScreen}<br>
		                                 				${TimeTable.showDate}<br>
		                                 				${TimeTable.showTime}<br>
		                                 			</td>
	                                 			</tr>
	                                 		</c:if>
                                  	
                                 </c:forEach> 
                                  </tbody>
                          </table>
                   </div>
                   <div id="table" style="width: 400px; float:left">
                              
                              <table class="table">
                                <thead>
                                  <tr>	
                                    <th scope="col" style="width: 400px;"><h5>????????????</h5></th>
                                  </tr>
                                </thead>
                                <tbody>
                                 <c:forEach var="TimeTable" items="${showList }" varStatus="status">
	                                 		<c:if test="${TimeTable.theaterIdentifier == '???'}">
	                                 			<tr>
		                                 			<td>
		                                 				${TimeTable.movieName}<br>
		                                 				${TimeTable.theater_name}<br>
		                                 				${TimeTable.showScreen}<br>
		                                 				${TimeTable.showDate}<br>
		                                 				${TimeTable.showTime}<br>
		                                 			</td>
	                                 			</tr>
	                                 		</c:if>
                                  	
                                 </c:forEach> 
                                  </tbody>
                              </table>
                       </div>
                       <div id="table" style="width: 400px; float:left">       
                              <table class="table" style="width: 400px;">
                                <thead>
                                  <tr>	
                                    <th scope="col" style="width: 400px;"><h5>???????????????</h5></th>
                                  </tr>
                                </thead>
                                <tbody>
                                 <c:forEach var="TimeTable" items="${showList }" varStatus="status">
	                                 		<c:if test="${TimeTable.theaterIdentifier == '???'}">
	                                 			<tr>
		                                 			<td>
		                                 				${TimeTable.movieName}<br>
		                                 				${TimeTable.theater_name}<br>
		                                 				${TimeTable.showScreen}<br>
		                                 				${TimeTable.showDate}<br>
		                                 				${TimeTable.showTime}<br>
		                                 			</td>
	                                 			</tr>
	                                 		</c:if>
                                  	
                                 </c:forEach> 
                                  </tbody>
                              </table>	
                         </div>     
                                    <!-- 
                                    
                                    !!
                                     <th scope="col" style="width: 400px;"><h5>????????????</h5></th>
                                    <th scope="col" style="width: 400px;"><h5>???????????????</h5></th>
                                    !!
                                    
                                     
                                    <td class="cgv">
                                    <strong>${cgv.movieName }</strong><br>
                                    ${cgv.theater_name }<br>
                                    ${cgv.showScreen }<br>
                                    ${cgv.showDate }<br>
                                    ${cgv.showTime }
				
                                    </td>
                                    
                                    <td class="megabox">
                                    <strong>${MGBList[status.index].movieName }</strong><br>
                                    ${MGBList[status.index].theater_name }<br>
                                    ${MGBList[status.index].showScreen }<br>
                                    ${MGBList[status.index].showDate }<br>
                                    ${MGBList[status.index].showTime }

                                    </td>
                                    
      
                                    <td class="lotte">
                                    <strong>${LotList[status.index].movieName }</strong><br>
                                    ${LotList[status.index].theater_name }<br>
                                    ${LotList[status.index].showScreen }<br>
                                    ${LotList[status.index].showDate }<br>
                                    ${LotList[status.index].showTime }
                                    
                                    </td>
                                    -->
                                 
                                 

                               
                

        </div>
        <!--????????? ???-->
        <script>
        
        function showTimeTableView(){
        	
        	
        	var district = document.getElementById("districtName").value;
        	var openDate = document.getElementById("openDate").value;
        	
        	var xmlhttp = new XMLHttpRequest();
    		
    		xmlhttp.open("post", "./getTimeTableByAttributes", true);
    		xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    		
    		xmlhttp.send("districtName=" + district);
    		//xmlhttp.send("openDate=" + openDate);
    		
    		// ?????? ??? ?????? ????????? ??? ?????? ??????
    		xmlhttp.onreadystatechange = function(){
    			
    			// readyState==4??? ????????? ????????? ???????????? ????????? ????????? ?????? 200??? ????????? ????????? ??????
    			if(xmlhttp.readyState==4 && xmlhttp.status == 200){
    				var text = JSON.parse(xmlhttp.responseText);
    				console.log(text);
    			
    				
    			}
        	
    		}
        	
        }
        

        </script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link href="${ contextPath }/resources/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<script type="text/javascript" src="${ contextPath }/resources/js/bootstrap-datetimepicker.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAf5xrmNMwmRYe-jdx4N3ItbdKDOJryoj4&language=${ sessionScope.tVal }&hl=${ sessionScope.tVal }&callback=initialize" async defer></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<title>Hello Korea</title>
<style>
	#more{margin-top:5%;}
	/* .firstImgArea{display:inline-block;} */
	.imgArea{display:block;}
	.secondImgArea{display:inline-block;}
	.firstImg{width:528px; height:435px;}
	.secondImg{width:262.5px; height:217px; display:inline-block;}
	.contentArea{display:block;}
	.detailHead{text-align:center; width:280px; height:40px; background-color:lightgray;}
	.detailContent{height:300px; text-align:center;}
	.detailBottom{height:50px; text-align:center;}
	.tm-about-box-1{padding:10px 10px;}
	.roomImgTd{width:260px; height:280px;}
	.QAV{display:none;}
	.allQAV{display:none;}
	.selectRoom{width:150px; height:45px;}
	.selectPeople{width:150px; height:45px;}
	.summary p{ 
	 		display: inline-block; width: 500px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
			white-space: normal; line-height: 1.2; height: 52px; text-align: left; word-wrap: break-word; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical;

  	}
</style>
</head>
<body>
	<!-- 지역의 숙박상세 Page. -->
	<jsp:include page="../common/searchMenubar.jsp"/>
	<jsp:include page="../common/searchSubmenubar.jsp"/>
	

	<!-- 환율 적용 여부 검사 -->
	<c:if test="${ sessionScope.cur != null }">
		<input type="hidden" id="CURICON" value="${ sessionScope.cur.get(0) }">
		<input type="hidden" id="CUR" value="${ sessionScope.cur.get(1) }">
	</c:if>
	<c:if test="${ sessionScope.cur == null }">
		<input type="hidden" id="CURICON" value="₩">
		<input type="hidden" id="CUR" value="1">
	</c:if>

	

	<!-- gray bg -->	
	<section class="container tm-home-section-1" id="more">
		<div class="row">
		</div>
		<div class="tm-section-header section-margin-top">
			<div class="col-lg-4 col-md-4 col-sm-4"><h2 class="tm-section-title" id="hotelTitleText">아무개호텔</h2></div>
			<div class="col-lg-8 col-md-8 col-sm-8"><hr></div>	
		</div>
		
		<div class="tm-section-header section-margin-top">
			<div class="col-lg-7">
				<div class="imgArea">
				<div class="firstImgArea">
					<img src="${ contextPath }/resources/img/about-1.jpg" alt="image" class="firstImg"/>
				</div>
				<div class="secondImgArea">
					<img src="${ contextPath }/resources/img/about-1.jpg" class="secondImg" alt="image" />
					<img src="${ contextPath }/resources/img/about-1.jpg" class="secondImg" alt="image" />
				</div>
				</div>
			</div>
			<div class="col-lg-5">
				<div class="contentArea">
					호텔정보 영역입니다.<br>
					호텔정보 영역입니다.<br>
					호텔정보 영역입니다.<br>
					<input type="button" class="btn" id="payment" value="결제하기"/>
				</div>
				<hr>
				<div class="hInfoArea">
					호텔정보 영역입니다.<br>
				</div>
			</div>
		</div>
		
		<div class="col-lg-12 col-md-12">
		<div class="tm-section-header section-margin-top">
			<div class="col-lg-4 col-md-4 col-sm-4"><h2 class="tm-section-title">인근정보</h2></div>
			<div class="col-lg-8 col-md-8 col-sm-8"><hr></div>	
		</div>
			<div id="google-map"></div>
		</div>
	</section>
		<script>
		
			var contentid = ${param.contentid};
			var contenttypeid = ${param.contenttypeid};
			var cid = ${param.cid};
			
			
			function detailHotelInfo(){
				console.log("deatilHotel : " + contenttypeid);
				console.log("detailHotel : " + contentid);
				$.ajax({
					url:"detailHotelInformation.sub",
					type:"GET",
					data:{contenttypeid:contenttypeid, contentid:contentid},
					dataType:"json",
					success:function(data){
						console.log(data);
						var myData = data.response.body.items.item;
						var output = "";
						var overviewText = myData.overview.split(". ");
						$("#hotelTitleText").text(myData.title);
						for(var i = 0; i < overviewText.length; i++){
							output += overviewText[i] + ".<br>";
						}
						$(".contentArea").html(output);
						if(myData.firstimage == null){
							output = "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='firstImg' />";
						}else{
							output = "<img src="+myData.firstimage+" alt='image' class='firstImg' />";
						}
						$(".firstImgArea").html(output);
						if(typeof(myData.mapy === String)){
							myData.mapy = parseFloat(myData.mapy);
						}
						if(typeof(myData.mapx === String)){
							myData.mapx = parseFloat(myData.mapx);
						}
						initialize(myData.mapy, myData.mapx, myData.title);
					},
					error:function(data){
						console.log(data);
					}
				});
			}
			
			function detailHotelImage(){
				console.log("detailHotelImage : " + contentid);
				$.ajax({
					url:"detailHotelImage.sub",
					type:"GET",
					data:{contenttypeid:contenttypeid, contentid:contentid},
					dataType:"json",
					success:function(data){
						console.log(data);
						var myData = data.response.body.items.item;
						var count = 0;
						var output = "";
						if(data.response.body.items == ""){
							output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='secondImg' />";
							output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='secondImg' />";
						}else{
							for(var i = 0; i < myData.length; i++){
								count++;
								output += "<img src="+myData[i].originimgurl+" alt='image' class='secondImg' />";
								if(count == 2){break;}
							}
						}
						$(".secondImgArea").html(output);
					},
					error:function(data){
						console.log(data);
					}
				});
			}
			
			function detailHotelIntro(){
				console.log("detailHotelIntro : " + contenttypeid);
				console.log("detailHotelIntro : " + contentid);
				$.ajax({
					url:"detailHotelIntro.sub",
					type:"GET",
					data:{contenttypeid:contenttypeid, contentid:contentid},
					dataType:"json",
					success:function(data){
						console.log(data);
						var myData = data.response.body.items.item;
						var output = "";
						var hInfo = $(".hInfoArea");
						hInfo.html("");
						output += "<h3>숙박정보</h3><br>";
						output += "ㆍ <b>문의 및 안내</b> : "+myData.infocenterlodging+"<br>";
						output += "ㆍ <b>규 모</b> : "+myData.scalelodging+"<br>";
						output += "ㆍ <b>객실 유형</b> : "+myData.roomtype+"<br>";
						output += "ㆍ <b>주차 가능</b> : "+myData.parkinglodging+"<br>";
						output += "ㆍ <b>조리 가능</b> : "+myData.chkcooking+"<br>";
						output += "ㆍ <b>체크인</b> : "+myData.checkintime+"<br>";
						output += "ㆍ <b>체크아웃</b> : "+myData.checkouttime+"<br>";
						output += "ㆍ <b>예약 안내</b> : "+myData.reservationlodging+"<br>";
						output += "ㆍ <b>예약안내 홈페이지</b> : "+myData.reservationurl+"<br>";
						hInfo.html(output);
					},
					error:function(data){
						console.log(data);
					}
				});
			}
			
			var rid = 0;
			var price = 0;
			var rType = "";
			
			// 환율 적용
			var curIcon = $("#CURICON").val();
			var currency = $("#CUR").val();
			//console.log(currency);
			//console.log(currency);
			currency=parseFloat(currency);
			
			if(curIcon == '¥'){
				currency=currency*10;
			}
			if(curIcon == 'Rp'){
				currency=currency*10;
			}
			if(curIcon == '$'){
				currency=currency*1000;
			}
			
			//console.log(curIcon);
			//console.log(currency);
			
			function numberWithCommas(x){
				x=x.toFixed(2);
				return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
			
			function detailRoomInfo(){
				console.log("detailRoomInfo : " + contenttypeid);
				console.log("detailRoomInfo : " + contentid);
				$.ajax({
					url:"detailRoomInfo.sub",
					type:"GET",
					data:{contenttypeid:contenttypeid, contentid:contentid},
					dataType:"json",
					success:function(data){
						console.log(data);
						var myData = data.response.body.items.item;
						var output = "";
						var roomInfo = $("#roomInfoArea");
						roomInfo.html("");
						$.ajax({
							url:"detailRoom.com",
							type:"GET",
							data:{contentid:contentid, cid:cid},
							dataType:"json",
							success:function(result){
								console.log("여기와?");
								console.log(result);
								for(var i in myData){
									rid = result[i].rid;
									price = result[i].rPrice;
									rType = result[i].rType;
									output = "";
									output += "<tr class='detailRow'>";
									if(myData[i].roomimg1 == null){
										output += "<td class='detailContent detailContent1'><img src='${contextPath}/resources/img/noImage.gif' class='roomIngTd' />";
									}else{ 
										output += "<td class='detailContent detailContent1'><img src="+myData[i].roomimg1+" class='roomImgTd' />";
									}
									output += "</td>";
									output += "<td>";
									output += "<h4><b>객실명 : "+result[i].rType+"</b></h4>";
									output += "ㆍ 객실크기 : "+myData[i].roomsize1+" 평<br>";
									output += "ㆍ 목욕시설 : "+myData[i].roombathfacility+"<br>";
									output += "ㆍ 욕조 : "+myData[i].roombath+"<br>";
									output += "ㆍ 에어컨 : "+myData[i].roomaircondition+"<br>";
									output += "ㆍ TV : "+myData[i].roomtv+"<br>";
									output += "ㆍ 케이블설치 : "+myData[i].roomcable+"<br>";
									output += "ㆍ 인터넷 : "+myData[i].roominternet+"<br>";
									output += "ㆍ 냉장고 : "+myData[i].roomrefrigerator+"<br>";
									output += "ㆍ 세면도구 : "+myData[i].roomtoiletries+"<br>";
									output += "ㆍ 드라이기 : "+myData[i].roomhairdryer+"<br>";
									output += "</td>"
									output += "<td style='font-size:23px;'>";
									output += "ㆍ 정원 : "+myData[i].roombasecount+"명<br>";
									output += "ㆍ 최대인원 : "+result[i].rLimit+"명<br>";
									output += "ㆍ 가격 : " + curIcon + " " + numberWithCommas((result[i].rPrice/currency)) + "<br>";
									output += "</td>";
									output += "<td class='detailContent detailCount'>";
									output += "인　원 &nbsp;&nbsp;<select class='selectPeople' id='selectPeople"+rid+"' name='selectPeople'>";
									output += "<option>선택</option>";
									for(var p = 1; p < result[i].rLimit+1; p++){
										output += "<option value="+p+">"+p+"</option>";
									}
									output += "</select><br>";
									output += "객실수　<select class='selectRoom' id='selectRoom"+rid+"' name='selectRoom'>";
									output += "<option>선택</option>";
									if(result[i].rCount > 1){
										for(var r = 1; r < result[i].rCount+1; r++){
											output += "<option value="+r+">"+r+"</option>";
										}
									}else{
										output += "<option value='1'>1</option>";
									}
									output += "</select>";
									output += "<br><br><br><br><br><br><br>";
									output += "<input type='hidden' class='roomRid' name='roomRid' value="+rid+">";
									output += "<input type='hidden' class='roomPrice' name='roomPrice' value="+price+">";
									output += "<input type='hidden' class='roomType' name='roomType' value='"+rType+"'>";
									output += "<input type='button' class='btn' onclick='payment("+rid+","+price+","+'rType'+")' value='예약' style='background-color:#00aef0; color:white; width:200px; height:45px;'/>";
									//output += "<input type='text' id='roomInfo"+rid+"' value='"+rid+","+price+","+rType+"'>";
									output += "</td>";
									output += "</tr>"
									document.getElementById("roomInfoArea").innerHTML += output;
								}
							},error:function(result){console.log(data);}
						});
					},
					error:function(data){
						console.log(data);
					}
				});//output += "ㆍ ";
			}
			
			</script>
			
			<c:if test="${!empty sessionScope.loginUser}">
			<script>
			function payment(rid, price, rType){
				var count = $("#selectRoom"+rid).val();
				var limit = $("#selectPeople"+rid).val();
				var startDate = $("#fromDate").val();
				var endDate = $("#toDate").val();
				
				location.href="${contextPath}/reservationRoom.com?rid="+rid+"&price="+price+"&rType="+rType+"&count="+count+"&limit="+limit+"&startDate="+startDate+"&endDate="+endDate;
			}
			</script>
			</c:if>
			<c:if test="${empty sessionScope.loginUser}">
			<script>
			function payment(rid, price, rType){
				alert("로그인이 필요한 서비스입니다.");
			}
			</script>
			</c:if>
			
			
			<script>
			function paymentTest(){
				var startDate = $("#fromDate").val();
				var endDate = $("#toDate").val();
				console.log("startDate : " + startDate);
				console.log("endDate : " + endDate);
				var people = "";
				var roomcount = "";
				var rid;
				var price;
				var rType;
				
				var jsonArray = new Array();
				$("select[name=selectPeople]").each(function(index, value){
					people += index + " : " + value.value + " ";
					if(value.value != "선택"){
						//console.log(index +"번 객실");
						$("select[name=selectRoom]").each(function(i, v){
							if(index == i){
								//console.log(value.value, v.value);
								rid = $("table tbody").children("tr").eq(i).children("td").eq(3).children("input").eq(0).val();
								price = $("table tbody").children("tr").eq(i).children("td").eq(3).children("input").eq(1).val();
								rType = $("table tbody").children("tr").eq(i).children("td").eq(3).children("input").eq(2).val();
								console.log("인원 : " + value.value);
								console.log("객실수 : " + v.value);
								console.log("rid : " + rid);
								console.log("price : " + price);
								console.log("rType : " + rType);
								var param = {
										"people" : value.value,
										"roomcount" : v.value,
										"rid" : rid,
										"price" : price,
										"rType" : rType,
										"start" : startDate,
										"end" : endDate
								};
								jsonArray.push(param);
							}
						});
					}
				});
				var myJSON = JSON.stringify(jsonArray);
				console.log(myJSON);
				
				var $form = $("#reservationRooms");
					$form.attr("action","${contextPath}/reservationRooms.com");
					$form.attr("method","post");
					$form.append("<input type='hidden' value='"+myJSON+"' name='myJson'>");
					$form.submit();
					//alert($("input[name=myJson]").val());
				
			}
			
			//객실번호, 주소, 업체명(rid로 join), 예약시작일, 예약종료일, 인원, 객실수, rid, null, 객실이름, 가격(파람으로넘기기)
			$(function(){
				detailHotelInfo();
				detailHotelImage();
				detailHotelIntro();
				detailRoomInfo();
				
				console.log("cid : "+ cid);
				
				
			});
		/* Google map
      	------------------------------------------------*/
      	var map;
        function initialize(mapy, mapx, title) {
        	var mapLocation = {lat:mapy, lng:mapx};
        	var mapOptions = { //구글 맵 옵션 설정
            	zoom : 16, //기본 확대율
            	center : mapLocation, //new google.maps.LatLng(mapy, mapx), // 지도 중앙 위치
            	scrollwheel : false, //마우스 휠로 확대 축소 사용 여부
            	mapTypeControl : false //맵 타입 컨트롤 사용 여부
          };
   
          map = new google.maps.Map(document.getElementById('google-map'), mapOptions); //구글 맵을 사용할 타겟
          var size_x = 60;
          var size_y = 60;
          var image = new google.maps.MarkerImage('https://www.weicherthallmark.com/wp-content/themes/realty/lib/images/map-marker/map-marker-gold-fat.png', //마커 이미지 설정
        		  		new google.maps.Size(size_x, size_y),'','',
        		  		new google.maps.Size(size_x, size_y));
          var marker = new google.maps.Marker({ //마커 설정
              map : map,
              position : mapLocation, //마커 위치
              //icon : image,//마커 이미지
              title : title//가게이름..
          });
   
          google.maps.event.addDomListener(window, "resize", function() { //리사이즈에 따른 마커 위치
              var center = map.getCenter();
              google.maps.event.trigger(map, "resize");
              map.setCenter(center); 
          });
	    }
	
      	// DOM is ready
		$(function() {
			
			


			// https://css-tricks.com/snippets/jquery/smooth-scrolling/
			/* $('a[href*=#]:not([href=#])').click(function() {
				if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
					var target = $(this.hash);
					target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
					if (target.length) {
						$('html,body').animate({
							scrollTop: target.offset().top
						}, 1000);
						return false;
					}
				}
			}); */

		  	// Flexslider
		  	$('.flexslider').flexslider({
		  		controlNav: false,
		  		directionNav: false
		  	});

		  	// Google Map
		  	//loadGoogleMap();
		  })(jQuery);
		
	</script>
	
	<section class="container tm-home-section-1" id="more">
		<div class="col-lg-12" >
		 <form id="reservationRooms">
			<div class="col-lg-12 dateArea" align="center">
				<span style="font-size:30px;">이용일자　　</span><jsp:include page="../common/datePicker.jsp"/>
			</div>
			
			<table border="1" class="infoTable">
				<thead>
					<tr>
						<th class="detailHead">객실유형</th>
						<th class="detailHead">정보</th>
						<th class="detailHead">가격</th>
						<th class="detailHead">객실선택</th>
					</tr>
				</thead>
				<tbody id="roomInfoArea">
					<tr class="detailRow">
						<td class="detailContent detailContent1">정보오오오오오오오오</td>
						<td class="detailContent">정보오오오오오오오오</td>
						<td class="detailContent">정보오오오오오오오오</td>
						<td class="detailContent detailCount">정보오오오오오오오오</td>
					</tr>
					
				</tbody>
				<tfoot>
					<tr>
						<td class="detailBottom"></td>
						<td class="detailBottom"></td>
						<td class="detailBottom"></td>
						<td class="detailBottom">
						<!-- <input type="button" class="btn" onclick="paymentTest();" id="paymentBtn" value="결제하기" style="background-color:#00aef0; color:white; width:200px; height:45px;"/> -->
						</td>
					</tr>
				</tfoot>
			</table>
			</form>
					
		</div>
	</section>
	<section class="container tm-home-section-1" id="more">
   
      <div class="section-margin-top about-section">
         <div class="row"> 
         </div>         
         <div class="tm-section-header section-margin-top">
       		   <div class="col-lg-4 col-md-4 col-sm-4 title1"><h2 class="tm-section-title1">R E V I E W (${ listCount })</h2></div>
      		   <div class="col-lg-8 col-md-8 col-sm-8"><hr></div>
	      	   <div style = "height:200px; width:100%; position:relative; text-align:center">
	      	   		<div class = "star_rating br1" style = "display:inline-block; width:310px; height:200px; padding-top:50px; padding-left:50px; text-align:left; float:left;">
	      	   			<c:set var="num1" value="20"/>
             			<c:set var="num2" value="3" />
             
						<div style = "margin-bottom:2px;">
             			<div class="progressbar-wrap" style="display:inline-block; width:29%; heigth:10px; float:left;">
             				<div style = "height:14px;">매우좋음</div>		
             			</div>
             			<div class="progressbar-wrap" style="display:inline-block; background:gray; width:69%; heigth:14px; float:left; margin-top:2px;">
                        	<div style="background:blue; width:${(num2 / num1) * 100 }%; height:14px;"></div>
                        </div>
                        </div>

	      	   		</div> 
	      	   		<div class ="best_review br1" style = "display:inline-block; width:600px; height:200px; padding-top:50px; padding-left:70px; text-align:left; float:left;">
	      	   			
	      	   		</div>
	      	   		<button type="button" class="btn btn-secondary" 
	      	   			style = "position:absolute; right:10px; bottom:10px"
	      	   			onclick="review()">리뷰 쓰기</button>
	      	   </div>	   

      	 </div>
      </div>
      <div class = "new_line">
		 <c:forEach var = "list" items = "${ list }"> 
      
         <div class="row line_b" >
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" style = "height:220px">
               <div class="tm-about-box-1" style = "height:220px; padding:10px 10px">
                  <a href="#"><img src="${ contextPath }/resources/img/about-4.jpg" alt="img" class="tm-about-box-1-img" style = "margin:0 auto 10px"></a>
                  <h3 class="tm-about-box-1-title" style = "margin-bottom:5px">Songs <span>( GOD )</span></h3>
                  <!-- <p class="margin-bottom-15 gray-text">Proin gravida nibhvell aliquet. Aenean sollicitudin bibum auctor nisi elit.</p> -->
                  <div class="gray-text">
                     <a href="#" class="tm-social-icon"><i class="fa fa-twitter"></i></a>
                     <a href="#" class="tm-social-icon"><i class="fa fa-facebook"></i></a>
                     <a href="#" class="tm-social-icon"><i class="fa fa-pinterest"></i></a>
                     <a href="#" class="tm-social-icon"><i class="fa fa-google-plus"></i></a>
                  </div>
               </div>
            </div>
            <div class="col-lg-9 col-md-9 col-sm-6 col-xs-12 line_l" style = "height:220px; padding-bottom:10px" >	
            	<br>
            	<div>
            		<c:if test = "${ list.grade eq 0.0 }">
            			<span class="StarBar">
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            			</span>
            		</c:if>
            		<c:if test = "${ list.grade eq 0.5 }">
            			<span class="StarBar">
            				<i class="fas fa-star-half-alt" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            			</span>
            		</c:if>
            		<c:if test = "${ list.grade eq 1.0 }">
            			<span class="StarBar">
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            			</span>
            		</c:if>
            		<c:if test = "${ list.grade eq 1.5 }">
            			<span class="StarBar">
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star-half-alt" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            			</span>
            		</c:if>
            		<c:if test = "${ list.grade eq 2.0 }">
            			<span class="StarBar">
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            			</span>
            		</c:if>
            		<c:if test = "${ list.grade eq 2.5 }">
            			<span class="StarBar">
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star-half-alt" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            			</span>
            		</c:if>
            		<c:if test = "${ list.grade eq 3.0 }">
            			<span class="StarBar">
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            			</span>
            		</c:if>
            		<c:if test = "${ list.grade eq 3.5 }">
            			<span class="StarBar">
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star-half-alt" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            			</span>
            		</c:if>
            		<c:if test = "${ list.grade eq 4.0 }">
            			<span class="StarBar">
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            			</span>
            		</c:if>
            		<c:if test = "${ list.grade eq 4.5 }">
            			<span class="StarBar">
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star-half-alt" style = "font-size:20px"></i>
            			</span>
            		</c:if>
            		<c:if test = "${ list.grade eq 5.0 }">
            			<span class="StarBar">
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            			</span>
            		</c:if>
            	
            	&nbsp;&nbsp;
            	<span class="ReviewUpDate">
            		리뷰 게시 날짜 : ${ list.modify_date }
            	</span>
            	</div>
            	<div class="ReviewTitle" style = "font-size:20px; cursor:pointer; padding-top:10px">
            		<a onclick = "goDetail(${ list.bid })"><span>${ list.title }</span></a>
            	</div>
            	<div class="summary" style = "padding-top:10px">
            		<p>${ list.text }</p>
            		<span><a onclick = "goDetail(${ list.bid })" style = "font-weight:bold">자세히 보기</a></span>
            	</div>
            	<div style = "padding-top:20px;" >
            		<div class="fa" style = "width:100%">
            			<i class="fa fa-thumbs-o-up" style = "font-size:20px; padding-top:10px"> ${ list.likey } </i>
            			<i class="far fa-comment-dots" style = "font-size:20px; padding-top:10px"> 0 </i>
            			<i class="fa fa-flag" style = "font-size:20px; padding-top:10px; float:right;"><a onclick="reportWrite(this)"> 신고하기</a> </i>
            			<input type = "hidden" value="${ list.m_id }">
            			<input type = "hidden" value="${ list.bid }">
            		</div>
            	</div>
            </div>
            
         </div> 
         </c:forEach>
         </div>
         <div class="paging" align="center">
<ul class="pagination pagination-sm">
<c:if test="${ pi.currentPage <= 1 }">
<li><a>&laquo;</a></li>
            </c:if>
            <c:if test="${ pi.currentPage > 1 }">
                <li><a onclick="goPrev();">&laquo;</a></li>
            </c:if>
            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                <c:if test="${ p eq pi.currentPage }">
                <li><a style="background-color:#ddd;">${ p }</a></li>               
                </c:if>
                <c:if test="${ p ne pi.currentPage }">
                    <li><a onclick="goPage(${ p });">${ p }</a></li>  
                </c:if>
            </c:forEach>
            <c:if test="${ pi.currentPage >= pi.maxPage }">
                <li><a>&raquo;</a></li>
            </c:if>
            <c:if test="${ pi.currentPage < pi.maxPage }">
                <li><a onclick="goNext(${ pi.currentPage });">&raquo;</a></li>
            </c:if>
            </ul>
    </div>    
 
   </section> 
   
   <section class="container tm-home-section-1" id="more">
   
      <div class="section-margin-top about-section">
         <div class="row">   
         </div>         
         <div class="tm-section-header section-margin-top">
       		   <div class="col-lg-4 col-md-4 col-sm-4 title2"><h2 class="tm-section-title2">Q & A (${ listCount2 })</h2></div>
      		   <div class="col-lg-8 col-md-8 col-sm-8"><hr></div>
	      	   <div style = "height:200px; width:100%; position:relative">
	      	   		<button type="button" class="btn btn-secondary" style = "position:absolute; right:10px; bottom:10px" onclick="qa()">Q&A 쓰기</button>
	      	   </div>	   

      	 </div>
      </div>
      <div class = "new_line2">
      	<c:forEach var = "list2" items = "${ list2 }">
         <div class="row line_b" >
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" style = "height:auto">
               <div class="tm-about-box-1" style = "height:220px; padding:10px 10px">
                  <a href="#"><img src="${ contextPath }/resources/img/about-4.jpg" alt="img" class="tm-about-box-1-img" style = "margin:0 auto 10px"></a>
                  <h3 class="tm-about-box-1-title" style = "margin-bottom:5px">Songs <span>( GOD )</span></h3>
                  <!-- <p class="margin-bottom-15 gray-text">Proin gravida nibhvell aliquet. Aenean sollicitudin bibum auctor nisi elit.</p> -->
                  <div class="gray-text">
                     <a href="#" class="tm-social-icon"><i class="fa fa-twitter"></i></a>
                     <a href="#" class="tm-social-icon"><i class="fa fa-facebook"></i></a>
                     <a href="#" class="tm-social-icon"><i class="fa fa-pinterest"></i></a>
                     <a href="#" class="tm-social-icon"><i class="fa fa-google-plus"></i></a>
                  </div>
               </div>
            </div>
            <div class="col-lg-9 col-md-9 col-sm-6 col-xs-12 line_l" style = "height:auto">	
            	<br>
            	<div class="summary" style = "padding-top:10px; font-size:18px">
            		${ list2.text }
            	</div>
            	<br>
            	
            	<div style = "padding-top:1px" >
            		<div class="fa" style = "width:100%">
            			<span class="ReviewUpDate" style = "padding-top:5px">
            				${ list2.modify_date }
            			</span>
            			<span>|</span>
            			<span class="ReviewUpDate" style = "padding-top:5px">
            				<i class="fa fa-thumbs-o-up" style = "font-size:14px; padding-top:5px"> ${ list2.likey } </i>
            				<i class="fa fa-flag" style = "font-size:14px; padding-top:5px; float:right; cursor:pointer"><a onclick="reportWrite(this)"> 신고하기</a></i>
            				<input type = "hidden" value="${ list2.m_id }">
            				<input type = "hidden" value="${ list2.bid }">
            			</span>	
            		</div>
            	</div>
            	<div style = "margin-top:5px">
            		<button type="button" class="btn btn-secondary" onclick = "QA('${ list2.bid }');">답변</button>
            		<button type="button" class="btn btn-secondary" onclick = "allQA('${ list2.bid }');">모든 답변보기</button>
            		<div id = "allQAV${ list2.bid }" class = "QAV" style = "padding-top:5px;">
            		<c:forEach var="listQAnswer" items="${ listQAnswer }">
            		<c:if test="${ list2.bid eq listQAnswer.bid }">
            			<div class="summary" style = "padding-top:10px; font-size:18px">
            				${ listQAnswer.content }
            			</div>
            			<span class="ReviewUpDate" style = "padding-top:5px">
            				${ listQAnswer.modify_date }
            			</span>
            			<span>|</span> ${ listQAnswer.bid }님의 답변
            		</c:if>
            		</c:forEach>
            		</div>
            		<div id = "${ list2.bid }" class = "QAV" Style ="padding-top:10px">
            			<input type = "hidden" value = "${ list2.bid }">
            			<textarea style="resize: none;" name = "text" rows="3" cols="110"></textarea>
            			<button type="button" class="btn btn-secondary" onclick = "insertA(this);">확인</button>
            		</div>
            	</div>
            	
            </div>
            
         </div> 
         <br><br><br>
         <div></div>
         </c:forEach>
      </div>    
         <br>              
      <div class="paging2" align="center">
<ul class="pagination pagination-sm">
<c:if test="${ pi2.currentPage <= 1 }">
<li><a>&laquo;</a></li>
            </c:if>
            <c:if test="${ pi2.currentPage > 1 }">
                <li><a onclick="goPrev2();">&laquo;</a></li>
            </c:if>
            <c:forEach var="p" begin="${ pi2.startPage }" end="${ pi2.endPage }">
                <c:if test="${ p eq pi2.currentPage }">
                <li><a style="background-color:#ddd;">${ p }</a></li>               
                </c:if>
                <c:if test="${ p ne pi2.currentPage }">
                    <li><a onclick="goPage2(${ p });">${ p }</a></li>  
                </c:if>
            </c:forEach>
            <c:if test="${ pi2.currentPage >= pi2.maxPage }">
                <li><a>&raquo;</a></li>
            </c:if>
            <c:if test="${ pi2.currentPage < pi2.maxPage }">
                <li><a onclick="goNext2(${ pi2.currentPage });">&raquo;</a></li>
            </c:if>
            </ul>
    </div>  
   </section>
	
	<!-- white bg -->
	<section class="tm-white-bg section-padding-bottom"></section>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
	
		function QPaging(page){
			console.log("page : " + page);
			
			$.ajax({ 
				url:"QPaging.bo",
				type:"post",
				data:{page:page,contentid:contentid},
				dataType:"json",
				success:function(data){
					console.log(data);
					
					$divBody = $(".new_line2");
					$divBody.html('');
					
					$pageBody = $(".paging2 ul");
					$pageBody.html('');
					
					var Q = data.list2;
					var p2 = data.pi2;
					var QAnswer = data.listQAnswer;
					
					$pageTitle = $(".tm-section-title2");
					$pageTitle.html('');
					var m_id = ${sessionScope.loginUser.mId};
					var count2 = data.listCount2;
					$pageTitle.append("Q & A ("+count2+")");
					
					if(Q.length > 0){
						for(var i = 0 ; i < Q.length; i++){
							var output="";
							output += "<br><br><br>";
							output += "<div class='row line_b'>";
							output += "<div class='col-lg-3 col-md-3 col-sm-6 col-xs-12' style = 'height:auto'>";
							output += "<div class='tm-about-box-1' style = 'height:220px; padding:10px 10px;'>";
								if(Q[i].attach != ""){
									output += "<a onclick = member_info(this);><img src='${ contextPath }/resources/uploadFiles/member/"+Q[i].attach+"' alt='img' class='tm-about-box-1-img' style = 'margin:0 auto 10px; width:140px; height:140px;'></a>";
								}else{
									output += "<a onclick = member_info(this);><img src='${ contextPath }/resources/img/about-4.jpg' alt='img' class='tm-about-box-1-img' style = 'margin:0 auto 10px;'></a>";
								}
							output += "<h3 class='tm-about-box-1-title' style = 'margin-bottom:5px;'>"+Q[i].nickname+"<span>( "+Q[i].national+" )</span></h3>";
							output += "<div class = 'member_info' style = 'border-radius: 10px; visibility:hidden; position:absolute; background-color:lightgray; left:-133px; top:-10px; width:200px; height:200px; z-index:999;'>";
							output += "<div><h3>"+Q[i].nickname+"</h3><input type='hidden' id='receiveIdForq"+i+"' value="+Q[i].m_id+"><input type='hidden' id='nicknameForq"+i+"' value="+Q[i].nickname+"><input type='hidden' id='mIdForq' value="+${sessionScope.loginUser.mId}+"></div>";
							output += "<div style = 'text-align:right;'><button class='btn btn-light' style='width:65px; height:30px;' type = 'button' onclick='openMsg2("+i+")'>메세지</button></div>";
							output += "<div class='info' style = 'text-align:left;'>회원가입시기 : "+Q[i].create_date+"<br>";
							output += "흥미 : "+Q[i].interesting+", 국적 : "+Q[i].national+"<br>";
							output += "E-MAIL : "+Q[i].email+"<br>";
							output += "<i class='fa fa-thumbs-o-up' style = 'font-size:13px;'></i> "+Q[i].help_count+"건의 도움되는 리뷰, 댓글<br>";
							output += "<i class='fas fa-pen-square'></i> "+Q[i].board_count+"건 포스팅<br>";
							output += "<i class='fas fa-pen'></i> "+Q[i].reply_count+"건의 도움글 작성";
							output += "</div>";
							output += "</div>";
							output += "<div class='gray-text'>";
							output += "</div>";
							output += "</div>";
							output += "</div>";	
							output += "<div class='col-lg-9 col-md-9 col-sm-6 col-xs-12 line_l' style = 'height:auto;' ><br>";
							output += "<div class='summary' style = 'padding-top:10px; font-size:18px'>";
							output += Q[i].text+"<span>";
							output += "</div><br>";
							output += "<div style = 'padding-top:1px' >";
							output += "<div class='fa' style = 'width:100%'>";
							output += "<span class='ReviewUpDate' style = 'padding-top:5px'>";
							output += Q[i].modify_date+"</span>";
							output += "<span>&nbsp;|&nbsp;</span>";
							output += "<span class='ReviewUpDate' style = 'padding-top:5px'><i class='fa fa-flag' style = 'font-size:14px; padding-top:5px; float:right; cursor:pointer'><input type = 'hidden' value="+Q[i].m_id+"><input type = 'hidden' value="+Q[i].bid+"><a onclick='reportWrite(this);'> 신고하기</a></i></span>";
							output += "</div></div>";
							output += "<div style = 'margin-top:5px'><button type='button' class='btn btn-secondary' onclick = 'QA("+Q[i].bid+");'>답변</button>&nbsp;<button type='button' class='btn btn-secondary' onclick = 'allQA("+Q[i].bid+");'>모든 답변보기</button></div>";
							output += "<div id = 'allQAV"+Q[i].bid+"' class = 'QAV' style = 'padding-top:5px;''>";
		            		for(var j = 0 ; j < QAnswer.length ; j++){		            			
		            			if(Q[i].bid == QAnswer[j].bid){
		            				output += "<div class='summary' style = 'padding-top:10px; font-size:18px'>";
		            				output += QAnswer[j].content+"</div>";
		            				output += "<span class='ReviewUpDate' style = 'padding-top:5px'>"+QAnswer[j].modify_date+"</span>";
		            				output += "<span>|</span> "+QAnswer[j].nickname+"님의 답변";
		            				
		            			}
		            		}
		            		output += "</div>";
							output += "<div id = "+Q[i].bid+" class = 'QAV' Style ='padding-top:10px'><input type = 'hidden' value = "+Q[i].bid+"><textarea style='resize: none;' name = 'text' rows='3' cols='110'></textarea><button type='button' class='btn btn-secondary' onclick = 'insertA(this);'>확인</button></div></div>";
							
							$divBody.append(output);
						}
						var num = p2.maxPage;
						var pOutput = "";
						if(p2.currentPage <= 1){
							pOutput += "<li><a>&laquo;</a></li>";
						}
						if(p2.currentPage > 1){
							pOutput += "<li><a onclick='goPrev2("+p2.currentPage+");'>&laquo;</a></li>";
						}
						for(var a = p2.startPage ; a <= p2.endPage ; a++){
							if(a == p2.currentPage){
								pOutput += "<li><a style='background-color:#ddd;''>"+a+"</a></li>";
							}
							if(a != p2.currentPage){
								pOutput += "<li><a onclick='goPage2("+a+");'>"+a+"</a></li>";
							}
						}
						if(p2.currentPage >= p2.maxPage){
							pOutput += "<li><a>&raquo;</a></li>";
						}
						if(p2.currentPage < p2.maxPage){
							pOutput += "<li><a onclick='goNext2("+p2.currentPage+");'>&raquo;</a></li>";
						}

						$pageBody.append(pOutput);
					}
				}, error:function(data){
					console.log(data);
				}
			});
		}
		
		function reviewPaging(page){
			console.log("page : " + page);
			
			$.ajax({ 
				url:"reviewPaging.bo",
				type:"post",
				data:{page:page,contentid:contentid},
				dataType:"json",
				success:function(data){
					console.log(data);
					
					$divBody = $(".new_line");
					$divBody.html('');
					
					$pageBody = $(".paging ul");
					$pageBody.html('');
					
					$pageTitle = $(".tm-section-title1");
					$pageTitle.html('');
					
					$star = $(".star_rating");
					$star.html('');
					var listcount = data.listCount;
					var gCount = data.gCount;
					var width5 = (gCount[0] / listcount) * 100;
					var width4 = (gCount[1] / listcount) * 100;
					var width3 = (gCount[2] / listcount) * 100;
					var width2 = (gCount[3] / listcount) * 100;
					var width1 = (gCount[4] / listcount) * 100;
					var starOut = "";
					starOut += "<div style = 'margin-bottom:6px; height:14px;'>";
	             	starOut += "<div class='progressbar-wrap' style='display:inline-block; width:29%; heigth:10px; float:left;'>";
	             	starOut += "<div style = 'height:14px; margin-top:4px;'>매우좋음</div>";	
	             	starOut += "</div>";
	             	starOut += "<div class='progressbar-wrap' style='display:inline-block; background:gray; width:58%; heigth:14px; float:left; margin-top:6px;'>";
	             	starOut += "<div style='background:red; width:"+width1+"%; height:14px;'></div>";
	             	starOut += "</div>";
	             	starOut += "<div class='progressbar-wrap' style='display:inline-block; height:14px; margin-top:4px;'>&nbsp;("+gCount[4]+")</div>";
	             	starOut += "</div>";
	             	starOut += "<div style = 'margin-bottom:9px; height:14px;'>";
	             	starOut += "<div class='progressbar-wrap' style='display:inline-block; width:29%; heigth:10px; float:left;'>";
	             	starOut += "<div style = 'height:14px; margin-top:9px;'>좋&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;음</div>";	
	             	starOut += "</div>";
	             	starOut += "<div class='progressbar-wrap' style='display:inline-block; background:gray; width:58%; heigth:14px; float:left; margin-top:12px;'>";
	             	starOut += "<div style='background:red; width:"+width2+"%; height:14px;'></div>";
	             	starOut += "</div>";
	             	starOut += "<div class='progressbar-wrap' style='display:inline-block; height:14px; margin-top:10px;'>&nbsp;("+gCount[3]+")</div>";
	             	starOut += "</div>";
	             	starOut += "<div style = 'margin-bottom:9px; height:14px;'>";
	             	starOut += "<div class='progressbar-wrap' style='display:inline-block; width:29%; heigth:10px; float:left;'>";
	             	starOut += "<div style = 'height:14px; margin-top:9px;'>보&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;통</div>";	
	             	starOut += "</div>";
	             	starOut += "<div class='progressbar-wrap' style='display:inline-block; background:gray; width:58%; heigth:14px; float:left; margin-top:12px;'>";
	             	starOut += "<div style='background:red; width:"+width3+"%; height:14px;'></div>";
	             	starOut += "</div>";
	             	starOut += "<div class='progressbar-wrap' style='display:inline-block; height:14px; margin-top:13px;'>&nbsp;("+gCount[2]+")</div>";
	             	starOut += "</div>";
	             	starOut += "<div style = 'margin-bottom:9px; height:14px;'>";
	             	starOut += "<div class='progressbar-wrap' style='display:inline-block; width:29%; heigth:10px; float:left;'>";
	             	starOut += "<div style = 'height:14px; margin-top:9px;'>불&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;만</div>";	
	             	starOut += "</div>";
	             	starOut += "<div class='progressbar-wrap' style='display:inline-block; background:gray; width:58%; heigth:14px; float:left; margin-top:12px;'>";
	             	starOut += "<div style='background:red; width:"+width4+"%; height:14px;'></div>";
	             	starOut += "</div>";
	             	starOut += "<div class='progressbar-wrap' style='display:inline-block; height:14px; margin-top:15px;'>&nbsp;("+gCount[1]+")</div>";
	             	starOut += "</div>";
	             	starOut += "<div style = 'margin-bottom:9px; height:14px;'>";
	             	starOut += "<div class='progressbar-wrap' style='display:inline-block; width:29%; heigth:10px; float:left;'>";
	             	starOut += "<div style = 'height:14px; margin-top:9px;'>매우불만</div>";	
	             	starOut += "</div>";
	             	starOut += "<div class='progressbar-wrap' style='display:inline-block; background:gray; width:58%; heigth:14px; float:left; margin-top:12px;'>";
	             	starOut += "<div style='background:red; width:"+width5+"%; height:14px;'></div>";
	             	starOut += "</div>";
	             	starOut += "<div class='progressbar-wrap' style='display:inline-block; height:14px; margin-top:18px;'>&nbsp;("+gCount[0]+")</div>";
	             	starOut += "</div>";

	             	$star.append(starOut);
					var count1 = data.listCount;
					$pageTitle.append("R E V I E W ("+count1+")");
					
					var review = data.list;
					console.log(review.length);
					var p = data.pi;			
					
					if(review.length > 0){
						for(var i = 0 ; i < review.length; i++){
							var output="";
							output += "<div class='row line_b'>";
							output += "<div class='col-lg-3 col-md-3 col-sm-6 col-xs-12' style = 'height:220px'>";
							output += "<div class='tm-about-box-1' style = 'height:220px; padding:10px 10px;'>";
							if(review[i].attach != ""){
								output += "<a onclick = member_info(this);><img src='${ contextPath }/resources/uploadFiles/member/"+review[i].attach+"' alt='img' class='tm-about-box-1-img' style = 'margin:0 auto 10px; width:140px; height:140px;'></a>";
							}else{
								output += "<a onclick = member_info(this);><img src='${ contextPath }/resources/img/about-4.jpg' alt='img' class='tm-about-box-1-img' style = 'margin:0 auto 10px;'></a>";
							}
							output += "<h3 class='tm-about-box-1-title' style = 'margin-bottom:5px;'>"+review[i].nickname+"<span>( "+review[i].national+" )</span></h3>";
							output += "<div class = 'member_info' style = 'border-radius: 10px; visibility:hidden; position:absolute; background-color:lightgray; left:-133px; top:-10px; width:200px; height:200px; z-index:999;'>";
							output += "<div><h3>"+review[i].nickname+"</h3><input type='hidden' id='receiveIdForMsg"+i+"' value="+review[i].m_id+"><input type='hidden' id='nicknameForMsg"+i+"' value="+review[i].nickname+"><input type='hidden' id='mIdForMsg' value="+${sessionScope.loginUser.mId}+"></div>";
							output += "<div style = 'text-align:right;'><button class='btn btn-light' style='width:65px; height:30px;' type = 'button' onclick='openMsg3("+i+")'>메세지</button></div>";
							output += "<div class='info' style = 'text-align:left;'>회원가입시기 : "+review[i].create_date+"<br>";
							output += "흥미 : "+review[i].interesting+", 국적 : "+review[i].national+"<br>";
							output += "E-MAIL : "+review[i].email+"<br>";
							output += "<i class='fa fa-thumbs-o-up' style = 'font-size:13px;'></i> "+review[i].help_count+"건의 도움되는 리뷰, 댓글<br>";
							output += "<i class='fas fa-pen-square'></i> "+review[i].board_count+"건 포스팅<br>";
							output += "<i class='fas fa-pen'></i> "+review[i].reply_count+"건의 도움글 작성";
							output += "</div>";
							output += "</div>";
							output += "<div class='gray-text'>";
							output += "</div>";
							output += "</div>";
							output += "</div>";
							output += "<div class='col-lg-9 col-md-9 col-sm-6 col-xs-12 line_l' style = 'height:220px; padding-bottom:10px;' ><br>";
							
							output += "<div><span class='StarBar'>";
							
							if(review[i].grade == 0.0){
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
							}
							
							if(review[i].grade == 0.5){
								output += "<i class='fas fa-star-half-alt' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
							}
							
							if(review[i].grade == 1.0){
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
							}
							
							if(review[i].grade == 1.5){
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star-half-alt' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
							}
							
							if(review[i].grade == 2.0){
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
							}
							
							if(review[i].grade == 2.5){
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star-half-alt' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
							}
							
							if(review[i].grade == 3.0){
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
							}
							
							if(review[i].grade == 3.5){
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star-half-alt' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
							}
							
							if(review[i].grade== 4.0){
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
							}
							
							if(review[i].grade == 4.5){
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star-half-alt' style = 'font-size:20px'></i>";
							}
							
							if(review[i].grade == 5.0){
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
							}
							output += "</span>&nbsp;&nbsp;";
							output += "<span class='ReviewUpDate'>리뷰 게시 날짜 : "+review[i].regist_date+"</span>";
							if(review[i].m_id == ${sessionScope.loginUser.mId}){
								output += "<span style='float:right'><button type = 'button' style = 'width:47px; height:31px;' class='btn btn-danger' onclick = 'updateR("+review[i].bid+")'>수정</button>&nbsp;<button type = 'button' style = 'width:47px; height:31px;' class='btn btn-danger' onclick=deleteR("+review[i].bid+")>삭제</button></span>";
							}	
							output += "</div>";
							output += "<div class='ReviewTitle' style = 'font-size:20px; cursor:pointer; padding-top:10px;'><a onclick='goDetail("+review[i].bid+")'><span>"+review[i].title+"</span></a></div>";
							output += "<div class='summary' style = 'padding-top:10px;'><p>"+review[i].text+"</p><span><a style = 'font-weight:bold' onclick = 'goDetail("+review[i].bid+")'>자세히 보기</a></span></div>";
							output += "<div style = 'padding-top:20px;'><div class='fa' style = 'width:100%;'>";
							output += "<input type = 'hidden' value = "+review[i].m_id+"><input type = 'hidden' value = "+review[i].bid+"><i class='fa fa-thumbs-o-up' style = 'font-size:20px; padding-top:10px; cursor:pointer;' onclick=RUp(this);> "+review[i].likey+" </i>&nbsp;<i class='far fa-comment-dots' style = 'font-size:20px; padding-top:10px; cursor:pointer;' onclick = goDetail("+review[i].bid+")> "+review[i].rCount+"</i><i class='fa fa-flag' style = 'font-size:20px; padding-top:10px; float:right;'><a onclick='reportWrite1(this);'> 신고하기</a></i><input type = 'hidden' value="+review[i].m_id+"><input type = 'hidden' value="+review[i].bid+"></div></div></div></div>";
							
							$divBody.append(output);
						}
						var num = p.maxPage;
						var pOutput = "";
						if(p.currentPage <= 1){
							pOutput += "<li><a>&laquo;</a></li>";
						}
						if(p.currentPage > 1){
							pOutput += "<li><a onclick='goPrev("+p.currentPage+");'>&laquo;</a></li>";
						}
						for(var a = p.startPage ; a <= p.endPage ; a++){
							if(a == p.currentPage){
								pOutput += "<li><a style='background-color:#ddd;''>"+a+"</a></li>";
							}
							if(a != p.currentPage){
								pOutput += "<li><a onclick='goPage("+a+");'>"+a+"</a></li>";
							}
						}
						if(p.currentPage >= p.maxPage){
							pOutput += "<li><a>&raquo;</a></li>";
						}
						if(p.currentPage < p.maxPage){
							pOutput += "<li><a onclick='goNext("+p.currentPage+");'>&raquo;</a></li>";
						}

						$pageBody.append(pOutput);
					}
				}, error:function(data){
					console.log(data);
				}
			});
		}
		
		function deleteR(element){
			var bid = element;
			var msg = confirm("정말 삭제하시겠습니까?");
				if(msg == true){
					$.ajax({
						url:"deleteReview.bo",
						type:"post",
						data:{bid:bid},
						dataType:"json",
						success:function(data){
							reviewPaging(1);
							bestReview();
							alert(data.msg);
							
						},error:function(data){
							alert(data.msg); 
						}
					});	
				}
		}
		
		function updateR(element){
			var bid = element;
			var msg = confirm("정말 수정하시겠습니까?");
			
			if(msg == true){
				location.href = "updateR.bo?bid="+bid+"&contentid="+contentid+"&contenttypeid="+contenttypeid+"&cid="+cid;
			}	
		}
		

		function member_info(element){
		
			if($(element).parent().children().eq(2).css("visibility") == "visible"){
				$(element).parent().children().eq(2).css("visibility", "hidden");
			}else{
				$(element).parent().children().eq(2).css("visibility", "visible");
			}	
		}
		
		function goPrev(page){
			page=page-1;
			reviewPaging(page);
		}
		
		function goPage(page){
			page=page;
			reviewPaging(page);
		}
		
		function goNext(page){
			page=page+1;
			reviewPaging(page);
		}
		
		function goPrev2(page){
			page=page-1;
			QPaging(page);
		}
		
		function goPage2(page){
			page=page;
			QPaging(page);
		}
		
		function goNext2(page){
			page=page+1;
			QPaging(page);
		}
		
		function RUp(element){
			var m_id = $(element).parent().children().eq(0).val();
			var ref_id = $(element).parent().children().eq(1).val();
		
			if(${ sessionScope.loginUser != null && !sessionScope.loginUser.mType.equals('admin')}){ 

			
					if(m_id != ${sessionScope.loginUser.mId}){
						$.ajax({
							url:"thumbsR.bo",
							type:"post",
							data:{target_id:m_id, ref_id:ref_id},
							dataType:"json",
							success:function(data){
								var t_Count = data.thumbsCount;
								$(element).parent().children().eq(2).text(" "+t_Count);
								alert(data.msg);
								
							},error:function(data){
								alert(data.msg); 
							}
						});
				}else{
					alert("본인 글에는 (도움이 되었어요)를 할 수 없습니다");
				}
				
			}else{
				alert("로그인이 필요한 기능 입니다.");
			}
		}
		
		function AUp(element){
			var m_id = $(element).parent().children().eq(2).val();
			var reply_id = $(element).parent().children().eq(3).val();
		
			if(${ sessionScope.loginUser != null }){ 
				if(${!sessionScope.loginUser.mType.equals('admin')}){
			
					if(m_id != ${sessionScope.loginUser.mId}){
						$.ajax({
							url:"thumbsA.bo",
							type:"post",
							data:{target_id:m_id, reply_id:reply_id},
							dataType:"json",
							success:function(data){
								var t_Count = data.thumbsCount;
								$(element).parent().children().eq(4).text(" "+t_Count);
								alert(data.msg);
								
							},error:function(data){
								alert(data.msg);
							}
						});
				}else{
					alert("본인 글에는 (도움이 되었어요)를 할 수 없습니다");
				}
				}else{
					alert("관리자 계정으로는 작성할 수 없습니다.");
				}
			}else{
				alert("로그인이 필요한 기능 입니다.");
			}
		}
		
		function QA(element){
			var a = document.getElementById(element);

			if(a.style.display == "block"){
				a.style.display = "none";
			}else{
				a.style.display = "block";
			}
		}
		
		function goMessage(tid){
			if(${ sessionScope.loginUser != null }){ 
				var mid = ${ sessionScope.loginUser.mId };
				location.href="recieveMessageView?tid="+tid+"&mid="+mid;
			}else{
				alert("로그인이 필요한 기능 입니다.");
			}
		}
		
		function allQA(element){
			var a = document.getElementById("allQAV"+element);
			if(a.style.display == "block"){
				a.style.display = "none";
			}else{
				a.style.display = "block";
			}
			
			$.ajax({
				url:"selectA.bo",
				type:"post",
				dataType:"json",
				success:function(data){
					$ABody = $('#allQAV'+element);
					$ABody.html('');
					
					var QAns = data.listQAnswer;
					var output = "";

            		for(var j = 0 ; j < QAns.length ; j++){		            			
            			if(element == QAns[j].bid){
            				output += "<div class='summary' style = 'padding-top:10px; font-size:18px'>";
            				output += QAns[j].content+"</div>";
            				output += "<div><span class='ReviewUpDate' style = 'padding-top:5px'>"+QAns[j].modify_date+"</span>";
            				output += "<span>|</span> "+QAns[j].nickname+"님의 답변";
            				output += "<input type = 'hidden' value = "+QAns[j].m_id+"><input type = 'hidden' value = "+QAns[j].reply_id+"><i class='fa fa-thumbs-o-up' style = 'font-size:14px; padding-top:5px; cursor:pointer' onclick = AUp(this);>&nbsp;"+QAns[j].help_point+"</i>";
            				output += "<i class='fa fa-flag' style = 'font-size:12px; padding-top:5px; float:right;'><input type = 'hidden' value="+QAns[j].m_id+"><input type = 'hidden' value="+QAns[j].reply_id+"><a onclick='reportWriteA1(this);'> 신고하기</a></i></div>";
            			}
            		}
    				
            		$ABody.append(output);
				},error:function(data){
					
				}
			});
		}
		
		function insertA(element){
			if(${ sessionScope.loginUser != null && sessionScope.loginUser.mType.equals('1')}){
				var a = $(element).parent().children().eq(1).val();
				var b = $(element).parent().children().eq(0).val();
			
				$.ajax({
						url:"insertA.bo",
						type:"post",
						data:{text:a, bid:b},
						dataType:"json",
						success:function(data){
							QA(b);
							$(element).parent().children().eq(1).val("");
						
						},error:function(data){
							console.log(data);
						}
				});
			}else{
				alert("로그인이 필요한 서비스 입니다.");
			}
		}
	
		function review(){
			if(${ sessionScope.loginUser != null && sessionScope.loginUser.mType.equals('1')})
				$.ajax({
					url:"reviewBool.bo",
					type:"post",
					data:{contentid:contentid},
					dataType:"json",
					success:function(data){
						var result = data.result;
						if(result > 0){
		 					location.href="reviewWrite.bo?contentid="+contentid+"&contenttypeid="+contenttypeid+"&cid="+cid;								
						}else{
							alert("실 이용객만 리뷰 작성이 가능합니다.");
						}
					},error:function(data){
						console.log(data);
					}
				});

			else{
				alert("로그인이 필요한 서비스 입니다.");
			}
 		}
		
		function qa(){
			if(${ sessionScope.loginUser != null && sessionScope.loginUser.mType.equals('1')})
				location.href="QAWrite.bo?contentid="+contentid+"&contenttypeid="+contenttypeid+"&cid="+cid;
			else{
				alert("로그인이 필요한 서비스 입니다.");
			}
		}
 	  
		function reportWrite(element){
    		var m_id = $(element).parent().children().eq(0).val();
    		var ref_id = $(element).parent().children().eq(1).val();
    		var r_level = 0;
    		
    		if(${ sessionScope.loginUser != null && sessionScope.loginUser.mType.equals('1')})
    			window.open('reportWrite.bo?m_id='+m_id+'&ref_id='+ref_id+'&r_level='+r_level, 'reportWrite', 'height=380, width=450, top=80, left=400 resizable=none, scrollbars=no');
    		else{
    			alert("로그인이 필요한 서비스 입니다.");
    		}
   		}
		
		function reportWrite1(element){
    		var m_id = $(element).parent().parent().children().eq(5).val();
    		var ref_id = $(element).parent().parent().children().eq(6).val();
    		var r_level = 0;

    		if(${ sessionScope.loginUser != null && sessionScope.loginUser.mType.equals('1')})
    			window.open('reportWrite.bo?m_id='+m_id+'&ref_id='+ref_id+'&r_level='+r_level, 'reportWrite', 'height=380, width=450, top=80, left=400 resizable=none, scrollbars=no');
    		else{
    			alert("로그인이 필요한 서비스 입니다."); 
    		}
   		}
		
		function reportWriteA1(element){
    		var m_id = $(element).parent().children().eq(0).val();
    		var ref_id = $(element).parent().children().eq(1).val();
    		var r_level = 1;

    		if(${ sessionScope.loginUser != null && sessionScope.loginUser.mType.equals('1')}){
    			window.open('reportWrite.bo?m_id='+m_id+'&ref_id='+ref_id+'&r_level='+r_level, 'reportWrite', 'height=380, width=450, top=80, left=400 resizable=none, scrollbars=no');
    		}
    		else{
    			alert("로그인이 필요한 서비스 입니다.");
    		}
   		}
    	
    	function goDetail(bid){
    		location.href = "reviewDetail.bo?bid="+ bid;
    	}
    	
    	function bestReview(){   		
    		$.ajax({
    			url:"bestReview.bo",
    			type:"post",
    			data:{contentid:contentid},
    			dataType:"json",
    			success:function(data){
    				$best = $('.best_review');
    				$best.html('');
    				var rBest = data.bestReviewList;
    				var output = "";
    				
    				for(var i = 0 ; i < rBest.length ; i++){
    					output += "<div style = 'border-bottom: 1px solid #ccc; cursor:pointer;' onclick = 'goDetail("+rBest[i].bid+")'><h3>BEST "+(i+1)+". "+ rBest[i].title+"</div><br>";
    				}
      	   			
      	   			$best.append(output);
    			},error:function(data){
    				
    			}
    		})

    	}
    	
    	$(function(){
    		QPaging(1);
			reviewPaging(1);
			bestReview();
    	});
    	
		$(function() {

		  	$('a[href*=#]:not([href=#])').click(function() {
			    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
			      var target = $(this.hash);
			      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
			      if (target.length) {
			        $('html,body').animate({
			          scrollTop: target.offset().top
			        }, 1000);
			        return false;
			      }
			    }
		  	});		  	
		});
		$(window).load(function(){

		  	$('.flexslider.flexslider-banner').flexslider({
			    controlNav: false
		    });
		  	$('.flexslider').flexslider({
		    	animation: "slide",
		    	directionNav: false,
		    	slideshow: false
		  	});
		});
		
		function openMsg3(i){
			var mId = $("#mIdForMsg").val();
			var receiveId = $("#receiveIdForMsg"+i).val();
			var nickname = $("#nicknameForMsg"+i).val();
			
			if(mId==receiveId){
				alert('자신에게 메세지를 보낼 수 없습니다.');
			}else{
				window.open('sendView?mId='+mId+'&receiveId='+receiveId+'&nickname='+nickname, 'Hello', 'width=480px, height=580px, top=80px, left=400px');
			}
			
		   }
		
		function openMsg2(i){
			var mId = $("#mIdForq").val();
			var receiveId = $("#receiveIdForq"+i).val();
			var nickname = $("#nicknameForq"+i).val();
			if(mId==receiveId){
				alert('자신에게 메세지를 보낼 수 없습니다.');
			}else{
			window.open('sendView?mId='+mId+'&receiveId='+receiveId+'&nickname='+nickname, 'Hello', 'width=480px, height=580px, top=80px, left=400px');
			}
		   }
	</script>
</body>
</html>
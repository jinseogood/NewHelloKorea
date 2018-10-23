<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAf5xrmNMwmRYe-jdx4N3ItbdKDOJryoj4&callback=initialize" async defer></script>
<title>Hello Korea</title>
<style>
	#more{margin-top:5%;}
	.img-responsive2{width:254px; height:185px;}
	.areaMainPicture{width:528px; height:435px;}
	.goDetailView{cursor:pointer;}
</style>
</head>
<body>
	<!-- 지역의 모든것 Page. -->
	<jsp:include page="../common/searchMenubar.jsp"/>
	<jsp:include page="../common/searchSubmenubar.jsp"/>
	
	<!-- gray bg -->	
	<section class="container tm-home-section-1" id="more">
		<div class="row">
			<!-- slider -->
			<div class="flexslider flexslider-about effect2">
			  <ul class="slides">
			    <li>
			      <img src="${ contextPath }/resources/img/about-01.jpg" alt="image" id="areaMainPicture" class="areaMainPicture"/>
			      <div class="flex-caption">
			      	<h2 class="slider-title"> </h2>
			      	<h3 class="slider-subtitle"></h3>
			      	<p class="slider-description"></p>
			      </div>			      
			    </li>
			  </ul>
			</div>
		</div>
		<!-- <div class="tm-section-header section-margin-top">
			<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>
			<div class="col-lg-4 col-md-6 col-sm-6"><h2 class="tm-section-title">여행지보기</h2></div>
			<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>	
		</div>
		
		<div class="col-lg-12 col-md-12">
			<div id="google-map"></div>
		</div> -->
	</section>
		<script>
			var areaCode = ${param.areaCode};
			console.log("지역메인 areaCode : " + areaCode);
			
			if(areaCode == 1){
				$(".flex-caption .slider-title").text("서울");
				$(".slider-description").text("서울은 한국의 비즈니스와 문화의 중심지로, 불교 사원 너머로 고층 빌딩이 우뚝 솟은 곳입니다. 서울은 산업과 기술의 폭발적인 유입으로 세계적인 도시가 되었습니다. 남산 공원 정상에 세워진 N 서울 타워에서 서울을 한눈에 바라보십시오. 인사동의 찻집과 가게들이 한국의 맛을 살짝 보여준다면, 경복궁과 경복궁 박물관에서는 한국 문화를 좀 더 자세히 경험할 수 있습니다. 유네스코 세계 유산에도 등재된 창덕궁은 진정으로 고대 건축물의 훌륭한 예시라고 할 수 있습니다.");
				$("#areaMainPicture").attr("src","${contextPath}/resources/img/seoulMianPicture.png");
			}else if(areaCode == 2){
				$(".flex-caption .slider-title").text("인천");
				$(".slider-description").text("예술과 엔터테인먼트, 쇼핑, 역사와 자연 환경까지, 인천은 모든 것을 갖춘 곳입니다! 현재 인천에서는 2015년 완성을 목표로 한 대규모 부동산 및 도시 개발 사업이 진행되고 있습니다. 제17회 아시안 게임이 개최되는 2014년에는 많은 관광객이 인천을 방문할 것으로 예상됩니다. 국내 최대 규모의 지하상가로 꼽히는 부평 지하상가는 최신 유행 패션과 잡화, 브랜드 상품이 즐비하여 쇼핑객들에게 즐거움을 선사합니다. 자유 공원을 산책하며 근대사의 흔적을 짚어보고, 인천 상륙작전 기념관에도 방문해 봅시다. 국내 유일의 차이나타운에서는 본격적인 중국 요리를 맛볼 수 있으며, 기념품 가게도 있습니다. 바쁘게 돌아가는 도시 생활에서 잠시 벗어나고 싶을 때는, 인근 섬으로 페리를 타고 짧은 여행을 다녀오는 것도 좋습니다.");
				$("#areaMainPicture").attr("src","");
			}else if(areaCode == 3){
				$(".flex-caption .slider-title").text("대전");
			}else if(areaCode == 4){
				$(".flex-caption .slider-title").text("대구");
			}else if(areaCode == 5){
				$(".flex-caption .slider-title").text("광주");
			}else if(areaCode == 6){
				$(".flex-caption .slider-title").text("부산");
			}else if(areaCode == 7){
				$(".flex-caption .slider-title").text("울산");
			}else if(areaCode == 8){
				$(".flex-caption .slider-title").text("세종특별자치시");
			}else if(areaCode == 31){
				$(".flex-caption .slider-title").text("경기도");
			}else if(areaCode == 32){
				$(".flex-caption .slider-title").text("강원도");
			}else if(areaCode == 33){
				$(".flex-caption .slider-title").text("충청북도");
			}else if(areaCode == 34){
				$(".flex-caption .slider-title").text("충청남도");
			}else if(areaCode == 35){
				$(".flex-caption .slider-title").text("경상북도");
			}else if(areaCode == 36){
				$(".flex-caption .slider-title").text("경상남도");
			}else if(areaCode == 37){
				$(".flex-caption .slider-title").text("전라북도");
			}else if(areaCode == 38){
				$(".flex-caption .slider-title").text("전라남도");
			}else if(areaCode == 39){
				$(".flex-caption .slider-title").text("제주도");
			}
			
			$(function(){
				var sigunguCode = 1;
				aboutMainHotel(sigunguCode);
				aboutMainFood(sigunguCode);
				aboutMainGame(sigunguCode);
			});
			
			function aboutMainHotel(sigunguCode){
				$.ajax({
					url:"aboutMainSeoulHotel.sub",
					type:"GET",
					data:{areaCode:areaCode, sigunguCode:sigunguCode},
					dataType:"json",
					success:function(data){
						if(data.response.body.totalCount == 0){
							sigunguCode++;
							aboutMainHotel(sigunguCode);
						}else{
							console.log(data);
							var myData = data.response.body.items.item;
							var rowHotelArea = $("#rowHotelArea");
							rowHotelArea.html("");
							var output = "";
							var count = 0;
							for(var i = 0; i < myData.length; i++){
								count++;
								output = "";
								contenttypeid = myData[i].contenttypeid;
								contentid = myData[i].contentid;
								output += "<div class='col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12'>";
								output += "<div class='tm-home-box-2'>";
								if(myData[i].firstimage == null){
									output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='img-responsive2'>";
								}else{
									output += "<img src="+myData[i].firstimage+" alt='image' class='img-responsive2'>";
								}
								output += "<h3 class='goDetailView' onclick='goHotelDetail("+contentid+","+contenttypeid+");'>"+myData[i].title+"</h3>";
								output += "</div></div>";
								document.getElementById("rowHotelArea").innerHTML += output;
								if(count == 4){
									return;
								}
							}
						}
						
					},
					error:function(data){
						console.log(data);
					}
				});
			}
			function goHotelDetail(contentid, contenttypeid){
				location.href="${contextPath}/detailHotel?contentid="+contentid+"&contenttypeid="+contenttypeid;
			}
			
			function aboutMainFood(){
				$.ajax({
					url:"aboutMainSeoulFood.sub",
					type:"GET",
					data:{areaCode:areaCode},
					dataType:"json",
					success:function(data){
						console.log(data);
						var myData = data.response.body.items.item;
						var rowFoodArea = $("#rowFoodArea");
						rowFoodArea.html("");
						var output = "";
						var count = 0;
						for(var i = 0; i < myData.length; i++){
							count++;
							contentid = myData[i].contentid;
							contenttypeid = myData[i].contenttypeid;
							output = "";
							output += "<div class='col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12'>";
							output += "<div class='tm-home-box-2'>";
							if(myData[i].firstimage == null){
								output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='img-responsive2'>";
							}else{
								output += "<img src="+myData[i].firstimage+" alt='image' class='img-responsive2'>";
							}
							output += "<h3 class='goDetailView' onclick='goDetailFood("+contenttypeid+","+contentid+");'>"+myData[i].title+"</h3>";
							output += "</div></div>";
							document.getElementById("rowFoodArea").innerHTML += output;
							if(count == 4){
								return;
							}
						}
					},
					error:function(data){
						console.log(data);
					}
				});
			}
			function goDetailFood(contenttypeid, contentid){
				location.href="${contextPath}/detailFood?contenttypeid="+contenttypeid+"&contentid="+contentid;
			}
			
			function aboutMainGame(){
				$.ajax({
					url:"aboutMainSeoulGame.sub",
					type:"GET",
					data:{areaCode:areaCode},
					dataType:"json",
					success:function(data){
						console.log(data);
						var myData = data.response.body.items.item;
						var rowGameArea = $("#rowGameArea");
						rowGameArea.html("");
						var output = "";
						var count = 0;
						for (var i = 0; i < myData.length; i++){
							count++;
							output = "";
							contenttypeid = myData[i].contenttypeid;
							contentid = myData[i].contentid;
							mapy = myData[i].mapy;
							mapx = myData[i].mapx;
							output += "<div class='col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12'>";
							output += "<div class='tm-home-box-2'>";
							if(myData[i].firstimage == null){
								output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='img-responsive2'>";
							}else{
								output += "<img src="+myData[i].firstimage+" alt='image' class='img-responsive2'>";
							}
							output += "<h3 class='goDetailView' onclick='goDetailGame("+contentid+","+contenttypeid+","+mapy+","+mapx+");'>"+myData[i].title+"</h3>";
							output += "</div></div>";
							document.getElementById("rowGameArea").innerHTML += output;
							if(count == 4){
								return;
							}
						}
					},
					error:function(data){
						console.log(data);
					}
				});
			}
			function goDetailGame(contentid, contenttypeid, mapy, mapx){
				location.href="${contextPath}/detailGame?contentid="+contentid+"&contenttypeid="+contenttypeid+"&mapy="+mapy+"&mapx="+mapx;
			}
			
		
		/* Google map
      	------------------------------------------------*/
      	var map = '';
      	var center;

      	function initialize() {
	        var mapOptions = {
	          	zoom: 14,
	          	center: new google.maps.LatLng(37.769725, -122.462154),
	          	scrollwheel: false
        	};
        
	        map = new google.maps.Map(document.getElementById('google-map'),  mapOptions);

	        google.maps.event.addDomListener(map, 'idle', function() {
	          calculateCenter();
	        });
        
	        google.maps.event.addDomListener(window, 'resize', function() {
	          map.setCenter(center);
	        });
      	}

	    function calculateCenter() {
	        center = map.getCenter();
	    }

	    function loadGoogleMap(){
	        var script = document.createElement('script');
	        script.type = 'text/javascript';
	        script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&' + 'callback=initialize';
	        document.body.appendChild(script);
	    }
	
      	// DOM is ready
		$(function() {

			// https://css-tricks.com/snippets/jquery/smooth-scrolling/
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

		  	// Flexslider
		  	$('.flexslider').flexslider({
		  		controlNav: false,
		  		directionNav: false
		  	});

		  	// Google Map
		  	//loadGoogleMap();
		  });
	</script>
	
	<section class="container tm-home-section-1" id="more">
		<div class="container">
			<div class="row">
				<div class="tm-section-header section-margin-top">
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>
					<div class="col-lg-4 col-md-6 col-sm-6"><h2 class="tm-section-title">추천 호텔</h2></div>
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>	
				</div>
				<div class="row" id="rowHotelArea">
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2">						
						<img src="${ contextPath }/resources/img/index-03.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2">						
					    <img src="${ contextPath }/resources/img/index-04.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2">						
					    <img src="${ contextPath }/resources/img/index-05.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2 tm-home-box-2-right">						
					    <img src="${ contextPath }/resources/img/index-06.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
					</div>
				</div>
			</div>
		</div>
			
					
		</div>
		
		<div class="container">
			<div class="row">
				<div class="tm-section-header section-margin-top">
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>
					<div class="col-lg-4 col-md-6 col-sm-6"><h2 class="tm-section-title">추천 음식점</h2></div>
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>	
				</div>
				<div class="row" id="rowFoodArea">
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2">						
						<img src="${ contextPath }/resources/img/index-03.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2">						
					    <img src="${ contextPath }/resources/img/index-04.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2">						
					    <img src="${ contextPath }/resources/img/index-05.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2 tm-home-box-2-right">						
					    <img src="${ contextPath }/resources/img/index-06.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
					</div>
				</div>
			</div>
		</div>
			
			
				
		</div>
		
		<div class="container">
			<div class="row">
				<div class="tm-section-header section-margin-top">
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>
					<div class="col-lg-4 col-md-6 col-sm-6"><h2 class="tm-section-title">추천 오락거리</h2></div>
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>	
				</div>
				<div class="row" id="rowGameArea">
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2">						
						<img src="${ contextPath }/resources/img/index-03.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2">						
					    <img src="${ contextPath }/resources/img/index-04.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2">						
					    <img src="${ contextPath }/resources/img/index-05.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2 tm-home-box-2-right">						
					    <img src="${ contextPath }/resources/img/index-06.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
					</div>
				</div>
			</div>
		</div>
			
			
			
			
			<div class="row">
				<div class="col-lg-12">
					<p class="home-description">Holiday is free Bootstrap v3.3.5 responsive template for tour and travel websites. You can download and use this layout for any purpose. You do not need to provide a credit link to us. If you have any question, feel free to <a href="http://www.facebook.com/templatemo" target="_parent">contact us</a>. Credit goes to <a rel="nofollow" href="http://unsplash.com" target="_parent">Unspash</a> for images used in this template.</p>					
				</div>
			</div>		
		</div>
	
	</section>		
	
	<!-- white bg -->
	<section class="tm-white-bg section-padding-bottom">
	</section>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		$(function() {

			// https://css-tricks.com/snippets/jquery/smooth-scrolling/
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
			// Flexsliders
		  	$('.flexslider.flexslider-banner').flexslider({
			    controlNav: false
		    });
		  	$('.flexslider').flexslider({
		    	animation: "slide",
		    	directionNav: false,
		    	slideshow: false
		  	});
		});
	</script>
</body>
</html>
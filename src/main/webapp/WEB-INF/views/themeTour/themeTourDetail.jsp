<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<title>Hello Korea</title>
<style>
	#more{margin-top:5%;}
	/* .firstImgArea{display:inline-block;} */
	.imgArea{display:block;}
	.secondImgArea{display:inline-block;}
	.secondImg{width:262.5px; height:217px; display:inline-block;}
	.contentArea{display:block;}
	.detailHead{text-align:center; width:280px; height:40px; background-color:lightgray;}
	.detailContent{height:350px; text-align:center;}
	.detailBottom{height:50px;}
	.tm-about-box-1{padding:10px 10px;}
</style>
</head>
<body>
	<!-- 지역의 숙박상세 Page. -->
	<jsp:include page="../common/searchMenubar.jsp"/>
	<jsp:include page="../common/searchSubmenubar.jsp"/>
	

	<!-- gray bg -->	
	<section class="container tm-home-section-1" id="more">
		<div class="row">
		</div>
		<div class="tm-section-header section-margin-top">
			<div class="col-lg-5 col-md-4 col-sm-4"><h2 class="tm-section-title">관광지 이름 or 행사 이름</h2></div>
			<div class="col-lg-6 col-md-8 col-sm-8"><hr></div>	
		</div>
		
		<div class="tm-section-header section-margin-top">
			<div class="col-lg-7">
				<div class="imgArea">
				<div class="firstImgArea">
					<img src="${ contextPath }/resources/img/about-1.jpg" alt="image" />
				</div>
				<div class="secondImgArea">
					<img src="${ contextPath }/resources/img/about-1.jpg" class="secondImg" alt="image" />
					<img src="${ contextPath }/resources/img/about-1.jpg" class="secondImg" alt="image" />
				</div>
				</div>
			</div>
			<div class="col-lg-5">
				<div class="contentArea">
					관광지 정보 / 축제(행사) 정보 영역입니다.<br>
					관광지 정보 / 축제(행사) 정보 영역입니다.<br>
					관광지 정보 / 축제(행사) 정보 영역입니다.<br>
					관광지 정보 / 축제(행사) 정보 영역입니다.<br>
					관광지 정보 / 축제(행사) 정보 영역입니다.<br>
					관광지 정보 / 축제(행사) 정보 영역입니다.<br>
					관광지 정보 / 축제(행사) 정보 영역입니다.<br>
					관광지 정보 / 축제(행사) 정보 영역입니다.<br>
					관광지 정보 / 축제(행사) 정보 영역입니다.<br>
					관광지 정보 / 축제(행사) 정보 영역입니다.<br>
					관광지 정보 / 축제(행사) 정보 영역입니다.<br>
					관광지 정보 / 축제(행사) 정보 영역입니다.<br>
					관광지 정보 / 축제(행사) 정보 영역입니다.<br>
					관광지 정보 / 축제(행사) 정보 영역입니다.<br>
					관광지 정보 / 축제(행사) 정보 영역입니다.<br>
					관광지 정보 / 축제(행사) 정보 영역입니다.<br>
					
				</div>
			</div>
		</div>
		
		<div class="col-lg-12 col-md-12">
		<div class="tm-section-header section-margin-top">
			<div class="col-lg-4 col-md-4 col-sm-4"><h2 class="tm-section-title">인근정보</h2></div>
			<div class="col-lg-8 col-md-8 col-sm-8"><hr></div>	
		</div>
		</div>
		<div class="col-lg-7 col-md-6">
			<div id="google-map"></div>
		</div>
		<div class="col-lg-5 col-md-6">
			<div>
				날씨정보닷<br>
				날씨정보닷<br>
				날씨정보닷<br>
				날씨정보닷<br>
				날씨정보닷<br>
				날씨정보닷<br>
				날씨정보닷<br>
				날씨정보닷<br>
				날씨정보닷<br>
			</div>
		</div>
	</section>
		<script>
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
		  	loadGoogleMap();
		  });
	</script>
	
	<section class="container tm-home-section-1" id="more">
	</section>
	
	<section class="container tm-home-section-1" id="more">
   
      <div class="section-margin-top about-section">
         <div class="row">   
         </div>         
         <div class="tm-section-header section-margin-top">
       		   <div class="col-lg-4 col-md-4 col-sm-4"><h2 class="tm-section-title">R E V I E W (1,123)</h2></div>
      		   <div class="col-lg-8 col-md-8 col-sm-8"><hr></div>
	      	   <div style = "height:200px; width:100%; position:relative">
	      	   		<button type="button" class="btn btn-secondary" 
	      	   			style = "position:absolute; right:10px; bottom:10px"
	      	   			onclick="review()">리뷰 쓰기</button>
	      	   </div>	   

      	 </div>
      </div>
     
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
            	<span class="StarBar" >
            		<i class="fa fa-star"></i>
            		<i class="fa fa-star"></i>
            		<i class="fa fa-star"></i>
            		<i class="fa fa-star"></i>
            		<i class="fa fa-star"></i>
            	</span>
            	&nbsp;&nbsp;
            	<span class="ReviewUpDate">
            		리뷰 게시 날짜 : 2018년 09월 19일
            	</span>
            	</div>
            	<div class="ReviewTitle" style = "font-size:20px; cursor:pointer; padding-top:10px">
            		<a href="#"><span>여기 너무 멋져요우~</span></a>
            	</div>
            	<div class="summary" style = "padding-top:10px">
            		방과 수영장이 매우 좋았습니다. 다만 영어 못하는 택시기사가 바가지 씌울때 호텔에...
            		방과 수영장이 매우 좋았습니다. 다만 영어 못하는 택시기사가 바가지 씌울때 호텔에...
            		방과 수영장이 매우 좋았습니다. 다만 영어 못하는 택시기사가 바가지 씌울때 호텔에...
            		방과 수영장이 매우 좋았습니다. 다만 영어 못하는 택시기사가 바가지 씌울때 호텔에...
            		<span><a href="#">더 보기</a></span>
            	</div>
            	<div style = "padding-top:20px;" >
            		<div class="fa" style = "width:100%">
            			<i class="fa fa-thumbs-o-up" style = "font-size:20px; padding-top:10px"> 0 </i>
            			<i class="fa fa-comment" style = "font-size:20px; padding-top:10px"> 0 </i>
            			<i class="fa fa-flag" style = "font-size:20px; padding-top:10px; float:right;"> 신고하기 </i>
            		
            		</div>
            	</div>
            </div>
            
         </div> 
         <br>
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
            <div class="col-lg-9 col-md-9 col-sm-6 col-xs-12 line_l" style = "height:220px">
          	    <br>
            	<span class="StarBar">
            		<i class="fa fa-star"></i>
            		<i class="fa fa-star"></i>
            		<i class="fa fa-star"></i>
            		<i class="fa fa-star"></i>
            		<i class="fa fa-star"></i>
            	</span>
            	&nbsp;&nbsp;
            	<span class="ReviewUpDate">
            		리뷰 게시 날짜 : 2018년 09월 19일
            	</span>
            	<div class="ReviewTitle" style = "font-size:20px; cursor:pointer; padding-top:10px">
            		<a href="#"><span>여기 너무 멋져요우~</span></a>
            	</div>
            	<div class="summary" style = "padding-top:10px">
            		방과 수영장이 매우 좋았습니다. 다만 영어 못하는 택시기사가 바가지 씌울때 호텔에...
            		방과 수영장이 매우 좋았습니다. 다만 영어 못하는 택시기사가 바가지 씌울때 호텔에...
            		방과 수영장이 매우 좋았습니다. 다만 영어 못하는 택시기사가 바가지 씌울때 호텔에...
            		방과 수영장이 매우 좋았습니다. 다만 영어 못하는 택시기사가 바가지 씌울때 호텔에...
            		<span><a href="#">더 보기</a></span>
            	</div>
            	<div style = "padding-top:20px" >
            		<div class="fa" style = "width:100%">
            			<i class="fa fa-thumbs-o-up" style = "font-size:20px; padding-top:10px"> 0 </i>
            			<i class="fa fa-comment" style = "font-size:20px; padding-top:10px"> 0 </i>
            			<i class="fa fa-flag" style = "font-size:20px; padding-top:10px; float:right;"> 신고하기 </i>
            		
            		</div>
            	</div>
            </div>
            
         </div>   
         <br>
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
            <div class="col-lg-9 col-md-9 col-sm-6 col-xs-12 line_l" style = "height:220px">
            	<br>
            	<span class="StarBar">
            		<i class="fa fa-star"></i>
            		<i class="fa fa-star"></i>
            		<i class="fa fa-star"></i>
            		<i class="fa fa-star"></i>
            		<i class="fa fa-star"></i>
            	</span>
            	&nbsp;&nbsp;
            	<span class="ReviewUpDate">
            		리뷰 게시 날짜 : 2018년 09월 19일
            	</span>
            	<div class="ReviewTitle" style = "font-size:20px; cursor:pointer; padding-top:10px">
            		<a href="#"><span>여기 너무 멋져요우~</span></a>
            	</div>
            	<div class="summary" style = "padding-top:10px">
            		방과 수영장이 매우 좋았습니다. 다만 영어 못하는 택시기사가 바가지 씌울때 호텔에...
            		방과 수영장이 매우 좋았습니다. 다만 영어 못하는 택시기사가 바가지 씌울때 호텔에...
            		방과 수영장이 매우 좋았습니다. 다만 영어 못하는 택시기사가 바가지 씌울때 호텔에...
            		방과 수영장이 매우 좋았습니다. 다만 영어 못하는 택시기사가 바가지 씌울때 호텔에...
            		<span><a href="#">더 보기</a></span>
            	</div>
            	<div style = "padding-top:20px" >
            		<div class="fa" style = "width:100%">
            			<i class="fa fa-thumbs-o-up" style = "font-size:20px; padding-top:10px"> 0 </i>
            			<i class="fa fa-comment" style = "font-size:20px; padding-top:10px"> 0 </i>
            			<i class="fa fa-flag" style = "font-size:20px; padding-top:10px; float:right;"> 신고하기 </i>
            		
            		</div>
            	</div>
            </div>
            
         </div>        
 
   </section> 
   
   <section class="container tm-home-section-1" id="more">
   
      <div class="section-margin-top about-section">
         <div class="row">   
         </div>         
         <div class="tm-section-header section-margin-top">
       		   <div class="col-lg-4 col-md-4 col-sm-4"><h2 class="tm-section-title">Q & A (6,143)</h2></div>
      		   <div class="col-lg-8 col-md-8 col-sm-8"><hr></div>
	      	   <div style = "height:200px; width:100%; position:relative">
	      	   		<button type="button" class="btn btn-secondary" style = "position:absolute; right:10px; bottom:10px">Q&A 쓰기</button>
	      	   </div>	   

      	 </div>
      </div>
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
            <div class="col-lg-9 col-md-9 col-sm-6 col-xs-12 line_l" style = "height:220px">	
            	<br>
            	<div class="summary" style = "padding-top:10px; font-size:18px">
            		I am staying 5 nights in October for my wife's 50th birthday. We are staying in The Oberoi hotel in Bali for 5nights previous. Can you advise approximately how long between hotels when travelling around midday? Seondly, is there anything you can do to wish my wife a Happy Birthday when she arrives?
            		<span><a href="#">더 보기</a></span>
            	</div>
            	<br>
            	
            	<div style = "padding-top:1px" >
            		<div class="fa" style = "width:100%">
            			<span class="ReviewUpDate" style = "padding-top:5px">
            				질문 날짜 : 2018년 09월 19일
            			</span>
            			<span>|</span>
            			<span class="ReviewUpDate" style = "padding-top:5px">
            				<i class="fa fa-thumbs-o-up" style = "font-size:14px; padding-top:5px"> 0 </i>
            				<i class="fa fa-flag" style = "font-size:14px; padding-top:5px; float:right; cursor:pointer"><a onclick="reportWrite()"> 신고하기</a></i>
            			</span>	
            		</div>
            	</div>
            	<div style = "margin-top:5px">
            		<button type="button" class="btn btn-secondary">답변</button>
            		<button type="button" class="btn btn-secondary">모든 답변보기</button>
            	</div>
            </div>
            
         </div> 
         <br>
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
            <div class="col-lg-9 col-md-9 col-sm-6 col-xs-12 line_l" style = "height:220px">	
            	<br>
            	<div class="summary" style = "padding-top:10px; font-size:18px">
            		I am staying 5 nights in October for my wife's 50th birthday. We are staying in The Oberoi hotel in Bali for 5nights previous. Can you advise approximately how long between hotels when travelling around midday? Seondly, is there anything you can do to wish my wife a Happy Birthday when she arrives?
            		<span><a href="#">더 보기</a></span>
            	</div>
            	<br>
            	
            	<div style = "padding-top:1px" >
            		<div class="fa" style = "width:100%">
            			<span class="ReviewUpDate" style = "padding-top:5px">
            				질문 날짜 : 2018년 09월 19일
            			</span>
            			<span>|</span>
            			<span class="ReviewUpDate" style = "padding-top:5px">
            				<i class="fa fa-thumbs-o-up" style = "font-size:14px; padding-top:5px"> 0 </i>
            				<i class="fa fa-flag" style = "font-size:14px; padding-top:5px; float:right; cursor:pointer"><a onclick="reportWrite()"> 신고하기</a></i>
            			</span>	
            		</div>
            	</div>
            	<div style = "margin-top:5px">
            		<button type="button" class="btn btn-secondary">답변</button>
            		<button type="button" class="btn btn-secondary">모든 답변보기</button>
            	</div>
            </div>
            
         </div> 
         <br>
         
                
      </div>
   </section>
	
	<!-- white bg -->
	<section class="tm-white-bg section-padding-bottom"></section>
	
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
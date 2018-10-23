<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<title>Hello Korea</title>
<style>
	#more{margin-top:5%;}
	#detailClick:hover{cursor:pointer}
	.themeText{font-size:20px;}
	#detailHover{max-width:750px;}
	#detailInfo-1{max-width:500px;}
	#tm-home-box-2-link-1{width:50px;}
	#tm-home-box-2-link-2{width:445px; display:inline-block;}
	#dibsBtn{padding:15px; width:50px; height:50px;}
	#infoTextArea{height:175px; padding:10px 20px 44px; text-align:left; }
	.img-responsive1{width:250px; height:225px;}
</style>
</head>
<body>
	<!-- 지역의 호텔검색 Page. -->
	<jsp:include page="../common/searchMenubar.jsp"/>
	<jsp:include page="../common/searchSubmenubar.jsp"/>
	
	
	<section class="container tm-home-section-1" id="more">
		<div class="container">
			<div class="row">
				<div class="tm-section-header section-margin-top">
					<div class="col-lg-3 col-md-3 col-sm-3"><hr></div>
					<div class="col-lg-6 col-md-6 col-sm-6"><h2 class="tm-section-title">테마여행</h2></div>
					<div class="col-lg-3 col-md-3 col-sm-3"><hr></div>	
				</div>
				<div class="tm-section-header col-lg-12">
					<div class="col-lg-4 col-md-3 col-sm-3">
						<span class="tm-section-title" style="font-size:25px;"><b>테마 선택</b></span>
					</div>
					<div class="col-lg-8 col-md-6 col-sm-6" align="right">
						<span class="tm-section-title" style="font-size:25px;"><b>추천 장소 Best</b></span>
					</div>	
				</div>
				
				
					
				<!-- 테마 선택 버튼 영역 -->
				<div class="col-lg-3" align="left">
					
					<div class="col-lg-12 col-md-12 col-sm-12" align="left">
						<span class="tm-section-title" style="font-size:25px; border-bottom:1px solid #ccc;"><b>분류</b></span>
						<br><br>
						<input type="radio" class="themeSearch" id="themeShopping" value="shopping" name="themeSelect" style="width:17px; height:17px;" />
						<label for="themeShopping" class="themeText">&nbsp;&nbsp;쇼핑</label><br>
						<input type="radio" class="themeSearch" id="themeBeauty" value="beauty" name="themeSelect" style="width:17px; height:17px;" />
						<label for="themeBeauty" class="themeText">&nbsp;&nbsp;뷰티</label><br>
						<input type="radio" class="themeSearch" id="themeClassic" value="classic" name="themeSelect" style="width:17px; height:17px;"/>
						<label for="themeClassic" class="themeText">&nbsp;&nbsp;전통</label><br>
						<input type="radio" class="themeSearch" id="themeLeisure" value="leisure" name="themeSelect" style="width:17px; height:17px;" />
						<label for="themeLeisure" class="themeText">&nbsp;&nbsp;레져</label><br>
						<!-- <input type="radio" class="themeSearch" id="themeKoreaWave" value="koreawave" name="themeSelect" style="width:17px; height:17px;" />
						<label for="themeKoreaWave" class="themeText">&nbsp;&nbsp;한류</label><br> -->
						
					</div>
					
					
					
				</div>
				<div class="col-lg-9" align="right" id="viewArea">
				   <div class="tm-home-box-3" id="detailHover">
						<div class="tm-home-box-3-img-container" id="detailClick" onclick="location.href='${contextPath}/themeDetail'">
							<img src="${ contextPath }/resources/img/index-09.jpg" alt="image" class="img-responsive1">	
						</div>						
						<div class="tm-home-box-3-info" id="detailInfo-1">
							<p class="tm-home-box-3-description" id="infoTextArea">Proin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum</p>
					        <div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-1"><i class="fa fa-heart tm-home-box-2-icon border-right" id="dibsBtn"></i></a>
							<a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-2"><span class="tm-home-box-2-description box-3">Travel</span></a>
							<!-- <a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-1"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a> -->
						</div>
						</div>						
					</div>
					<div class="tm-home-box-3" id="detailHover">
						<div class="tm-home-box-3-img-container" id="detailClick" onclick="location.href='${contextPath}/detailHotel'">
							<img src="${ contextPath }/resources/img/index-09.jpg" alt="image" class="img-responsive1">	
						</div>						
						<div class="tm-home-box-3-info" id="detailInfo-1">
							<p class="tm-home-box-3-description" id="infoTextArea">Proin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum</p>
					        <div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-1"><i class="fa fa-heart tm-home-box-2-icon border-right" id="dibsBtn"></i></a>
							<a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-2"><span class="tm-home-box-2-description box-3">Travel</span></a>
							<!-- <a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-1"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a> -->
						</div>
						</div>						
					</div>
					<div class="tm-home-box-3" id="detailHover">
						<div class="tm-home-box-3-img-container" id="detailClick" onclick="location.href='${contextPath}/detailHotel'">
							<img src="${ contextPath }/resources/img/index-09.jpg" alt="image" class="img-responsive1">	
						</div>						
						<div class="tm-home-box-3-info" id="detailInfo-1">
							<p class="tm-home-box-3-description" id="infoTextArea">Proin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum</p>
					        <div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-1"><i class="fa fa-heart tm-home-box-2-icon border-right" id="dibsBtn"></i></a>
							<a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-2"><span class="tm-home-box-2-description box-3">Travel</span></a>
							<!-- <a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-1"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a> -->
						</div>
						</div>						
					</div>
					<div class="tm-home-box-3" id="detailHover">
						<div class="tm-home-box-3-img-container" id="detailClick" onclick="location.href='${contextPath}/detailHotel'">
							<img src="${ contextPath }/resources/img/index-09.jpg" alt="image" class="img-responsive1">	
						</div>						
						<div class="tm-home-box-3-info" id="detailInfo-1">
							<p class="tm-home-box-3-description" id="infoTextArea">Proin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum</p>
					        <div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-1"><i class="fa fa-heart tm-home-box-2-icon border-right" id="dibsBtn"></i></a>
							<a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-2"><span class="tm-home-box-2-description box-3">Travel</span></a>
							<!-- <a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-1"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a> -->
						</div>
						</div>						
					</div>
					<div class="tm-home-box-3" id="detailHover">
						<div class="tm-home-box-3-img-container" id="detailClick" onclick="location.href='${contextPath}/detailHotel'">
							<img src="${ contextPath }/resources/img/index-09.jpg" alt="image" class="img-responsive1">	
						</div>						
						<div class="tm-home-box-3-info" id="detailInfo-1">
							<p class="tm-home-box-3-description" id="infoTextArea">Proin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum</p>
					        <div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-1"><i class="fa fa-heart tm-home-box-2-icon border-right" id="dibsBtn"></i></a>
							<a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-2"><span class="tm-home-box-2-description box-3">Travel</span></a>
							<!-- <a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-1"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a> -->
						</div>
						</div>						
					</div>
			    </div>
			</div>
		</div>
		
	</section>		
	<script>
	var checkvalue = "";
	var contenttypeid;
	var contentidvalue;
	var contentid;
	var contentidd;
	var pageNo;
	var contenttypeidd = 38;
	var contentidvalues = [2495482, 2505619, 132318, 132248, 132593, 2017158, 806322];
	
		$(function(){
			
			searchThemeCondition(contenttypeidd, contentidvalues);
			
			$(".themeSearch").click(function(){ // shopping, beauty, classic, leisure
				checkvalue = $("input[type=radio][name=themeSelect]:checked").val();
				console.log("checkvalue : " + checkvalue);
				if(checkvalue == "shopping"){
					contenttypeid = 38;
					contentidvalue = [2495482, 2505619, 132318, 132248, 132593, 2017158, 806322];
					console.log(contentidvalue);
				}else if(checkvalue == "beauty"){
					contenttypeid = 38;
					contentidvalue = [970046, 2497595, 987759, 987770, 1304854, 985355, 987806];
				}else if(checkvalue == "classic"){
					contenttypeid = 12;
					contentidvalue = [126508, 126747, 126509, 127642, 126504, 126514, 126804];
				}else if(checkvalue == "leisure"){
					contenttypeid = 28;
					contentidvalue = [131940, 2368508, 131794, 1750188, 1945525, 1904623, 1908140];
				}
				searchThemeCondition(contenttypeid, contentidvalue);
			});
		});
	</script>
	<c:if test="${!empty sessionScope.loginUser }">
		<script>
		function searchThemeCondition(contenttypeid, contentidvalue){
			var viewArea = $("#viewArea");
			viewArea.html("");
			var output = "";
			for(var i = 0; i < contentidvalue.length; i++){
				contentidd = contentidvalue[i];
				$.ajax({
					url:"themeSearchCondition.sub",
					type:"GET",
					data:{contenttypeid:contenttypeid, contentid:contentidd},
					dataType:"json",
					async:false,
					success:function(data){
						console.log(data);
						var myData = data.response.body.items.item;
						output = "";
						contenttypeid = myData.contenttypeid;
						contentid = myData.contentid;
						mapy = myData.mapy;
						mapx = myData.mapx;
						output += "<div class='tm-home-box-3' id='detailHover'>";
						output += "<div class='tm-home-box-3-img-container' id='detailClick'>";
						output += "<img src="+myData.firstimage+" alt='image' class='img-responsive1'/>";
						output += "</div>";
						output += "<div class='tm-home-box-3-info' id='detailInfo-1'>";
						output += "<p class='tm-home-box-3-description detailViewContent' onclick='detailView("+contentid+","+contenttypeid+","+myData.mapy+","+myData.mapx+");' id='infoTextArea'>";
						output += "<span style='font-size:23px;'>"+myData.title+"</span><br>";
						var overview = myData.overview;
						var reg = /<br\s*[\/]?>/g;
							overview = overview.replace(reg, " ");
						if(overview.length > 190){
							output += overview.substring(0, 191) + "...";
						}else{
							output += overview;
						}	
						output += "</p>";
						output += "<div class='tm-home-box-2-container'>";
						$.ajax({
							url:"dibsCheckStatus.good",
							type:"GET",
							data:{contenttypeid:contenttypeid, contentid:contentid},
							async:false,
							success:function(ddatta){
								console.log("ddatta오니?");
								console.log(ddatta);
								if(ddatta > 0){
									output += "<a onclick='btnGood2("+contenttypeid+","+contentid+");' class='tm-home-box-2-link goodBtn' id='tm-home-box-2-link-1'><i class='fa fa-heart tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
								}else{
									output += "<a onclick='btnGood2("+contenttypeid+","+contentid+");' class='tm-home-box-2-link goodBtn' id='tm-home-box-2-link-1'><i class='fa fa-heart-o tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
								}
							},
							error:function(ddatta){
								console.log(ddatta);
							}
						});
						//output += "<a onclick='btnGood("+contenttypeid+","+contentid+");' class='tm-home-box-2-link goodBtn' id='tm-home-box-2-link-1'><i class='fa fa-heart-o tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
						output += "<a onclick='' class='tm-home-box-2-link' id='tm-home-box-2-link-2'>";
						output += "<span class='tm-home-box-2-description box-3'>";
						$.ajax({
							url:"gradeCheck.bo",
							type:"GET",
							data:{contentid:contentid},
							async:false,
							dataType:"json",
							success:function(ddatta){console.log("success");
							if(ddatta.bb == null){
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
							}else if(ddatta.bb.grade == 0){
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
							}else if(ddatta.bb.grade > 0 && ddatta.bb.grade <= 0.5){
								output += "<i class='fas fa-star-half-alt' style = 'font-size:20px'></i>";//별반
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
							}else if(ddatta.bb.grade > 0.5 && ddatta.bb.grade <= 1){
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";//별하나
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
							}else if(ddatta.bb.grade > 1.0 && ddatta.bb.grade <= 1.5){
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star-half-alt' style = 'font-size:20px'></i>";//별한개반
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
							}else if(ddatta.bb.grade > 1.5 && ddatta.bb.grade <= 2.0){
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";//별두개
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
							}else if(ddatta.bb.grade > 2.0 && ddatta.bb.grade <= 2.5){
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star-half-alt' style = 'font-size:20px'></i>";//별두개반
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
							}else if(ddatta.bb.grade > 2.5 && ddatta.bb.grade <= 3.0){
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";//별세개
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
							}else if(ddatta.bb.grade > 3.0 && ddatta.bb.grade <= 3.5){
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star-half-alt' style = 'font-size:20px'></i>";//별세개반
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
							}else if(ddatta.bb.grade > 3.5 && ddatta.bb.grade <= 4.0){
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";//별네개
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
							}else if(ddatta.bb.grade > 4.0 && ddatta.bb.grade <= 4.5){
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star-half-alt' style = 'font-size:20px'></i>";//별네개반
							}else if(ddatta.bb.grade > 4.5 && ddatta.bb.grade <= 5.0){
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";//별다섯
							}
							},error:function(ddatta){console.log("fail"); console.log(ddatta);}
						});
						output += "</span></a>";
						output += "</div></div></div>";
						document.getElementById("viewArea").innerHTML += output;
					},error:function(data){console.log(data);}
				});
			}
		}
		</script>
		</c:if>
		<script>
		
		
		function detailView(contentid, contenttypeid, mapy, mapx){
			location.href="${contextPath}/detailGame?contentid="+contentid+"&contenttypeid="+contenttypeid+"&mapy="+mapy+"&mapx="+mapx;
		}
		
		
		</script>
		<c:if test="${!empty sessionScope.loginUser}">
		<script>
		function btnGood2(contenttypeid, contentid){
			console.log(contenttypeid);
			console.log(contentid);
			
				$.ajax({
					url:"dibsCheckStatus.good",
					type:"GET",
					data:{contenttypeid:contenttypeid, contentid:contentid},
					success:function(data){
						// 1일시, 이미 찜한 목록 => delete요청.
						// 0일시, 새로 찜에 추가 => insert요청.
						console.log("오긴와?");
						console.log(data);
						if(data > 0){
							deleteDibsInfo(contentid, contenttypeid);
						}else{
							insertDibsInfo(contentid, contenttypeid);
						}
					},
					error:function(data){
						console.log(data);
					}
				});
		}
		$(function(){
			$(".goodBtn").click(function(){
				if($(this).children("i").hasClass("fa fa-heart tm-home-box-2-icon border-right") == true){
					$(this).children("i").removeClass("fa fa-heart tm-home-box-2-icon border-right");
					$(this).children("i").addClass("fa fa-heart-o tm-home-box-2-icon border-right");
				}else if($(this).children("i").hasClass("fa fa-heart-o tm-home-box-2-icon border-right") == true){
					$(this).children("i").removeClass("fa fa-heart-o tm-home-box-2-icon border-right");
					$(this).children("i").addClass("fa fa-heart tm-home-box-2-icon border-right");
				}
			});
		});
		</script>
		</c:if>
		<c:if test="${ empty sessionScope.loginUser }">
		<script>
			function btnGood2(contenttypeid, contentid){
				alert("로그인이 필요한 서비스입니다.");
			}
		</script>
		</c:if>
		<c:if test="${empty sessionScope.loginUser }">
		<script>
		function searchThemeCondition(contenttypeid, contentidvalue){
			var viewArea = $("#viewArea");
			viewArea.html("");
			var output = "";
			for(var i = 0; i < contentidvalue.length; i++){
				contentidd = contentidvalue[i];
				$.ajax({
					url:"themeSearchCondition.sub",
					type:"GET",
					data:{contenttypeid:contenttypeid, contentid:contentidd},
					dataType:"json",
					async:false,
					success:function(data){
						console.log(data);
						var myData = data.response.body.items.item;
						output = "";
						contenttypeid = myData.contenttypeid;
						contentid = myData.contentid;
						mapy = myData.mapy;
						mapx = myData.mapx;
						output += "<div class='tm-home-box-3' id='detailHover'>";
						output += "<div class='tm-home-box-3-img-container' id='detailClick'>";
						output += "<img src="+myData.firstimage+" alt='image' class='img-responsive1'/>";
						output += "</div>";
						output += "<div class='tm-home-box-3-info' id='detailInfo-1'>";
						output += "<p class='tm-home-box-3-description detailViewContent' onclick='detailView("+contentid+","+contenttypeid+","+myData.mapy+","+myData.mapx+");' id='infoTextArea'>";
						output += "<span style='font-size:23px;'>"+myData.title+"</span><br>";
						var overview = myData.overview;
						var reg = /<br\s*[\/]?>/g;
							overview = overview.replace(reg, " ");
						if(overview.length > 190){
							output += overview.substring(0, 191) + "...";
						}else{
							output += overview;
						}	
						output += "</p>";
						output += "<div class='tm-home-box-2-container'>";
						output += "<a onclick='btnGood("+contenttypeid+","+contentid+");' class='tm-home-box-2-link goodBtn' id='tm-home-box-2-link-1'><i class='fa fa-heart-o tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
						output += "<a onclick='' class='tm-home-box-2-link' id='tm-home-box-2-link-2'>";
						output += "<span class='tm-home-box-2-description box-3'>";
						$.ajax({
							url:"gradeCheck.bo",
							type:"GET",
							data:{contentid:contentid},
							dataType:"json",
							async:false,
							success:function(ddatta){
								console.log("success");
								if(ddatta.bb == null){
									output += "<i class='far fa-star' style='font-size:20px;'></i>";
									output += "<i class='far fa-star' style='font-size:20px;'></i>";
									output += "<i class='far fa-star' style='font-size:20px;'></i>";
									output += "<i class='far fa-star' style='font-size:20px;'></i>";
									output += "<i class='far fa-star' style='font-size:20px;'></i>";
								}else if(ddatta.bb.grade == 0){
									output += "<i class='far fa-star' style='font-size:20px;'></i>";
									output += "<i class='far fa-star' style='font-size:20px;'></i>";
									output += "<i class='far fa-star' style='font-size:20px;'></i>";
									output += "<i class='far fa-star' style='font-size:20px;'></i>";
									output += "<i class='far fa-star' style='font-size:20px;'></i>";
								}else if(ddatta.bb.grade > 0 && ddatta.bb.grade <= 0.5){
									output += "<i class='fas fa-star-half-alt' style = 'font-size:20px'></i>";//별반
									output += "<i class='far fa-star' style = 'font-size:20px'></i>";
									output += "<i class='far fa-star' style = 'font-size:20px'></i>";
									output += "<i class='far fa-star' style = 'font-size:20px'></i>";
									output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								}else if(ddatta.bb.grade > 0.5 && ddatta.bb.grade <= 1){
									output += "<i class='far fa-star' style = 'font-size:20px'></i>";//별하나
									output += "<i class='far fa-star' style = 'font-size:20px'></i>";
									output += "<i class='far fa-star' style = 'font-size:20px'></i>";
									output += "<i class='far fa-star' style = 'font-size:20px'></i>";
									output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								}else if(ddatta.bb.grade > 1.0 && ddatta.bb.grade <= 1.5){
									output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
									output += "<i class='fas fa-star-half-alt' style = 'font-size:20px'></i>";//별한개반
									output += "<i class='far fa-star' style = 'font-size:20px'></i>";
									output += "<i class='far fa-star' style = 'font-size:20px'></i>";
									output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								}else if(ddatta.bb.grade > 1.5 && ddatta.bb.grade <= 2.0){
									output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
									output += "<i class='fas fa-star' style = 'font-size:20px'></i>";//별두개
									output += "<i class='far fa-star' style = 'font-size:20px'></i>";
									output += "<i class='far fa-star' style = 'font-size:20px'></i>";
									output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								}else if(ddatta.bb.grade > 2.0 && ddatta.bb.grade <= 2.5){
									output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
									output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
									output += "<i class='fas fa-star-half-alt' style = 'font-size:20px'></i>";//별두개반
									output += "<i class='far fa-star' style = 'font-size:20px'></i>";
									output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								}else if(ddatta.bb.grade > 2.5 && ddatta.bb.grade <= 3.0){
									output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
									output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
									output += "<i class='fas fa-star' style = 'font-size:20px'></i>";//별세개
									output += "<i class='far fa-star' style = 'font-size:20px'></i>";
									output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								}else if(ddatta.bb.grade > 3.0 && ddatta.bb.grade <= 3.5){
									output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
									output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
									output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
									output += "<i class='fas fa-star-half-alt' style = 'font-size:20px'></i>";//별세개반
									output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								}else if(ddatta.bb.grade > 3.5 && ddatta.bb.grade <= 4.0){
									output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
									output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
									output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
									output += "<i class='fas fa-star' style = 'font-size:20px'></i>";//별네개
									output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								}else if(ddatta.bb.grade > 4.0 && ddatta.bb.grade <= 4.5){
									output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
									output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
									output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
									output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
									output += "<i class='fas fa-star-half-alt' style = 'font-size:20px'></i>";//별네개반
								}else if(ddatta.bb.grade > 4.5 && ddatta.bb.grade <= 5.0){
									output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
									output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
									output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
									output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
									output += "<i class='fas fa-star' style = 'font-size:20px'></i>";//별다섯
								}
							},error:function(ddatta){console.log("fail"); console.log(ddatta);}
						});
						output += "</span></a>";
						output += "</div></div></div>";
						document.getElementById("viewArea").innerHTML += output;
					},error:function(data){console.log(data);}
				});
			}
		}
		</script>
		</c:if>
		<script>
		function insertDibsInfo(contentid, contenttypeid){
			$.ajax({
				url:"insertDibsInfo.good",
				type:"get",
				data:{contenttypeid:contenttypeid, contentid:contentid},
				success:function(data){
					if(data > 0){
						alert("찜 목록에 추가되었습니다.");
					}
				},
				error:function(data){
					console.log(data);
				}
			});
		}
		
		function deleteDibsInfo(contentid, contenttypeid){
			$.ajax({
				url:"deleteDibsGame.good",
				type:"GET",
				data:{contenttypeid:contenttypeid, contentid:contentid},
				success:function(data){
					if(data > 0){
						alert("찜 목록에서 삭제되었습니다.");
					}
				},
				error:function(data){
					console.log(data);
				}
			});
		}
	</script>
	
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
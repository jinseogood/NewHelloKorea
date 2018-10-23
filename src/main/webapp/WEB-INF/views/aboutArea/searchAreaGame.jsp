<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<title>Hello Korea</title>
<style>
	#more{margin-top:5%;}
	/* #detailClick:hover{cursor:pointer} */
	.gameSearchText{font-size:20px;}
	#detailHover{max-width:750px;}
	#detailInfo-1{max-width:500px;}
	#tm-home-box-2-link-1{width:50px;}
	#tm-home-box-2-link-2{width:445px; display:inline-block;}
	#dibsBtn{padding:15px; width:50px; height:50px;}
	#infoTextArea{height:175px; padding:10px 20px 44px; text-align:left; }
	.img-responsive1{width:250px; height:225px;}
	.detailViewContent{cursor:pointer;}
</style>
</head>
<body>
	<!-- 지역의 오락거리검색 Page. -->
	<jsp:include page="../common/searchMenubar.jsp"/>
	<jsp:include page="../common/searchSubmenubar.jsp"/>
	
	
	<section class="container tm-home-section-1" id="more">
		<div class="container">
			<div class="row">
				<div class="tm-section-header section-margin-top">
					<div class="col-lg-3 col-md-3 col-sm-3"><hr></div>
					<div class="col-lg-6 col-md-6 col-sm-6"><h2 class="tm-section-title tm-section-title1">서울 오락거리</h2></div>
					<div class="col-lg-3 col-md-3 col-sm-3"><hr></div>	
				</div>
					<div class="col-lg-3 col-md-3 col-sm-3">
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6"></div>
					<div class="col-lg-3 col-md-3 col-sm-3" align="right">
					</div>	
					<br><br>
				<div class="col-lg-3" align="left">
					
					
					<div class="col-lg-12 col-md-12 col-sm-12" align="left">
						<span class="tm-section-title" style="font-size:25px; border-bottom:1px solid #ccc;"><b>오락거리 유형</b></span>
						<br>
						<input type="radio" class="gameSearch" id="festival" value="1" name="festivalgroup" style="width:15px; height:15px;"/>
						<label for="festival" class="gameSearchText">&nbsp;&nbsp;축제</label><br>
						<input type="radio" class="gameSearch" id="shopping" value="3" name="festivalgroup" style="width:15px; height:15px;"/>
						<label for="shopping" class="gameSearchText">&nbsp;&nbsp;쇼핑</label><br>
						<input type="radio" class="gameSearch" id="musium" value="4" name="festivalgroup" style="width:15px; height:15px;"/>
						<label for="musium" class="gameSearchText">&nbsp;&nbsp;박물관</label><br>
						<input type="radio" class="gameSearch" id="amusmentPark" value="5" name="festivalgroup" style="width:15px; height:15px;"/>
						<label for="amusmentPark" class="gameSearchText">&nbsp;&nbsp;공원/테마파크</label><br>
						<input type="radio" class="gameSearch" id="spar" value="6" name="festivalgroup" style="width:15px; height:15px;"/>
						<label for="spar" class="gameSearchText">&nbsp;&nbsp;온천/스파</label><br>
						<input type="radio" class="gameSearch" id="culture" value="7" name="festivalgroup" style="width:15px; height:15px;"/>
						<label for="culture" class="gameSearchText">&nbsp;&nbsp;문화시설</label><br>
						<input type="radio" class="gameSearch" id="reports" value="8" name="festivalgroup" style="width:15px; height:15px;"/>
						<label for="reports" class="gameSearchText">&nbsp;&nbsp;레포츠</label><br>
					</div>
					
					<br><br>
					<!-- 축제 선택시에만 일자 고르는 select-option 나오도록 -->
					<script>
					
					//var areaCode = ${param.areaCode};
					var areaCode1;
					var areaCode;
					//var sigunguCode = ${param.sigunguCode};
					var sigunguCode1;
					var sigunguCode;
					//var contenttypeid = ${param.contenttypeid};
					var contenttypeid1;
					var contenttypeid;// = sessionStorage.getItem("contenttypeid");
					//var pageNo = ${param.pageNo};
					var areaCode = sessionStorage.getItem("areaCode");
					var sigunguCode;// = sessionStorage.getItem("sigunguCode");
					var pageNo = sessionStorage.getItem("pageNo");
					var checkvalue = "";
					var cat1 = "";
					var cat2 = "";
					var cat3 = "";
					var mapy;
					var mapx;
					
					
					
					</script>
					<c:if test="${!empty sessionScope.loginUser}">
					<script>
					function searchGamePage(pageNo){
						console.log("오세여?");
						if(sessionStorage.getItem("sigunguCode") == 0){
							sigunguCode = "";
						}else{
							sigunguCode = sessionStorage.getItem("sigunguCode");
						}
						if(sessionStorage.getItem("contenttypeid") == 0){
							contenttypeid = 28;
						}else{
							contenttypeid = sessionStorage.getItem("contenttypeid");
						}
						if(sessionStorage.getItem("cat3") == 0){
							cat3 = "";
						}
						$.ajax({
							url:"searchAreaGame.sub",
							type:"GET",
							data:{areaCode:areaCode, sigunguCode:sigunguCode, contenttypeid:contenttypeid, pageNo:pageNo},
							dataType:"json",
							async:false,
							success:function(data){
								console.log(data);
								var myData = data.response.body.items.item;
								var viewArea = $("#viewArea");
								viewArea.html("");
								
								$pageBody = $(".pagination");
								$pageBody.html("");
								
								var totalCount = data.response.body.totalCount;
								var pOutput = "";
								if(totalCount > 12){
									var num = (totalCount / 12) + 0.9;
									pOutput = "";
									pOutput = "<li><a onclick='goFirst();'>[처음으로]</a></li>";
									for(var pp = 1; pp < num; pp++){
										pOutput += "<li><a onclick='goPage("+pp+")'>"+pp+"</a></li>";
									}
									pOutput += "<li><a onclick='goLast("+num+");'>[끝으로]</a></li>";
									$pageBody.append(pOutput);
								}
								
								var output = "";
								if(myData == null){
									output += "<div align='center'><h1>정보가 없습니다.</h1></div>";
									document.getElementById("viewArea").innerHTML += output;
								}else if(data.response.body.totalCount == 1){
									if(data.response.body.items.item.firstimage != null){
										contenttypeid = myData.contenttypeid;
										contentid = myData.contentid;
										mapy = myData.mapy;
										mapx = myData.mapx;
										output += "<div class='tm-home-box-3' id='detailHover'>";
										output += "<div class='tm-home-box-3-img-container' id='detailClick'>";
										output += "<img src="+myData.firstimage+" alt='image' class='img-responsive1'/>";
										output += "</div>";
										output += "<div class='tm-home-box-3-info' id='detailInfo-1'>";
										output += "<p class='tm-home-box-3-description detailViewContent' onclick='detailView("+contentid+","+contenttypeid+","+mapy+","+mapx+");' id='infoTextArea'>";
										output += "<span style='font-size:23px;'>"+myData.title+"</span><br>";
										$.ajax({
											url:"detailGameInformation.sub",
											type:"GET",
											data:{contenttypeid:contenttypeid, contentid:contentid},
											dataType:"json",
											async:false,
											success:function(ddate){
												var overview = ddate.response.body.items.item.overview;
												var reg = /<br\s*[\/]?>/g;
													overview = overview.replace(reg, " ");
												var overview = ddate.response.body.items.item.overview;
												if(overview.length > 190){
													output += overview.substring(0, 191) + "...";
												}else{
													output += overview;
												}
											},error:function(ddate){console.log(ddate);}
										});
										output += "</p>";
										output += "<div class='tm-home-box-2-container'>";
										$.ajax({
											url:"dibsCheckStatus.good",
											type:"GET",
											data:{contenttypeid:contenttypeid, contentid:contentid},
											async:false,
											success:function(ddatta){
												if(ddatta > 0){
													output += "<a onclick='btnGood2("+contenttypeid+","+contentid+");' class='tm-home-box-2-link goodBtn' id='tm-home-box-2-link-1'><i class='fa fa-heart tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
												}else{
													output += "<a onclick='btnGood2("+contenttypeid+","+contentid+");' class='tm-home-box-2-link goodBtn' id='tm-home-box-2-link-1'><i class='fa fa-heart-o tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
												}
											},error:function(ddatta){
												console.log(ddatta);
											}
										});
										//output += "<a onclick='btnGood("+contenttypeid+","+contentid+");' class='tm-home-box-2-link goodBtn' id='tm-home-box-2-link-1'><i class='fa fa-heart-o tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
										output += "<a onclick='' class='tm-home-box-2-link' id='tm-home-box-2-link-2'>";
										output += "<span onclick='detailView("+contentid+","+contenttypeid+","+mapy+","+mapx+");' class='tm-home-box-2-description box-3'>";
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
											},error:function(ddatta){console.log("fail");
												
											}
										});
										output += "</span></a>";
										output += "</div></div></div>";
										document.getElementById("viewArea").innerHTML += output;
									}
								}else{
									for(var i in myData){
										if(myData[i].firstimage != null){
											contenttypeid = myData[i].contenttypeid;
											contentid = myData[i].contentid;
											mapy = myData[i].mapy;
											mapx = myData[i].mapx;
											output = "";
											output += "<div class='tm-home-box-3' id='detailHover'>";
											output += "<div class='tm-home-box-3-img-container' id='detailClick'>";
											output += "<img src="+myData[i].firstimage+" alt='image' class='img-responsive1'>";
											output += "</div>";
											output += "<div class='tm-home-box-3-info' id='detailInfo-1'>";
											output += "<p class='tm-home-box-3-description detailViewContent' onclick='detailView("+contentid+","+contenttypeid+","+mapy+","+mapx+");' id='infoTextArea'>";
											output += "<span style='font-size:23px;'>"+myData[i].title+"</span><br>";
											$.ajax({
												url:"detailGameInformation.sub",
												type:"GET",
												data:{contenttypeid:contenttypeid, contentid:contentid},
												dataType:"json",
												async:false,
												success:function(ddate){
													var overview = ddate.response.body.items.item.overview;
													var reg = /<br\s*[\/]?>/g;
														overview = overview.replace(reg, " ");
													if(overview.length > 190){
														output += overview.substring(0, 191) + "...";
													}else{
														output += overview;
													}
												},error:function(ddate){console.log(ddate);}
											});
											output += "</p>";
											output += "<div class='tm-home-box-2-container'>";
											$.ajax({
												url:"dibsCheckStatus.good",
												type:"GET",
												data:{contenttypeid:contenttypeid, contentid:contentid},
												async:false,
												success:function(data){
													if(data > 0){
														output += "<a onclick='btnGood2("+contenttypeid+","+contentid+");' class='tm-home-box-2-link goodBtn' id='tm-home-box-2-link-1'><i class='fa fa-heart tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
													}else{
														output += "<a onclick='btnGood2("+contenttypeid+","+contentid+");' class='tm-home-box-2-link goodBtn' id='tm-home-box-2-link-1'><i class='fa fa-heart-o tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
													}
												},
												error:function(data){
													console.log(data);
												}
											});
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
												},error:function(ddatta){console.log("fail");
													
												}
											});
											output += "</span></a>";
											output += "</div></div></div>";
											document.getElementById("viewArea").innerHTML += output;
										}
									}
								}
								
							},
							error:function(data){
								console.log(data);
							}
						});
					}
					
					function searchGameCondition(contenttypeid, areaCode, sigunguCode, cat1, cat2, cat3, pageNo){
						$.ajax({
							url:"searchGameCondition.sub",
							type:"GET",
							data:{contenttypeid:contenttypeid, areaCode:areaCode, sigunguCode:sigunguCode, cat1:cat1, cat2:cat2, cat3:cat3, pageNo:pageNo},
							dataType:"json",
							success:function(data){
								console.log("gameSearchCondition");
								console.log(data);
								var myData = data.response.body.items.item;
								var viewArea = $("#viewArea");
								viewArea.html("");
								
								$pageBody = $(".pagination");
								$pageBody.html("");
								
								var totalCount = data.response.body.totalCount;
								var pOutput = "";
								if(totalCount > 12){
									var num = (totalCount / 12) + 0.9;
									pOutput = "";
									pOutput += "<li><a onclick='goFirst();'>[처음으로]</a></li>";
									for(var pp = 1; pp < num; pp++){
										pOutput += "<li><a onclick='goPage("+pp+");'>"+pp+"</a></li>";
									}
									pOutput += "<li><a onclick='goLast("+num+");'>[끝으로]</a></li>";
									$pageBody.append(pOutput);
								}
								var output = "";
								if(myData == null){
									output += "<div align='center'></h1>정보가 없습니다.</h1></div>";
									document.getElementById("viewArea").innerHTML += output;
								}else if(data.response.body.totalCount == 1){
									if(data.response.body.items.item.firstimage != null){
										contenttypeid = myData.contenttypeid;
										contentid = myData.contentid;
										mapy = myData.mapy;
										mapx = myData.mapx;
										output += "<div class='tm-home-box-3' id='detailHover'>";
										output += "<div class='tm-home-box-3-img-container' id='detailClick'>";
										output += "<img src="+myData.firstimage+" alt='image' class='img-responsive1'/>";
										output += "</div>";
										output += "<div class='tm-home-box-3-info' id='detailInfo-1'>";
										output += "<p class='tm-home-box-3-description detailViewContent' onclick='detailView("+contentid+","+contenttypeid+","+mapy+","+mapx+");' id='infoTextArea'>";
										output += "<span style='font-size:23px;'>"+myData.title+"</span><br>";
										$.ajax({
											url:"detailGameInformation.sub",
											type:"GET",
											data:{contenttypeid:contenttypeid, contentid:contentid},
											dataType:"json",
											async:false,
											success:function(ddate){
												var overview = ddate.response.body.items.item.overview;
												var reg = /<br\s*[\/]?>/g;
													overview = overview.replace(reg, " ");
												if(overview.length > 190){
													output += overview.substring(0, 191) + "...";
												}else{
													output += overview;
												}
											},error:function(ddate){console.log(ddate);}
										});
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
											},error:function(ddatta){console.log("fail");
												
											}
										});
										output += "</span></a>";
										output += "</div></div></div>";
										document.getElementById("viewArea").innerHTML += output;
									}
								}else{
									for(var i in myData){
										if(myData[i].firstimage != null){
											contenttypeid = myData[i].contenttypeid;
											contentid = myData[i].contentid;
											mapy = myData[i].mapy;
											mapx = myData[i].mapx;
											output = "";
											output += "<div class='tm-home-box-3' id='detailHover'>";
											output += "<div class='tm-home-box-3-img-container' id='detailClick'>";
											output += "<img src="+myData[i].firstimage+" alt='image' class='img-responsive1'>";
											output += "</div>";
											output += "<div class='tm-home-box-3-info' id='detailInfo-1'>";
											output += "<p class='tm-home-box-3-description detailViewContent' onclick='detailView("+contentid+","+contenttypeid+","+mapy+","+mapx+");' id='infoTextArea'>";
											output += "<span style='font-size:23px;'>" +myData[i].title+"</span><br>";
											$.ajax({
												url:"detailGameInformation.sub",
												type:"GET",
												data:{contenttypeid:contenttypeid, contentid:contentid},
												dataType:"json",
												async:false,
												success:function(ddate){
													var overview = ddate.response.body.items.item.overview;
													var reg = /<br\s*[\/]?>/g;
														overview = overview.replace(reg, " ");
													if(overview.length > 190){
														output += overview.substring(0, 191) + "...";
													}else{
														output += overview;
													}
												},error:function(ddate){console.log(ddate);}
											});
											output += "</p>";
											output += "<div class='tm-home-box-2-container'>";
											$.ajax({
												url:"dibsCheckStatus.good",
												type:"GET",
												data:{contenttypeid:contenttypeid, contentid:contentid},
												async:false,
												success:function(ddatta){
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
												},error:function(ddatta){console.log("fail");
													
												}
											});
											output += "</span></a>";
											output += "</div></div></div>";
											document.getElementById("viewArea").innerHTML += output;
										}
									}
								}
							},
							error:function(data){
								console.log(data);
							}
						});
					}
					
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
					<c:if test="${empty sessionScope.loginUser}">
					<script>
						function btnGood2(contenttypeid, contentid){
							alert("로그인이 필요한 서비스입니다.");
						}
						
						function searchGamePage(pageNo){
							console.log("오세여?");
							if(sessionStorage.getItem("sigunguCode") == 0){
								sigunguCode = "";
							}else{
								sigunguCode = sessionStorage.getItem("sigunguCode");
							}
							if(sessionStorage.getItem("contenttypeid") == 0){
								contenttypeid = 12;
							}else{
								contenttypeid = sessionStorage.getItem("contenttypeid");
							}
							if(sessionStorage.getItem("cat3") == 0){
								cat3 = "";
							}
							$.ajax({
								url:"searchAreaGame.sub",
								type:"GET",
								data:{areaCode:areaCode, sigunguCode:sigunguCode, contenttypeid:contenttypeid, pageNo:pageNo},
								dataType:"json",
								async:false,
								success:function(data){
									console.log(data);
									var myData = data.response.body.items.item;
									var viewArea = $("#viewArea");
									viewArea.html("");
									
									$pageBody = $(".pagination");
									$pageBody.html("");
									
									var totalCount = data.response.body.totalCount;
									var pOutput = "";
									if(totalCount > 12){
										var num = (totalCount / 12) + 0.9;
										pOutput = "";
										pOutput = "<li><a onclick='goFirst();'>[처음으로]</a></li>";
										for(var pp = 1; pp < num; pp++){
											pOutput += "<li><a onclick='goPage("+pp+")'>"+pp+"</a></li>";
										}
										pOutput += "<li><a onclick='goLast("+num+");'>[끝으로]</a></li>";
										$pageBody.append(pOutput);
									}
									
									var output = "";
									if(myData == null){
										output += "<div align='center'><h1>정보가 없습니다.</h1></div>";
										document.getElementById("viewArea").innerHTML += output;
									}else if(data.response.body.totalCount == 1){
										if(data.response.body.items.item.firstimage != null){
											contenttypeid = myData.contenttypeid;
											contentid = myData.contentid;
											mapy = myData.mapy;
											mapx = myData.mapx;
											output += "<div class='tm-home-box-3' id='detailHover'>";
											output += "<div class='tm-home-box-3-img-container' id='detailClick');'>";
											output += "<img src="+myData.firstimage+" alt='image' class='img-responsive1'/>";
											output += "</div>";
											output += "<div class='tm-home-box-3-info' id='detailInfo-1'>";
											output += "<p class='tm-home-box-3-description detailViewContent' onclick='detailView("+contentid+","+contenttypeid+","+mapy+","+mapx+");' id='infoTextArea'>";
											output += "<span style='font-size:23px;'>"+myData.title+"</span><br>";
											$.ajax({
												url:"detailGameInformation.sub",
												type:"GET",
												data:{contenttypeid:contenttypeid, contentid:contentid},
												dataType:"json",
												async:false,
												success:function(ddate){
													var overview = ddate.response.body.items.item.overview;
													var reg = /<br\s*[\/]?>/g;
														overview = overview.replace(reg, " ");
													if(overview.length > 190){
														output += overview.substring(0, 191) + "...";
													}else{
														output += overview;
													}
												},error:function(ddate){console.log(ddate);}
											});
											output += "</p>";
											output += "<div class='tm-home-box-2-container'>";
											output += "<a onclick='btnGood("+contenttypeid+","+contentid+");' class='tm-home-box-2-link goodBtn' id='tm-home-box-2-link-1'><i class='fa fa-heart-o tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
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
												},error:function(ddatta){console.log("fail");
													
												}
											});
											output += "</span></a>";
											output += "</div></div></div>";
											document.getElementById("viewArea").innerHTML += output;
										}
									}else{
										for(var i in myData){
											if(myData[i].firstimage != null){
												contenttypeid = myData[i].contenttypeid;
												contentid = myData[i].contentid;
												mapy = myData[i].mapy;
												mapx = myData[i].mapx;
												output = "";
												output += "<div class='tm-home-box-3' id='detailHover'>";
												output += "<div class='tm-home-box-3-img-container' id='detailClick');'>";
												output += "<img src="+myData[i].firstimage+" alt='image' class='img-responsive1'>";
												output += "</div>";
												output += "<div class='tm-home-box-3-info' id='detailInfo-1'>";
												output += "<p class='tm-home-box-3-description detailViewContent' onclick='detailView("+contentid+","+contenttypeid+","+mapy+","+mapx+");' id='infoTextArea'>";
												output += "<span style='font-size:23px;'>"+myData[i].title+"</span><br>";
												$.ajax({
													url:"detailGameInformation.sub",
													type:"GET",
													data:{contenttypeid:contenttypeid, contentid:contentid},
													dataType:"json",
													async:false,
													success:function(ddate){
														var overview = ddate.response.body.items.item.overview;
														var reg = /<br\s*[\/]?>/g;
															overview = overview.replace(reg, " ");
														if(overview.length > 190){
															output += overview.substring(0, 191) + "...";
														}else{
															output += overview;
														}
													},error:function(ddate){console.log(ddate);}
												});
												output += "</p>";
												output += "<div class='tm-home-box-2-container'>";
												output += "<a onclick='btnGood("+contenttypeid+","+contentid+");' class='tm-home-box-2-link goodBtn' id='tm-home-box-2-link-1'><i class='fa fa-heart-o tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
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
													},error:function(ddatta){console.log("fail");
														
													}
												});
												output += "</span></a>";
												output += "</div></div></div>";
												document.getElementById("viewArea").innerHTML += output;
											}
										}
									}
									
								},
								error:function(data){
									console.log(data);
								}
							});
						}
						
						function searchGameCondition(contenttypeid, areaCode, sigunguCode, cat1, cat2, cat3, pageNo){
							$.ajax({
								url:"searchGameCondition.sub",
								type:"GET",
								data:{contenttypeid:contenttypeid, areaCode:areaCode, sigunguCode:sigunguCode, cat1:cat1, cat2:cat2, cat3:cat3, pageNo:pageNo},
								dataType:"json",
								success:function(data){
									console.log("gameSearchCondition");
									console.log(data);
									var myData = data.response.body.items.item;
									var viewArea = $("#viewArea");
									viewArea.html("");
									
									$pageBody = $(".pagination");
									$pageBody.html("");
									
									var totalCount = data.response.body.totalCount;
									var pOutput = "";
									if(totalCount > 12){
										var num = (totalCount / 12) + 0.9;
										pOutput = "";
										pOutput += "<li><a onclick='goFirst();'>[처음으로]</a></li>";
										for(var pp = 1; pp < num; pp++){
											pOutput += "<li><a onclick='goPage("+pp+");'>"+pp+"</a></li>";
										}
										pOutput += "<li><a onclick='goLast("+num+");'>[끝으로]</a></li>";
										$pageBody.append(pOutput);
									}
									var output = "";
									if(myData == null){
										output += "<div align='center'></h1>정보가 없습니다.</h1></div>";
										document.getElementById("viewArea").innerHTML += output;
									}else if(data.response.body.totalCount == 1){
										if(data.response.body.items.item.firstimage != null){
											contenttypeid = myData.contenttypeid;
											contentid = myData.contentid;
											mapy = myData.mapy;
											mapx = myData.mapx;
											output += "<div class='tm-home-box-3' id='detailHover'>";
											output += "<div class='tm-home-box-3-img-container' id='detailClick'>";
											output += "<img src="+myData.firstimage+" alt='image' class='img-responsive1'/>";
											output += "</div>";
											output += "<div class='tm-home-box-3-info' id='detailInfo-1'>";
											output += "<p class='tm-home-box-3-description detailViewContent' onclick='detailView("+contentid+","+contenttypeid+","+mapy+","+mapx+");' id='infoTextArea'>";
											output += "<span style='font-size:23px;'>"+myData.title+"</span><br>";
											$.ajax({
												url:"detailGameInformation.sub",
												type:"GET",
												data:{contenttypeid:contenttypeid, contentid:contentid},
												dataType:"json",
												async:false,
												success:function(ddate){
													var overview = ddate.response.body.items.item.overview;
													var reg = /<br\s*[\/]?>/g;
														overview = overview.replace(reg, " ");
													if(overview.length > 190){
														output += overview.substring(0, 191) + "...";
													}else{
														output += overview;
													}
												},error:function(ddate){console.log(ddate);}
											});
											output += "</p>";
											output += "<div class='tm-home-box-2-container'>";
											output += "<a onclick='btnGood("+contenttypeid+","+contentid+");' class='tm-home-box-2-link goodBtn' id='tm-home-box-2-link-1'><i class='fa fa-heart-o tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
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
												},error:function(ddatta){console.log("fail");
													
												}
											});
											output += "</span></a>";
											output += "</div></div></div>";
											document.getElementById("viewArea").innerHTML += output;
										}
									}else{
										for(var i in myData){
											if(myData[i].firstimage != null){
												contenttypeid = myData[i].contenttypeid;
												contentid = myData[i].contentid;
												mapy = myData[i].mapy;
												mapx = myData[i].mapx;
												output = "";
												output += "<div class='tm-home-box-3' id='detailHover'>";
												output += "<div class='tm-home-box-3-img-container' id='detailClick'>";
												output += "<img src="+myData[i].firstimage+" alt='image' class='img-responsive1'>";
												output += "</div>";
												output += "<div class='tm-home-box-3-info' id='detailInfo-1'>";
												output += "<p class='tm-home-box-3-description detailViewContent' onclick='detailView("+contentid+","+contenttypeid+","+mapy+","+mapx+");' id='infoTextArea'>";
												output += "<span style='font-size:23px;'>" +myData[i].title+"</span><br>";
												$.ajax({
													url:"detailGameInformation.sub",
													type:"GET",
													data:{contenttypeid:contenttypeid, contentid:contentid},
													dataType:"json",
													async:false,
													success:function(ddate){
														var overview = ddate.response.body.items.item.overview;
														var reg = /<br\s*[\/]?>/g;
															overview = overview.replace(reg, " ");
														if(overview.length > 190){
															output += overview.substring(0, 191) + "...";
														}else{
															output += overview;
														}
													},error:function(ddate){console.log(ddate);}
												});
												output += "</p>";
												output += "<div class='tm-home-box-2-container'>";
												output += "<a onclick='btnGood("+contenttypeid+","+contentid+");' class='tm-home-box-2-link goodBtn' id='tm-home-box-2-link-1'><i class='fa fa-heart-o tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
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
													},error:function(ddatta){console.log("fail");
														
													}
												});
												output += "</span></a>";
												output += "</div></div></div>";
												document.getElementById("viewArea").innerHTML += output;
											}
										}
									}
								},
								error:function(data){
									console.log(data);
								}
							});
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
					
					function goFirst(){
						var pageNo = 1;
						searchGamePage(pageNo);
					}
					
					function goPage(pageNo){
						var pageNo = pageNo;
						searchGamePage(pageNo);
					}
					
					function goLast(pageNo){
						var pageNo = Math.floor(pageNo);
						searchGamePage(pageNo);
					}
					
					function detailView(contentid, contenttypeid, mapy, mapx){
						location.href="${contextPath}/detailGame?contentid="+contentid+"&contenttypeid="+contenttypeid+"&mapy="+mapy+"&mapx="+mapx;
					}
					
					
						
					
					$(function(){
							searchGamePage(pageNo);
							
							$(".gameSearch").click(function(){
								checkvalue = $("input[type=radio][name=festivalgroup]:checked").val();
								console.log(checkvalue);
								if(checkvalue == 1){
									sessionStorage.removeItem("contenttypeid");
									contenttypeid1 = sessionStorage.setItem("contenttypeid", 15);
									contenttypeid = sessionStorage.getItem("contenttypeid");
									areaCode1 = sessionStorage.getItem("areaCode");
									sigunguCode1 = sessionStorage.getItem("sigunguCode");
									cat1 = "A02";
									cat2 = "A0207";
									cat3 = "";
								}else if(checkvalue == 3){
									sessionStorage.removeItem("contenttypeid");
									contenttypeid1 = sessionStorage.setItem("contenttypeid", 38);
									contenttypeid = sessionStorage.getItem("contenttypeid");
									areaCode1 = sessionStorage.getItem("areaCode");
									sigunguCode1 = sessionStorage.getItem("sigunguCode");
									cat1 = "A04";
									cat2 = "A0401";
									cat3 = "";
									//$(".tm-section-title1").text("인천 쇼핑");
								}else if(checkvalue == 4){
									sessionStorage.removeItem("contenttypeid");
									contenttypeid1 = sessionStorage.setItem("contenttypeid", 14);
									contenttypeid = sessionStorage.getItem("contenttypeid");
									areaCode1 = sessionStorage.getItem("areaCode");
									sigunguCode1 = sessionStorage.getItem("sigunguCode");
									cat1 = "A02";
									cat2 = "A0206";
									cat3 = "A02060100";
								}else if(checkvalue == 5){
									sessionStorage.removeItem("contenttypeid");
									contenttypeid1 = sessionStorage.setItem("contenttypeid", 12);
									contenttypeid = sessionStorage.getItem("contenttypeid");
									areaCode1 = sessionStorage.getItem("areaCode");
									sigunguCode1 = "";
									cat1 = "A02";
									cat2 = "A0202";
									cat3 = "A02020600";
								}else if(checkvalue == 6){
									sessionStorage.removeItem("contenttypeid");
									contenttypeid1 = sessionStorage.setItem("contenttypeid", 12);
									contenttypeid = sessionStorage.getItem("contenttypeid");
									areaCode1 = sessionStorage.getItem("areaCode");
									sigunguCode1 = "";
									cat1 = "A02";
									cat2 = "A0202";
									cat3 = "A02020300";
								}else if(checkvalue == 7){
									sessionStorage.removeItem("contenttypeid");
									contenttypeid1 = sessionStorage.setItem("contenttypeid", 14);
									contenttypeid = sessionStorage.getItem("contenttypeid");
									areaCode1 = sessionStorage.getItem("areaCode");
									sigunguCode1 = sessionStorage.getItem("sigunguCode");
									cat1 = "A02";
									cat2 = "";
									cat3 = "";
								}else if(checkvalue == 8){
									sessionStorage.removeItem("contenttypeid");
									contenttypeid1 = sessionStorage.setItem("contenttypeid", 28);
									contenttypeid = sessionStorage.getItem("contenttypeid");
									areaCode1 = sessionStorage.getItem("areaCode");
									sigunguCode1 = sessionStorage.getItem("sigunguCode");
									cat1 = "A03";
									cat2 = "";
									cat3 = "";
								}
								console.log("condition : " + contenttypeid);
								console.log("condition : " + areaCode1);
								console.log("condition : " + sigunguCode1);
								console.log("condition : " + cat1);
								console.log("condition : " + cat2);
								console.log("condition : " + cat3);
								searchGameCondition(contenttypeid, areaCode1, sigunguCode1, cat1, cat2, cat3, pageNo);
								
							});
							
							
							
							/* $(".festivalSearchArea").hide();
							
							$("input[name=festivalgroup]").click(function(){
								if($("#festival").is(":checked") == true){
									$(".festivalSearchArea").show();
								}else{
									$(".festivalSearchArea").hide();
								}
							}); */
						});
						
						if(sessionStorage.getItem("areaCode") == 1){
							if(sessionStorage.getItem("contenttypeid") == 12){
								$(".tm-section-title1").text("서울 관광지");
							}else if(sessionStorage.getItem("contenttypeid") == 14){
								$(".tm-section-title1").text("서울 문화시설");
							}else if(sessionStorage.getItem("contenttypeid") == 15){
								$(".tm-section-title1").text("서울 축제공연행사");
							}else{
								$(".tm-section-title1").text("서울 레포츠");
							}
						}else if(sessionStorage.getItem("areaCode") == 2){
							if(sessionStorage.getItem("contenttypeid") == 12){
								$(".tm-section-title1").text("인천 관광지");
							}else if(sessionStorage.getItem("contenttypeid") == 14){
								$(".tm-section-title1").text("인천 문화시설");
							}else if(sessionStorage.getItem("contenttypeid") == 15){
								$(".tm-section-title1").text("인천 축제공연행사");
							}else{
								$(".tm-section-title1").text("인천 레포츠");
							}
						}else if(sessionStorage.getItem("areaCode") == 3){
							if(sessionStorage.getItem("contenttypeid") == 12){
								$(".tm-section-title1").text("대전 관광지");
							}else if(sessionStorage.getItem("contenttypeid") == 14){
								$(".tm-section-title1").text("대전 문화시설");
							}else if(sessionStorage.getItem("contenttypeid") == 15){
								$(".tm-section-title1").text("대전 축제공연행사");
							}else{
								$(".tm-section-title1").text("대전 레포츠");
							}
						}else if(sessionStorage.getItem("areaCode") == 4){
							if(sessionStorage.getItem("contenttypeid") == 12){
								$(".tm-section-title1").text("대구 관광지");
							}else if(sessionStorage.getItem("contenttypeid") == 14){
								$(".tm-section-title1").text("대구 문화시설");
							}else if(sessionStorage.getItem("contenttypeid") == 15){
								$(".tm-section-title1").text("대구 축제공연행사");
							}else{
								$(".tm-section-title1").text("대구 레포츠");
							}
						}else if(sessionStorage.getItem("areaCode") == 5){
							if(sessionStorage.getItem("contenttypeid") == 12){
								$(".tm-section-title1").text("광주 관광지");
							}else if(sessionStorage.getItem("contenttypeid") == 14){
								$(".tm-section-title1").text("광주 문화시설");
							}else if(sessionStorage.getItem("contenttypeid") == 15){
								$(".tm-section-title1").text("광주 축제공연행사");
							}else{
								$(".tm-section-title1").text("광주 레포츠");
							}
						}else if(sessionStorage.getItem("areaCode") == 6){
							if(sessionStorage.getItem("contenttypeid") == 12){
								$(".tm-section-title1").text("부산 관광지");
							}else if(sessionStorage.getItem("contenttypeid") == 14){
								$(".tm-section-title1").text("부산 문화시설");
							}else if(sessionStorage.getItem("contenttypeid") == 15){
								$(".tm-section-title1").text("부산 축제공연행사");
							}else{
								$(".tm-section-title1").text("부산 레포츠");
							}
						}else if(sessionStorage.getItem("areaCode") == 7){
							if(sessionStorage.getItem("contenttypeid") == 12){
								$(".tm-section-title1").text("울산 관광지");
							}else if(sessionStorage.getItem("contenttypeid") == 14){
								$(".tm-section-title1").text("울산 문화시설");
							}else if(sessionStorage.getItem("contenttypeid") == 15){
								$(".tm-section-title1").text("울산 축제공연행사");
							}else{
								$(".tm-section-title1").text("울산 레포츠");
							}
						}else if(sessionStorage.getItem("areaCode") == 8){
							if(sessionStorage.getItem("contenttypeid") == 12){
								$(".tm-section-title1").text("세종시 관광지");
							}else if(sessionStorage.getItem("contenttypeid") == 14){
								$(".tm-section-title1").text("세종시 문화시설");
							}else if(sessionStorage.getItem("contenttypeid") == 15){
								$(".tm-section-title1").text("세종시 축제공연행사");
							}else{
								$(".tm-section-title1").text("세종시 레포츠");
							}
						}else if(sessionStorage.getItem("areaCode") == 31){
							if(sessionStorage.getItem("contenttypeid") == 12){
								$(".tm-section-title1").text("경기도 관광지");
							}else if(sessionStorage.getItem("contenttypeid") == 14){
								$(".tm-section-title1").text("경기도 문화시설");
							}else if(sessionStorage.getItem("contenttypeid") == 15){
								$(".tm-section-title1").text("경기도 축제공연행사");
							}else{
								$(".tm-section-title1").text("경기도 레포츠");
							}
						}else if(sessionStorage.getItem("areaCode") == 32){
							if(sessionStorage.getItem("contenttypeid") == 12){
								$(".tm-section-title1").text("강원도 관광지");
							}else if(sessionStorage.getItem("contenttypeid") == 14){
								$(".tm-section-title1").text("강원도 문화시설");
							}else if(sessionStorage.getItem("contenttypeid") == 15){
								$(".tm-section-title1").text("강원도 축제공연행사");
							}else{
								$(".tm-section-title1").text("강원도 레포츠");
							}
						}else if(sessionStorage.getItem("areaCode") == 33){
							if(sessionStorage.getItem("contenttypeid") == 12){
								$(".tm-section-title1").text("충청북도 관광지");
							}else if(sessionStorage.getItem("contenttypeid") == 14){
								$(".tm-section-title1").text("충청북도 문화시설");
							}else if(sessionStorage.getItem("contenttypeid") == 15){
								$(".tm-section-title1").text("충청북도 축제공연행사");
							}else{
								$(".tm-section-title1").text("충청북도 레포츠");
							}
						}else if(sessionStorage.getItem("areaCode") == 34){
							if(sessionStorage.getItem("contenttypeid") == 12){
								$(".tm-section-title1").text("충청남도 관광지");
							}else if(sessionStorage.getItem("contenttypeid") == 14){
								$(".tm-section-title1").text("충청남도 문화시설");
							}else if(sessionStorage.getItem("contenttypeid") == 15){
								$(".tm-section-title1").text("충청남도 축제공연행사");
							}else{
								$(".tm-section-title1").text("충청남도 레포츠");
							}
						}else if(sessionStorage.getItem("areaCode") == 35){
							if(sessionStorage.getItem("contenttypeid") == 12){
								$(".tm-section-title1").text("경상북도 관광지");
							}else if(sessionStorage.getItem("contenttypeid") == 14){
								$(".tm-section-title1").text("경상북도 문화시설");
							}else if(sessionStorage.getItem("contenttypeid") == 15){
								$(".tm-section-title1").text("경상북도 축제공연행사");
							}else{
								$(".tm-section-title1").text("경상북도 레포츠");
							}
						}else if(sessionStorage.getItem("areaCode") == 36){
							if(sessionStorage.getItem("contenttypeid") == 12){
								$(".tm-section-title1").text("경상남도 관광지");
							}else if(sessionStorage.getItem("contenttypeid") == 14){
								$(".tm-section-title1").text("경상남도 문화시설");
							}else if(sessionStorage.getItem("contenttypeid") == 15){
								$(".tm-section-title1").text("경상남도 축제공연행사");
							}else{
								$(".tm-section-title1").text("경상남도 레포츠");
							}
						}else if(sessionStorage.getItem("areaCode") == 37){
							if(sessionStorage.getItem("contenttypeid") == 12){
								$(".tm-section-title1").text("전라북도 관광지");
							}else if(sessionStorage.getItem("contenttypeid") == 14){
								$(".tm-section-title1").text("전라북도 문화시설");
							}else if(sessionStorage.getItem("contenttypeid") == 15){
								$(".tm-section-title1").text("전라북도 축제공연행사");
							}else{
								$(".tm-section-title1").text("전라북도 레포츠");
							}
						}else if(sessionStorage.getItem("areaCode") == 38){
							if(sessionStorage.getItem("contenttypeid") == 12){
								$(".tm-section-title1").text("전라남도 관광지");
							}else if(sessionStorage.getItem("contenttypeid") == 14){
								$(".tm-section-title1").text("전라남도 문화시설");
							}else if(sessionStorage.getItem("contenttypeid") == 15){
								$(".tm-section-title1").text("전라남도 축제공연행사");
							}else{
								$(".tm-section-title1").text("전라남도 레포츠");
							}
						}else if(sessionStorage.getItem("areaCode") == 39){
							if(sessionStorage.getItem("contenttypeid") == 12){
								$(".tm-section-title1").text("제주도 관광지");
							}else if(sessionStorage.getItem("contenttypeid") == 14){
								$(".tm-section-title1").text("제주도 문화시설");
							}else if(sessionStorage.getItem("contenttypeid") == 15){
								$(".tm-section-title1").text("제주도 축제공연행사");
							}else{
								$(".tm-section-title1").text("제주도 레포츠");
							}
						}
					</script>
					
				</div>
				<div class="col-lg-9" align="right" id="viewArea">
					
				    <div class="tm-home-box-3" id="detailHover">
						<div class="tm-home-box-3-img-container" id="detailClick" onclick="location.href='${contextPath}/detailGame'">
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
					</div><div class="tm-home-box-3" id="detailHover">
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
					</div><div class="tm-home-box-3" id="detailHover">
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
					</div><div class="tm-home-box-3" id="detailHover">
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
		<div class="pagingBtnArea col-lg-12" align="center">
			<ul class="pagination">
			
			</ul>
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
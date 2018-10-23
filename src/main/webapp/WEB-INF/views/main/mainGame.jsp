<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Hello Korea</title>
<style>
	.img-responsive0{width:346px; height:346.98px;}
	.img-responsive1{width:250px; height:225px;}
	.img-responsive2{width:100%; height:auto;}
	.themeBtn{width:250px; height:60px; background-color:#00aef0; color:white;}
	#themeText{height:164px; overflow:hidden; padding:30px 30px 54px;}
	.mainSearchArea{font-size:15px; width:300px; height:60px; color:black; background-color:rgba(255, 255, 255, 0.6);
	                border:none;border-radius:5px;}
	.subSearchArea{font-size:15px; width:300px; height:60px; color:black; background-color:rgba(255, 255, 255, 0.6);
	               border:none;border-radius:5px;}
	.subSearchAreaa{font-size:15px; width:300px; height:60px; color:black; background-color:rgba(255, 255, 255, 0.6);
	               border:none;border-radius:5px;}
	#searchAreaBox{position:absolute; text-align:center; top:10%; z-index:3;}
	.areaSearchBtn{height:60px;}
	.themeAreaSelect{cursor:pointer; color:blue;}
	.themeAreaSelect:hover{color:#00aef0;}
	.tm-home-box-2-description .box-3{width:244px;}
	.tm-home-box-2-link{cursor:pointer;}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<!-- Banner -->
	<section class="tm-banner">
		<!-- Flexslider -->
		<div id="searchAreaBox" class="col-lg-12 col-md-12 col-sm-12">
			<select class="mainSearchArea" name="searchCondition">
						<option value="0">지역선택</option>
						<option value="1">서울</option>
						<option value="2">인천</option>
						<option value="3">대전</option>
						<option value="4">대구</option>
						<option value="5">광주</option>
						<option value="6">부산</option>
						<option value="7">울산</option>
						<option value="8">세종특별자치시</option>
						<option value="31">경기도</option>
						<option value="32">강원도</option>
						<option value="33">충청북도</option>
						<option value="34">충청남도</option>
						<option value="35">경상북도</option>
						<option value="36">경상남도</option>
						<option value="37">전라북도</option>
						<option value="38">전라남도</option>
						<option value="39">제주도</option>
					</select>
					<select class="subSearchArea" id="sigungu1">
			  			<option value="0">시군구 선택</option>
			  			<option value="1">강남구</option>
			  			<option value="2">강동구</option>
			  			<option value="3">강북구</option>
			  			<option value="4">강서구</option>
			  			<option value="5">관악구</option>
			  			<option value="6">광진구</option>
			  			<option value="7">구로구</option>
			  			<option value="8">금천구</option>
			  			<option value="9">노원구</option>
			  			<option value="10">도봉구</option>
			  			<option value="11">동대문구</option>
			  			<option value="12">동작구</option>
			  			<option value="13">마포구</option>
			  			<option value="14">서대문구</option>
			  			<option value="15">서초구</option>
			  			<option value="16">성동구</option>
			  			<option value="17">성북구</option>
			  			<option value="18">송파구</option>
			  			<option value="19">양천구</option>
			  			<option value="20">영등포구</option>
			  			<option value="21">용산구</option>
			  			<option value="22">은평구</option>
			  			<option value="23">종로구</option>
			  			<option value="24">중구</option>
			  			<option value="25">중랑구</option>
			  		</select>
			  		<select class="subSearchArea" id="sigungu2">
			  			<option value="0">시군구 선택</option>
			  			<option value="1">강화군</option>
			  			<option value="2">계양구</option>
			  			<option value="3">남구</option>
			  			<option value="4">남동구</option>
			  			<option value="5">동구</option>
			  			<option value="6">부평구</option>
			  			<option value="7">서구</option>
			  			<option value="8">연수구</option>
			  			<option value="9">옹진군</option>
			  			<option value="10">중구</option>
			  		</select>
			  		<select class="subSearchArea" id="sigungu3">
			  			<option value="0">시군구 선택</option>
			  			<option value="1">대덕구</option>
			  			<option value="2">동구</option>
			  			<option value="3">서구</option>
			  			<option value="4">유성구</option>
			  			<option value="5">중구</option>
			  		</select>
			  		<select class="subSearchArea" id="sigungu4">
			  			<option value="0">시군구 선택</option>
			  			<option value="1">남구</option>
			  			<option value="2">달서구</option>
			  			<option value="3">달성군</option>
			  			<option value="4">동구</option>
			  			<option value="5">북구</option>
			  			<option value="6">서구</option>
			  			<option value="7">수성구</option>
			  			<option value="8">중구</option>
			  		</select>
			  		<select class="subSearchArea" id="sigungu5">
			  			<option value="0">시군구 선택</option>
			  			<option value="1">광산구</option>
			  			<option value="2">남구</option>
			  			<option value="3">동군</option>
			  			<option value="4">북구</option>
			  			<option value="5">서구</option>
			  		</select>
			  		<select class="subSearchArea" id="sigungu6">
			  			<option value="0">시군구 선택</option>
			  			<option value="1">강서구</option>
			  			<option value="2">금정구</option>
			  			<option value="3">기장군</option>
			  			<option value="4">남구</option>
			  			<option value="5">동구</option>
			  			<option value="6">동래구</option>
			  			<option value="7">부산진구</option>
			  			<option value="8">북구</option>
			  			<option value="9">사상구</option>
			  			<option value="10">사하구</option>
			  			<option value="11">서구</option>
			  			<option value="12">수영구</option>
			  			<option value="13">연제구</option>
			  			<option value="14">영도구</option>
			  			<option value="15">중구</option>
			  			<option value="16">해운대구</option>
			  		</select>
			  		<select class="subSearchArea" id="sigungu7">
			  			<option value="0">시군구 선택</option>
			  			<option value="1">중구</option>
			  			<option value="2">남구</option>
			  			<option value="3">동군</option>
			  			<option value="4">북구</option>
			  			<option value="5">울주군</option>
			  		</select>
			  		<select class="subSearchArea" id="sigungu8">
			  			<option value="0">시군구 선택</option>
			  			<option value="1">세종특별자치시</option>
			  		</select>
			  		<select class="subSearchArea" id="sigungu9">
			  			<option value="0">시군구 선택</option>
			  			<option value="1">가평군</option>
			  			<option value="2">고양시</option>
			  			<option value="3">과천시</option>
			  			<option value="4">광명시</option>
			  			<option value="5">광주시</option>
			  			<option value="6">구리시</option>
			  			<option value="7">군포시</option>
			  			<option value="8">김포시</option>
			  			<option value="9">남양주시</option>
			  			<option value="10">동두천시</option>
			  			<option value="11">부천시</option>
			  			<option value="12">성남시</option>
			  			<option value="13">수원시</option>
			  			<option value="14">시흥시</option>
			  			<option value="15">안산시</option>
			  			<option value="16">안성시</option>
			  			<option value="17">안양시</option>
			  			<option value="18">양주시</option>
			  			<option value="19">양평군</option>
			  			<option value="20">여주시</option>
			  			<option value="21">연천군</option>
			  			<option value="22">오산시</option>
			  			<option value="23">용인시</option>
			  			<option value="24">의왕시</option>
			  			<option value="25">의정부시</option>
			  			<option value="26">이천시</option>
			  			<option value="27">파주시</option>
			  			<option value="28">평택시</option>
			  			<option value="29">포천시</option>
			  			<option value="30">하남시</option>
			  			<option value="31">화성시</option>
			  		</select>
			  		<select class="subSearchArea" id="sigungu10">
			  			<option value="0">시군구 선택</option>
			  			<option value="1">강릉시</option>
			  			<option value="2">고성군</option>
			  			<option value="3">동해시</option>
			  			<option value="4">삼척시</option>
			  			<option value="5">속초시</option>
			  			<option value="6">양구군</option>
			  			<option value="7">양양군</option>
			  			<option value="8">영월군</option>
			  			<option value="9">원주시</option>
			  			<option value="10">인제군</option>
			  			<option value="11">정선군</option>
			  			<option value="12">철원군</option>
			  			<option value="13">춘천시</option>
			  			<option value="14">태백시</option>
			  			<option value="15">평창군</option>
			  			<option value="16">홍천군</option>
			  			<option value="17">화천군</option>
			  			<option value="18">횡성군</option>
			  		</select>
			  		<select class="subSearchArea" id="sigungu11">
			  			<option value="0">시군구 선택</option>
			  			<option value="1">괴산군</option>
			  			<option value="2">단양군</option>
			  			<option value="3">보은군</option>
			  			<option value="4">영동군</option>
			  			<option value="5">옥천군</option>
			  			<option value="6">음성군</option>
			  			<option value="7">제천시</option>
			  			<option value="8">진천군</option>
			  			<option value="9">청원군</option>
			  			<option value="10">청주시</option>
			  			<option value="11">충주시</option>
			  			<option value="12">증평군</option>
			  		</select>
			  		<select class="subSearchArea" id="sigungu12">
			  			<option value="0">시군구 선택</option>
			  			<option value="1">공주시</option>
			  			<option value="2">금산군</option>
			  			<option value="3">논산시</option>
			  			<option value="4">당진시</option>
			  			<option value="5">보령시</option>
			  			<option value="6">부여군</option>
			  			<option value="7">서산시</option>
			  			<option value="8">서천군</option>
			  			<option value="9">아산시</option>
			  			<option value="10">예산군</option>
			  			<option value="11">천안시</option>
			  			<option value="12">청양군</option>
			  			<option value="13">태안군</option>
			  			<option value="14">홍성군</option>
			  			<option value="15">계룡시</option>
			  		</select>
			  		<select class="subSearchArea" id="sigungu13">
			  			<option value="0">시군구 선택</option>
			  			<option value="1">경산시</option>
			  			<option value="2">경주시</option>
			  			<option value="3">고령군</option>
			  			<option value="4">구미시</option>
			  			<option value="5">군위군</option>
			  			<option value="6">김천시</option>
			  			<option value="7">문경시</option>
			  			<option value="8">봉화군</option>
			  			<option value="9">상주시</option>
			  			<option value="10">성주군</option>
			  			<option value="11">안동시</option>
			  			<option value="12">영덕군</option>
			  			<option value="13">영양군</option>
			  			<option value="14">영주시</option>
			  			<option value="15">영천시</option>
			  			<option value="16">예천군</option>
			  			<option value="17">울릉군</option>
			  			<option value="18">울진군</option>
			  			<option value="19">의성군</option>
			  			<option value="20">청도군</option>
			  			<option value="21">청송군</option>
			  			<option value="22">칠곡군</option>
			  			<option value="23">포항시</option>
			  		</select>
			  		<select class="subSearchArea" id="sigungu14">
			  			<option value="0">시군구 선택</option>
			  			<option value="1">거제시</option>
			  			<option value="2">고창군</option>
			  			<option value="3">김해시</option>
			  			<option value="4">남해군</option>
			  			<option value="5">마산시</option>
			  			<option value="6">밀양시</option>
			  			<option value="7">사천시</option>
			  			<option value="8">산청군</option>
			  			<option value="9">양산시</option>
			  			<option value="10">의령군</option>
			  			<option value="11">진주시</option>
			  			<option value="12">진해시</option>
			  			<option value="13">창녕군</option>
			  			<option value="14">창원시</option>
			  			<option value="15">통영시</option>
			  			<option value="16">하동군</option>
			  			<option value="17">함안군</option>
			  			<option value="18">함양군</option>
			  			<option value="19">합천군</option>
			  		</select>
			  		<select class="subSearchArea" id="sigungu15">
			  			<option value="0">시군구 선택</option>
			  			<option value="1">고창군</option>
			  			<option value="2">군산시</option>
			  			<option value="3">김제시</option>
			  			<option value="4">남원시</option>
			  			<option value="5">무주군</option>
			  			<option value="6">부안군</option>
			  			<option value="7">순창군</option>
			  			<option value="8">완주군</option>
			  			<option value="9">익산시</option>
			  			<option value="10">임실군</option>
			  			<option value="11">장수군</option>
			  			<option value="12">전주시</option>
			  			<option value="13">정읍시</option>
			  			<option value="14">진안군</option>
			  		</select>
			  		<select class="subSearchArea" id="sigungu16">
			  			<option value="0">시군구 선택</option>
			  			<option value="1">강진군</option>
			  			<option value="2">고흥군</option>
			  			<option value="3">곡성군</option>
			  			<option value="4">광양시</option>
			  			<option value="5">구례군</option>
			  			<option value="6">나주시</option>
			  			<option value="7">담양군</option>
			  			<option value="8">목포시</option>
			  			<option value="9">무안군</option>
			  			<option value="10">보성군</option>
			  			<option value="11">순천시</option>
			  			<option value="12">신안군</option>
			  			<option value="13">여수시</option>
			  			<option value="14">영광군</option>
			  			<option value="15">영암군</option>
			  			<option value="16">완도군</option>
			  			<option value="17">장성군</option>
			  			<option value="18">장흥군</option>
			  			<option value="19">진도군</option>
			  			<option value="20">함평군</option>
			  			<option value="21">해남군</option>
			  			<option value="22">화순군</option>
			  		</select>
			  		<select class="subSearchArea" id="sigungu17">
			  			<option value="0">시군구 선택</option>
			  			<option value="1">남제주군</option>
			  			<option value="2">북제주군</option>
			  			<option value="3">서귀포시</option>
			  			<option value="4">제주시</option>
			  		</select>
			  		<select class="subSearchAreaa">
			  			<option value="0">분류</option>
			  			<option value="12">관광지</option>
			  			<option value="14">문화시설</option>
			  			<option value="15">축제공연행사</option>
			  			<option value="28">레포츠</option>
			  		</select>
					<input type="button" class="tm-banner-link areaSearchBtn" value="검색" style="border-radius:5px;width:150px;">
		</div>
		
		<div class="flexslider flexslider-banner">
		  <ul class="slides">
		    <li>
			    <div class="tm-banner-inner">
					<h1 class="tm-banner-title"><span class="tm-yellow-text"></span></h1>
					<p class="tm-banner-subtitle"></p>
					
				</div>
		      <img src="${ contextPath }/resources/img/jeju-beach2.png" alt="Image" />
		    </li>
		    <li>
			    <div class="tm-banner-inner">
					<h1 class="tm-banner-title"><span class="tm-yellow-text"></span></h1>
					<p class="tm-banner-subtitle"></p>
				</div>
		      <img src="${ contextPath }/resources/img/anapji2.png" alt="Image" />
		    </li>
		  </ul>
		</div>
		
	</section>
	<script>
	
		var areaCode;
		var areaCode1;
		var areaCode2;
		var sigunguCode;
		var sigunguCode1;
		var sigunguCode2;
		var contenttypeid;
		var contenttypeid1;
		var contenttypeid2;
		var pageNo1 = sessionStorage.setItem("pageNo", 1);
		var pageNo = sessionStorage.getItem("pageNo");
	
		$(function(){
			
			$(".areaSearchBtn").click(function(){
				areaCode1 = $(".mainSearchArea").val();
				areaCode2 = sessionStorage.setItem("areaCode", areaCode1);
				areaCode = sessionStorage.getItem("areaCode");
				contenttypeid1 = $(".subSearchAreaa").val();
				contenttypeid2 = sessionStorage.setItem("contenttypeid", contenttypeid1);
				contenttypeid = sessionStorage.getItem("contenttypeid");
				console.log("mainSearchAreaValue : " + areaCode);
				console.log("mainSearchAreaValue : " + contenttypeid);
				
				if(areaCode == 0){
					alert("지역을 선택해 주세요.");
				}else if(areaCode == 1){
					sigunguCode1 = $("#sigungu1").val();
					sigunguCode2 = sessionStorage.setItem("sigunguCode", sigunguCode1);
					sigunguCode = sessionStorage.getItem("sigunguCode");
					if(sigunguCode == 0){
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}else{
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}
				}else if(areaCode == 2){
					sigunguCode1 = $("#sigungu2").val();
					sigunguCode2 = sessionStorage.setItem("sigunguCode", sigunguCode1);
					sigunguCode = sessionStorage.getItem("sigunguCode");
					if(sigunguCode == 0){
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}else{
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}
				}else if(areaCode == 3){
					sigunguCode1 = $("#sigungu3").val();
					sigunguCode2 = sessionStorage.setItem("sigunguCode", sigunguCode1);
					sigunguCode = sessionStorage.getItem("sigunguCode");
					if(sigunguCode == 0){
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}else{
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}
				}else if(areaCode == 4){
					sigunguCode1 = $("#sigungu4").val();
					sigunguCode2 = sessionStorage.setItem("sigunguCode", sigunguCode1);
					sigunguCode = sessionStorage.getItem("sigunguCode");
					if(sigunguCode == 0){
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}else{
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}
				}else if(areaCode == 5){
					sigunguCode1 = $("#sigungu5").val();
					sigunguCode2 = sessionStorage.setItem("sigunguCode", sigunguCode1);
					sigunguCode = sessionStorage.getItem("sigunguCode");
					if(sigunguCode == 0){
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}else{
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}
				}else if(areaCode == 6){
					sigunguCode1 = $("#sigungu6").val();
					sigunguCode2 = sessionStorage.setItem("sigunguCode", sigunguCode1);
					sigunguCode = sessionStorage.getItem("sigunguCode");
					if(sigunguCode == 0){
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}else{
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}
				}else if(areaCode == 7){
					sigunguCode1 = $("#sigungu7").val();
					sigunguCode2 = sessionStorage.setItem("sigunguCode", sigunguCode1);
					sigunguCode = sessionStorage.getItem("sigunguCode");
					if(sigunguCode == 0){
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}else{
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}
				}else if(areaCode == 8){
					sigunguCode1 = $("#sigungu8").val();
					sigunguCode2 = sessionStorage.setItem("sigunguCode", sigunguCode1);
					sigunguCode = sessionStorage.getItem("sigunguCode");
					if(sigunguCode == 0){
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}else{
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}
				}else if(areaCode == 31){
					sigunguCode1 = $("#sigungu9").val();
					sigunguCode2 = sessionStorage.setItem("sigunguCode", sigunguCode1);
					sigunguCode = sessionStorage.getItem("sigunguCode");
					if(sigunguCode == 0){
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}else{
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}
				}else if(areaCode == 32){
					sigunguCode1 = $("#sigungu10").val();
					sigunguCode2 = sessionStorage.setItem("sigunguCode", sigunguCode1);
					sigunguCode = sessionStorage.getItem("sigunguCode");
					if(sigunguCode == 0){
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}else{
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}
				}else if(areaCode == 33){
					sigunguCode1 = $("#sigungu11").val();
					sigunguCode2 = sessionStorage.setItem("sigunguCode", sigunguCode1);
					sigunguCode = sessionStorage.getItem("sigunguCode");
					if(sigunguCode == 0){
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}else{
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}
				}else if(areaCode == 34){
					sigunguCode1 = $("#sigungu12").val();
					sigunguCode2 = sessionStorage.setItem("sigunguCode", sigunguCode1);
					sigunguCode = sessionStorage.getItem("sigunguCode");
					if(sigunguCode == 0){
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}else{
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}
				}else if(areaCode == 35){
					sigunguCode1 = $("#sigungu13").val();
					sigunguCode2 = sessionStorage.setItem("sigunguCode", sigunguCode1);
					sigunguCode = sessionStorage.getItem("sigunguCode");
					if(sigunguCode == 0){
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}else{
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}
				}else if(areaCode == 36){
					sigunguCode = $("#sigungu14").val();
					if(sigunguCode == 0){
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}else{
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}
				}else if(areaCode == 37){
					sigunguCode1 = $("#sigungu15").val();
					sigunguCode2 = sessionStorage.setItem("sigunguCode", sigunguCode1);
					sigunguCode = sessionStorage.getItem("sigunguCode");
					if(sigunguCode == 0){
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}else{
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}
				}else if(areaCode == 38){
					sigunguCode1 = $("#sigungu16").val();
					sigunguCode2 = sessionStorage.setItem("sigunguCode", sigunguCode1);
					sigunguCode = sessionStorage.getItem("sigunguCode");
					if(sigunguCode == 0){
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}else{
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}
				}else if(areaCode == 39){
					sigunguCode1 = $("#sigungu17").val();
					sigunguCode2 = sessionStorage.setItem("sigunguCode", sigunguCode1);
					sigunguCode = sessionStorage.getItem("sigunguCode");
					if(sigunguCode == 0){
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}else{
						location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
					}
				}
			});
			
			$("#sigungu1").hide();
			$("#sigungu2").hide();
			$("#sigungu3").hide();
			$("#sigungu4").hide();
			$("#sigungu5").hide();
			$("#sigungu6").hide();
			$("#sigungu7").hide();
			$("#sigungu8").hide();
			$("#sigungu9").hide();
			$("#sigungu10").hide();
			$("#sigungu11").hide();
			$("#sigungu12").hide();
			$("#sigungu13").hide();
			$("#sigungu14").hide();
			$("#sigungu15").hide();
			$("#sigungu16").hide();
			$("#sigungu17").hide();
			
			$(".mainSearchArea").on("click", function(){
				areaCode = $(".mainSearchArea").val();
				console.log("mainSearchAreaCode : " + areaCode);
				
				if(areaCode == 1){
					$("#sigungu1").show();
					$("#sigungu2").hide();
					$("#sigungu3").hide();
					$("#sigungu4").hide();
					$("#sigungu5").hide();
					$("#sigungu6").hide();
					$("#sigungu7").hide();
					$("#sigungu8").hide();
					$("#sigungu9").hide();
					$("#sigungu10").hide();
					$("#sigungu11").hide();
					$("#sigungu12").hide();
					$("#sigungu13").hide();
					$("#sigungu14").hide();
					$("#sigungu15").hide();
					$("#sigungu16").hide();
					$("#sigungu17").hide();
					
					$("#sigungu1").click(function(){
						sigunguCode = $("#sigungu1").val();
					});
				}else if(areaCode == 2){
					$("#sigungu1").hide();
					$("#sigungu2").show();
					$("#sigungu3").hide();
					$("#sigungu4").hide();
					$("#sigungu5").hide();
					$("#sigungu6").hide();
					$("#sigungu7").hide();
					$("#sigungu8").hide();
					$("#sigungu9").hide();
					$("#sigungu10").hide();
					$("#sigungu11").hide();
					$("#sigungu12").hide();
					$("#sigungu13").hide();
					$("#sigungu14").hide();
					$("#sigungu15").hide();
					$("#sigungu16").hide();
					$("#sigungu17").hide();
					
					$("#sigungu2").click(function(){
						sigunguCode = $("#sigungu2").val();
					});
				}else if(areaCode == 3){
					$("#sigungu1").hide();
					$("#sigungu2").hide();
					$("#sigungu3").show();
					$("#sigungu4").hide();
					$("#sigungu5").hide();
					$("#sigungu6").hide();
					$("#sigungu7").hide();
					$("#sigungu8").hide();
					$("#sigungu9").hide();
					$("#sigungu10").hide();
					$("#sigungu11").hide();
					$("#sigungu12").hide();
					$("#sigungu13").hide();
					$("#sigungu14").hide();
					$("#sigungu15").hide();
					$("#sigungu16").hide();
					$("#sigungu17").hide();
					
					$("#sigungu3").click(function(){
						sigunguCode = $("#sigungu3").val();
					});
				}else if(areaCode == 4){
					$("#sigungu1").hide();
					$("#sigungu2").hide();
					$("#sigungu3").hide();
					$("#sigungu4").show();
					$("#sigungu5").hide();
					$("#sigungu6").hide();
					$("#sigungu7").hide();
					$("#sigungu8").hide();
					$("#sigungu9").hide();
					$("#sigungu10").hide();
					$("#sigungu11").hide();
					$("#sigungu12").hide();
					$("#sigungu13").hide();
					$("#sigungu14").hide();
					$("#sigungu15").hide();
					$("#sigungu16").hide();
					$("#sigungu17").hide();
					
					$("#sigungu4").click(function(){
						sigunguCode = $("#sigungu4").val();
					});
				}else if(areaCode == 5){
					$("#sigungu1").hide();
					$("#sigungu2").hide();
					$("#sigungu3").hide();
					$("#sigungu4").hide();
					$("#sigungu5").show();
					$("#sigungu6").hide();
					$("#sigungu7").hide();
					$("#sigungu8").hide();
					$("#sigungu9").hide();
					$("#sigungu10").hide();
					$("#sigungu11").hide();
					$("#sigungu12").hide();
					$("#sigungu13").hide();
					$("#sigungu14").hide();
					$("#sigungu15").hide();
					$("#sigungu16").hide();
					$("#sigungu17").hide();
					
					$("#sigungu5").click(function(){
						sigunguCode = $("#sigungu5").val();
					});
				}else if(areaCode == 6){
					$("#sigungu1").hide();
					$("#sigungu2").hide();
					$("#sigungu3").hide();
					$("#sigungu4").hide();
					$("#sigungu5").hide();
					$("#sigungu6").show();
					$("#sigungu7").hide();
					$("#sigungu8").hide();
					$("#sigungu9").hide();
					$("#sigungu10").hide();
					$("#sigungu11").hide();
					$("#sigungu12").hide();
					$("#sigungu13").hide();
					$("#sigungu14").hide();
					$("#sigungu15").hide();
					$("#sigungu16").hide();
					$("#sigungu17").hide();
					
					$("#sigungu6").click(function(){
						sigunguCode = $("#sigungu6").val();
					});
				}else if(areaCode == 7){
					$("#sigungu1").hide();
					$("#sigungu2").hide();
					$("#sigungu3").hide();
					$("#sigungu4").hide();
					$("#sigungu5").hide();
					$("#sigungu6").hide();
					$("#sigungu7").show();
					$("#sigungu8").hide();
					$("#sigungu9").hide();
					$("#sigungu10").hide();
					$("#sigungu11").hide();
					$("#sigungu12").hide();
					$("#sigungu13").hide();
					$("#sigungu14").hide();
					$("#sigungu15").hide();
					$("#sigungu16").hide();
					$("#sigungu17").hide();
					
					$("#sigungu7").click(function(){
						sigunguCode = $("#sigungu7").val();
					});
				}else if(areaCode == 8){
					$("#sigungu1").hide();
					$("#sigungu2").hide();
					$("#sigungu3").hide();
					$("#sigungu4").hide();
					$("#sigungu5").hide();
					$("#sigungu6").hide();
					$("#sigungu7").hide();
					$("#sigungu8").show();
					$("#sigungu9").hide();
					$("#sigungu10").hide();
					$("#sigungu11").hide();
					$("#sigungu12").hide();
					$("#sigungu13").hide();
					$("#sigungu14").hide();
					$("#sigungu15").hide();
					$("#sigungu16").hide();
					$("#sigungu17").hide();
					
					$("#sigungu8").click(function(){
						sigunguCode = $("#sigungu8").val();
					});
				}else if(areaCode == 31){
					$("#sigungu1").hide();
					$("#sigungu2").hide();
					$("#sigungu3").hide();
					$("#sigungu4").hide();
					$("#sigungu5").hide();
					$("#sigungu6").hide();
					$("#sigungu7").hide();
					$("#sigungu8").hide();
					$("#sigungu9").show();
					$("#sigungu10").hide();
					$("#sigungu11").hide();
					$("#sigungu12").hide();
					$("#sigungu13").hide();
					$("#sigungu14").hide();
					$("#sigungu15").hide();
					$("#sigungu16").hide();
					$("#sigungu17").hide();
					
					$("#sigungu9").click(function(){
						sigunguCode = $("#sigungu9").val();
					});
				}else if(areaCode == 32){
					$("#sigungu1").hide();
					$("#sigungu2").hide();
					$("#sigungu3").hide();
					$("#sigungu4").hide();
					$("#sigungu5").hide();
					$("#sigungu6").hide();
					$("#sigungu7").hide();
					$("#sigungu8").hide();
					$("#sigungu9").hide();
					$("#sigungu10").show();
					$("#sigungu11").hide();
					$("#sigungu12").hide();
					$("#sigungu13").hide();
					$("#sigungu14").hide();
					$("#sigungu15").hide();
					$("#sigungu16").hide();
					$("#sigungu17").hide();
					
					$("#sigungu10").click(function(){
						sigunguCode = $("#sigungu10").val();
					});
				}else if(areaCode == 33){
					$("#sigungu1").hide();
					$("#sigungu2").hide();
					$("#sigungu3").hide();
					$("#sigungu4").hide();
					$("#sigungu5").hide();
					$("#sigungu6").hide();
					$("#sigungu7").hide();
					$("#sigungu8").hide();
					$("#sigungu9").hide();
					$("#sigungu10").hide();
					$("#sigungu11").show();
					$("#sigungu12").hide();
					$("#sigungu13").hide();
					$("#sigungu14").hide();
					$("#sigungu15").hide();
					$("#sigungu16").hide();
					$("#sigungu17").hide();
					
					$("#sigungu11").click(function(){
						sigunguCode = $("#sigungu11").val();
					});
				}else if(areaCode == 34){
					$("#sigungu1").hide();
					$("#sigungu2").hide();
					$("#sigungu3").hide();
					$("#sigungu4").hide();
					$("#sigungu5").hide();
					$("#sigungu6").hide();
					$("#sigungu7").hide();
					$("#sigungu8").hide();
					$("#sigungu9").hide();
					$("#sigungu10").hide();
					$("#sigungu11").hide();
					$("#sigungu12").show();
					$("#sigungu13").hide();
					$("#sigungu14").hide();
					$("#sigungu15").hide();
					$("#sigungu16").hide();
					$("#sigungu17").hide();
					
					$("#sigungu12").click(function(){
						sigunguCode = $("#sigungu12").val();
					});
				}else if(areaCode == 35){
					$("#sigungu1").hide();
					$("#sigungu2").hide();
					$("#sigungu3").hide();
					$("#sigungu4").hide();
					$("#sigungu5").hide();
					$("#sigungu6").hide();
					$("#sigungu7").hide();
					$("#sigungu8").hide();
					$("#sigungu9").hide();
					$("#sigungu10").hide();
					$("#sigungu11").hide();
					$("#sigungu12").hide();
					$("#sigungu13").show();
					$("#sigungu14").hide();
					$("#sigungu15").hide();
					$("#sigungu16").hide();
					$("#sigungu17").hide();
					
					$("#sigungu13").click(function(){
						sigunguCode = $("#sigungu13").val();
					});
				}else if(areaCode == 36){
					$("#sigungu1").hide();
					$("#sigungu2").hide();
					$("#sigungu3").hide();
					$("#sigungu4").hide();
					$("#sigungu5").hide();
					$("#sigungu6").hide();
					$("#sigungu7").hide();
					$("#sigungu8").hide();
					$("#sigungu9").hide();
					$("#sigungu10").hide();
					$("#sigungu11").hide();
					$("#sigungu12").hide();
					$("#sigungu13").hide();
					$("#sigungu14").show();
					$("#sigungu15").hide();
					$("#sigungu16").hide();
					$("#sigungu17").hide();
					
					$("#sigungu14").click(function(){
						sigunguCode = $("#sigungu14").val();
					});
				}else if(areaCode == 37){
					$("#sigungu1").hide();
					$("#sigungu2").hide();
					$("#sigungu3").hide();
					$("#sigungu4").hide();
					$("#sigungu5").hide();
					$("#sigungu6").hide();
					$("#sigungu7").hide();
					$("#sigungu8").hide();
					$("#sigungu9").hide();
					$("#sigungu10").hide();
					$("#sigungu11").hide();
					$("#sigungu12").hide();
					$("#sigungu13").hide();
					$("#sigungu14").hide();
					$("#sigungu15").show();
					$("#sigungu16").hide();
					$("#sigungu17").hide();
					
					$("#sigungu15").click(function(){
						sigunguCode = $("#sigungu15").val();
					});
				}else if(areaCode == 38){
					$("#sigungu1").hide();
					$("#sigungu2").hide();
					$("#sigungu3").hide();
					$("#sigungu4").hide();
					$("#sigungu5").hide();
					$("#sigungu6").hide();
					$("#sigungu7").hide();
					$("#sigungu8").hide();
					$("#sigungu9").hide();
					$("#sigungu10").hide();
					$("#sigungu11").hide();
					$("#sigungu12").hide();
					$("#sigungu13").hide();
					$("#sigungu14").hide();
					$("#sigungu15").hide();
					$("#sigungu16").show();
					$("#sigungu17").hide();
					
					$("#sigungu16").click(function(){
						sigunguCode = $("#sigungu16").val();
					});
				}else if(areaCode == 39){
					$("#sigungu1").hide();
					$("#sigungu2").hide();
					$("#sigungu3").hide();
					$("#sigungu4").hide();
					$("#sigungu5").hide();
					$("#sigungu6").hide();
					$("#sigungu7").hide();
					$("#sigungu8").hide();
					$("#sigungu9").hide();
					$("#sigungu10").hide();
					$("#sigungu11").hide();
					$("#sigungu12").hide();
					$("#sigungu13").hide();
					$("#sigungu14").hide();
					$("#sigungu15").hide();
					$("#sigungu16").hide();
					$("#sigungu17").show();
					
					$("#sigungu17").click(function(){
						sigunguCode = $("#sigungu17").val();
					});
				}
				
			});
				shoppingTheme();
			
			
		});
		
		function shoppingTheme(){
		$.ajax({
			url:"mainThemeShopping.tm",
			type:"GET",
			dataType:"json",
			success:function(data){
				console.log(data);
				var themeData = data.response.body.items.item;
				var containerArea = $("#subContainer1");
				containerArea.html("");
				var output = "";
				output += "<div class='tm-home-box-3-img-container'>";
				output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
				output += "</div>";
				output += "<div class='tm-home-box-3-info'>";
				if(themeData.overview.length > 1){
					var overviewText = "";
					overviewText = themeData.overview.substring(0, 110) + "...";
					output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
				}
				output += "<div class='tm-home-box-2-container'>";
				output += "<a onclick='btnGood("+themeData.contenttypeid+","+themeData.contentid+");' class='tm-home-box-2-link goodBtn'><i class='fa fa-heart-o tm-home-box-2-icon border-right'></i></a>";
				output += "<a onclick='detailView("+themeData.contentid+","+themeData.contenttypeid+","+themeData.mapy+","+themeData.mapx+");' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
				output += "</div></div>";
				containerArea.html(output);
			},
			error:function(data){
				console.log("fail..");
				console.log(data);
			}
		});
		$.ajax({
			url:"mainThemeShopping2.tm",
			type:"GET",
			dataType:"json",
			success:function(data){
				console.log(data);
				var themeData = data.response.body.items.item;
				var containerArea = $("#subContainer2");
				containerArea.html("");
				var output = "";
				output += "<div class='tm-home-box-3-img-container'>";
				output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
				output += "</div>";
				output += "<div class='tm-home-box-3-info'>";
				if(themeData.overview.length > 1){
					var overviewText = "";
					overviewText = themeData.overview.substring(0, 110) + "...";
					output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
				}
				output += "<div class='tm-home-box-2-container'>";
				output += "<a onclick='btnGood("+themeData.contenttypeid+","+themeData.contentid+");' class='tm-home-box-2-link goodBtn'><i class='fa fa-heart-o tm-home-box-2-icon border-right'></i></a>";
				output += "<a onclick='detailView("+themeData.contentid+","+themeData.contenttypeid+","+themeData.mapy+","+themeData.mapx+");' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
				output += "</div></div>";
				containerArea.html(output);
			},
			error:function(data){
				console.log(data);
			}
		});
		$.ajax({
			url:"mainThemeShopping3.tm",
			type:"GET",
			dataType:"json",
			success:function(data){
				console.log(data);
				var themeData = data.response.body.items.item;
				var containerArea = $("#subContainer3");
				containerArea.html("");
				var output = "";
				output += "<div class='tm-home-box-3-img-container'>";
				output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
				output += "</div>";
				output += "<div class='tm-home-box-3-info'>";
				if(themeData.overview.length > 1){
					var overviewText = "";
					overviewText = themeData.overview.substring(0, 110) + "...";
					output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
				}
				output += "<div class='tm-home-box-2-container'>";
				output += "<a onclick='btnGood("+themeData.contenttypeid+","+themeData.contentid+");' class='tm-home-box-2-link goodBtn'><i class='fa fa-heart-o tm-home-box-2-icon border-right'></i></a>";
				output += "<a onclick='detailView("+themeData.contentid+","+themeData.contenttypeid+","+themeData.mapy+","+themeData.mapx+");' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
				output += "</div></div>";
				containerArea.html(output);
			},
			error:function(data){
				console.log(data);
			}
		});
		$.ajax({
			url:"mainThemeShopping4.tm",
			type:"GET",
			dataType:"json",
			success:function(data){
				console.log(data);
				var themeData = data.response.body.items.item;
				var containerArea = $("#subContainer4");
				containerArea.html("");
				var output = "";
				output += "<div class='tm-home-box-3-img-container'>";
				output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
				output += "</div>";
				output += "<div class='tm-home-box-3-info'>";
				if(themeData.overview.length > 1){
					var overviewText = "";
					overviewText = themeData.overview.substring(0, 110) + "...";
					output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
				}
				output += "<div class='tm-home-box-2-container'>";
				output += "<a onclick='btnGood("+themeData.contenttypeid+","+themeData.contentid+");' class='tm-home-box-2-link goodBtn'><i class='fa fa-heart-o tm-home-box-2-icon border-right'></i></a>";
				output += "<a onclick='detailView("+themeData.contentid+","+themeData.contenttypeid+","+themeData.mapy+","+themeData.mapx+");' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
				output += "</div></div>";
				containerArea.html(output);
			},
			error:function(data){
				console.log(data);
			}
		});
	}
	
	function beautyTheme(){
		$.ajax({
			url:"mainThemeBeauty.tm",
			type:"GET",
			dataType:"json",
			success:function(data){
				console.log(data);
				var themeData = data.response.body.items.item;
				var containerArea = $("#subContainer1");
				containerArea.html("");
				var output = "";
				output += "<div class='tm-home-box-3-img-container'>";
				output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
				output += "</div>";
				output += "<div class='tm-home-box-3-info'>";
				if(themeData.overview.length > 1){
					var overviewText = "";
					overviewText = themeData.overview.substring(0, 110) + "...";
					output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
				}
				output += "<div class='tm-home-box-2-container'>";
				output += "<a onclick='btnGood("+themeData.contenttypeid+","+themeData.contentid+");' class='tm-home-box-2-link goodBtn'><i class='fa fa-heart-o tm-home-box-2-icon border-right'></i></a>";
				output += "<a onclick='detailView("+themeData.contentid+","+themeData.contenttypeid+","+themeData.mapy+","+themeData.mapx+");' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
				output += "</div></div>";
				containerArea.html(output);
			},
			error:function(data){
				console.log("fail..");
				console.log(data);
			}
		});
		$.ajax({
			url:"mainThemeBeauty2.tm",
			type:"GET",
			dataType:"json",
			success:function(data){
				console.log(data);
				var themeData = data.response.body.items.item;
				var containerArea = $("#subContainer2");
				containerArea.html("");
				var output = "";
				output += "<div class='tm-home-box-3-img-container'>";
				output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
				output += "</div>";
				output += "<div class='tm-home-box-3-info'>";
				if(themeData.overview.length > 1){
					var overviewText = "";
					overviewText = themeData.overview.substring(0, 110) + "...";
					output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
				}
				output += "<div class='tm-home-box-2-container'>";
				output += "<a onclick='btnGood("+themeData.contenttypeid+","+themeData.contentid+");' class='tm-home-box-2-link goodBtn'><i class='fa fa-heart-o tm-home-box-2-icon border-right'></i></a>";
				output += "<a onclick='detailView("+themeData.contentid+","+themeData.contenttypeid+","+themeData.mapy+","+themeData.mapx+");' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
				output += "</div></div>";
				containerArea.html(output);
			},
			error:function(data){
				console.log(data);
			}
		});
		$.ajax({
			url:"mainThemeBeauty3.tm",
			type:"GET",
			dataType:"json",
			success:function(data){
				console.log(data);
				var themeData = data.response.body.items.item;
				var containerArea = $("#subContainer3");
				containerArea.html("");
				var output = "";
				output += "<div class='tm-home-box-3-img-container'>";
				output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
				output += "</div>";
				output += "<div class='tm-home-box-3-info'>";
				if(themeData.overview.length > 1){
					var overviewText = "";
					overviewText = themeData.overview.substring(0, 110) + "...";
					output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
				}
				output += "<div class='tm-home-box-2-container'>";
				output += "<a onclick='btnGood("+themeData.contenttypeid+","+themeData.contentid+");' class='tm-home-box-2-link goodBtn'><i class='fa fa-heart-o tm-home-box-2-icon border-right'></i></a>";
				output += "<a onclick='detailView("+themeData.contentid+","+themeData.contenttypeid+","+themeData.mapy+","+themeData.mapx+");' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
				output += "</div></div>";
				containerArea.html(output);
			},
			error:function(data){
				console.log(data);
			}
		});
		$.ajax({
			url:"mainThemeBeauty4.tm",
			type:"GET",
			dataType:"json",
			success:function(data){
				console.log(data);
				var themeData = data.response.body.items.item;
				var containerArea = $("#subContainer4");
				containerArea.html("");
				var output = "";
				output += "<div class='tm-home-box-3-img-container'>";
				output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
				output += "</div>";
				output += "<div class='tm-home-box-3-info'>";
				if(themeData.overview.length > 1){
					var overviewText = "";
					overviewText = themeData.overview.substring(0, 110) + "...";
					output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
				}
				output += "<div class='tm-home-box-2-container'>";
				output += "<a onclick='btnGood("+themeData.contenttypeid+","+themeData.contentid+");' class='tm-home-box-2-link goodBtn'><i class='fa fa-heart-o tm-home-box-2-icon border-right'></i></a>";
				output += "<a onclick='detailView("+themeData.contentid+","+themeData.contenttypeid+","+themeData.mapy+","+themeData.mapx+");' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
				output += "</div></div>";
				containerArea.html(output);
			},
			error:function(data){
				console.log(data);
			}
		});
	}
	
	function classicTheme(){
		$.ajax({
			url:"mainThemeClassic.tm",
			type:"GET",
			dataType:"json",
			success:function(data){
				console.log(data);
				var themeData = data.response.body.items.item;
				var containerArea = $("#subContainer1");
				containerArea.html("");
				var output = "";
				output += "<div class='tm-home-box-3-img-container'>";
				output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
				output += "</div>";
				output += "<div class='tm-home-box-3-info'>";
				if(themeData.overview.length > 1){
					var overviewText = "";
					overviewText = themeData.overview.substring(0, 110) + "...";
					output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
				}
				output += "<div class='tm-home-box-2-container'>";
				output += "<a onclick='btnGood("+themeData.contenttypeid+","+themeData.contentid+");' class='tm-home-box-2-link goodBtn'><i class='fa fa-heart-o tm-home-box-2-icon border-right'></i></a>";
				output += "<a onclick='detailView("+themeData.contentid+","+themeData.contenttypeid+","+themeData.mapy+","+themeData.mapx+");' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
				output += "</div></div>";
				containerArea.html(output);
			},
			error:function(data){
				console.log("fail..");
				console.log(data);
			}
		});
		$.ajax({
			url:"mainThemeClassic2.tm",
			type:"GET",
			dataType:"json",
			success:function(data){
				console.log(data);
				var themeData = data.response.body.items.item;
				var containerArea = $("#subContainer2");
				containerArea.html("");
				var output = "";
				output += "<div class='tm-home-box-3-img-container'>";
				output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
				output += "</div>";
				output += "<div class='tm-home-box-3-info'>";
				if(themeData.overview.length > 1){
					var overviewText = "";
					overviewText = themeData.overview.substring(0, 110) + "...";
					output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
				}
				output += "<div class='tm-home-box-2-container'>";
				output += "<a onclick='btnGood("+themeData.contenttypeid+","+themeData.contentid+");' class='tm-home-box-2-link goodBtn'><i class='fa fa-heart-o tm-home-box-2-icon border-right'></i></a>";
				output += "<a onclick='detailView("+themeData.contentid+","+themeData.contenttypeid+","+themeData.mapy+","+themeData.mapx+");' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
				output += "</div></div>";
				containerArea.html(output);
			},
			error:function(data){
				console.log(data);
			}
		});
		$.ajax({
			url:"mainThemeClassic3.tm",
			type:"GET",
			dataType:"json",
			success:function(data){
				console.log(data);
				var themeData = data.response.body.items.item;
				var containerArea = $("#subContainer3");
				containerArea.html("");
				var output = "";
				output += "<div class='tm-home-box-3-img-container'>";
				output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
				output += "</div>";
				output += "<div class='tm-home-box-3-info'>";
				if(themeData.overview.length > 1){
					var overviewText = "";
					overviewText = themeData.overview.substring(0, 110) + "...";
					output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
				}
				output += "<div class='tm-home-box-2-container'>";
				output += "<a onclick='btnGood("+themeData.contenttypeid+","+themeData.contentid+");' class='tm-home-box-2-link goodBtn'><i class='fa fa-heart-o tm-home-box-2-icon border-right'></i></a>";
				output += "<a onclick='detailView("+themeData.contentid+","+themeData.contenttypeid+","+themeData.mapy+","+themeData.mapx+");' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
				output += "</div></div>";
				containerArea.html(output);
			},
			error:function(data){
				console.log(data);
			}
		});
		$.ajax({
			url:"mainThemeClassic4.tm",
			type:"GET",
			dataType:"json",
			success:function(data){
				console.log(data);
				var themeData = data.response.body.items.item;
				var containerArea = $("#subContainer4");
				containerArea.html("");
				var output = "";
				output += "<div class='tm-home-box-3-img-container'>";
				output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
				output += "</div>";
				output += "<div class='tm-home-box-3-info'>";
				if(themeData.overview.length > 1){
					var overviewText = "";
					overviewText = themeData.overview.substring(0, 110) + "...";
					output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
				}
				output += "<div class='tm-home-box-2-container'>";
				output += "<a onclick='btnGood("+themeData.contenttypeid+","+themeData.contentid+");' class='tm-home-box-2-link goodBtn'><i class='fa fa-heart-o tm-home-box-2-icon border-right'></i></a>";
				output += "<a onclick='detailView("+themeData.contentid+","+themeData.contenttypeid+","+themeData.mapy+","+themeData.mapx+");' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
				output += "</div></div>";
				containerArea.html(output);
			},
			error:function(data){
				console.log(data);
			}
		});
	}
	
	function leisureTheme(){
		$.ajax({
			url:"mainThemeLeisure.tm",
			type:"GET",
			dataType:"json",
			success:function(data){
				console.log(data);
				var themeData = data.response.body.items.item;
				var containerArea = $("#subContainer1");
				containerArea.html("");
				var output = "";
				output += "<div class='tm-home-box-3-img-container'>";
				output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
				output += "</div>";
				output += "<div class='tm-home-box-3-info'>";
				if(themeData.overview.length > 1){
					var overviewText = "";
					overviewText = themeData.overview.substring(0, 110) + "...";
					output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
				}
				output += "<div class='tm-home-box-2-container'>";
				output += "<a onclick='btnGood("+themeData.contenttypeid+","+themeData.contentid+");' class='tm-home-box-2-link goodBtn'><i class='fa fa-heart-o tm-home-box-2-icon border-right'></i></a>";
				output += "<a onclick='detailView("+themeData.contentid+","+themeData.contenttypeid+","+themeData.mapy+","+themeData.mapx+");' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
				output += "</div></div>";
				containerArea.html(output);
			},
			error:function(data){
				console.log(data);
			}
		});
		$.ajax({
			url:"mainThemeLeisure2.tm",
			type:"GET",
			dataType:"json",
			success:function(data){
				console.log(data);
				var themeData = data.response.body.items.item;
				var containerArea = $("#subContainer2");
				containerArea.html("");
				var output = "";
				output += "<div class='tm-home-box-3-img-container'>";
				output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
				output += "</div>";
				output += "<div class='tm-home-box-3-info'>";
				if(themeData.overview.length > 1){
					var overviewText = "";
					overviewText = themeData.overview.substring(0, 110) + "...";
					output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
				}
				output += "<div class='tm-home-box-2-container'>";
				output += "<a onclick='btnGood("+themeData.contenttypeid+","+themeData.contentid+");' class='tm-home-box-2-link goodBtn'><i class='fa fa-heart-o tm-home-box-2-icon border-right'></i></a>";
				output += "<a onclick='detailView("+themeData.contentid+","+themeData.contenttypeid+","+themeData.mapy+","+themeData.mapx+");' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
				output += "</div></div>";
				containerArea.html(output);
			},
			error:function(data){
				console.log(data);
			}
		});
		$.ajax({
			url:"mainThemeLeisure3.tm",
			type:"GET",
			dataType:"json",
			success:function(data){
				console.log(data);
				var themeData = data.response.body.items.item;
				var containerArea = $("#subContainer3");
				containerArea.html("");
				var output = "";
				output += "<div class='tm-home-box-3-img-container'>";
				output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
				output += "</div>";
				output += "<div class='tm-home-box-3-info'>";
				if(themeData.overview.length > 1){
					var overviewText = "";
					overviewText = themeData.overview.substring(0, 110) + "...";
					output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
				}
				output += "<div class='tm-home-box-2-container'>";
				output += "<a onclick='btnGood("+themeData.contenttypeid+","+themeData.contentid+");' class='tm-home-box-2-link goodBtn'><i class='fa fa-heart-o tm-home-box-2-icon border-right'></i></a>";
				output += "<a onclick='detailView("+themeData.contentid+","+themeData.contenttypeid+","+themeData.mapy+","+themeData.mapx+");' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
				output += "</div></div>";
				containerArea.html(output);
			},
			error:function(data){
				console.log(data);
			}
		});
		$.ajax({
			url:"mainThemeLeisure4.tm",
			type:"GET",
			dataType:"json",
			success:function(data){
				console.log(data);
				var themeData = data.response.body.items.item;
				var containerArea = $("#subContainer4");
				containerArea.html("");
				var output = "";
				output += "<div class='tm-home-box-3-img-container'>";
				output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
				output += "</div>";
				output += "<div class='tm-home-box-3-info'>";
				if(themeData.overview.length > 1){
					var overviewText = "";
					overviewText = themeData.overview.substring(0, 110) + "...";
					output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
				}
				output += "<div class='tm-home-box-2-container'>";
				output += "<a onclick='btnGood("+themeData.contenttypeid+","+themeData.contentid+");' class='tm-home-box-2-link goodBtn'><i class='fa fa-heart-o tm-home-box-2-icon border-right'></i></a>";
				output += "<a onclick='detailView("+themeData.contentid+","+themeData.contenttypeid+","+themeData.mapy+","+themeData.mapx+");' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
				output += "</div></div>";
				containerArea.html(output);
			},
			error:function(data){
				console.log(data);
			}
		});
	}
	</script>
	

	<!-- 상단 호텔 3개 부분 -->	
	<section class="container tm-home-section-1" id="more">
		<div class="row" id="rowArea">
			<div class="col-lg-4 col-md-4 col-sm-6" id="rowArea1">
				<div class="tm-home-box-1 tm-home-box-1-2 tm-home-box-1-center">
					<img src="${ contextPath }/resources/img/index-01.jpg" alt="image" class="img-responsive0">
					<a href="#">
						<div class="tm-green-gradient-bg tm-city-price-container">
							<span>ㅇㅇㅇ호텔</span>
							<span>00건의 리뷰</span>
						</div>	
					</a>			
				</div>				
			</div>

			<div class="col-lg-4 col-md-4 col-sm-6" id="rowArea2">
				<div class="tm-home-box-1 tm-home-box-1-2 tm-home-box-1-center">
					<img src="${ contextPath }/resources/img/index-01.jpg" alt="image" class="img-responsive0">
					<a href="#">
						<div class="tm-green-gradient-bg tm-city-price-container">
							<span>ㅇㅇㅇ호텔</span>
							<span>00건의 리뷰</span>
						</div>	
					</a>			
				</div>				
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6" id="rowArea3">
				<div class="tm-home-box-1 tm-home-box-1-2 tm-home-box-1-right">
					<img src="${ contextPath }/resources/img/index-02.jpg" alt="image" class="img-responsive0">
					<a href="#">
						<div class="tm-red-gradient-bg tm-city-price-container">
							<span>ㅇㅇㅇ호텔</span>
							<span>00건의 리뷰</span>
						</div>	
					</a>					
				</div>				
			</div>
		</div>
	</section>
	
	
	<!-- 테마여행 view 부분 -->
	<section class="tm-white-bg section-padding-bottom">
	<div class="container">
		<div class="row">				
			<div class="section-margin-top">
				<div class="tm-section-header">
					<div class="col-lg-3 col-md-3 col-sm-3"><hr></div>
					<div class="col-lg-6 col-md-6 col-sm-6"><h2 class="tm-section-title">테마여행</h2></div>
					<div class="col-lg-3 col-md-3 col-sm-3"><hr></div>	
				</div>
				<div align="right">
					<a class="themeAreaSelect" onclick="shoppingTheme();">쇼핑</a> | 
					<a class="themeAreaSelect" onclick="beautyTheme();">뷰티</a> | 
					<a class="themeAreaSelect" onclick="classicTheme();">전통</a> | 
					<a class="themeAreaSelect" onclick="leisureTheme();">레져</a> <!-- | 
					<a class="themeAreaSelect" onclick="koreaWaveTheme();">한류</a> -->&nbsp;&nbsp;&nbsp;&nbsp;
				</div><br>
			</div>
			<div class="col-lg-6">
					<div class="tm-home-box-3" id="subContainer1">
						<div class="tm-home-box-3-img-container">
							<img src="${ contextPath }/resources/img/index-07.jpg" alt="image" class="img-responsive1">	
						</div>						
						<div class="tm-home-box-3-info">
							<p class="tm-home-box-3-description" id="themeText">Proin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum</p>
					        <div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
							<a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description box-3" id="themeSpan">Travel</span></a>
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
						</div>
						</div>						
					</div>					
			     </div>
			     <div class="col-lg-6">
			        <div class="tm-home-box-3" id="subContainer2">
						<div class="tm-home-box-3-img-container">
							<img src="${ contextPath }/resources/img/index-08.jpg" alt="image" class="img-responsive1">	
						</div>						
						<div class="tm-home-box-3-info">
							<p class="tm-home-box-3-description">Proin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum</p>
					        <div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
							<a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description box-3">Travel</span></a>
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
						</div>
						</div>						
					</div>
				</div>
				<div class="col-lg-6">
				    <div class="tm-home-box-3" id="subContainer3">
						<div class="tm-home-box-3-img-container">
							<img src="${ contextPath }/resources/img/index-09.jpg" alt="image" class="img-responsive1">	
						</div>						
						<div class="tm-home-box-3-info">
							<p class="tm-home-box-3-description">Proin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum</p>
					        <div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
							<a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description box-3">Travel</span></a>
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
						</div>
						</div>						
					</div>
			    </div>
			    <div class="col-lg-6">
			        <div class="tm-home-box-3" id="subContainer4">
						<div class="tm-home-box-3-img-container">
							<img src="${ contextPath }/resources/img/index-10.jpg" alt="image" class="img-responsive1">	
						</div>						
						<div class="tm-home-box-3-info">
							<p class="tm-home-box-3-description">Proin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum</p>
					        <div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
							<a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description box-3">Travel</span></a>
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
						</div>
						</div>						
					</div>
			   	</div>
			</div>		
		</div>
		<div class="col-lg-12" align="center">
			<input type="button" class="btn themeBtn" value="테마여행 더보기" onclick="location.href='${contextPath}/themeMain'">
		</div>
		
	</section>			
	
	<!-- white bg -->
	<section class="tm-white-bg section-padding-bottom">
	</section>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		// HTML document is loaded. DOM is ready.
		$(function() {

			$('#hotelCarTabs a').click(function (e) {
			  e.preventDefault()
			  $(this).tab('show')
			})

        	$('.date').datetimepicker({
            	format: 'MM/DD/YYYY'
            });
            $('.date-time').datetimepicker();

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
		
		// Load Flexslider when everything is loaded.
		$(window).load(function() {	  		
			// Vimeo API nonsense

/*
			  var player = document.getElementById('player_1');
			  $f(player).addEvent('ready', ready);
			 
			  function addEvent(element, eventName, callback) {
			    if (element.addEventListener) {
			      element.addEventListener(eventName, callback, false)
			    } else {
			      element.attachEvent(eventName, callback, false);
			    }
			  }
			 
			  function ready(player_id) {
			    var froogaloop = $f(player_id);
			    froogaloop.addEvent('play', function(data) {
			      $('.flexslider').flexslider("pause");
			    });
			    froogaloop.addEvent('pause', function(data) {
			      $('.flexslider').flexslider("play");
			    });
			  }
*/

			 
			 
			  // Call fitVid before FlexSlider initializes, so the proper initial height can be retrieved.
/*

			  $(".flexslider")
			    .fitVids()
			    .flexslider({
			      animation: "slide",
			      useCSS: false,
			      animationLoop: false,
			      smoothHeight: true,
			      controlNav: false,
			      before: function(slider){
			        $f(player).api('pause');
			      }
			  });
*/


			  

//	For images only
		    $('.flexslider').flexslider({
			    controlNav: false
		    });


	  	});
	</script>
</body>
</html>
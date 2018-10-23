<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.submenubar{
		background:black;
		color:white;
	}
	.submenuTitle{
		width:1170px;
		margin-left:auto;
		margin-right:auto;
	}
	.searchSubMenu{cursor:pointer;}
</style>
</head>
<body>
	<div class="submenubar">
		<div class="submenuTitle">
			<nav class="tm-nav">
				<ul>
					<li><a class="searchSubMenu" onclick="areaAll();" style="padding:10px 34px 10px 34px;">지역의 모든 것</a></li>
					<li><a class="searchSubMenu" onclick="areaHotel();" style="padding:10px 34px 10px 34px;">숙박</a></li>
					<li><a class="searchSubMenu" onclick="areaFood();" style="padding:10px 34px 10px 34px;">음식점</a></li>
					<li><a class="searchSubMenu" onclick="areaGame();" style="padding:10px 34px 10px 34px;">오락거리</a></li>
				</ul>
			</nav>	
		</div>
		<script>
			var areaCode;// = sessionStorage.getItem("areaCode");
			var sigunguCode;// = sessionStorage.getItem("sigunguCode");
			var contenttypeid;// = sessionStorage.getItem("contenttypeid");
			var pageNo;// = sessionStorage.getItem("pageNo");
			var cat3;// = sessionStorage.getItem("cat3");
			console.log("서브메뉴바 areaCode : " + sessionStorage.getItem("areaCode"));
			console.log("서브메뉴바 sigunguCode : " + sessionStorage.getItem("sigunguCode"));
			console.log("서브메뉴바 contenttypeid : " + sessionStorage.getItem("contenttypeid"));
			console.log("서브메뉴바 cat3 : " + sessionStorage.getItem("cat3"));
			
			function areaAll(){
				if(sessionStorage.getItem("areaCode") == null){
					areaCode = 1;
				}else{
					areaCode = sessionStorage.getItem("areaCode");
				}
				location.href="${contextPath}/areaAllView.main?areaCode="+areaCode;
			}
			function areaHotel(){
				areaCode = sessionStorage.getItem("areaCode");
				if(sessionStorage.getItem("sigunguCode") == 0){
					sigunguCode = 0;
				}else{
					sigunguCode = sessionStorage.getItem("sigunguCode");
				}
				pageNo = 1;
				location.href="${contextPath}/areaHotelView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo;
			}
			function areaFood(){
				areaCode = sessionStorage.getItem("areaCode");
				if(sessionStorage.getItem("sigunguCode") == 0){
					sigunguCode = 0;
				}else{
					sigunguCode = sessionStorage.getItem("sigunguCode");
				}
				if(sessionStorage.getItem("cat3") == null){
					cat3 = "";
				}else{
					cat3 = sessionStorage.getItem("cat3");
				}
				location.href="${contextPath}/areaFoodView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&cat3="+cat3;
			}
			function areaGame(){
				areaCode = sessionStorage.getItem("areaCode");
				if(sessionStorage.getItem("sigunguCode") == 0){
					sigunguCode = 0;
				}else if(sessionStorage.getItem("sigunguCode") == null){
					sigunguCode = "";
				}else{
					sigunguCode = sessionStorage.getItem("sigunguCode");
				}
				if(sessionStorage.getItem("cat3") != null){
					sessionStorage.removeItem("cat3");
					sessionStorage.setItem("cat3", "");
					cat3 = sessionStorage.getItem("cat3");
				}
				if(sessionStorage.getItem("contenttypeid") == null){
					contenttypeid = 0;
				}
				pageNo = 1;
				
				location.href="${contextPath}/areaGameView.main?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&pageNo="+pageNo+"&contenttypeid="+contenttypeid;
			}
		</script>
	</div>
</body>
</html>
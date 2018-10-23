<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="${ contextPath }/resources/js/jquery-1.11.2.min.js"></script>      		<!-- jQuery -->
<script type="text/javascript" src="${ contextPath }/resources/js/bootstrap.min.js"></script>					<!-- bootstrap js -->
<script type="text/javascript" src="${ contextPath }/resources/js/jquery.flexslider-min.js"></script>			<!-- flexslider js -->
<script type="text/javascript" src="${ contextPath }/resources/js/templatemo-script.js"></script>      		<!-- Templatemo Script -->
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,700' rel='stylesheet' type='text/css'>
<link href="${ contextPath }/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="${ contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${ contextPath }/resources/css/bootstrap-datetimepicker.min.css" rel="stylesheet">  
<link href="${ contextPath }/resources/css/flexslider.css" rel="stylesheet">
<link href="${ contextPath }/resources/css/templatemo-style.css" rel="stylesheet">

<title>Insert title here</title>
<style>
@font-face { font-family: 'Youth'; font-style: normal; font-weight: 400; src: url('//cdn.jsdelivr.net/korean-webfonts/1/orgs/othrs/kywa/Youth/Youth.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/orgs/othrs/kywa/Youth/Youth.woff') format('woff'); } .youth * { font-family: 'Youth', sans-serif; }
	
	body, div, p, a, h1,h2,h3,h4, input, select {
		font-family: 'Youth' !important;
	}  
	
	#menuIconArea{
		width:135px;
		height:80px;
		float:right;
	}
	
	#loginDiv { /* 팝업창 css */
		top: 0px;
		position: absolute;
		width: 400px;
		height: 420px; 
		display: none;
		border: none;
		background:#FAFAFA;
		border-radius:10px;
	}
	
	#loginModal{
		width: 400px;
		height: 300px;
		margin-left:auto;
		margin-right:auto;
	}
	
	#inModal{
		height:280px;
	}
	
	#emailLoginDiv {
		top: 0px;
		position: absolute;
		width: 400px;
		height: 450px; 
		display: none;
		border: none;
		background:#FAFAFA;
		border-radius:10px;
	}
	
	#sllerJoinDiv{
		top: 0px;
		position: absolute;
		width: 400px;
		height: 450px; 
		display: none;
		border: none;
		background:#FAFAFA;
		border-radius:10px;
	}
	
	#userJoinDiv {
		top: 0px;
		position: absolute;
		width: 400px;
		height: 450px; 
		display: none;
		border: none;
		background:#FAFAFA;
		border-radius:10px;
	}
	
	#btnDiv {
		margin-left: auto;
		margin-right: auto;
		width: 300px;
		height: 200px;
		margin-top: 15px;
	}

 	#emailBtn {
		width: 250px;
		height: 50px;
		margin-top: 10px;
		border: none;
		border-radius:7px;
	} 
	
	#btnJoinFacebook{
		width:250px;
		height:50px;
		/* background:#2E64FE;
		border:solid 1px #FAFAFA;
		color:#FAFAFA; */
		border:solid 1px #2E64FE;
		background:#FAFAFA;
		color:#2E64FE;
	}
	
	#btnJoinGoogle{
		width:250px;
		height:50px;
		margin-top:10px;
		/* border:solid 1px #FAFAFA;
		background:#DF0101;
		color:#FAFAFA; */
		border:solid 1px #DF0101;
		background:#FAFAFA;
		color:#DF0101;
	}

#close1, #close2, #close3{
     margin-right:3%;
}
.page-header{
    margin-top:5%;
}

</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
</head>
<body>
	<!-- Header -->
  	<div class="tm-header">
  		<div class="container">
  			<div class="row">
  				<div class="col-lg-5 col-md-4 col-sm-3 tm-site-name-container">
  					<a href="index.jsp" class="tm-site-name">Hello Korea</a>	
  				</div>
	  			<div class="col-lg-7 col-md-8 col-sm-9">
	  				<div class="mobile-menu-icon">
		              <i class="fa fa-bars"></i>
		            </div>
	  				<nav class="tm-nav">
				  		<div id="menuIconArea">
				  			<c:if test="${ sessionScope.loginUser != null && sessionScope.loginUser.mType.equals('admin') }">
								<a href="myPageView.ad"><img src="${ contextPath }/resources/img/myPageIcon.png" style="width:35px;height:35px;"></a>
							</c:if>
							<c:if test="${ sessionScope.loginUser != null && sessionScope.loginUser.mType.equals('1') }">
							    <a class="myPage" href="userMypage.um"><img src="${ contextPath }/resources/img/myPageIcon.png" style="width:35px;height:35px;"></a>
							</c:if>
							<c:if test="${ sessionScope.loginUser != null && sessionScope.loginUser.mType.equals('2') }">		
								<a href="myPageView.sell"><img src="${ contextPath }/resources/img/myPageIcon.png" style="width:35px;height:35px;"></a>
							</c:if>
							<c:if test="${ sessionScope.loginUser == null }">
					  			<a class="fas fa-angry" id="loginOpen" data-toggle="modal" data-target="#loginDiv"><img src="${ contextPath }/resources/img/loginIcon.png" style="width:32px;height:32px;margin-top:2%;"></a>
							</c:if>
							<c:if test="${! empty sessionScope.loginUser }">
							    <input type="hidden" id="msgBtn" value="${ sessionScope.loginUser.mId }">
							    <a onclick="openMsg()" id="noMsg"><img src="${ contextPath }/resources/img/msgIcon.png" style="width:38px;height:38px;"></a>
							    <a onclick="openMsg()" id="newMsg"><img src="${ contextPath }/resources/img/msgIcon2.png" style="width:38px;height:38px;"></a>
								<a class="logout" href="logout.me"><img src="${ contextPath }/resources/img/logoutIcon.png" style="width:30px;height:30px;margin-left:1%;"></a>
							</c:if>
								
				  		</div>
					</nav>		
	  			</div>				
  			</div>
  		</div>
  	</div>

	<!-- 모달 -->
	<div id="loginDiv" class="modal fade" role="dialog" style="height:400px;">
    	<div class="page-header">
			<button type="button" class="close" data-dismiss="modal" id="close1">&times;</button>
			<br>
			<h3 align="center">&nbsp;&nbsp;&nbsp;&nbsp;Welcome to Hello Korea</h3>
		</div>
		<div id="loginModal" class="col-md-3" align="center">
			<div id="inModal" class="login-box well" align="center">
				<div id="btnDiv">
					<button id="btnJoinFacebook"class="btn btn-primary btn-round"><i class="fa fa-facebook" aria-hidden="true"></i>&nbsp;&nbsp;Facebook Login</button>
					<button id="btnJoinGoogle" class="btn btn-primary btn-round"> <i class="fa fa-google" aria-hidden="true"></i>&nbsp;&nbsp;Google Login</button>
					<hr/>
					<button id="emailBtn" data-toggle="modal" data-target="#emailLoginDiv">이메일로 계속하기</button>
				</div>
			</div>
		</div>
	</div>
	
	<!--자회원 로그인 폼  -->
	<div id="emailLoginDiv" class="modal fade" role="dialog" style="height:450px;">
		<div class="page-header" align="center">
			<button type="button" class="close" data-dismiss="modal" id="close2">&times;</button>
			<h3>&nbsp;&nbsp;&nbsp;&nbsp;로그인 </h3>
			<label>더 많은 정보를 확인하세요 !</label>
		</div>
		<div id="loginModal" class="col-md-3">
			<div id="inModal" class="login-box well" style="height:230px;">
				<form action="login.me" method="post">
					
					<div class="form-group">
						<label for="username-email">이메일 </label>
						<input name="email" value='' id="email" placeholder="E-mail" type="text" class="form-control" />
					</div>
					<div class="form-group">
						<label for="password">비밀번호</label>
						<input name="password" id="password" value='' placeholder="Password" type="password" class="form-control" />
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-default btn-login-submit btn-block m-t-md" value="Login" />
					</div>
				</form><br>
					<hr/>
				<div class="form-group">
					<label>회원가입을 안 하셨나요?</label>
					<a class="userJoinBtn" data-toggle="modal" data-target="#userJoinDiv">회원가입</a><br>
					<label>비밀번호를 잊으셨나요?</label>
				    <a href="/bbs/index.php?mid=index&act=dispMemberFindAccount" class="text-sm">비밀번호 찾기</a>
				</div>
			</div>
		</div>
	</div>

	<!-- 유저회원가입 -->
	<div id="userJoinDiv" class="modal fade" role="dialog" style="height:420px;">
		<div class="page-header" align="center">
			<button type="button" class="close" data-dismiss="modal" id="close3">&times;</button>
			<h3>&nbsp;&nbsp;&nbsp;&nbsp;회원가입하기 </h3>
			<label>더 많은 정보를 확인하세요 !</label>
		</div>
		<div id="loginModal" class="col-md-3">
			<div id="inModal" class="login-box well" style="height:230px;">
				<form action="insertUser.me" method="post">
					
					<div class="form-group">
						<label for="username-email">이메일</label>
						<input name="email" value='' id="email" placeholder="E-mail" type="text" class="form-control" />
					</div>
					<div class="form-group">
						<label for="password">비밀번호</label>
						<input name="password" id="password" value='' placeholder="Password" type="password" class="form-control" />
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-default btn-login-submit btn-block m-t-md" />
					</div>
				</form>
			</div>
			
				<div class="form-group" style="margin-left:3%;margin-right:3%;">
				<hr />
					<label>판매자 등록은 여기로 </label>
					<a id="sellerJoinBtn" data-toggle="modal" data-target="#sllerJoinDiv">판매자 회원가입</a>
				</div>
		</div>
	</div>
	
	<!-- seller -->
	<div id="sllerJoinDiv" class="modal fade" role="dialog"  style="height:400px;">
		<div class="page-header" align="center">
			<button type="button" class="close" data-dismiss="modal" id="close4">&times;</button>
			<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;판매자 가입하기 </h3>
			<label>손쉽게 등록하여 판매하세요 !</label>
		</div>
		<div id="loginModal" class="col-md-3">
			<div id="inModal" class="login-box well" style="height:250px;">
				<form action="insertSeller.me" method="post">
					<div class="form-group">
						<label for="email">이메일 </label>
						<input name="email" value='' id="email" placeholder="E-mail" type="text" class="form-control" />
					</div>
					<div class="form-group">
						<label for="password">비밀번호</label>
						<input name="password" id="password" value='' placeholder="Password" type="password" class="form-control" />
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-default btn-login-submit btn-block m-t-md" />
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
		
		
		function openMsg(){
			var mId = $("#msgBtn").val(); 
			window.open('receiveMessageView?mId='+mId, 'Hello', 'width=480px, height=580px, top=80px, left=400px');
		}
  		
  		$("#loginOpen").click(function(event){
  	    	console.log('작동');
  	    	$("#loginDiv").css({
				"top": (($(window).height()-$("#loginDiv").outerHeight())/1.5+$(window).scrollTop())+"px",
				"left": (($(window).width()-$("#loginDiv").outerWidth())/2+$(window).scrollLeft())+"px"
			});
  	             
			$("body").css("overflow","hidden");
		});
  		
  	    $("#closeBtn").click(function(event){
			/*  $("#popup_mask").hide(); */
			$("#loginDiv").hide(); 
			$(".modal-backdrop").hide();
			$("body").css("overflow","auto");
  	      
		});
  	    
		$("#emailBtn").click(function(event){
			$("#loginDiv").hide();
			$(".modal-backdrop").hide();
			$("#emailLoginDiv").show();
			$("#emailLoginDiv").css({
				"top": (($(window).height()-$("#emailLoginDiv").outerHeight())/1.5+$(window).scrollTop())+"px",
				"left": (($(window).width()-$("#emailLoginDiv").outerWidth())/2+$(window).scrollLeft())+"px"
			});
			$("body").css("overflow","hidden");
		
		});
		  	  
		$(".userJoinBtn").click(function(event){
			$("#emailLoginDiv").hide();
			 $(".modal-backdrop").hide(); 
			$("#userJoinDiv").show();
			$("#userJoinDiv").css({
				"top": (($(window).height()-$("#userJoinDiv").outerHeight())/1.5+$(window).scrollTop())+"px",
				"left": (($(window).width()-$("#userJoinDiv").outerWidth())/2+$(window).scrollLeft())+"px"
			});
			$("body").css("overflow","hidden");
		
		});
		  	
		$("#sellerJoinBtn").click(function(){
			$("#userJoinDiv").hide();
			$(".modal-backdrop").hide();
			$("#sllerJoinDiv").show();
			$("#sllerJoinDiv").css({
				"top": (($(window).height()-$("#sllerJoinDiv").outerHeight())/1.5+$(window).scrollTop())+"px",
				"left": (($(window).width()-$("#sllerJoinDiv").outerWidth())/2+$(window).scrollLeft())+"px"
			});
		         
			$("body").css("overflow","hidden"); 
		});
  		
	</script>
	 <script>
		$("#loginOpen").click(function(){
			$.ajax({
				url:"facebook.me",
				type:"post",
				data:{},
				success:function(data){
					console.log(data);
					$("#btnJoinFacebook").attr("onclick", "location.href =" + data);
					
					
				},
				errror:function(){
					console.log("에러");	
				}
			})
		});
		
		//메세지 알림 이미지
		$(function(){
			$("#newMsg").hide();
			$("#noMsg").hide();
			var mId = $("#msgBtn").val(); 
			
			$.ajax({
				url:"checkNewMessage",
				type:"post",
				data:{mId:mId},
				success:function(data){
					console.log(data);
					if(data.newMessage == 'Y'){
						$("#newMsg").show();
						$("#noMsg").hide();
					}else{
						$("#newMsg").hide();
						$("#noMsg").show();
					}
				},
				errror:function(){
					console.log("에러");	
				}
			});
		});
		
	
	</script>
 	<script> 
 		$("#loginOpen").click(function(){
			$.ajax({
				url:"google.me",
				type:"post",
				data:{},
				success:function(data){
				console.log(data);
					$("#btnJoinGoogle").attr("onclick", "location.href =" + data);
					
				},
				error:function(){
					console.log("에러");	
				}
			})
		});
 		
 	</script>
  		
</body>
</html>
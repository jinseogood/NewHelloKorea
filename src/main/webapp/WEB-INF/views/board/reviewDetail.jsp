<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link href="${ contextPath }/resources/css/jquery-ui.css" rel="stylesheet" type="text/css">

<meta charset="UTF-8">
<title>Hello Korea</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>



<style>
img.ui-datepicker-trigger {
	width: 20px;
	margin-left: 5px;
	vertical-align: middle;
	cursor: pointer;
}

.web-font {
	font-family: 'Jua', sans-serif;
	font-size: 18px;
	margin-right: 5px;
}

input {
	box-sizing: border-box;
}

#fromDate, #toDate {
	width: 100px;
}

.ui-datepicker-header {
	background: rgb(241, 196, 15);
}

.ui-datepicker-calendar {
	font-family: 'Jua', sans-serif;
}

#monthpicker {
	width: 15%;
}

textarea {
	width: 100%;
}

#review_title {
	width: 100%;
	padding: 8px 5px;
	margin: 8px 0px;
	box-sizing: border-box;
}

.rate-base-layer {
	color: #aaa;
}

.rate-hover-layer {
	color: orange;
}

.rate2 {
	font-size: 35px;
}

.rate2 .rate-hover-layer {
	/* color: pink; */
	color: #aaa;
}

.rate2 .rate-select-layer {
	/* color: red; */
	color: orange;
}
body{ margin:50px 0px; }
.thumbnail{ padding:0px; }
.stageParent{ background:#fff; border:3px dashed #444; border-radius:5px; padding:10px; }
.stage{ min-height:220px; max-height:400px; overflow-y:auto; }
.detailImgArea{
	display:inline-block;
	width:220px;
	height:210px;
}
</style>
</head>
<body>

   <jsp:include page="../common/menubar.jsp"/>
   
   <section class="container tm-home-section-1" id="more" style = "width:100%; padding:100px">
   <c:set var = "b" value = "${ b }" scope = "request"/>
      <div class="row">
         
      </div> 

      <div class="tm-section-header section-margin-top" >
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>
					<div class="col-lg-4 col-md-6 col-sm-6"><h2 class="tm-section-title">REVIEW DETAIL</h2></div>
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>	
	  </div>	
      <div id="google-map" style = "text-align:center; width:100%; height:auto">
      

      		<div class="row line_b" >
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" style = "height:auto">
               <div class="tm-about-box-1" style = "height:220px; padding:10px 10px">
                  <a onclick = "member_info(this);">
                  	<c:if test="${ b.attach ne null }"> 	
                  		<img src="${ contextPath }/resources/uploadFiles/member/${ b.attach }" alt="img" class="tm-about-box-1-img" style = "margin:0 auto 10px; width:140px; height:140px;">
                  	</c:if>
                  	<c:if test="${ b.attach eq null }"> 	
                  		<img src="${ contextPath }/resources/img/about-4.jpg" alt="img" class="tm-about-box-1-img" style = "margin:0 auto 10px;">
                  	</c:if>
                  </a>
                  <h3 class="tm-about-box-1-title" style = "margin-bottom:5px">${ b.nickname }<span>( ${ b.national })</span></h3>
                  <div class = 'member_info' style = 'border-radius: 10px; visibility:hidden; position:absolute; background-color:lightgray; left:-133px; top:-10px; width:200px; height:200px; z-index:999;'>
				  <div>
				  <h3>${b.nickname}</h3>
				  <input type="hidden" id="receiveIdForMsg" value="${b.m_id}">
				  <input type="hidden" id="nicknameForMsg" value="${b.nickname}">
				  <input type="hidden" id="mIdForMsg" value="${sessionScope.loginUser.mId}">
				  </div>
				  <div style = 'text-align:right;'><button class='btn btn-light' style='width:65px; height:30px;' type = 'button' onclick="openMsg()">메세지</button></div>
						<div class='info' style = 'text-align:left;'>회원가입시기 : ${b.create_date}<br>
							흥미 : ${b.interesting}, 국적 : ${b.national}<br>
							E-MAIL : ${b.email}<br>
							<i class='fa fa-thumbs-o-up' style = 'font-size:13px;'></i> ${b.help_count}건의 도움되는 리뷰, 댓글<br>
							<i class='fas fa-pen-square'></i>${b.board_count}건 포스팅<br>
							<i class='fas fa-pen'></i>${b.reply_count}건의 도움글 작성
							</div>
							</div>
                  <div class="gray-text">
                  </div>
               </div>
            </div>
            <div class="col-lg-9 col-md-9 col-sm-6 col-xs-12 line_l" style = "height:auto; text-align:left">	
            	<br>
            	<h1 style = "padding-bottom:10px;">${ b.title }</h1>
            	<div class="summary" style = "padding-top:10px; font-size:18px">
					<span>${ b.text }</span>
            	</div>
            	<br>
            	
            	<div style = "padding-top:1px" >
            		<div class="fa" style = "width:100%">
            			<span class="ReviewUpDate" style = "padding-top:5px">
							리뷰 게시 날짜 : ${ b.modify_date }
            			</span>
            			&nbsp;
            			<span>|</span>
            			&nbsp;
            			<span class="ReviewUpDate" style = "padding-top:5px">
            				<i class="fa fa-thumbs-o-up" style = "font-size:14px; padding-top:5px; cursor:pointer" onclick = "RUp(this);">&nbsp;${ b.likey }</i>
            				<i class="fa fa-flag" style = "font-size:14px; padding-top:5px; float:right; cursor:pointer"><a onclick="reportWrite(this);"> 신고하기</a></i>
            				<input type = "hidden" value="${ b.m_id }">
            				<input type = "hidden" value="${ b.bid }">
            			</span>	
            		</div>
            		<div class = "tripDate">
            			<br>
            			<span style = "font-weight:bold">숙박시기 :</span>&nbsp;${ b.travel_date }
            		</div>
            	</div>
            	
            </div>
            
         </div>
         <!-- 여기사진넣고 그아래에 댓글 넣을거임 -->
         <c:if test="${ a.size() > 0 }">
         <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style = "height:220px; padding-top:20px; text-align:left">
         	<c:forEach var = "a" items = "${ a }">
         		<div class = "detailImgArea">
         			<img src = "/hello/resources/uploadFiles/board/${ a.changeName }" style = "width:190px; height:180px; padding-right:5px">
         		</div>
         	</c:forEach>
         </div>
         </c:if>
         <div id = "" class = "QAV" Style ="padding-top:10px">
            			<input type = "hidden" value = "${ b.bid }">
            			<textarea style="resize: none;" name = "text" rows="5" cols="110"></textarea>
            			<div style = "height:38px">
            			<button type="button" style = "float:left" class="btn btn-secondary" onclick = "insertA(this);">확인</button>
            			<button type="button" style = "float:left; margin-left:5px;" class="btn btn-secondary" onclick = "returnPage();">돌아가기</button>
            			</div>
            			<div style = "float:left; width:100%">
         				<c:if test="${ listRAnswer.size() > 0 }">
         					<c:forEach var = "list" items = "${ listRAnswer }">
         						<div class="summary" style = "padding-top:10px; font-size:20px; text-align:left">
            						${ list.content }
            					</div>
            					<div style = "text-align:left">
            				<span class="ReviewUpDate" style = "padding-top:5px">
            					${ list.modify_date }
            				</span>
            				<span>|</span> ${ list.nickname }님의 답변
            				<i class="fa fa-thumbs-o-up" style = "font-size:14px; padding-top:5px; cursor:pointer" onclick = "AUp(this);">&nbsp;${ list.help_point }</i>
            				<i class="fa fa-flag" style = "font-size:14px; padding-top:5px; float:right; cursor:pointer"><input type = "hidden" value = "${ list.m_id }"><input type = "hidden" value = "${ list.reply_id }"><a onclick="reportWriteA(this)"> 신고하기</a></i>
            				</div>
         					</c:forEach>
         				</c:if>
         				</div>
         </div>
       </div> 
          	
   </section>
   
   <!-- white bg -->
   <section class="tm-white-bg section-padding-bottom">
     
   </section>
   <jsp:include page="../common/footer.jsp"/>

<script>
function returnPage(){
	history.back();
}

function member_info(element){
	
	if($(element).parent().children().eq(2).css("visibility") == "visible"){
		$(element).parent().children().eq(2).css("visibility", "hidden");
	}else{
		$(element).parent().children().eq(2).css("visibility", "visible");
	}	
}

function insertA(element){
	if(${ sessionScope.loginUser != null && sessionScope.loginUser.mType.equals('1')}){
	var a = $(element).parent().parent().children().eq(1).val();
	var b = $(element).parent().parent().children().eq(0).val();
	
	console.log(b);
	console.log(a);
		$.ajax({
				url:"insertA.bo",
				type:"post",
				data:{text:a, bid:b},
				dataType:"json",
				success:function(data){
					$(element).parent().parent().children().eq(1).val("");
					location.reload();
				},error:function(data){
					console.log(data);
				}
		});
	}else{
		alert('로그인이 필요한 서비스입니다.');
	}
}

function RUp(element){
	var m_id = $(element).parent().children().eq(2).val();
	var ref_id = $(element).parent().children().eq(3).val();

	if(${ sessionScope.loginUser != null }){ 
		if(${!sessionScope.loginUser.mType.equals('admin')}){
	
			if(m_id != ${sessionScope.loginUser.mId}){
				$.ajax({
					url:"thumbsR.bo",
					type:"post",
					data:{target_id:m_id, ref_id:ref_id},
					dataType:"json",
					success:function(data){
						var t_Count = data.thumbsCount;
						$(element).text(" "+t_Count);
						alert(data.msg);
						
					},error:function(data){
						alert(data.msg);
					}
				});
		}else{
			alert("본인 글에는 (도움이 되었어요)를 할 수 없습니다");
		}
		}
	}else{
		alert("로그인이 필요한 기능 입니다.");
	}
}

function AUp(element){
	var m_id = $(element).parent().children().eq(3).children().eq(0).val();
	var reply_id = $(element).parent().children().eq(3).children().eq(1).val();

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
						$(element).text(" "+t_Count);
						alert(data.msg);
						
					},error:function(data){
						alert(data.msg);
					}
				});
		}else{
			alert("본인 글에는 (도움이 되었어요)를 할 수 없습니다");
		}
		}
	}else{
		alert("로그인이 필요한 기능 입니다.");
	}
}

function reportWrite(element){
	var m_id = $(element).parent().parent().children().eq(2).val();
	var ref_id = $(element).parent().parent().children().eq(3).val();
	var r_level = 0;
	
	if(${ sessionScope.loginUser != null && sessionScope.loginUser.mType.equals('1')})
		window.open('reportWrite.bo?m_id='+m_id+'&ref_id='+ref_id+'&r_level='+r_level, 'reportWrite', 'height=380, width=450, top=80, left=400 resizable=none, scrollbars=no');
	else{
		alert("로그인이 필요한 서비스 입니다.");
	}
}

function reportWriteA(element){
	var m_id = $(element).parent().children().eq(0).val();
	var ref_id = $(element).parent().children().eq(1).val();
	var r_level = 1;
	
	if(${ sessionScope.loginUser != null && sessionScope.loginUser.mType.equals('1')})
		window.open('reportWrite.bo?m_id='+m_id+'&ref_id='+ref_id+'&r_level='+r_level, 'reportWrite', 'height=380, width=450, top=80, left=400 resizable=none, scrollbars=no');
	else{
		alert("로그인이 필요한 서비스 입니다.");
	}
}


   function openMsg(){
	var mId = $("#mIdForMsg").val();
	var receiveId = $("#receiveIdForMsg").val();
	var nickname = $("#nicknameForMsg").val();
	window.open('sendView?mId='+mId+'&receiveId='+receiveId+'&nickname='+nickname, 'Hello', 'width=480px, height=580px, top=80px, left=400px');
   }
</script>
</body>
</html>
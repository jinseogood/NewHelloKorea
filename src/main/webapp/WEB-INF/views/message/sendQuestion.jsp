<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,700' rel='stylesheet' type='text/css'>
<link href="${ contextPath }/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="${ contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${ contextPath }/resources/css/bootstrap-datetimepicker.min.css" rel="stylesheet">  
<link href="${ contextPath }/resources/css/flexslider.css" rel="stylesheet">
<link href="${ contextPath }/resources/css/templatemo-style.css" rel="stylesheet">
<title>Message</title>
<style>
.msgTable{
   width:80%;
   margin-left:auto;
   margin-right:auto;
   font-size:11px;
}
th, td {
    text-align:center;
}
.pagination-sm>li>a, .pagination-sm>li>span{
    font-size:9px;
}
.header{
    font-size:12px;
    padding:3%;
}
 .outline{
    width:90%;
    margin-top:5%;
    margin-bottom:5%;
    margin-left:auto;
    margin-right:auto;
    border:1px solid lightgray;
    border-style:dotted;
    border-radius: 10px;
} 
</style>
</head>
<body>
<jsp:include page="../message/messageMenubar.jsp"/>
<div class="outline">
<div class="header">

<header class="panel-heading tab-bg-dark-navy-blue">
                                <ul class="nav nav-tabs">
                                    
                                    <li class="">
                                        <a data-toggle="tab" onclick="receiveMsg()">
                                            <i class="fa fa-envelope-o"></i>
                                                                                                 받은 메세지
                                        </a>
                                    </li>
                                    <li class="">
                                        <a data-toggle="tab" onclick="sendMsg()">
                                            <i class="fa fa-envelope-o"></i>
                                                                                                 보낸 메세지
                                        </a>
                                    </li>
                                    <li class="active">
                                        <a data-toggle="tab" href="#">
                                            <i class="fa fa-user"></i>
                                                                                                  문의하기
                                        </a>
                                    </li>
                                </ul>
                            </header>

</div>
<br>
<form action="insertQuestion" method="post">
<div class="msgTable">
<h4>관리자에게 1:1로 문의하기</h4>
<p>관리자에게 궁금한 점을 하단에 작성하시어 문의하기를 누르시면</p>
<p>메세지로 1:1 답변을 받으실 수 있습니다.</p>
<div><br>
						<div class="form-group">
						    <input type="hidden" id="mId" name="sendId" value="${mId}">
							<input type="text" id="title" name="title" class="form-control" placeholder="제목을 입력하세요" required/>
						</div>
						<div class="form-group">
							<textarea id="content" name="content" class="form-control" rows="6" placeholder="문의 내용을 입력하세요" required></textarea>
						</div>
						<div class="form-group">
							<button class="tm-submit-btn" type="submit" name="submit">문의하기</button> 
						</div>               
					</div>
</div>
</form>
</div>
                                    
                                   <script>
                                        function sendMsg(){
                                        	var mId = $("#mId").val();
                                        	location.href="sendMessageView?mId="+mId;
                                        }
                                        function receiveMsg(){
                                        	var mId = $("#mId").val();
                                        	location.href="receiveMessageView?mId="+mId;
                                        }
                                   </script>
</body>
</html>
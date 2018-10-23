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

label{
    margin-top:2%;
}
#btnArea{
    margin-top:3%;
    margin-bottom:3%;
}
.form-control[readonly]{
    background-color:white;
}
</style>
</head>
<body>
<jsp:include page="../message/messageMenubar.jsp"/>
<div class="outline">
<div class="header">

<header class="panel-heading tab-bg-dark-navy-blue">
                                <ul class="nav nav-tabs">
                                    
                                    <li class="active">
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
                                    <li class="">
                                        <a data-toggle="tab" onclick="sendQuestion()">
                                            <i class="fa fa-user"></i>
                                                                                                  문의하기
                                        </a>
                                    </li>
                                </ul>
                            </header>


</div>
<div class="msgTable">
<form action="sendMessage" method="post">
<label for="title" class="col-lg-2 col-sm-2 control-label">&nbsp;제목</label>
<div class="col-lg-10">
                             <input type="hidden" id="receiveId" name="receiveId" value="${receiveId}">
							<input type="text" id="title" name="title" class="form-control" placeholder="제목">
						</div>
						<label for="nickname" class="col-lg-2 col-sm-2 control-label">&nbsp;받는이</label>
						<div class="col-lg-10">
							<input type="text" id="nickname" name="nickname" class="form-control" placeholder="${nickname}" readonly/>
						</div>
						<label for="content" class="col-lg-2 col-sm-2 control-label">&nbsp;내용</label>
						<div class="col-lg-10">
							<textarea id="content" name="content" class="form-control" rows="6" placeholder="내용"></textarea>
						</div>
						<div class="col-lg-10" align="center" id="btnArea">
						    
							<button class="btn btn-info" type="submit">&nbsp;&nbsp;발송&nbsp;&nbsp;</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="hidden" id="mId" name="sendId" value="${mId}">
							<button class="btn btn-flat" onclick="receiveMsg()" type="button">&nbsp;&nbsp;취소&nbsp;&nbsp;</button> 
						</div> 

</form>
</div>


 </div>
                                    
       <script>
          function receiveMsg(){
             var mId = $("#mId").val();
             location.href="receiveMessageView?mId="+mId;
          }
          function sendMsg(){
        	 var mId = $("#mId").val();
             location.href="sendMessageView?mId="+mId;
          }
          function sendQuestion(){
         	 var mId = $("#mId").val();
             location.href="sendQuestionView?mId="+mId;
           }
                                   </script>
</body>
</html>
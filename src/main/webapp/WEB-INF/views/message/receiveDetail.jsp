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
<div align="right"><a onclick="report()"><i class="fa fa-flag"> </i> 신고하기</a></div>
<label for="title" class="col-lg-2 col-sm-2 control-label">&nbsp;제목</label>
<div class="col-lg-10">

							<input type="text" id="title" class="form-control" placeholder="${m.title}" readonly/>
						</div>
						<label for="nickname" class="col-lg-2 col-sm-2 control-label">&nbsp;보낸이</label>
						<div class="col-lg-10">
							<input type="text" id="nickname" class="form-control" placeholder="${m.nickname}" readonly/>
						</div>
					    <label for="sendDate" class="col-lg-2 col-sm-2 control-label">&nbsp;보낸날짜</label>
						<div class="col-lg-10">
							<input type="text" id="sendDate" class="form-control" placeholder="${m.sendDate}" readonly/>
						</div>
						<label for="content" class="col-lg-2 col-sm-2 control-label">&nbsp;내용</label>
						<div class="col-lg-10">
							<textarea id="content" class="form-control" rows="4" placeholder="${m.content}" readonly></textarea>
						</div>
						<div class="form-group" align="center" id="btnArea">
						    <form action="sendView" method="post">
						    <input type="hidden" id="mId" name="mId" value="${m.receiveId}">
						    <button class="btn btn-success" type="button" onclick="receiveMsg()">&nbsp;&nbsp;목록&nbsp;&nbsp;</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<c:if test="${ m.sendId != 0}">
							<input type="hidden" id="receiveId" name="receiveId" value="${m.sendId}">
							<input type="hidden" id="nickname" name="nickname" value="${m.nickname}">
							<button class="btn btn-info" onclick="send()">&nbsp;&nbsp;답장&nbsp;&nbsp;</button>
							</c:if>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="hidden" id="msgId" value="${m.msgId}">
							<button class="btn btn-flat" onclick="deleteMsg()" type="button">&nbsp;&nbsp;삭제&nbsp;&nbsp;</button>
							</form> 
						</div> 


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
      function report(){
         if(confirm('정말 신고하시겠습니까?')){
        	var m_id = ${m.sendId};
     		var ref_id = ${m.msgId};
     		var r_level = 2;
			
     		if( m_id != 0 ){
     			if(${ sessionScope.loginUser != null && sessionScope.loginUser.mType.equals('1')}){
     				window.open('reportWrite.bo?m_id='+m_id+'&ref_id='+ref_id+'&r_level='+r_level, 'reportWrite', 'height=380, width=450, top=80, left=400 resizable=none, scrollbars=no');
     			}
     			else{
     				alert("로그인이 필요한 서비스 입니다.");
     			}
     		}else{
     			alert("관리자 메세지는 신고할 수 없습니다.");
     		}	
         }
      }
      function deleteMsg(){
    	  if (confirm('정말 삭제하시겠습니까?')) {
    		  var mId = $("#mId").val();
    		  var msgId = $("#msgId").val();
    		  location.href="deleteMessage?msgId="+msgId+"&mId="+mId;
          }
      }
  </script>
</body>
</html>
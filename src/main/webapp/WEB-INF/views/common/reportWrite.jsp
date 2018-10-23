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
<title>Report</title>
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

.title{
    width:100%;
    height:45px;
    background-color:#00aef0;
    color:white;
}
</style>
</head>
<body>
<div class="title">
<h2>&nbsp;&nbsp;&nbsp;Report</h2>
</div>
<div class="outline">
<div class="header">

<header class="panel-heading tab-bg-dark-navy-blue">
                                <ul class="nav nav-tabs">
                                    <li class="active">
                                        <a data-toggle="tab" href="#">
                                            <i class="fa fa-user"></i>
                                                                                                  신고하기
                                        </a>
                                    </li>
                                </ul>
                            </header>

</div>
<br>
<div class="msgTable">
<h4>관리자에게 신고하기</h4>
<p>적절한 신고사유를 하단에 작성하시어 신고하기를 누르시면</p>
<p>확인 후 해당 글을 삭제 처리하겠습니다.</p>
<div><br>
						<!-- <div class="form-group">
							<input type="text" id="contact_subject" class="form-control" placeholder="제목을 입력하세요" required/>
						</div>
						<div class="form-group">
							<textarea id="contact_message" class="form-control" rows="6" placeholder="신고 내용을 입력하세요" required></textarea>
						</div> -->
						<!-- <form action = "insertReport.bo" method = "post"> -->
							<select id = "reason" name = "reason">
								<option value = "집단간 싸움 유발(학과, 직업간 서열/비교, 지역감정, 종교 등)">집단간 싸움 유발(학과, 직업간 서열/비교, 지역감정, 종교 등)</option>
								<option value = "성 관련 순환주제(양성평등, 군대, 혼전순결, 외모/몸매 등)">성 관련 순환주제(양성평등, 군대, 혼전순결, 외모/몸매 등)</option>
								<option value = "욕설, 비속어, 인신공격(심한 불쾌감 유발)">욕설, 비속어, 인신공격(심한 불쾌감 유발)</option>
								<option value = "선정적, 음란성(신고자가 선정적이라고 판단)">선정적, 음란성(신고자가 선정적이라고 판단)</option>
								<option value = "낚시성, 도배, 무의미(무의미한 짧은 글 포함)">낚시성, 도배, 무의미(무의미한 짧은 글 포함)</option>
								<option value = "기타(악성코드, 홍보성, 사생활침해 등)">기타(악성코드, 홍보성, 사생활침해 등)</option>
							</select>
							<input type = "hidden" id = "r_target" name = "r_target" value = "${ m_id }">
							<input type = "hidden" id = "ref_id" name = "ref_id" value = "${ ref_id }">
							<input type = "hidden" id = "r_level" name = "r_level" value = "${ r_level }">
							<br><br>
							<div class="form-group">
								<button class="tm-submit-btn" type="button" onclick = "report();">신고하기</button> 
							</div>        
						<!-- </form>   -->     
					</div>
</div>
</div>
                                    
                                   <script>
                                        function sendMsg(){
                                        	location.href="sendMessageView";
                                        }
                                        function recieveMsg(){
                                        	location.href="recieveMessageView";
                                        }
                                        function report(){
                                        	var reason = $("#reason").val();
                                        	var r_target = $("#r_target").val();
                                        	var ref_id = $("#ref_id").val();
                                        	var r_level = $("#r_level").val();
                                        	//console.log(reason);
                                        	//console.log(r_target);
                                        	//console.log(ref_id);
                                        	
                                        	$.ajax({
                                        		url:"insertReport.bo",
                                        		type:"post",
                                        		data:{reason:reason, r_target:r_target, ref_id:ref_id, r_level:r_level},
                                        		dataType:"json",
                                        		success:function(data){
                                        			alert(data.msg);
                                        			window.close();
                                        		},error:function(data){
                                        			
                                        		}
                                        	})
                                        	
                                        	//location.href = "insertReport.bo?reason="+reason+"&r_target="+r_target+"&ref_id="+ref_id;
                                        }
                                   </script>
</body>
</html>
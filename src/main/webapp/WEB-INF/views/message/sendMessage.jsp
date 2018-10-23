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
   min-height:290px;
}
th, td {
    text-align:center;
}
#msgTable tr:hover{
    cursor:pointer;
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
    min-height:485px;
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
                                    <li class="active">
                                        <a data-toggle="tab" href="#">
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
<br>
<div class="msgTable">
<table class="table table-condensed" id="msgTable">
    <tr>
        <th><input type="hidden" id="mId" value="${mId}"></th>
        <th style="width: 130px">제목</th>
        <th style="width: 67px">받는이</th>
        <th style="width: 67px">보낸 날짜</th>
        <th style="width: 67px">읽은 날짜</th>
    </tr>
    <c:forEach var="m" items="${ list }">
    <tr>
        <td>${m.msgId}</td>
        <th scope="row">${m.title}</th>
        <td>${m.nickname}</td>
        <td>${m.sendDate}</td>
        <c:if test="${ m.readDate == null}">
        <td>읽지 않음</td>
        </c:if>
        <c:if test="${ m.readDate != null }">
        <td>${m.readDate}</td>
        </c:if>
    </tr>
    </c:forEach>
    </table>
</div>

<div class="paging" align="center">
<ul class="pagination pagination-sm">
<c:if test="${ pi.currentPage <= 1 }">
<li><a>&laquo;</a></li>
            </c:if>
            <c:if test="${ pi.currentPage > 1 }">
                <c:url var="mlistBack" value="sendMessageView">
                    <c:param name="mId" value="${list.get(0).sendId}"/>
                    <c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
                </c:url>
                <li><a href="${ mlistBack }">&laquo;</a></li>
            </c:if>
            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                <c:if test="${ p eq pi.currentPage }">
                <li><a href="#" style="background-color:#ddd;">${ p }</a></li>               
                </c:if>
                <c:if test="${ p ne pi.currentPage }">
                    <c:url var="mlistCheck" value="sendMessageView">
                         <c:param name="mId" value="${list.get(0).sendId}"/>
                         <c:param name="currentPage" value="${ p }"/>
                    </c:url>
                    <li><a href="${ mlistCheck }">${ p }</a></li>  
                </c:if>
            </c:forEach>
            <c:if test="${ pi.currentPage >= pi.maxPage }">
                <li><a>&raquo;</a></li>
            </c:if>
            <c:if test="${ pi.currentPage < pi.maxPage }">
                <c:url var="mlistEnd" value="sendMessageView">
                    <c:param name="mId" value="${list.get(0).sendId}"/>
                    <c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
                </c:url>
                <li><a href="${ mlistEnd }">&raquo;</a></li>
            </c:if>
            </ul>
    </div>
    </div>
    <script>
    $(function(){
    	<% for(int i = 0; i < 11; i++){%>
  		$("#msgTable tr").eq(<%=i%>).children().eq(0).hide();
  		<% } %>
    })
    
    $(function(){
           $("#msgTable tr").click(function(){
        	   if($(this).children().eq(0).text() != ''){
        	   var msgId = $(this).children().eq(0).text();
        	   location.href="sendDetailView?msgId="+msgId;
        	   }
           });
   		
  	  });
    
       function receiveMsg(){
    	 var mId = $("#mId").val();
         location.href="receiveMessageView?mId="+mId;
      }
       function sendQuestion(){
      	 var mId = $("#mId").val();
           location.href="sendQuestionView?mId="+mId;
        }
    </script>
</body>
</html>
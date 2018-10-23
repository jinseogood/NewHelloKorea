<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Korea</title>
<style>

.tableArea{
    width:80%;
    margin-left:auto;
    margin-right:auto;
    min-height:480px;
}
.titleArea{
    padding:3%;
    width:70%;
    margin-left:auto;
    margin-right:auto;
}
.paging{
    padding:2%;
    margin-bottom:5%;
}
.searchArea{
    width:60%; 
    margin-bottom:6%;
    margin-left:auto;
    margin-right:auto;
}
table.type09 {
    width:80%;
    border-collapse: collapse;
    text-align: center;
    line-height: 1.5;

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    text-align: center;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.type09 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    text-align: center;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.type09 tr:hover{
    cursor:pointer;
}
.modal-body{
    width:90%;
    margin-left:auto;
    margin-right:auto;
    
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="../common/adminMenubar.jsp"/>
	<div class="main">
	
	<div class="titleArea">
	<div class="row">
                        <div class="col-md-12">
                            <!--breadcrumbs start -->
                            <ul class="breadcrumb">
                                <li><a href="myPageView.ad"><i class="fa fa-home"></i> Home</a></li>
                                <li><a href="selectReportList.ad">일반회원 관리</a></li>
                                <li><a href="selectQuestionList.ad">문의현황</a></li>
                            </ul>
                            <!--breadcrumbs end -->
                        </div>
                    </div>
	
	
	</div>
	<div class="searchArea" align="center">
	
 <form action="selectQuestionList.ad" onsubmit="return checkForm();">
			<div class="col-xs-8 col-xs-offset-2">
		    <div class="input-group">
                <div class="input-group-btn search-panel">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    	<span id="search_concept">검색 카테고리</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                      <li><a href="#qRecordId" class="search">문의번호</a></li>
                      <li><a href="#sendId" class="search">문의자</a></li>
                      <li><a href="#noP" class="search">미처리건</a></li>
                      <li class="divider"></li>
                      <li><a href="#datePick" onclick="showDatePicker()">문의일</a></li>
                    </ul>
                </div>
                <input type="hidden" name="searchParam" value="all" id="searchParam">                       
                <input type="text" class="form-control" id="searchWord" name="searchWord" placeholder="검색어를 입력하세요">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                </span>
                </form>
            </div>
            
            
            <div id="datePicker">
            <br>
            <jsp:include page="../common/datePicker.jsp"/>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <button class="btn btn-white" type="submit">&nbsp;조회&nbsp;</button>
            <br>
            </div>
            
                </div>
                </div>
        </div>
	
	<script>
	 $(function(){
    	 $("#datePicker").hide();
     });
	 
	 $(document).ready(function(e){
		 $(".search").click(function(e){
			 $("#datePicker").hide();
		 });
	 });
	 
     function showDatePicker(){
    	 $("#datePicker").show();
    	 
     }
     
     function checkForm(){
    	 var searchWord = $('#searchWord').val();
		 var param = $('.input-group #searchParam').val();
		 if(param=='qRecordId'){
				if(isNaN(searchWord)){
					alert("문의 번호는 숫자만 입력 가능합니다.");
					return false;
				}
			}
		 if(param=='sendId'){
			 if(isNaN(searchWord)){
					alert("문의자는 숫자만 입력 가능합니다.");
					return false;
				}
		 }
		 return true;
      }
     
	$(document).ready(function(e){
	    $('.search-panel .dropdown-menu').find('a').click(function(e) {
			e.preventDefault();
			var param = $(this).attr("href").replace("#","");
			var concept = $(this).text();
			$('.search-panel span#search_concept').text(concept);
			$('.input-group #searchParam').val(param);
		});
	});
	
	</script>
			
	<div class="tableArea" align="center" id="questionTable">
<table class="type09">
    <thead>
    <tr>
        <th style="width:10%">문의번호</th>
        <th style="width:10%">문의자</th>
        <th style="width:50%">문의 제목</th>
        <th style="width:15%">문의일</th>
        <th style="width:15%">처리상황</th>
        <th></th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${category != null}">
    <tr>
    <th colspan="7">검색 카테고리 : ${category}, 검색어 : ${word} 의 결과</th>
    </tr>
    </c:if>
    <c:forEach var="q" items="${ list }">
    <tr>
        <th scope="row">${q.qRecordId}</th>
        <td>${q.sendId}</td>
        <td>${q.title}</td>
        <td>${q.sendDate}</td>
        <td>${q.status}</td>
        <td>${q.content}</td>
        <td>${q.msgId}</td>
    </tr>
    </c:forEach>
    
    </tbody>
</table>
</div>
<div class="paging" align="center">
<ul class="pagination pagination-sm">
<c:if test="${ pi.currentPage <= 1 }">
<li><a>&laquo;</a></li>
            </c:if>
            <c:if test="${ pi.currentPage > 1 }">
                <c:url var="qlistBack" value="selectQuestionList.ad">
                    <c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
                </c:url>
                <li><a href="${ qlistBack }">&laquo;</a></li>
            </c:if>
            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                <c:if test="${ p eq pi.currentPage }">
                <li><a href="#" style="background-color:#ddd;">${ p }</a></li>               
                </c:if>
                <c:if test="${ p ne pi.currentPage }">
                    <c:url var="qlistCheck" value="selectQuestionList.ad">
                         <c:param name="currentPage" value="${ p }"/>
                    </c:url>
                    <li><a href="${ qlistCheck }">${ p }</a></li>  
                </c:if>
            </c:forEach>
            <c:if test="${ pi.currentPage >= pi.maxPage }">
                <li><a>&raquo;</a></li>
            </c:if>
            <c:if test="${ pi.currentPage < pi.maxPage }">
                <c:url var="qlistEnd" value="selectQuestionList.ad">
                    <c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
                </c:url>
                <li><a href="${ qlistEnd }">&raquo;</a></li>
            </c:if>
            </ul>
    </div>


	</div> 

	
	<jsp:include page="../common/footer.jsp"/>
	
	<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal-1" class="modal fade">
                                      <div class="modal-dialog">
                                          <div class="modal-content">
                                              <div class="modal-header">
                                                  <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                                                  <h4 class="modal-title" align="center" style="font-weight: bold;">문의 답변하기</h4>
                                              </div>
                                              <div class="modal-body">
                                                  <br>
                                                  <form class="form-horizontal" role="form">
                                                      <div class="form-group">
                                                          <label for="qRecordId" class="col-lg-2 col-sm-2 control-label">문의번호</label>
                                                          <div class="col-lg-10">
                                                              <input type="text" class="form-control" id="qRecordId" readonly>
                                                              <input type="hidden" class="form-control" id="msgId">
                                                          </div>
                                                      </div>
                                                      <div class="form-group">
                                                          <label for="sendId" class="col-lg-2 col-sm-2 control-label">문의자</label>
                                                          <div class="col-lg-10">
                                                              <input type="text" class="form-control" id="sendId" readonly>
                                                          </div>
                                                      </div>
                                                      <div class="form-group">
                                                          <label for="sendDate" class="col-lg-2 col-sm-2 control-label">문의일</label>
                                                          <div class="col-lg-10">
                                                              <input type="text" class="form-control" id="sendDate" readonly>
                                                          </div>
                                                      </div>
                                                      <div class="form-group">
                                                          <label for="title" class="col-lg-2 col-sm-2 control-label">문의제목</label>
                                                          <div class="col-lg-10">
                                                              <input type="text" class="form-control" id="title" readonly>
                                                          </div>
                                                      </div>
                                                      <div class="form-group">
                                                          <label for="content" class="col-lg-2 col-sm-2 control-label">문의내용</label>
                                                          <div class="col-lg-10">
                                                              <textArea class="form-control" id="content" style="height:300px;" readonly>
                                                              </textArea>
                                                          </div>
                                                      </div>
                                                      
                                              <div id="sendAnswer">
                                                      <div class="form-group">
                                                          <label for="content2" class="col-lg-2 col-sm-2 control-label">답변내용</label>
                                                          <div class="col-lg-10">
                                                              <textArea class="form-control" id="content2" style="height:300px;">
                                                              </textArea>
                                                          </div>
                                                      </div>
                                                      
                                                      
                                              <br>
                                                      <div class="form-group" align="center">
                                                              <button type="button" class="btn btn-info" onclick="answerQuestion()">문의답변 발송하기</button>
                                                          
                                                      </div>
                                                  </div>    
                                                  </form>

                                              </div>

                                          </div>
                                      </div>
                                  </div>
                                  
                                  	
	<script>
		$(function(){
			<% for(int i = 0; i < 11; i++){%>
			$("#questionTable tr").eq(<%=i%>).children().eq(5).hide();
			$("#questionTable tr").eq(<%=i%>).children().eq(6).hide();
			<% } %>
			
			$("#questionTable tr").click(function(){
				if($(this).children().eq(5).text()!=''){
					
				
				$("#qRecordId").val($(this).children().eq(0).text());
				$("#msgId").val($(this).children().eq(6).text());
				$("#sendId").val($(this).children().eq(1).text());
				$("#sendDate").val($(this).children().eq(3).text());
				$("#title").val($(this).children().eq(2).text());
				$("#content").text($(this).children().eq(5).text());
				
				var status = $(this).children().eq(4).text();
				
				if(status == '처리완료'){
					$("#sendAnswer").hide();
				}else{
					$("#sendAnswer").show();
				}
				
				$(this).attr({"data-toggle":"modal", "data-target":"#myModal-1"});
				
				}
			});
		});
		
		function answerQuestion(){
			var msgId = $("#msgId").val();
			var receiveId = $("#sendId").val();
			var content = $("#content2").val();
			location.href="answerQuestion.ad?receiveId="+receiveId+"&msgId="+msgId+"&content="+content;
		}
	</script>

</body>
</html>
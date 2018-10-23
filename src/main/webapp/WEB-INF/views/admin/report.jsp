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
.tableArea{
    width:80%;
    margin-left:auto;
    margin-right:auto;
}
.titleArea{
    padding:3%;
    width:70%;
    margin-left:auto;
    margin-right:auto;
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
                                <li><a href="selectReportList.ad">신고현황</a></li>
                            </ul>
                            <!--breadcrumbs end -->
                        </div>
                    </div>
	
	
	</div>
	<div class="searchArea" align="center">
 <form action="selectReportList.ad" onsubmit="return checkForm();">
			<div class="col-xs-8 col-xs-offset-2">
		    <div class="input-group">
                <div class="input-group-btn search-panel">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    	<span id="search_concept">검색 카테고리</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                      <li><a href="#rRecordId" class="search">신고 번호</a></li>
                      <li><a href="#rTarget" class="search">신고 대상</a></li>
                      <li><a href="#noResult" class="search">미 처리건</a></li>
                      <li class="divider"></li>
                      <li><a href="#datePick" onclick="showDatePicker()">신고일</a></li>
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
		 if(param=='rRecordId'){
				if(isNaN(searchWord)){
					alert("신고 번호는 숫자만 입력 가능합니다.");
					return false;
				}
			}
		 if(param=='rTarget'){
			 if(isNaN(searchWord)){
					alert("신고 대상은 숫자만 입력 가능합니다.");
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
	
	<div class="tableArea" align="center">
<table class="type09" id="reportTable">
    <thead>
    <tr>
        <th style="width:10%">신고번호</th>
        <th style="width:10%">구분</th>
        <th style="width:10%">신고대상</th>
        <th style="width:15%">신고일</th>
        <th style="width:40%">신고사유</th>
        <th style="width:15%">처리상황</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${category != null}">
    <tr>
    <th colspan="7">검색 카테고리 : ${category}, 검색어 : ${word} 의 결과</th>
    </tr>
    </c:if>
    <c:forEach var="r" items="${ list }">
    <tr>
        <th scope="row">${r.rRecordId}</th>
        <td>${r.rLevelText}</td>
        <td>${r.rTarget}</td>
        <td>${r.rDate}</td>
        <td>${r.reason}</td>
        <td>${r.resultText}</td>
        <td>${r.refId}</td>
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
                <c:url var="rlistBack" value="selectReportList.ad">
                    <c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
                </c:url>
                <li><a href="${ rlistBack }">&laquo;</a></li>
            </c:if>
            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                <c:if test="${ p eq pi.currentPage }">
                <li><a href="#" style="background-color:#ddd;">${ p }</a></li>               
                </c:if>
                <c:if test="${ p ne pi.currentPage }">
                    <c:url var="rlistCheck" value="selectReportList.ad">
                         <c:param name="currentPage" value="${ p }"/>
                    </c:url>
                    <li><a href="${ rlistCheck }">${ p }</a></li>  
                </c:if>
            </c:forEach>
            <c:if test="${ pi.currentPage >= pi.maxPage }">
                <li><a>&raquo;</a></li>
            </c:if>
            <c:if test="${ pi.currentPage < pi.maxPage }">
                <c:url var="rlistEnd" value="selectReportList.ad">
                    <c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
                </c:url>
                <li><a href="${ rlistEnd }">&raquo;</a></li>
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
                                                  <h4 class="modal-title" align="center" style="font-weight: bold;">블랙리스트 등록하기</h4>
                                              </div>
                                              <div class="modal-body">
                                                  <br>
                                                  <form class="form-horizontal">
                                                      <div class="form-group">
                                                          <label for="rRecordId" class="col-lg-2 col-sm-2 control-label">신고번호</label>
                                                          <div class="col-lg-10">
                                                              <input type="text" class="form-control" id="rRecordId" readonly>
                                                              <input type="hidden" id="rLevel" name="rLevel">
                                                              <input type="hidden" id="refId" name="refId">
                                                          </div>
                                                      </div>
                                                      <div class="form-group">
                                                          <label for="reportedId" class="col-lg-2 col-sm-2 control-label">신고대상</label>
                                                          <div class="col-lg-10">
                                                              <input type="text" class="form-control" id="rTarget" readonly>
                                                          </div>
                                                      </div>
                                                      <div class="form-group">
                                                          <label for="reportId" class="col-lg-2 col-sm-2 control-label">신고자</label>
                                                          <div class="col-lg-10">
                                                              <input type="text" class="form-control" id="mId" readonly>
                                                          </div>
                                                      </div>
                                                      <div class="form-group">
                                                          <label for="rDate" class="col-lg-2 col-sm-2 control-label">신고일</label>
                                                          <div class="col-lg-10">
                                                              <input type="text" class="form-control" id="rDate" readonly>
                                                          </div>
                                                      </div>
                                                      <div class="form-group">
                                                          <label for="reason" class="col-lg-2 col-sm-2 control-label">신고사유</label>
                                                          <div class="col-lg-10">
                                                              <input type="text" class="form-control" id="reason" readonly>
                                                          </div>
                                                      </div>
                                                      <div class="form-group">
                                                          <label for="text" class="col-lg-2 col-sm-2 control-label">신고내용</label>
                                                          <div class="col-lg-10">
                                                              <textArea class="form-control" id="rContent" style="height:300px;" readonly>
                                                              </textArea>
                                                          </div>
                                                      </div>
                                                      
                                                      
                                                      <div id="blacklist">
                                                      
                                                      <label class="col-lg-2 col-sm-2 control-label">기간</label>
                                                      <div class="radio" align="center">
                                                      
                                                  <label>
                                                      <input type="radio" name="radioBtn" value="7" checked="">
                                                      7일&nbsp;&nbsp;
                                                  </label>
                                              
                                                  <label>
                                                      <input type="radio" name="radioBtn" value="15">
                                                      15일&nbsp;&nbsp;
                                                  </label>
                                                  <label>
                                                      <input type="radio" name="radioBtn" value="30">
                                                      30일&nbsp;&nbsp;
                                                  </label>
                                                  <label>
                                                      <input type="radio" name="radioBtn" value="0">
                                                      영구정지
                                                  </label>
                                              </div>
                                                      <br>
                                                      <div class="form-group" align="center">
                                                              <button type="button" class="btn btn-info" onclick="insertBlacklist()">블랙리스트 등록</button>
                                                              <button type="button" class="btn btn-success" onclick="refuseReport()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;반려하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
                                                          
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
		$("#reportTable tr").eq(<%=i%>).children().eq(6).hide();
		<% } %>
		
	});
	
	$(function(){
		$("#reportTable tr").click(function(){
			if($(this).children().eq(6).text()!=''){
		    var rLevelText = $(this).children().eq(1).text();
		    var rLevel = -99;
		    var refId = $(this).children().eq(6).text();
		    if(rLevelText == '게시글'){
		    	rLevel = 0;
		    }else if(rLevelText == '댓글'){
		    	rLevel = 1;
		    }else{
		    	rLevel = 2;
		    }
			
			  $.ajax({
				url:"selectReportOne.ad",
				type:"POST",
				data:{rLevel:rLevel,
					  refId:refId},
				success:function(data){
					console.log(data);
					if(data.rLevel == 0 || data.rLevel == 1){
						$("#rRecordId").val(data.rRecordId0+', '+data.rRecordId1+', '
					            +data.rRecordId2+', '+data.rRecordId3+', '
					            +data.rRecordId4);
						$("#mId").val(data.mId0+', '+data.mId1+', '+data.mId2+', '
							      +data.mId3+', '+data.mId4);
					    $("#rDate").val(data.rDate0+', '+data.rDate1+', '+data.rDate2+', '+
							            data.rDate3+', '+data.rDate4);
					    $("#reason").val(data.reason0+', '+data.reason1+', '+data.reason2+', '
							             +data.reason3+', '+data.reason4);
					}else{
						$("#rRecordId").val(data.rRecordId0);
						$("#mId").val(data.mId0);
						$("#rDate").val(data.rDate0);
						$("#reason").val(data.reason0);
					}
					
					$("#rTarget").val(data.rTarget);
					$("#rContent").val(data.rContent);
					$("#rLevel").val(data.rLevel);
					$("#refId").val(data.refId);
					
					if(data.result == 'Y' || data.result == 'N'){
						$("#blacklist").hide();
					}else{
						$("#blacklist").show();
					}
						
				},
				error:function(data){
					console.log("에러");
					console.log(data);
				}
			});
		
			$(this).attr({"data-toggle":"modal", "data-target":"#myModal-1"});
			}
		});
		
	});
	


	
	function insertBlacklist(){
		
		var rLevel = $("#rLevel").val();
		var refId = $("#refId").val();
		var period = $('input[name="radioBtn"]:checked').val();
	    var rTarget = $("#rTarget").val();
	    var reason = $("#reason").val();
	    	
		location.href="insertBlacklist.ad?rLevel="+rLevel+"&refId="+refId
				      +"&period="+period+"&rTarget="+rTarget+"&reason="+reason;
	}
	
	function refuseReport(){
		var rLevel = $("#rLevel").val();
		var refId = $("#refId").val();
		location.href="refuseReport.ad?rLevel="+rLevel+"&refId="+refId;
		
	}
</script>
</body>
</html>
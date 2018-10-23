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
#detailBtn{
    font-size:12px;
    line-height:0.8;
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
                                <li><a href="selectCompanyList.ad">제휴업체 관리</a></li>
                                <li><a href="selectCompanyList.ad">업체 승인·관리</a></li>
                            </ul>
                            <!--breadcrumbs end -->
                        </div>
                    </div>
	
	
	</div>
	<div class="searchArea" align="center">
    <form action="selectCompanyList.ad" onsubmit="return checkForm();">
			<div class="col-xs-8 col-xs-offset-2">
		    <div class="input-group">
                <div class="input-group-btn search-panel">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    	<span id="search_concept">검색 카테고리</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                      <li><a href="#crId" class="search">등록번호</a></li>
                      <li><a href="#cName" class="search">업체명</a></li>
                      <li><a href="#cPhone" class="search">연락처</a></li>
                      <li><a href="#noA" class="search">미승인건</a></li>
                      <li class="divider"></li>
                      <li><a href="#datePick" onclick="showDatePicker()">신청일</a></li>
                      <li><a href="#datePick2" onclick="showDatePicker()">승인일</a></li>
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
		 if(param=='crId'){
				if(isNaN(searchWord)){
					alert("등록 번호는 숫자만 입력 가능합니다.");
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
<table class="type09" id="companyTable">
    <thead>
    <tr>
        <th style="width:9%">등록번호</th>
        <th style="width:50%">업체명</th>
        <th style="width:17%">연락처</th>
        <th style="width:12%">신청일</th>
        <th style="width:12%">승인일</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${category != null}">
    <tr>
    <th colspan="5">검색 카테고리 : ${category}, 검색어 : ${word} 의 결과</th>
    </tr>
    </c:if>
    <c:forEach var="c" items="${ list }">
    <tr>
        <th scope="row">${c.crId}</th>
        <td>${c.cName}</td>
        <c:if test="${c.cPhone != 'undefined'}">
        <td>${c.cPhone}</td>
        </c:if>
        <c:if test="${c.cPhone == 'undefined'}">
        <td></td>
        </c:if>
        <td>${c.crDate}</td>
        <td>${c.apDate}</td>
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
                <c:url var="clistBack" value="selectCompanyList.ad">
                    <c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
                </c:url>
                <li><a href="${ clistBack }">&laquo;</a></li>
            </c:if>
            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                <c:if test="${ p eq pi.currentPage }">
                <li><a href="#" style="background-color:#ddd;">${ p }</a></li>               
                </c:if>
                <c:if test="${ p ne pi.currentPage }">
                    <c:url var="clistCheck" value="selectCompanyList.ad">
                         <c:param name="currentPage" value="${ p }"/>
                    </c:url>
                    <li><a href="${ clistCheck }">${ p }</a></li>  
                </c:if>
            </c:forEach>
            <c:if test="${ pi.currentPage >= pi.maxPage }">
                <li><a>&raquo;</a></li>
            </c:if>
            <c:if test="${ pi.currentPage < pi.maxPage }">
                <c:url var="clistEnd" value="selectCompanyList.ad">
                    <c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
                </c:url>
                <li><a href="${ clistEnd }">&raquo;</a></li>
            </c:if>
            </ul>
    </div>
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
	
	$(function(){
		$("#companyTable tr").click(function(){
			if($(this).children().eq(0).text()!='등록번호'){
		    var crId = $(this).children().eq(0).text();
			location.href="selectOneCompany.ad?crId="+crId;
			}
		});
	});
	</script>
</body>
</html>
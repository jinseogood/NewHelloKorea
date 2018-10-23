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
.searchResult{
width:80%;
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
	#reservationDetailTable{
		width:500px;
		line-height: 1.5;
	}
	#reservationDetailTable tr{
		height:30px;
	}
	#reservationDetailTable th{
		padding: 3px;
	    text-align: center;
	    vertical-align: middle;
	    border-right: 3px solid #036;
	    background: #f3f6f7;
	}
	#reservationDetailTable select{
		margin: 3px;
	}
	#reservationDetailTable td{
	    padding: 3px;
	    vertical-align: middle;
	    border: 1px solid #ccc;
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
                                <li><a href="selectReservationList.ad">예약내역 관리</a></li>
                                <li><a href="selectReservationList.ad">예약내역 조회</a></li>
                            </ul>
                            <!--breadcrumbs end -->
                        </div>
                    </div>
	
	
	</div>
			<div class="searchArea" align="center">
			<form action="selectReservationList.ad" onsubmit="return checkForm();">
			<div class="col-xs-8 col-xs-offset-2">
		    <div class="input-group">
                <div class="input-group-btn search-panel">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    	<span id="search_concept">검색 카테고리</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                      <li><a href="#oId" class="search">예약 번호</a></li>
                      <li><a href="#cName" class="search">예약처</a></li>
                      <li><a href="#paName" class="search">예약자</a></li>
                      <li class="divider"></li>
                      <li><a href="#datePick" onclick="showDatePicker()">숙박일</a></li>
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
		 if(param=='oId'){
				if(isNaN(searchWord)){
					alert("예약 번호는 숫자만 입력 가능합니다.");
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
<table class="type09" id="reservationTable">
    <thead>
    <tr>
        <th style="width:9%">예약번호</th>
        <th style="width:40%">예약처</th>
        <th style="width:10%">예약자</th>
        <th style="width:20%">숙박일</th>
        <th style="width:12%">예약일</th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th style="width:9%">결제상황</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${category != null}">
    <tr>
    <th colspan="10">검색 카테고리 : ${category}, 검색어 : ${word} 의 결과</th>
    </tr>
    </c:if>
    <c:forEach var="r" items="${ list }">
    <tr>
        <th scope="row">${ r.oId }</th>
        <td>${ r.cName }</td>
        <td>${ r.paName }</td>
        <td style="font-size:12px">${ r.rSDate } ~ ${ r.rEDate }</td>
        <td>${ r.pdDate }</td>
        <td>${ r.rType }</td>
        <td>${ r.oRCount }</td>
        <td>${ r.people }</td>
        <td>${ r.price }</td>
        <c:if test="${r.pdType == 'P'}">
        <td>구매</td>
        </c:if>
        <c:if test="${r.pdType == 'R'}">
        <td>환불</td>
        </c:if>
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
                <c:url var="rlistBack" value="selectReservationList.ad">
                    <c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
                </c:url>
                <li><a href="${ rlistBack }">&laquo;</a></li>
            </c:if>
            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                <c:if test="${ p eq pi.currentPage }">
                <li><a href="#" style="background-color:#ddd;">${ p }</a></li>               
                </c:if>
                <c:if test="${ p ne pi.currentPage }">
                    <c:url var="rlistCheck" value="selectReservationList.ad">
                         <c:param name="currentPage" value="${ p }"/>
                    </c:url>
                    <li><a href="${ rlistCheck }">${ p }</a></li>  
                </c:if>
            </c:forEach>
            <c:if test="${ pi.currentPage >= pi.maxPage }">
                <li><a>&raquo;</a></li>
            </c:if>
            <c:if test="${ pi.currentPage < pi.maxPage }">
                <c:url var="rlistEnd" value="selectReservationList.ad">
                    <c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
                </c:url>
                <li><a href="${ rlistEnd }">&raquo;</a></li>
            </c:if>
            </ul>
    </div>

<!-- 예약 디테일 -->
	<div class="modal fade" id="reservationDetailModal" role="dialog">
		<div class="modal-dialog" align="center">
	    
		  	<div class="modal-content" style="width:530px;">
		  		<div class="modal-header">
		  			<button type="button" class="close" data-dismiss="modal">&times;</button>
		  			<h4 class="modal-title">상세 예약 내역</h4>
		  		</div>
		  		<div class="modal-body">
		  			<table id="reservationDetailTable">
		  				<tr>
		  					<th>예약번호</th>
		  					<td colspan="3"><p id="oId"></p></td>
		  				</tr>
		  				<tr>
		  					<th>예약처</th>
		  					<td colspan="3">
		  						<p id="cName"></p>
		  					</td>
		  				</tr>
		  				<tr>
		  					<th>예약자</th>
		  					<td colspan="3">
		  						<p id="paName"></p>
		  					</td>
		  				</tr>
		  				<tr>
		  					<th>숙박기간</th>
		  					<td colspan="3">
		  						<p id="date"></p>
		  					</td>
		  				</tr>
		  				<tr>
		  					<th>예약일</th>
		  					<td colspan="3">
		  						<p id="pdDate"></p>
		  					</td>
		  				</tr>
		  				<tr>
		  					<th style="border-right:3px solid orangered;">객실 타입</th>
		  					<td><p id="r_type"></p></td>
		  					<th style="border-right:3px solid orangered;">객실 수</th>
		  					<td><p id="o_rcount"></p></td>
		  				</tr>
		  				<tr>
		  					<th>인원 수</th>
		  					<td colspan="3"><p id="r_people"></p></td>
		  				</tr>
		  				<tr>
		  					<th>금액</th>
		  					<td><p id="r_price"></p></td>
		  					<th>상태</th>
		  					<td><p id="pdType"></p></td>
		  				</tr>
		  			</table>
		  			
		  		</div>
		  		<div class="modal-footer" align="center">
		  		</div>
		  	</div>
	      
	  	</div>
	</div>
	
	<script>
		$(function(){
			<% for(int i = 0; i < 11; i++){%>
			$("#reservationTable tr").eq(<%=i%>).children().eq(5).hide();
			$("#reservationTable tr").eq(<%=i%>).children().eq(6).hide();
			$("#reservationTable tr").eq(<%=i%>).children().eq(7).hide();
			$("#reservationTable tr").eq(<%=i%>).children().eq(8).hide();
			<% } %>
			$("#reservationTable tr").click(function(){
				if($(this).children().eq(5).text()!=''){
				$("#oId").text($(this).children().eq(0).text());
				$("#cName").text($(this).children().eq(1).text());
				$("#paName").text($(this).children().eq(2).text());
				$("#date").text($(this).children().eq(3).text());
				$("#pdDate").text($(this).children().eq(4).text());
				$("#r_type").text($(this).children().eq(5).text());
				$("#o_rcount").text($(this).children().eq(6).text() + "개");
				$("#r_people").text($(this).children().eq(7).text() + "명");
				$("#r_price").text($(this).children().eq(8).text() + "원");
				$("#pdType").text($(this).children().eq(9).text());
				$(this).attr({"data-toggle":"modal", "data-target":"#reservationDetailModal"});
				}
			});
		});
	</script>
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>
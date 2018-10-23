<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Korea | Seller</title>
<style>
	.content{
		width:1100px;
		height:1000px;
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
	    width:800px;
	    margin-bottom:3%;
	    margin-left:auto;
	    margin-right:auto;
	}
	.paging{
	    padding:2%;
	    margin-bottom:5%;
	}
	#revenueTable{
		width:1000px;
		border-collapse: collapse;
	    text-align: center;
	    line-height: 1.5;
	    margin-left:auto;
	    margin-right:auto;
	}
	#revenueTable tr{
		height:30px;
	}
	#revenueTable thead th{
		padding: 10px;
	    font-weight: bold;
	    text-align: center;
	    vertical-align: top;
	    color: #369;
	    border-bottom: 3px solid #036;
	}
	#revenueTable tbody th {
	    padding: 10px;
	    font-weight: bold;
	    text-align: center;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	    background: #f3f6f7;
	}
	#revenueTable td {
	    padding: 10px;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<div class="main">
		<jsp:include page="../common/sellerMenubar.jsp"/>
		<div class="content">
					
			<div class="titleArea">
				<div class="row">
                	<div class="col-md-12">
                    	<ul class="breadcrumb">
                        	<li><a href="myPageView.sell"><i class="fa fa-home"></i> Home</a></li>
                            <li class="active">수익 관리</li>
                        </ul>
                    </div>
                </div>
			</div>
			
			<div class="searchArea" align="center">
            	<form action="manageRevenue.sell">
					<div class="col-xs-8 col-xs-offset-2">
		    			<div class="input-group">
                			<div class="input-group-btn search-panel">
                    			<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    				<span id="search_concept">검색 카테고리</span> <span class="caret"></span>
                    			</button>
                    			<ul class="dropdown-menu" role="menu">
                      				<li><a href="#cName" onclick="other();">상호명</a></li>
                      				<li><a href="#rStatus" onclick="other();">상태</a></li>
                      				<li class="divider"></li>
                      				<li><a href="#datePick" onclick="showDatePicker();">기간</a></li>
                    			</ul>
                			</div>
                			<input type="hidden" name="searchParam" value="all" id="searchParam">         
                			<input type="text" class="form-control" name="searchWord" placeholder="검색어를 입력하세요">
                			<span class="input-group-btn">
                    			<button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                			</span>
                		</div>
						<div id="datePicker" align="center">
				           	<br>
				           	<jsp:include page="../common/datePicker.jsp"/>
				           	<br>
				        </div>
                	</div>
                </form>
			</div>
			
			<br><br>
		
			<table id="revenueTable" align="center">
				<thead>
					<tr>
						<th width="50px">No</th>
						<th width="300px">상호명</th>
						<th width="100px">예약 건수</th>
						<th width="250px">입금일</th>
						<th width="100px">입금액</th>
						<th width="100px">상태</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="no" value="1"/>
					<c:if test="${ list != null }">
						<c:forEach var="r" items="${ list }">
							<tr>
								<input type="hidden" id="DHID" value="${ r.dhId }">
								<input type="hidden" id="CID" value="${ r.cId }">
								<th>${ no }</th>
								<td>${ r.cName }</td>
								<td>${ r.rCount } 건</td>
								<td>${ r.rDate }</td>
								<td><fmt:formatNumber value="${ r.price }" pattern="#,###"/> 원</td>
								<td>${ r.status }</td>
								<c:set var="no" value="${ no + 1 }"/>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			
			<div class="paging" align="center">
            	<ul class="pagination pagination-sm">
            		<c:if test="${ pi.currentPage <= 1 }">
						<li><a href="#">&laquo;</a></li>
					</c:if>
                    <c:if test="${ pi.currentPage > 1 }">
                    	<c:url var="listFirst" value="manageRevenue.sell">
                    		<c:param name="currentPage" value="${ pi.startPage }"/>
                    	</c:url>
	                	<li><a href="${ listFirst }">&laquo;</a></li>
					</c:if>
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<li><a href="#" style="background-color:#ddd;">${ p }</a></li>	
						</c:if>
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="listCheck" value="manageRevenue.sell">
								<c:param name="currentPage" value="${ p }"/>
							</c:url>
							<li><a href="${ listCheck }">${ p }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						<li><a href="#">&raquo;</a></li>
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="listEnd" value="manageRevenue.sell">
							<c:param name="currentPage" value="${ pi.endPage }"/>
						</c:url>
	                    <li><a href="${ listEnd }">&raquo;</a></li>
					</c:if>
                </ul>
            </div>
			
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		$(function(){
	    	$("#datePicker").hide();
	    });
		function showDatePicker(){
	    	$("#datePicker").show();
	    }
	    function other(){
	    	$("#datePicker").hide();
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
</body>
</html>
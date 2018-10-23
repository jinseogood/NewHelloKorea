<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	#reservationTable{
		width:1100px;
		border-collapse: collapse;
	    text-align: center;
	    line-height: 1.5;
	    margin-left:auto;
	    margin-right:auto;
	}
	#reservationTable tr{
		height:30px;
	}
	#reservationTable thead th{
		padding: 10px;
	    font-weight: bold;
	    text-align: center;
	    vertical-align: top;
	    color: #369;
	    border-bottom: 3px solid #036;
	}
	#reservationTable tbody th {
	    padding: 10px;
	    font-weight: bold;
	    text-align: center;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	    background: #f3f6f7;
	}
	#reservationTable td {
	    padding: 10px;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
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
	
	<div class="main">
		<jsp:include page="../common/sellerMenubar.jsp"/>
		<div class="content">
					
			<div class="titleArea">
				<div class="row">
                	<div class="col-md-12">
                    	<ul class="breadcrumb">
                        	<li><a href="myPageView.sell"><i class="fa fa-home"></i> Home</a></li>
                            <li class="active">예약 내역</li>
                        </ul>
                    </div>
                </div>
			</div>
			
			<div class="searchArea" align="center">
            	<form action="reservation.sell">
					<div class="col-xs-8 col-xs-offset-2">
		    			<div class="input-group">
                			<div class="input-group-btn search-panel">
                    			<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    				<span id="search_concept">검색 카테고리</span> <span class="caret"></span>
                    			</button>
                    			<ul class="dropdown-menu" role="menu">
                      				<li><a href="#oName" onclick="other();">예약자</a></li>
                      				<li><a href="#oStatus" onclick="other();">상태</a></li>
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
			
			<br>
			<br>
		
			<table id="reservationTable" align="center">
				<thead>
					<tr>
						<th width="50px">No</th>
						<th width="150px">예약번호</th>
						<th width="300px">업체명</th>
						<th width="200px">예약자</th>
						<th width="150px">예약 시작일</th>
						<th width="150px">예약 종료일</th>
						<th width="100px">상태</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="no" value="1"/>
					<c:if test="${ list != null }">
						<c:forEach var="r" items="${ list }">
							<tr>
								<input type="hidden" id="OID" value="${ r.oId }">
								<input type="hidden" id="PAID" value="${ r.paId }">
								<th>${ no }</th>
								<td>${ r.oId }</td>
								<td>${ r.cName }</td>
								<td>${ r.paName }</td>
								<td>${ r.rSDate }</td>
								<td>${ r.rEDate }</td>
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
                    	<c:url var="listFirst" value="reservation.sell">
                    		<c:param name="currentPage" value="${ pi.startPage }"/>
                    	</c:url>
	                	<li><a href="${ listFirst }">&laquo;</a></li>
					</c:if>
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<li><a href="#" style="background-color:#ddd;">${ p }</a></li>	
						</c:if>
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="listCheck" value="reservation.sell">
								<c:param name="currentPage" value="${ p }"/>
							</c:url>
							<li><a href="${ listCheck }">${ p }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						<li><a href="#">&raquo;</a></li>
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="listEnd" value="reservation.sell">
							<c:param name="currentPage" value="${ pi.endPage }"/>
						</c:url>
	                    <li><a href="${ listEnd }">&raquo;</a></li>
					</c:if>
                </ul>
            </div>

	</div> 
			
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<!-- 예약 디테일 -->
	<div class="modal fade" id="reservationDetailModal" role="dialog">
		<div class="modal-dialog" align="center">
	    
		  	<div class="modal-content" style="width:530px;">
		  		<div class="modal-header">
		  			<button type="button" class="close" data-dismiss="modal">&times;</button>
		  			<h4 class="modal-title">예약 내역</h4>
		  		</div>
		  		<div class="modal-body">
		  			<table id="reservationDetailTable">
		  				<tbody>
		  				
		  				</tbody>
		  			</table>
		  		</div>
		  		<div class="modal-footer" align="center">
		  		</div>
		  	</div>
	      
	  	</div>
	</div>
	
	<script>
		$(function(){
			$("#datePicker").hide();
			
			$("#reservationTable tbody tr").click(function(){
				var oId=$(this).children().eq(0).val();
				
				$(this).attr({"data-toggle":"modal", "data-target":"#reservationDetailModal"});
				
				$.ajax({
					url:"reservationDetail.sell",
					type:"get",
					data:{oId:oId},
					dataType:"json",
					success:function(data){
						console.log(data);
						
						$tableBody = $("#reservationDetailTable");
						$tableBody.html('');
						
						var rDetail=data.data;
						var tPrice=0;
						
						var output="";
						
						output += "<tr><th>예약자</th><td colspan='3'><p>" + rDetail[0].paName + "</p></td></tr>";
						output += "<tr><th style='border-right:3px solid orangered;'>업체명</th><td colspan='3'><p>" + rDetail[0].cName + "</p></td></tr>";
						output += "<tr><th>기간</th><td colspan='3'>" + rDetail[0].rSDate + " ~ " + rDetail[0].rEDate + "</td></tr>";
						
						for(var i=0;i<rDetail.length;i++){
							output += "<tr><th style='border-right:3px solid orangered;'>객실 타입</th><td><p>" + rDetail[i].rType + "</p></td>";
							output += "<th style='border-right:3px solid orangered;'>객실 수</th><td><p>" + rDetail[i].oRCount + " 개</p></td></tr>";
							tPrice += rDetail[i].price;
						}
						console.log(typeof(tPrice));
						output += "<tr><th>인원 수</th><td colspan='3'><p>" + rDetail[0].people + " 명</p></td></tr>";
						output += "<tr><th>금액</th><td><p>" + numberWithCommas(tPrice) + " 원</p></td>";
						if(rDetail[0].status == "P"){
							output += "<th>상태</th><td>결제완료</td></tr>";	
						}
						else{
							output += "<th>상태</th><td>환불완료</td></tr>";
						}
						
						$tableBody.append(output);
						
					},
					error:function(data){
						console.log(data);
					}
				});
			});
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
		function numberWithCommas(x){
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Korea | Seller</title>
<style>
	input{
		border-radius:5px;
	}
	.content{
		width:800px;
		height:1300px;
		margin-left:auto;
		margin-right:auto;
	}
	.titleArea{
    	padding:3%;
    	width:70%;
    	margin-left:auto;
    	margin-right:auto;
	}
	#editTable{
		width:750px;
	}
	#editTable th{
		width: 250px;
    	padding: 10px;
    	font-weight: bold;
    	text-align: center;
    	vertical-align: top;
    	border-bottom: 1px solid #ccc;
    	background: #f3f6f7;
	}
	#editTable td{
		width: 500px;
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
                        	<li><a href="manageProduct.sell">업체 관리</a></li>
                        	<li><a onclick="productDetail();">${ eOP.get(0).companyName }</a>
                            <li class="active">업체 수정</li>
                        </ul>
                    </div>
                </div>
			</div>
		
			<form action="editCompany.sell" method="post">
				<table id="editTable" align="center">
					<input type="hidden" id="cId" name="cId" value="${ eOP.get(0).cId }">
					<input type="hidden" id="crId" name="crId" value="${ eOP.get(0).crId }">
					<tr>
						<th>상호명</th>
						<td><input type="hidden" name="companyName" value="${ eOP.get(0).companyName }">${ eOP.get(0).companyName }</td>
						<th>전화번호</th>
						<td><input type="hidden" name="companyPhone" value="${ eOP.get(0).companyPhone }">${ eOP.get(0).companyPhone }</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3"><input type="hidden" name="companyAddress" value="${ eOP.get(0).companyAddress }">${ eOP.get(0).companyAddress }</td>
					</tr>
					<c:set var="i" value="1"/>
					<c:forEach var="eOP" items="${ eOP }">
						<input type="hidden" name="roomId${ i }" value="${ eOP.rId }">
						<tr>
							<th>객실타입</th>
							<td><input type="hidden" name="roomType${ i }" value="${ eOP.roomType }">${ eOP.roomType }</td>
							<th>객실 수</th>
							<td><input type="number" name="roomCount${ i }" value="${ eOP.roomCount }"></td>
						</tr>
						<tr>
							<th>객실 가격</th>
							<td><input type="text" name="roomPrice${ i }" value="${ eOP.roomPrice }"></td>
							<th>정원</th>
							<td>${ eOP.roomPeople }명</td>
						</tr>
						<c:set var="i" value="${ i+1 }"/>
					</c:forEach>
					<tr>
						<td colspan="5" align="center">
							<button type="reset" class="btn btn-default">취소</button>&nbsp;&nbsp;
							<button type="submit" class="btn btn-success">수정</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		function productDetail(){
			location.href="detailCompany.sell?cId=" + $("#cId").val() + "&crId=" + $("#crId").val();
		}
	</script>
	
</body>
</html>
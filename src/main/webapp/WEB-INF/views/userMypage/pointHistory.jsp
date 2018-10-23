<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#pointTable{
		margin-top:80px;
		width:700px;
		border-collapse: collapse;
	    text-align: center;
	    line-height: 1.5;
	    	margin-left:auto;
	margin-right:auto;
	}
 tr{
	height:30px;
	}
 thead th{
		padding: 10px;
	    font-weight: bold;
	    text-align: center;
	    vertical-align: top;
	    color: #369;
	    border-bottom: 3px solid #036;
	}
	 tbody th {
	    padding: 10px;
	    font-weight: bold;
	    text-align: center;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	    background: #f3f6f7;
	}
	 td {
	    padding: 10px;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	}
	.mainDiv{
		margin-left:auto;
		margin-right:auto;
		height:800px;
	
	}
	.tableDiv{
	margin-left:auto;
	margin-right:auto;
	
	
}

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<div class="mainDiv">
		<jsp:include page="../common/userMenubar.jsp"/>
		<div class="tableDiv">
			<table id="pointTable">
			<thead>
				<tr>
					<th width="80px">No</th>
					<th width="150px">적립일</th>
					<th width="100px">적립 포인트</th>
					<th width="150px">적립요소</th>
					
				</tr>
			</thead>
			<c:forEach var="item" items="${pointList}">
					<tbody>
					<tr>
						<td>${item.pId }</td>
						<td>${item.pDate }</td>
						<td>${item.amount }</td>
						<c:if test="${item.paType eq 0}">
						<td>결제</td>
						</c:if>
						<c:if test="${item.paType eq 1 }">
						<td>리뷰</td>
						</c:if>
						<c:if test="${item.paType eq 2 }">
						<td>도움</td>
						</c:if>
					</tr>
					</tbody>
			</c:forEach>
			</table>
		</div>
		</div>
		<jsp:include page="../common/footer.jsp"/>
</body>
</html>
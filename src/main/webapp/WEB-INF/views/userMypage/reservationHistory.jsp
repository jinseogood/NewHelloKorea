<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#reservationTable{
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
			<table id="reservationTable">
			<thead>
				<tr>
					<th width="80px">예약번호</th>
					<th width="150px">호텔명</th>
					<th width="100px">룸타입</th>
					<th width="150px">예약날</th>
					<th width="100px">예약 인원수</th>
					<th width="100px">예약 방 갯수</th>
					<th width="60px">결제</th>
					
				</tr>
			</thead>
			<c:forEach var="item" items="${reservationList}">
					<tbody>
					<tr>
						<td>${item.oId }</td>
						<td>${item.cName }</td>
						<td>${item.rType }</td>
						<td>${item.rSdate }~${item.rEdate }</td>
						<td>${item.people }</td>
						<td>${item.oRcount }</td>
						<td>${item.pdType }</td>
					</tr>
					</tbody>
			</c:forEach>
			</table>
		</div>
		</div>
		<jsp:include page="../common/footer.jsp"/>
</body>
</html>
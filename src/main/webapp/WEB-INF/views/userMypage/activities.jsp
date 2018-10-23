<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.tableDiv{
	margin-left:auto;
	margin-right:auto;
	height:800px;
	
}
#activitiTable{
			margin-left:auto;
	margin-right:auto;
		margin-top:80px;
		width:700px;
		border-collapse: collapse;
	    text-align: center;
	    line-height: 1.5;
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
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<div class="mainDiv">
		<jsp:include page="../common/userMenubar.jsp"/>
		<div class="tableDiv">
			<table id="activitiTable">
			<thead>
				<tr>
					<th width="60px">글번호</th>
					<th width="150px">글제목</th>
					<th width="100px">글 종류</th>
					<th width="100px">좋아요</th>
					<th width="60px">댓글수</th>
					
				</tr>
			</thead>
					<tbody>
			<c:forEach var="item" items="${ boreList}">
					
					<tr>
					<td>${item.bId }</td>
					<td>${item.title }</td>
					<c:if test="${item.boardType eq 1 }">
					<td>리뷰</td>
					</c:if>
					<c:if test="${item.boardType eq 2 }">
					<td>Q</td>
					</c:if>
					<td>${item.likey }</td>
					<td>${item.rCount }</td>
					</tr>
			</c:forEach>
					</tbody>
			</table>
		</div>
		</div>
		<jsp:include page="../common/footer.jsp"/>
</body>
</html>
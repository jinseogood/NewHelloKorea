<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Korea | Confirm</title>
<style>
	.main{
		height:800px;
	}
	.title{
		width:800px;
		height:30px;
		margin-top:5px;
		text-align:left;
		font-size:20px;
		font-weight:bold;
		color:#646869;
	}
	.emailNotice{
		width:800px;
		height:30px;
		margin-top:5px;
		text-align:left;
	}
	#payOKTitle{
		width:800px;
		height:130px;
		text-align:center;
	}
	#airplaneIcon{
		width:130px;
		height:130px;
	}
	#mailIcon{
		width:40px;
		height:40px;
	}
	#okNotice{
		font-size:30px;
	}
	#orderInfo{
		width:800px;
		border-top:2px solid darkgray;
	}
	#orderInfo tr{
		height:45px;
		border-bottom:1px solid lightgray;
	}
	#orderInfo th{
		background:#f3f6f7;
	}
	#productInfo{
		width:800px;
		border-top:2px solid darkgray;
	}
	#productInfo tr{
		height:45px;
		border-bottom:1px solid lightgray;
	}
	#productInfo th{
		text-align:center;
		background:#f3f6f7;
	}
	#payInfo{
		width:800px;
		border-top:2px solid darkgray;
	}
	#payInfo tr{
		height:45px;
		border-bottom:1px solid lightgray;
	}
	#payInfo th{
		background:#f3f6f7;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<div class="main">
		<div class="notice" align="center">
			<br><br>
			<table id="payOKTitle">
				<tr>
					<td width="150px"><img id="airplaneIcon" src="${ contextPath }/resources/img/airplaneIcon.png"></td>
					<td colspan="3"><font id="okNotice"><b>예약/결제 요청</b>이 <b>정상적으로 완료</b>되었습니다.</font></td>
				</tr>
			</table>
			<div class="emailNotice">
				<img id="mailIcon" src="${ contextPath }/resources/img/mailIcon.png">
				&nbsp;&nbsp;
				${ p.paEmail } 으로 예약 확인 메일이 전송되었습니다.
			</div>
			<br>
			<div class="title">주문정보</div>
			<table id="orderInfo">
				<input type="hidden" id="CID" value="${ r.cid }">
				<input type="hidden" id="COID" value="${ r.contentid }">
				<tr>
					<th>주문번호</th>
					<td width="250px">${ r.oid }</td>
					<th width="150px">주문일자</th>
					<td width="250px">${ pdList.get(0).pdDate }</td>
				</tr>
				<tr>
					<th>주문자명</th>
					<td>${ p.paName }</td>
					<th>전화번호</th>
					<td>${ p.paPhone }</td>
				</tr>
			</table>
			<br>
			<div class="title">예약정보</div>
			<table id="productInfo">
				<tr>
					<th width="250px" style="border-right:1px solid lightgray;">업체명</th>
					<th width="250px" style="border-right:1px solid lightgray;">객실명</th>
					<th width="100px" style="border-right:1px solid lightgray;">가격</th>
					<th width="200px">예약 일자</th>
				</tr>
				<tr>
					<td style="border-right:1px solid lightgray;">${ r.cName }</td>
					<td style="border-right:1px solid lightgray;">${ r.roomName }</td>
					
					<c:if test="${ sessionScope.cur != null }">
						<fmt:parseNumber value="${ sessionScope.cur.get(1) }" integerOnly="false" pattern="#,###.##" var="parseCur"/>
						<c:if test="${ sessionScope.cur.get(0) == '¥' || sessionScope.cur.get(0) == 'Rp' }">
							<td style="text-align:center; border-right:1px solid lightgray;">${ sessionScope.cur.get(0) } <fmt:formatNumber value="${ pdList.get(0).price / (parseCur * 10) }" pattern="#,###.##"/></td>
						</c:if>
						<c:if test="${ sessionScope.cur.get(0) == '$' }">
							<td style="text-align:center; border-right:1px solid lightgray;">${ sessionScope.cur.get(0) } <fmt:formatNumber value="${ pdList.get(0).price / (parseCur * 1000) }" pattern="#,###.##"/></td>
						</c:if>
						<c:if test="${ sessionScope.cur.get(0) != '¥' && sessionScope.cur.get(0) != 'Rp' && sessionScope.cur.get(0) != '$' }">
							<td style="text-align:center; border-right:1px solid lightgray;">${ sessionScope.cur.get(0) } <fmt:formatNumber value="${ pdList.get(0).price / parseCur }" pattern="#,###.##"/></td>
						</c:if>
					</c:if>
					<c:if test="${ sessionScope.cur == null }">
						<td style="text-align:center; border-right:1px solid lightgray;">₩ <fmt:formatNumber value="${ pdList.get(0).price }" pattern="#,###.##"/></td>
					</c:if>
					
					<td style="text-align:center;">${ r.rSdate } - ${ r.rEdate }</td>
				</tr>
			</table>
			<br>
			<div class="title">결제정보</div>
			<table id="payInfo">
				<tr>
					<th width="150px">결제 수단</th>
					<c:if test="${ pdList.size() == 1 }">
						<td>신용 카드</td>
					</c:if>
					<c:if test="${ pdList.size() == 2 }">
						<td>신용 카드 & 포인트</td>
					</c:if>
				</tr>
				<tr style="border-bottom:none; height:50px;">
					<td colspan="4" style="text-align:center;">
						<button type="button" class="btn btn-success" onclick="goMyPage();" style="margin-top:10px;">마이페이지 바로가기</button>
						&nbsp;&nbsp;
						<button type="button" class="btn btn-success" onclick="goProduct();" style="margin-top:10px;">상품페이지 바로가기</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		function goMyPage(){
			location.href="userMypage.um";
		}
		function goProduct(){
			var cid=$("#CID").val();
			var contentid=$("#COID").val();
			
			location.href="detailHotel?contenttypeid=32&cid=" + cid + "&contentid=" + contentid;
		}
	</script>
	
</body>
</html>
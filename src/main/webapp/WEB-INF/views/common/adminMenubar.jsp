<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.submenubar {
	background: black;
	color: white;
}
   
.submenuTitle {
	width: 1170px;
	margin-left: auto;
	margin-right: auto;
}

.submenuContent {
	width: 800px;
	height: 1000px;
	margin-left: auto;
	margin-right: auto;
}

.full-menu {
	width: 100%;
	margin-top: 33px;
	display: inline-block;
	position: relative;
	z-index: 1001;
	background: #fff;
	border-bottom: 1px solid #9e9e9e;
	position: fixed;
	top: 85px;
	left: 0px;
	border-top: 1px solid #9e9e9e;
	opacity: 0.8;
}

.full-menu .menu-container {
	width: 1170px;
	margin-left: auto;
	margin-right: auto;
	align: center;
}

.full-menu dl {
	float: left;
}

.full-menu ul {
	margin-left: -2px;
	list-style: none;
	padding-left: 0px;
}

.full-menu a {
	text-decoration: none;
	line-height: 34px;
	font-size: 13px;
	font-weight: 400;
	color: #1d2129;
	font-family: Roboto, 'Noto Sans KR', sans-serif;
	padding: 10px 37px 10px 37px;
}

.wrap .full-menu {
	display: none;
}

.wrap:hover .full-menu {
	display: block;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrap">
		<div class="submenubar">
			<div class="submenuTitle">
				<nav class="tm-nav">
					<ul>
						<li><a href="selectReservationList.ad" style="padding: 10px 34px 10px 34px;">예약내역
								관리</a></li>
						<li><a href="selectReportList.ad" style="padding: 10px 34px 10px 34px;">일반회원
								관리</a></li>
						<li><a href="selectCompanyList.ad" style="padding: 10px 34px 10px 34px;">제휴업체
								관리</a></li>
						<li><a href="salesStatisticsView.ad" style="padding: 10px 34px 10px 34px;">통계</a></li>
					</ul>
				</nav>
			</div>
		</div>
		<div class="full-menu">
			<div class="menu-container">
				<dl>
					<dd>
						<ul>
							<li><a href="selectReservationList.ad">예약내역 조회</a></li>
						</ul>
					</dd>
				</dl>
				<dl>
					<dd>
						<ul>
							<li><a href="selectReportList.ad">신고현황</a></li>
							<li><a href="selectQuestionList.ad">문의현황</a></li>
							<li><a href="selectBlacklist.ad">블랙리스트 관리</a></li>
						</ul>
					</dd>
				</dl>
				<dl>
					<dd>
						<ul>
							<li><a href="selectCompanyList.ad" style="padding: 10px 27px 10px 22px;">업체
									승인·관리</a></li>
							<li><a href="selectDepositList.ad" style="padding: 10px 27px 10px 22px;">업체
									입금처리</a></li>
							<li><a href="selectDepositHistoryList.ad" style="padding: 10px 27px 10px 22px;">업체
									입금내역</a></li>		
						</ul>
					</dd>
				</dl>
				<dl>
					<dd>
						<ul>
							<li><a href="selectSalesStatistics.ad">매출 통계</a></li>
							<li><a href="companyStatisticsView.ad">업체 통계</a></li>
							<li><a href="memberStatisticsView.ad">회원 통계</a></li>
						</ul>
					</dd>
				</dl>
			</div>
		</div>
	</div>
</body>
</html>
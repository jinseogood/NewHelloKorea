<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Korea | Payment</title>
<style>
	.main{
		width:1000px;
		height:800px;
		margin-left:auto;
		margin-right:auto;
	}
	.orderArea{
		width:700px;
		height:800px;
		float:left;
	}
	.payArea{
		width:300px;
		height:800px;
		float:right;
	}
	.title{
		text-align:left;
		font-size:24px;
		color:white;
		background:gold;
		width:650px;
		height:35px;
	}
	#itemTable{
		width:650px;
		height:100px;
		border-top:1px solid lightgray;
		border-bottom:1px solid lightgray;
		border-left:1px solid lightgray;
		border-right:1px solid lightgray;
	}
	.inputStyle{
		height:38px;
		border-radius:3px;
		border:1px solid lightgray;
	}
	.orderDetail{
		width:650px;
		height:200px;
		margin-left:auto;
		margin-right:auto;
	}
	.textW{
		font-size:11px;
		color:red;
	}
	#orderTable{
		width:650px;
		height:200px;
	}
	#payTable{
		width:650px;
		height:150px;
	}
	#payTable button{
		margin:1px;
	}
	#priceTable{
		width:280px;
		height:400px;
		border:1px solid lightgray;
	}
	#paypalTable{
		width:280px;
		height:100px;
		border:1px solid lightgray;
	}
	#checkIcon{
		width:20px;
		height:20px;
	}
	#paypalLogo{
		width:180px;
		height:60px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/searchMenubar.jsp"/>
	<jsp:include page="../common/searchSubmenubar.jsp"/>
	
	<!-- 환율 적용 여부 검사 -->
	<c:if test="${ sessionScope.cur != null }">
		<input type="hidden" id="CURICON" value="${ sessionScope.cur.get(0) }">
		<input type="hidden" id="CUR" value="${ sessionScope.cur.get(1) }">
	</c:if>
	<c:if test="${ sessionScope.cur == null }">
		<input type="hidden" id="CURICON" value="₩">
		<input type="hidden" id="CUR" value="1">
	</c:if>
	
	<div class="main" align="center">
		<form action="" method="post" id="payPalForm">
			<input type="hidden" name="cmd" value="_xclick">
			<input type="hidden" name="business" value="korea-seller@gmail.com">
			
			<input type="hidden" id="loginMID" value="${ sessionScope.loginUser.mId }">
			
			<input type="hidden" name="item_name" value="${ reservation.roomName }">
			<input type="hidden" name="item_number" value="${ reservation.oid }">
			<input type="hidden" name="currency_code" value="USD">
			<input type="hidden" id="orderPrice" name="amount">
			<input type="hidden" name="quantity" value="${ reservation.oRcount }">
			<input type="hidden" id="orderInfo" name="custom">
			<input type="hidden" name="charset" value="UTF-8">
			<!-- 개인 테스트 용 -->
			<input type="hidden" name="return" value="https://localhost:8443/hello/paymentConfirm.pay">
			<input type="hidden" name="cancel_return" value="https://localhost:8443/hello/detailHotel?contenttypeid=32&cid=${ reservation.cid }&contentid=${ reservation.contentid }">
			<!-- 다른 IP이용 시 -->
			<%-- <input type="hidden" name="return" value="https://192.168.20.206:8443/hello/paymentConfirm.pay">
			<input type="hidden" name="cancel_return" value="https://192.168.20.206:8443:8443/hello/detailHotel?contenttypeid=32&cid=${ reservation.cid }&contentid=${ reservation.contentid }"> --%>
			
			<input type="hidden" id="oId" value="${ reservation.oid }">
			<input type="hidden" id="originPrice" value="${ ((param.price * reservation.period) * 0.1) + (param.price * reservation.period) }">
			
			<c:if test="${ sessionScope.cur != null }">
				<fmt:parseNumber value="${ sessionScope.cur.get(1) }" integerOnly="false" pattern="#,###.##" var="parseCur"/>
				<c:if test="${ sessionScope.cur.get(0) == '¥' || sessionScope.cur.get(0) == 'Rp' }">
					<input type="hidden" id="price" value="${ (((param.price * reservation.period) * 0.1) + (param.price * reservation.period)) / (parseCur * 10) }">
				</c:if>
				<c:if test="${ sessionScope.cur.get(0) == '$' }">
					<input type="hidden" id="price" value="${ (((param.price * reservation.period) * 0.1) + (param.price * reservation.period)) / (parseCur * 1000) }">
				</c:if>
				<c:if test="${ sessionScope.cur.get(0) != '¥' && sessionScope.cur.get(0) != 'Rp' && sessionScope.cur.get(0) != '$' }">
					<input type="hidden" id="price" value="${ (((param.price * reservation.period) * 0.1) + (param.price * reservation.period)) / parseCur }">
				</c:if>
			</c:if>
			<c:if test="${ sessionScope.cur == null }">
				<input type="hidden" id="price" value="${ ((param.price * reservation.period) * 0.1) + (param.price * reservation.period) }">
			</c:if>

			<div class="orderArea">
				<br>
				<div class="title">
					<label>&nbsp;① 주문 정보</label>		
				</div>
				<div class="itemDetail" align="center">
					<table id="itemTable" border="1">
						<tr>
							<td width="350px" colspan="2">
								<font style="font-size:20px; font-weight:bold;">${ reservation.roomName }</font>
								<br>
								<font style="font-size:14px;">${ reservation.cName }</font>
								<br>
								<font style="font-size:12px;">${ reservation.cAddress }</font>
							</td>
							<td width="200px">
								<img id="checkIcon" src="${ contextPath }/resources/img/checkIcon.png"> 입실 2일 전까지 취소 가능!
								<br>
								<img id="checkIcon" src="${ contextPath }/resources/img/checkIcon.png"> 환불 수수료 없음!
							</td>
							<td width="100px" style="text-align:center;">
								<c:if test="${ sessionScope.cur != null }">
									<fmt:parseNumber value="${ sessionScope.cur.get(1) }" integerOnly="false" pattern="#,###.##" var="parseCur"/>
									<c:if test="${ sessionScope.cur.get(0) == '¥' || sessionScope.cur.get(0) == 'Rp' }">
										<b style="font-size:16px;">${ sessionScope.cur.get(0) } <fmt:formatNumber value="${ param.price / (parseCur * 10) }" pattern="#,###.##"/>/</b><sub>박</sub>
									</c:if>
									<c:if test="${ sessionScope.cur.get(0) == '$' }">
										<b style="font-size:16px;">${ sessionScope.cur.get(0) } <fmt:formatNumber value="${ param.price / (parseCur * 1000) }" pattern="#,###.##"/>/</b><sub>박</sub>
									</c:if>
									<c:if test="${ sessionScope.cur.get(0) != '¥' && sessionScope.cur.get(0) != 'Rp' && sessionScope.cur.get(0) != '$' }">
										<b style="font-size:16px;">${ sessionScope.cur.get(0) } <fmt:formatNumber value="${ param.price / parseCur }" pattern="#,###.##"/>/</b><sub>박</sub>
									</c:if>
								</c:if>
								<c:if test="${ sessionScope.cur == null }">
									<b style="font-size:16px;">₩ <fmt:formatNumber value="${ param.price }" pattern="#,###.##"/>/</b><sub>박</sub>
								</c:if>
							</td>
						</tr>
					</table>
				</div>
				<br>
				<div class="title">
					<label>&nbsp;② 여행자 정보 입력</label>		
				</div>
				<div class="orderDetail" align="center">
					<table id="orderTable">
						<tr>
							<td><b>이름<font style="color:red;">* </font></b><font style="color:gray; font-size:10px;">(영문 명으로 입력해주세요.)</font></td>
							<td><b>성<font style="color:red;">* </font></b><font style="color:gray; font-size:10px;">(영문 명으로 입력해주세요.)</font></td>
						</tr>
						<tr>
							<td><input class="inputStyle" type="text" id="firstName" name="firstName" size="40"></td>
							<td><input class="inputStyle" type="text" id="lastName" name="lastName" size="40"></td>
						</tr>
						<tr class="textW">
							<td><span id="fnameWTEXT">이름을 입력하세요.</span></td>
							<td><span id="lnameWTEXT">성을 입력하세요.</span></td>
						</tr>
						<tr>
							<td colspan="2"><b>이메일<font style="color:red;">*</font></b> <font style="color:gray; font-size:10px;">(이 이메일 주소로 예약 확인 메일을 보내 드립니다.)</font></td>
						</tr>
						<tr>
							<td colspan="2"><input class="inputStyle" id="orderEmail" type="email" name="orderEmail" size="65"></td>
						</tr>
						<tr class="textW">
							<td colspan="2"><span id="emailWTEXT">유효한 이메일을 입력하세요.</span></td>
						</tr>
						<tr>
							<td colspan="2"><b>연락처<font style="color:red;">*</font></b> <font style="color:gray; font-size:10px;">(숙박 업체에서 이 전화번호로 연락을 취합니다.)</font></td>
						</tr>
						<tr>
							<td colspan="2">
								<select id="national" class="inputStyle">
									<option value="+233">+233 가나</option>
									<option value="+241">+241 가봉</option>
									<option value="+592">+592 가이아나</option>
									<option value="+220">+220 감비아</option>
									<option value="+44">+44 건지</option>
									<option value="+590">+233 과들루프</option>
									<option value="+502">+233 과테말라</option>
									<option value="+1">+1 괌</option>
									<option value="+1">+1 그레나다</option>
									<option value="+30">+30 그리스</option>
									<option value="+299">+299 그린란드</option>
									<option value="+224">+224 기니</option>
									<option value="+245">+245 기니비사우</option>
									<option value="+264">+264 나미비아</option>
									<option value="+674">+674 나우루</option>
									<option value="+234">+234 나이지리아</option>
									<option value="+0">+0 남극</option>
									<option value="+27">+27 남아프리카</option>
									<option value="+31">+31 네덜란드</option>
									<option value="+977">+977 네팔</option>
									<option value="+47">+47 노르웨이</option>
									<option value="+672">+672 노퍽 섬</option>
									<option value="+64">+64 뉴질랜드</option>
									<option value="+687">+687 뉴칼레도니아</option>
									<option value="+683">+683 니우에</option>
									<option value="+227">+227 니제르</option>
									<option value="+505">+505 니카라과</option>
									<option value="+82">+82 대한민국</option>
									<option value="+45">+45 덴마크</option>
									<option value="+1">+1 도미니카</option>
									<option value="+1">+1 도미니카공화국</option>
									<option value="+49">+49 독일</option>
									<option value="+670">+670 동티모르</option>
									<option value="+856">+856 라오스</option>
									<option value="+231">+231 라이베리아</option>
									<option value="+371">+371 라트비아</option>
									<option value="+7">+7 러시아</option>
									<option value="+961">+961 레바논</option>
									<option value="+266">+266 레소토</option>
									<option value="+262">+262 레위니옹 섬</option>
									<option value="+40">+40 루마니아</option>
									<option value="+352">+352 룩셈부르크</option>
									<option value="+250">+250 르완다</option>
									<option value="+218">+218 리비아</option>
									<option value="+370">+370 리투아니아</option>
									<option value="+423">+423 리히텐슈타인</option>
									<option value="+261">+261 마다가스카르</option>
									<option value="+596">+596 마르티니크</option>
									<option value="+692">+692 마셜</option>
									<option value="+262">+262 마요트</option>
									<option value="+853">+853 마카오</option>
									<option value="+389">+389 마케도니아공화국</option>
									<option value="+265">+265 말라위</option>
									<option value="+60">+60 말레이시아</option>
									<option value="+223">+223 말리</option>
									<option value="+44">+44 맨 섬</option>
									<option value="+52">+52 멕시코</option>
									<option value="+377">+377 모나코</option>
									<option value="+212">+212 모로코</option>
									<option value="+230">+230 모리셔스</option>
									<option value="+222">+222 모리타니</option>
									<option value="+258">+258 모잠비크</option>
									<option value="+1">+1 몬세라트</option>
									<option value="+382">+382 몬테네그로</option>
									<option value="+373">+373 몰도바</option>
									<option value="+960">+960 몰디브</option>
									<option value="+356">+356 몰타</option>
									<option value="+976">+976 몽골</option>
									<option value="+1">+1 미국</option>
									<option value="+1">+1 미국령 버진아일랜드</option>
									<option value="+0">+0 미드웨이 섬</option>
									<option value="+95">+95 미얀마</option>
									<option value="+691">+691 미크로네시아</option>
									<option value="+678">+678 바누아투</option>
									<option value="+973">+973 바레인</option>
									<option value="+1">+1 바베이도스</option>
									<option value="+39">+39 바티칸 시국</option>
									<option value="+1">+1 바하마</option>
									<option value="+880">+880 방글라데시</option>
									<option value="+1">+1 버뮤다</option>
									<option value="+229">+229 베냉</option>
									<option value="+58">+58 베네수엘라</option>
									<option value="+84">+84 베트남</option>
									<option value="+32">+32 벨기에</option>
									<option value="+375">+375 벨라루스</option>
									<option value="+501">+501 벨리즈</option>
									<option value="+599">+599 보네르</option>
									<option value="+387">+387 보스니아헤르체고비나</option>
									<option value="+267">+267 보츠와나</option>
									<option value="+591">+591 볼리비아</option>
									<option value="+257">+257 부룬디</option>
									<option value="+226">+226 부르키나파소</option>
									<option value="+975">+975 부탄</option>
									<option value="+1">+1 북마리아나제도</option>
									<option value="+359">+359 불가리아</option>
									<option value="+55">+55 브라질</option>
									<option value="+673">+673 브루나이 다루살람</option>
									<option value="+685">+685 사모아</option>
									<option value="+599">+599 사바</option>
									<option value="+966">+966 사우디아라비아</option>
									<option value="+0">+0 사우스조지아 섬</option>
									<option value="+378">+378 산마리노</option>
									<option value="+239">+239 상투메프린시페</option>
									<option value="+1">+1 생마르탱-세인트 마틴</option>
									<option value="+590">+590 생바르텔레미</option>
									<option value="+508">+08 생피에르 앤드 미클롱</option>
									<option value="+212">+212 서사하라</option>
									<option value="+221">+221 세네갈</option>
									<option value="+381">+381 세르비아</option>
									<option value="+248">+248 세이셸</option>
									<option value="+599">+599 세인트 유스타티우스</option>
									<option value="+1">+1 세인트루시아</option>
									<option value="+1">+1 세인트빈센트그레나딘</option>
									<option value="+1">+1 세인트키츠네비스</option>
									<option value="+290">+290 세인트헬레나</option>
									<option value="+252">+252 소말리아</option>
									<option value="+677">+677 솔로몬제도</option>
									<option value="+597">+597 수리남</option>
									<option value="+94">+94 스리랑카</option>
									<option value="+47">+47 스발바르</option>
									<option value="+268">+268 스와질란드</option>
									<option value="+46">+46 스웨덴</option>
									<option value="+41">+41 스위스</option>
									<option value="+34">+34 스페인</option>
									<option value="+421">+421 슬로바키아</option>
									<option value="+386">+386 슬로베니아</option>
									<option value="+232">+232 시에라리온</option>
									<option value="+65">+65 싱가포르</option>
									<option value="+971">+971 아랍에미리트</option>
									<option value="+297">+297 아루바</option>
									<option value="+374">+374 아르메니아</option>
									<option value="+54">+54 아르헨티나</option>
									<option value="+1">+1 아메리칸사모아</option>
									<option value="+354">+354 아이슬란드</option>
									<option value="+509">+509 아이티</option>
									<option value="+353">+353 아일랜드</option>
									<option value="+994">+994 아제르바이잔</option>
									<option value="+93">+93 아프가니스탄</option>
									<option value="+376">+376 안도라</option>
									<option value="+355">+355 알바니아</option>
									<option value="+213">+213 알제리</option>
									<option value="+244">+244 앙골라</option>
									<option value="+1">+1 앤티가바부다</option>
									<option value="+1">+1 앵귈라</option>
									<option value="+291">+291 에리트레아</option>
									<option value="+372">+372 에스토니아</option>
									<option value="+593">+593 에콰도르</option>
									<option value="+251">+251 에티오피아</option>
									<option value="+503">+503 엘살바도르</option>
									<option value="+44">+44 영국</option>
									<option value="+1">+1 영국령 버진아일랜드</option>
									<option value="+967">+967 예멘</option>
									<option value="+968">+968 오만</option>
									<option value="+61">+61 오스트레일리아</option>
									<option value="+43">+43 오스트리아</option>
									<option value="+504">+504 온두라스</option>
									<option value="+358">+358 올란드</option>
									<option value="+962">+962 요르단</option>
									<option value="+256">+256 우간다</option>
									<option value="+598">+598 우루과이</option>
									<option value="+998">+998 우즈베키스탄</option>
									<option value="+380">+380 우크라이나</option>
									<option value="+681">+681 월리스푸투나제</option>
									<option value="+0">+0 웨이크 섬</option>
									<option value="+964">+964 이라크</option>
									<option value="+972">+972 이스라엘</option>
									<option value="+20">+20 이집트</option>
									<option value="+39">+39 이탈리아</option>
									<option value="+91">+91 인도</option>
									<option value="+62">+62 인도네시아</option>
									<option value="+246">+246 인도양</option>
									<option value="+81">+81 일본</option>
									<option value="+1">+1 자메이카</option>
									<option value="+260">+260 잠비아</option>
									<option value="+44">+44 저지</option>
									<option value="+240">+240 적도기니</option>
									<option value="+995">+995 조지아</option>
									<option value="+0">+0 존스턴 앳홀</option>
									<option value="+86">+86 중국</option>
									<option value="+236">+236 중앙아프리카공화국</option>
									<option value="++253">+253 지부티</option>
									<option value="+350">+350 지브롤터</option>
									<option value="+263">+263 짐바브웨</option>
									<option value="+235">+235 차드</option>
									<option value="+420">+420 체코공화국</option>
									<option value="+56">+56 칠레</option>
									<option value="+237">+237 카메룬</option>
									<option value="+238">+238 카보베르데</option>
									<option value="+7">+7 카자흐스탄</option>
									<option value="+974">+974 카타르</option>
									<option value="+855">+855 캄보디아</option>
									<option value="+1">+1 캐나다</option>
									<option value="+254">+254 케냐</option>
									<option value="+1">+1 케이맨제도</option>
									<option value="+269">+269 코모로</option>
									<option value="+0">+0 코소보</option>
									<option value="+506">+506 코스타리카</option>
									<option value="+61">+61 코코스(킬링)제도</option>
									<option value="+225">+225 코트디부아르</option>
									<option value="+57">+57 콜롬비아</option>
									<option value="+242">+242 콩고</option>
									<option value="+243">+243 콩고민주공화국</option>
									<option value="+965">+965 쿠웨이트</option>
									<option value="+682">+682 쿡제도</option>
									<option value="+599">+599 퀴라소</option>
									<option value="+385">+385 크로아티아</option>
									<option value="+61">+61 크리스마스 섬</option>
									<option value="+996">+996 키르기스스탄</option>
									<option value="+686">+686 키리바시공화국</option>
									<option value="+357">+357 키프로스</option>
									<option value="+66">+66 타이</option>
									<option value="+886">+886 타이완</option>
									<option value="+992">+991 타지키스탄</option>
									<option value="+255">+255 탄자니아</option>
									<option value="+1">+1 터크스케이커스</option>
									<option value="+90">+90 터키</option>
									<option value="+228">+228 토고</option>
									<option value="+690">+690 토켈라우</option>
									<option value="+676">+676 통가</option>
									<option value="+993">+993 투르크메니스탄</option>
									<option value="+688">+688 투발루</option>
									<option value="+216">+216 튀니지</option>
									<option value="+1">+1 트리니다드토바고</option>
									<option value="+507">+507 파나마</option>
									<option value="+595">+595 파라과이</option>
									<option value="+92">+92 파키스탄</option>
									<option value="+675">+675 파푸아뉴기니</option>
									<option value="+680">+680 팔라우</option>
									<option value="+970">+970 팔레스타인 영토</option>
									<option value="+298">+298 페로제도</option>
									<option value="+51">+51 페루</option>
									<option value="+351">+351 포르투갈</option>
									<option value="+500">+500 포클랜드제도</option>
									<option value="+48">+48 폴란드</option>
									<option value="+1">+1 푸에르토리코</option>
									<option value="+33">+33 프랑스</option>
									<option value="+689">+689 프랑스령 폴리네시아</option>
									<option value="+594">+594 프랑스령기아나</option>
									<option value="+679">+679 피지</option>
									<option value="+358">+358 핀란드</option>
									<option value="+63">+63 필리핀</option>
									<option value="+0">+0 핏케언 섬</option>
									<option value="+36">+36 헝가리</option>
									<option value="+852">+852 홍콩</option>
								</select>
								&nbsp;&nbsp;
								<input type="tel" class="inputStyle" id="orderTel" name="orderTel" size="35">
							</td>
						</tr>
						<tr class="textW">
							<td colspan="2"><span id="telWTEXT">유효한 전화번호를 입력하세요.</span></td>
						</tr>
					</table>
				</div>
				<br><br>
				<div class="title">
					<label>&nbsp;③ 결제 정보</label>		
				</div>
				<div class="payDetail" align="center" style="margin-top:2px;">
					<table id="payTable">
						<tr>
							<td width="80px"><b>포인트</b></td>
							<td width="130px">
								<input type="text" class="inputStyle" id="point" name="point" size="10" value="0" style="text-align:right;" disabled> P
							</td>
							<td>
								<button type="button" class="btn btn-primary btn-sm" onclick="return pointCheck();">조회</button>
								<div style="display:inline-block"> ( <span id="pointView">0</span> P 보유 ) </div>
								<div id="pointError" style="display:inline-block"><font style="color:red; font-size:11px;">보유 포인트가 부족합니다.</font></div>
							</td>
						</tr>
						<tr>
							<td><b>결제 금액</b></td>
							
							<c:if test="${ sessionScope.cur != null }">
								<fmt:parseNumber value="${ sessionScope.cur.get(1) }" integerOnly="false" pattern="#,###.##" var="parseCur"/>
								<c:if test="${ sessionScope.cur.get(0) == '¥' || sessionScope.cur.get(0) == 'Rp' }">
									<td colspan="2">${ sessionScope.cur.get(0) } <fmt:formatNumber value="${ (((param.price * reservation.period) * 0.1) + (param.price * reservation.period)) / (parseCur * 10) }" pattern="#,###.##"/></td>
								</c:if>
								<c:if test="${ sessionScope.cur.get(0) == '$' }">
									<td colspan="2">${ sessionScope.cur.get(0) } <fmt:formatNumber value="${ (((param.price * reservation.period) * 0.1) + (param.price * reservation.period)) / (parseCur * 1000) }" pattern="#,###.##"/></td>
								</c:if>
								<c:if test="${ sessionScope.cur.get(0) != '¥' && sessionScope.cur.get(0) != 'Rp' && sessionScope.cur.get(0) != '$' }">
									<td colspan="2">${ sessionScope.cur.get(0) } <fmt:formatNumber value="${ (((param.price * reservation.period) * 0.1) + (param.price * reservation.period)) / parseCur }" pattern="#,###.##"/></td>
								</c:if>
							</c:if>
							<c:if test="${ sessionScope.cur == null }">
								<td colspan="2">₩ <fmt:formatNumber value="${ (((param.price * reservation.period) * 0.1) + (param.price * reservation.period)) }" pattern="#,###.##"/></td>
							</c:if>
							
						</tr>
						<tr>
							<td colspan="3"><hr style="width:644px; border-style:dashed; border-width:2px; border-color:gold;"></td>
						</tr>
						<tr>
							<td><b style="font-size:20px;">총 금액</b></td>
							
							<c:if test="${ sessionScope.cur != null }">
								<fmt:parseNumber value="${ sessionScope.cur.get(1) }" integerOnly="false" pattern="#,###.##" var="parseCur"/>
								<c:if test="${ sessionScope.cur.get(0) == '¥' || sessionScope.cur.get(0) == 'Rp' }">
									<td colspan="2"><b style="font-size:20px;">${ sessionScope.cur.get(0) }</b><b style="font-size:20px;" id="totalPrice"> <fmt:formatNumber value="${ (((param.price * reservation.period) * 0.1) + (param.price * reservation.period)) / (parseCur * 10) }" pattern="#,###.##"/></b></td>
								</c:if>
								<c:if test="${ sessionScope.cur.get(0) == '$' }">
									<td colspan="2"><b style="font-size:20px;">${ sessionScope.cur.get(0) }</b><b style="font-size:20px;" id="totalPrice"> <fmt:formatNumber value="${ (((param.price * reservation.period) * 0.1) + (param.price * reservation.period)) / (parseCur * 1000) }" pattern="#,###.##"/></b></td>
								</c:if>
								<c:if test="${ sessionScope.cur.get(0) != '¥' && sessionScope.cur.get(0) != 'Rp' && sessionScope.cur.get(0) != '$' }">
									<td colspan="2"><b style="font-size:20px;">${ sessionScope.cur.get(0) }</b><b style="font-size:20px;" id="totalPrice"> <fmt:formatNumber value="${ (((param.price * reservation.period) * 0.1) + (param.price * reservation.period)) / parseCur }" pattern="#,###.##"/></b></td>
								</c:if>
							</c:if>
							<c:if test="${ sessionScope.cur == null }">
								<td colspan="2"><b style="font-size:20px;">₩</b><b style="font-size:20px;" id="totalPrice"> <fmt:formatNumber value="${ (((param.price * reservation.period) * 0.1) + (param.price * reservation.period)) }" pattern="#,###.##"/></b></td>
							</c:if>
							
						</tr>
						<tr style="text-align:center;">
							<td colspan="3">
								<button class="btn btn-default" style="width:100px; height:30px;">이전으로</button>
								&nbsp;&nbsp;&nbsp;
								<button type="button" onclick="return pay();" class="btn btn-success" id="payBtn" style="width:100px; height:30px;">결제하기</button>
								
							</td>
						</tr>
					</table>
				</div>
				<br><br>
			</div>
		</form>
		<div class="payArea">
			<div class="priceDatail" align="center">
				<br>
				<table id="priceTable">
					<tr height="100px" style="border-bottom:1px solid lightgray;">
						<th colspan="2">
							<font style="font-size:18px;">${ reservation.roomName }</font>
							<br>
							<font style="font-size:16px; font-weight:normal;">${ reservation.rSdate } - ${ reservation.rEdate }</font>
						</th>
					</tr>
					<tr height="40px">
						<td>1박 요금</td>
						
						<c:if test="${ sessionScope.cur != null }">
							<fmt:parseNumber value="${ sessionScope.cur.get(1) }" integerOnly="false" pattern="#,###.##" var="parseCur"/>
							<c:if test="${ sessionScope.cur.get(0) == '¥' || sessionScope.cur.get(0) == 'Rp' }">
								<td style="text-align:right;">${ sessionScope.cur.get(0) } <fmt:formatNumber value="${ param.price / (parseCur * 10) }" pattern="#,###.##"/></td>
							</c:if>
							<c:if test="${ sessionScope.cur.get(0) == '$' }">
								<td style="text-align:right;">${ sessionScope.cur.get(0) } <fmt:formatNumber value="${ param.price / (parseCur * 1000) }" pattern="#,###.##"/></td>
							</c:if>
							<c:if test="${ sessionScope.cur.get(0) != '¥' && sessionScope.cur.get(0) != 'Rp' && sessionScope.cur.get(0) != '$' }">
								<td style="text-align:right;">${ sessionScope.cur.get(0) } <fmt:formatNumber value="${ param.price / parseCur }" pattern="#,###.##"/></td>
							</c:if>
						</c:if>
						<c:if test="${ sessionScope.cur == null }">
							<td style="text-align:right;">₩ <fmt:formatNumber value="${ param.price }" pattern="#,###.##"/></td>
						</c:if>
						
					</tr>
					<tr height="40px">
						<td>객실 수</td>
						<td style="text-align:right;">${ reservation.oRcount }</td>
					</tr>
					<tr height="40px">
						<td>박</td>
						<td style="text-align:right;">${ reservation.period }</td>
					</tr>
					<tr height="40px">
						<td>인원 수</td>
						<td style="text-align:right;">${ reservation.people }</td>
					</tr>
					<tr height="40px">
						<td>소계</td>
						
						<c:if test="${ sessionScope.cur != null }">
							<fmt:parseNumber value="${ sessionScope.cur.get(1) }" integerOnly="false" pattern="#,###.##" var="parseCur"/>
							<c:if test="${ sessionScope.cur.get(0) == '¥' || sessionScope.cur.get(0) == 'Rp' }">
								<td style="text-align:right;">${ sessionScope.cur.get(0) } <fmt:formatNumber value="${ (param.price * reservation.period) / (parseCur * 10) }" pattern="#,###.##"/></td>
							</c:if>
							<c:if test="${ sessionScope.cur.get(0) == '$' }">
								<td style="text-align:right;">${ sessionScope.cur.get(0) } <fmt:formatNumber value="${ (param.price * reservation.period) / (parseCur * 1000) }" pattern="#,###.##"/></td>
							</c:if>
							<c:if test="${ sessionScope.cur.get(0) != '¥' && sessionScope.cur.get(0) != 'Rp' && sessionScope.cur.get(0) != '$' }">
								<td style="text-align:right;">${ sessionScope.cur.get(0) } <fmt:formatNumber value="${ (param.price * reservation.period) / parseCur }" pattern="#,###.##"/></td>
							</c:if>
						</c:if>
						<c:if test="${ sessionScope.cur == null }">
							<td style="text-align:right;">₩ <fmt:formatNumber value="${ (param.price * reservation.period) }" pattern="#,###.##"/></td>
						</c:if>
						
					</tr>
					<tr height="40px">
						<td>세금 및 봉사료</td>
						
						<c:if test="${ sessionScope.cur != null }">
							<fmt:parseNumber value="${ sessionScope.cur.get(1) }" integerOnly="false" pattern="#,###.##" var="parseCur"/>
							<c:if test="${ sessionScope.cur.get(0) == '¥' || sessionScope.cur.get(0) == 'Rp' }">
								<td style="text-align:right;">${ sessionScope.cur.get(0) } <fmt:formatNumber value="${ ((param.price * reservation.period) * 0.1) / (parseCur * 10) }" pattern="#,###.##"/></td>
							</c:if>
							<c:if test="${ sessionScope.cur.get(0) == '$' }">
								<td style="text-align:right;">${ sessionScope.cur.get(0) } <fmt:formatNumber value="${ ((param.price * reservation.period) * 0.1) / (parseCur * 1000) }" pattern="#,###.##"/></td>
							</c:if>
							<c:if test="${ sessionScope.cur.get(0) != '¥' && sessionScope.cur.get(0) != 'Rp' && sessionScope.cur.get(0) != '$' }">
								<td style="text-align:right;">${ sessionScope.cur.get(0) } <fmt:formatNumber value="${ ((param.price * reservation.period) * 0.1) / parseCur }" pattern="#,###.##"/></td>
							</c:if>
						</c:if>
						<c:if test="${ sessionScope.cur == null }">
							<td style="text-align:right;">₩ <fmt:formatNumber value="${ ((param.price * reservation.period) * 0.1) }" pattern="#,###.##"/></td>
						</c:if>
						
					</tr>
					<tr height="60px" style="background:lightgray;">
						<th style="font-size:18px;">합계</th>
						
						<c:if test="${ sessionScope.cur != null }">
							<fmt:parseNumber value="${ sessionScope.cur.get(1) }" integerOnly="false" pattern="#,###.##" var="parseCur"/>
							<c:if test="${ sessionScope.cur.get(0) == '¥' || sessionScope.cur.get(0) == 'Rp' }">
								<th style="text-align:right; font-size:18px;">${ sessionScope.cur.get(0) } <fmt:formatNumber value="${ (((param.price * reservation.period) * 0.1) + (param.price * reservation.period)) / (parseCur * 10) }" pattern="#,###.##"/></td>
							</c:if>
							<c:if test="${ sessionScope.cur.get(0) == '$' }">
								<th style="text-align:right; font-size:18px;">${ sessionScope.cur.get(0) } <fmt:formatNumber value="${ (((param.price * reservation.period) * 0.1) + (param.price * reservation.period)) / (parseCur * 1000) }" pattern="#,###.##"/></td>
							</c:if>
							<c:if test="${ sessionScope.cur.get(0) != '¥' && sessionScope.cur.get(0) != 'Rp' && sessionScope.cur.get(0) != '$' }">
								<th style="text-align:right; font-size:18px;">${ sessionScope.cur.get(0) } <fmt:formatNumber value="${ (((param.price * reservation.period) * 0.1) + (param.price * reservation.period)) / parseCur }" pattern="#,###.##"/></td>
							</c:if>
						</c:if>
						<c:if test="${ sessionScope.cur == null }">
							<th style="text-align:right; font-size:18px;">₩ <fmt:formatNumber value="${ (((param.price * reservation.period) * 0.1) + (param.price * reservation.period)) }" pattern="#,###.##"/></td>
						</c:if>
						
					</tr>
				</table>
			</div>
			<div id="paypalInfoArea" align="center">
				<br>
				<table id="paypalTable">
					<tr>
						<td>
							<font style="font-size:15px; margin-left:2px;"><font style="color:red;">*</font> Payment System&nbsp;&nbsp;(USD)</font>
							<br>
							<img id="paypalLogo" src="${ contextPath }/resources/img/paypalLogo.png" style="margin-left:5px;">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	<script>
	
		// 환율 적용
		var curIcon = $("#CURICON").val();
		var currency = $("#CUR").val();
		//console.log(currency);
		//console.log(currency);
		currency=parseFloat(currency);
		
		//console.log(curIcon);
		//console.log(currency);
		
		if(curIcon == '¥'){
			currency=currency*10;
		}
		if(curIcon == 'Rp'){
			currency=currency*10;
		}
		if(curIcon == '$'){
			currency=currency*1000;
		}
		
		function numberWithCommas(x){
			x=x.toFixed(2);
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	
		$(function(){
			
			$("#fnameWTEXT").hide();
			$("#lnameWTEXT").hide();
			$("#emailWTEXT").hide();
			$("#telWTEXT").hide();
			
			$("#pointError").hide();
			
			$("#firstName").blur(function(){
				fNameCheck();
			});
			
			$("#lastName").blur(function(){
				lNameCheck();
			});
			
			$("#orderEmail").blur(function(){
				oEmailCheck();
			});
			
			$("#orderTel").blur(function(){
				oTelCheck();
			});
			
			$("#point").blur(function(){
				calPrice();
			});
		});
		
		function fNameCheck(){
			var fName=$("#firstName").val();
			
			console.log(fName);
			
			if(fName == ""){
				$("#fnameWTEXT").show();
				$("#firstName").css("border", "1px solid red");
			}
			else{
				$("#fnameWTEXT").hide();
				$("#firstName").css("border", "1px solid lightgray");
			}
		}
		
		function lNameCheck(){
			var lName=$("#lastName").val();
			
			console.log(lName);
			
			if(lName == ""){
				$("#lnameWTEXT").show();
				$("#lastName").css("border", "1px solid red");
			}
			else{
				$("#lnameWTEXT").hide();
				$("#lastName").css("border", "1px solid lightgray");
			}
		}
		
		function oEmailCheck(){
			var oEmail=$("#orderEmail").val();
			var result=oEmail.search("@");
			
			console.log(oEmail);
			console.log(result);
			
			if(oEmail == "" || result == -1){
				$("#emailWTEXT").show();
				$("#orderEmail").css("border", "1px solid red");
			}
			else{
				$("#emailWTEXT").hide();
				$("#orderEmail").css("border", "1px solid lightgray");
			}
		}
		
		function oTelCheck(){
			var oTel=$("#orderTel").val();
			var re = /^[0-9]+$/;
			
			console.log(oTel);
			
			if(oTel == "" || !re.test(oTel) || oTel.length<9 || oTel.length>11){
				$("#telWTEXT").show();
				$("#orderTel").css("border", "1px solid red");
			}
			else{
				$("#telWTEXT").hide();
				$("#orderTel").css("border", "1px solid lightgray");
			}
		}
		
		function pointCheck(){
			$.ajax({
				url:"selectUserPoint.pay",
				type:"post",
				success:function(data){
					console.log(data);
					
					$pointBody=$("#pointView");
					$pointBody.html('');
					
					$pointBody.append(data);
					
					if(data == 0){
						$("#point").attr("disabled", "disabled");
					}
					else{
						$("#point").attr("disabled", false);
					}
					
				},
				error:function(data){
					console.log(data);
				}
			});
		}
		
		var originPrice=$("#originPrice").val();
		var totalPrice=$("#price").val();
		
		console.log(originPrice);
		console.log(totalPrice);
		
		originPrice=parseFloat(originPrice);
		totalPrice=parseFloat(totalPrice);
		
		function calPrice(){
			var userPoint=$("#pointView").text();
			var point=$("#point").val();
			
			console.log("userP : " + userPoint);
			console.log("textP : " + point);
			
			if(parseInt(userPoint) >= parseInt(point)){
				$("#pointError").hide();
				originPrice=originPrice - point;
				cPrice=originPrice / currency;
				
				console.log(originPrice);
				console.log(cPrice);
				console.log(currency);
				
				cPrice=numberWithCommas(cPrice);
				
				console.log(cPrice);
				
				$("#totalPrice").html(" " + cPrice);
			}
			else{
				$("#pointError").show();
			}
		}
		
		function pay(){
			var point=$("#point").val();
			var fName=$("#firstName").val();
			var lName=$("#lastName").val();
			
			var nation=$("#national").val();
			var tel=$("#orderTel").val();
			
			var mId=$("#loginMID").val();
			
			var oId=$("#oId").val();
			
			var orderName=fName + " " + lName;
			var orderEmail=$("#orderEmail").val();
			var orderTel=nation + " " + tel;
			
			var point=$("#point").val();
			var pMethod;
			
			if(point != 0){
				pMethod="pc";
			}
			else{
				pMethod="c";
			}
			
			if(fName == ""){
				$("#firstName").focus();
				$("#fnameWTEXT").show();
				$("#firstName").css("border", "1px solid red");
			}
			else if(lName == ""){
				$("#lastName").focus();
				$("#lnameWTEXT").show();
				$("#lastName").css("border", "1px solid red");
			}
			else if(orderEmail == ""){
				$("#orderEmail").focus();
				$("#emailWTEXT").show();
				$("#orderEmail").css("border", "1px solid red");
			}
			else if(tel == ""){
				$("#orderTel").focus();
				$("#telWTEXT").show();
				$("#orderTel").css("border", "1px solid red");
			}
			else{
				console.log(point);
				console.log(totalPrice);
				$("#orderInfo").attr("value", (mId + "," + orderName + "," + orderTel + "," + orderEmail + "," + pMethod + "," + point + "," + oId + "," + originPrice));
				$("#orderPrice").attr("value", (originPrice * 0.00088));
				$("#payPalForm").attr("action", "https://www.sandbox.paypal.com/cgi-bin/webscr");
				$("#payBtn").attr("type", "submit");
			}
			
		}
		
	</script>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<%-- <script type="text/javascript" src="<%= request.getContextPath() %>/js/common/ext_util.js"></script><!-- 외부 유틸 js -->
<script type="text/javascript" src="<%= request.getContextPath() %>/js/common/constants.js"></script><!-- 상수 js --> 
<script type="text/javascript" src="<%= request.getContextPath() %>/js/common/common.js"></script><!-- 사용자정의 js -->  --%>

<style>
	.container {
	width: 100%;
	max-width: 400px;
	margin-top: 150px;
	margin-bottom: 100px;
	padding: 40px 40px;
	font-family: Roboto, 'Noto Sans KR', sans-serif;
	border: 1px solid lightgray;
	border-radius: 10px;
}

#real_nameFrm input[type=text], #real_nameFrm button {
	direction: ltr;
	height: 44px;
	font-size: 14px;
	width: 100%;
	height: 40px;
	display: block;
	margin-bottom: 10px;
	z-index: 1;
	position: relative;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	border: 1px solid #ccc;
}

#real_nameFrm .input-sm:focus {
	border-color: rgb(104, 145, 162);
	outline: 0;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgb(104, 145, 162);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgb(104, 145, 162);
}

p, label {
	text-align: center;
	font-weight: 400;
	color: rgba(0, 0, 0, 0.54);
} 
p {
    font-size:smaller;
}
#left{
    text-align:left;
}

</style>
</head>
<body>

	
    
	<div class="container">
	<h2 align="center" style="font-size:30px">투자자 인증하기</h2>
	
	<hr><p>* 투자자 인증에 앞서 비상장기업 투자는 원금 손실의 가능성이 크니 투자 위험 안내를 확인하세요.</p>
	<br>
	<div align="center">
    <button class="form-control btn btn-danger" data-toggle="modal" data-target="#myModal">투자위험고지 확인하기</button>
    </div>
    <hr>
	<h3 align="center" style="font-size:24px">계좌실명인증</h3>
	<br>
	
	<input type="hidden" class="input-sm" id="client_id" name="client_id" value="l7xxcf82f30569374f8593bedddd59b62018">
	<input type="hidden" class="input-sm" id="client_secret" name="client_secret" value="8096f01f6b2048d789198a7c3108950b">
	<input type="hidden" class="input-sm" id="token" name="token">
	<input type="hidden" class="input-sm" id="account_holder_info_type" name="account_holder_info_type">
	
	<form id="real_nameFrm" action="/updateInvestorMember" method="post">
	<input type="hidden" id="userId" name="userId">
	<input type="hidden" class="input-sm" id="tran_dtime" name="tran_dtime">
	<input type="hidden" class="input-sm" id="bank_code_std" name="bank_code_std">
	<div>
	<label style="font-size:14px">은행명&nbsp;&nbsp;</label><br>
	<select id="bankcode" style="font-size:14px">
	    <option value="003">기업은행</option>
	    <option value="004">국민은행</option>
	    <option value="011">농협중앙회</option>
	    <option value="012">단위농협</option>
	    <option value="020">우리은행</option>
	    <option value="031">대구은행</option>
	    <option value="005">외환은행</option>
	    <option value="023">SC제일은행</option>
	    <option value="032">부산은행</option>
	    <option value="045">새마을금고</option>
	    <option value="027">한국씨티은행</option>
	    <option value="034">광주은행</option>
	    <option value="039">경남은행</option>
	    <option value="007">수협</option>
	    <option value="048">신협</option>
	    <option value="037">전북은행</option>
	    <option value="035">제주은행</option>
	    <option value="064">산림조합</option>
	    <option value="071">우체국</option>
	    <option value="081">하나은행</option>
	    <option value="088">신한은행</option>
	    <option value="209">동양종금증권</option>
	    <option value="243">한국투자증권</option>
	    <option value="240">삼성증권</option>
	    <option value="230">미래에셋</option>
	    <option value="247">우리투자증권</option>
	    <option value="218">현대증권</option>
	    <option value="266">SK증권</option>
	    <option value="278">신한금융투자</option>
	    <option value="262">하이증권</option>
	    <option value="263">HMC증권</option>
	    <option value="267">대신증권</option>
	    <option value="270">하나대투증권</option>
	    <option value="279">동부증권</option>
	    <option value="280">유진증권</option>
	    <option value="287">메리츠증권</option>
	    <option value="291">신영증권</option>
	    <option value="238">대우증권</option>
	</select>
	</div>
	<br>
	<label style="font-size:14px"> 계좌주(투자자 이름) </label><br>
    <input type="text" class="input-sm" id="name" name="name" readonly required>
    <label style="font-size:14px"> 연락처 </label><br>
    <input type="text" class="input-sm" id="phone" name="phone" readonly required>

	
	<label style="font-size:14px"> 계좌번호 </label><br>
    <input type="text" class="input-sm" id="account_num" name="account_num" maxlength="16" placeholder="'-'없이 입력하세요" required>
	<div class="error-accountNum">
	<label style="color: red; font-style: italic;">계좌번호는 숫자만 입력하실 수 있습니다.</label>
	</div>
	<label style="font-size:14px"> 생년월일 </label><br>
	<input type="text" class="input-sm" id="account_holder_info" name="account_holder_info" maxlength="6" placeholder="ex. 880101과 같이 6자리로 입력하세요" required>
	<div class="error-birthNum">
	<label style="color: red; font-style: italic; font-size:14px;">생년월일은 숫자만 입력하실 수 있습니다.</label>
	</div>
	<div class="error-birthNum2">
	<label style="color: red; font-style: italic font-size:14px;">생년월일은 6자리입니다.</label>
	</div>
	</form>
    
		<br>
		<button class="form-control btn btn-primary" id="btnRealNameInquiry" type="button">투자자 인증받기</button>
    <hr>
    <p>* 투자 인증을 진행하기 위해서는 회원님의 투자자 정보가 실제 정보와 일치해야 합니다. 위의 공란을작성하여 계좌실명인증을 진행해 주시기 바랍니다.</p>
    <p>* 계좌주 및 연락처의 변경은 <a href="updateMember.jsp" style="color:#428bca;">개인정보수정</a> 메뉴를 통해 가능합니다.</p>
	</div>
	
	<div>
		<%@ include file="../common/footer.jsp"%>
	    </div>
	    
	    <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h3 class="modal-title" align="center" style="font-size:24px">투자 위험 주지 및 고지</h3>
        </div>
        <div class="modal-body">
          <p id="left"><br>
 &nbsp;본 위험고지서는 자본시장과 금융투자에 관한 법률(이하 “자본시장법”이라고만 합니다) 제117조의7 제4항에 의하여 귀하가 iCrowd에 청약의 주문을 하기 전에 투자의 위험을 사전에 충분히 인지할 수 있도록 iCrowd가 귀하에게 교부하는 것입니다.<br>
 <br>
 &nbsp;1. 귀하는 투자대상인 금융투자상품은 자본시장법에 따른 “증권”에 해당하므로 원본손실의 위험성이 있으며, 청약증거금 등 투자한 자금의 원본을 회수할 없음에 따른 손실의 위험이 있음을 이해합니다. 또한 귀하가 예상하거나 기대하는 수익의 일부 또는 전부를 얻지 못할 수 있습니다.<br>
 &nbsp;2. 귀하는 iCrowd의 홈페이지에 게재(정정)된 모집되는 증권의 발행조건, 발행인의 재무상태가 기재된 서류 및 사업계획서의 내용, 증권의 취득에 따른 투자위험요소 등을 충분히 확인하였으며, 청약의 주문 시 회사는 투자 위험의 고지 등에 관하여 별도로 정한 방법에 의하여 통지하는 내용에 대하여 확인합니다.<br>
 &nbsp;3. 귀하는 금번에 발행되는 비상장 증권의 발행목적은 한국거래소의 상장에 있는 것은 아니므로 증권의 환금성에 큰 제약이 있음과 귀하가 예상하는 회수금액에 대한 일부 또는 전부를 회수할 수 없는 위험이 있음을 이해하며, 귀하가 이를 감당할 수 있음을 확인합니다.<br>
 &nbsp;4. 귀하는 시장의 상황, 제도의 변경이 있을 수 있으며, 자본시장법 등 관련법규에 근거하여 투자의 한도에 제한이 있는 경우 이를 준수하여야 함을 이해합니다.<br>
 &nbsp;5. 귀하는 자본시장법 제117조의10 제7항에 따라 전문투자자(벤처캐피탈 등)에 대한 매도 등 예외적인 경우를 제외하고는 원칙적으로 6개월간 전매가 제한된다는 점을 이해합니다.<br>
 &nbsp;6. 귀하는 정부가 투자대상인 증권과 관련하여 게재된 사항이 진실 또는 정확하다는 것을 인정하거나 해당 증권의 가치를 보증 또는 승인한 것이 아니라는 점과 게재된 투자정보에 관한 사항은 청약기간 종료 전에 정정될 수 있음을 확인합니다.<br>
 &nbsp;7. 귀하는 청약기간 중에만 한정하여 청약의 철회가 가능하며(청약기간 종료일 이후에는 청약의 철회 불가), 청약기간의 종료 시 모집금액이 발행인이 목표한 모집예정금액의 80% 미달하는 경우 증권의 발행은 취소된다는 점을 이해합니다.<br>
 <br>
 &nbsp;8. 귀하는 아래 사항들에 대하여도 이해하였음을 확인합니다.<br>
 <br>
 &nbsp;1) iCrowd는 온라인소액증권 청약과 관련하여 별도의 수수료는 징수하지 않습니다.<br>
 &nbsp;2) 발행인이 증권의 발행조건과 관련하여 조기상환조건을 설정한 경우 이에 대한 구체적인 내용을 홈페이지를 통해 반드시 확인하여야 합니다.<br>
 &nbsp;3) iCrowd는 자본시장법상의 온라인소액투자중개업자로서의 지위에서 온라인소액증권발행인과 온라인소액투자중개계약을 체결하여 위 발행인이 발행하는 증권에 대한 청약 거래를 중개하므로, 모집예정금액에 도달한다고 하더라도 직접 증권의 발행하거나 주금을 납입 받지 않습니다.<br>
 &nbsp;4) 청약의 우대차별사유 : iCrowd는 발행인의 요청에 따라 합리적이고 명확한 기준(선착순 등)에 따라 투자자의 자격 등을 제한할 수 있습니다. 이 경우 귀하는 위 기준과 조건에 따라 청약거래에 있어 차별을 받게 될 수 있습니다.<br>
 <br>
 &nbsp;위 사항들은 청약의 주문 거래에 수반되는 위험∙제도 및 청약의 주문 거래와 관련하여 귀하가 알아야 할 사항을 간략하게 서술한 것으로 귀하의 위 거래와 관련하여 발생될 수 있는 모든 위험과 중요 사항을 전부 기술한 것은 아닙니다. 따라서 상세한 내용은 iCrowd 및 관계법규를 통하여 확인하여야 합니다. 또한 이 고지서는 청약의 주문 관련 법규 등에 우선하지 못한다는 점을 양지하시기 바랍니다.<br></p>
        </div>
      </div>
      
    </div>
  </div>

	    <script>

	    $(function(){
	     
	    	$("#userId").val(userId);
	    	
	    	
	    	if(userName != "null"){
	    		$("#name").val(userName);
	    	}
	    	
	    	if(phone != "null"){
	    		$("#phone").val(phone);
	    	}
	    	
	    	
	    	var accountNum = $("#account_num");
	    	var birthNum = $("#account_holder_info");
	    	
	    	$(".error-accountNum").hide();
	    	$(".error-birthNum").hide();
	    	$(".error-birthNum2").hide();
	    	
	    	
	    	accountNum.blur(function(){
	    		$(".error-accountNum").hide();
	    		
		    	if (isNaN(accountNum.val())) {
			    	$(".error-accountNum").show();
			    	accountNum.select();
				}else{
					$(".error-accountNum").hide();
				}
		    	
		    });
	    	
	    	birthNum.blur(function(){
	    		$(".error-birthNum").hide();
		    	$(".error-birthNum2").hide();
		    	
		    	if (isNaN(birthNum.val())) {
			    	$(".error-birthNum").show();
			    	birthNum.select();
				}else{
					$(".error-birthNum").hide();
				}
		    	
		    	if (birthNum.val().length < 6) {
			    	$(".error-birthNum2").show();
			    	birthNum.select();
				}else{
					$(".error-birthNum2").hide();
				}
		    	
		    });
	    	
	    });
	    
	    $(function(){
	    	setFieldVal();
	    	bindEvents();
	    });

	    function setFieldVal(){
	    	 $('#tran_dtime').val(new Date().format('yyyyMMddHHmmss')); // 요청일시
	    	 getTokenByClientCredentials(); //access-token 발급 요청
	    	 
	    	 //은행코드
	    	 $("#bank_code_std").val($("#bankcode option:selected").val());
	    	 //console.log($("#bank_code_std").val());
	    	 $("#bankcode").change(function() {
		    		$("#bank_code_std").val($("#bankcode option:selected").val());
		    		//console.log($("#bank_code_std").val());
		    	});
	    }
	    
	    function bindEvents(){
	    	//인증요청
	    	$('#btnRealNameInquiry').on('click', function(e){ 
	    		
	    		$(".error-accountNum").hide();
	    		$(".error-birthNum").hide();
		    	$(".error-birthNum2").hide();
		    	
	    		if($(".error-accountNum").is(':visible')){
					return;
				}else if($(".error-birthNum").is(':visible')){
					return;
				}else if($(".error-birthNum2").is(':visible')){
					return;
				}
	    		
	    		inquiryRealName(); });
	    	
	    }

	    function inquiryRealName(){

	    	if(isEmptyElem('token')){
	    		showMsg('Access Token을 먼저 획득해 주십시오.');
	    		return;
	    	}
	    	
	    	$.ajax({
	    		url:  "https://testapi.open-platform.or.kr/v1.0/inquiry/real_name",
	    		type: 'post',
	    		headers: {
	    			'Authorization': ('Bearer ' + $('#token').val())
	    		},
	    		data: js($.extend({}, getFormParamObj('real_nameFrm'), {
	    			// additional parameters
	    		}))
	    	})
	    	.done(function(data, textStatus, jqXHR){
	    		if(isGatewayException(data)){ return; } // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.		
	    		 /* // UI에 결과값 바인딩
	    		$('#resultTextArea').val(js(data));  */
	    		//console.log(Object.keys(data));
	    		//console.log(data.rsp_code);
	    		if(data.rsp_code=="A0000" && data.account_holder_name==$("#name").val()){
	    		
	    				$("#real_nameFrm").submit();
	    				//alert("투자자 인증에 성공하였습니다.");}
	    	
	    		}else{
	    			alert("입력 정보가 일치하지 않아 계좌실명인증이 불가합니다. 입력 정보를 다시 한 번 확인해주세요.");
	    		}
	    	});
	    }

	    </script>
</body>
</html>
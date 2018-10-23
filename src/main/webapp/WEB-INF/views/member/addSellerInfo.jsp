<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
body{
	background:lightgray;

}

input{
		border-radius:5px;
	}
	#national{
		border-radius:5px;
	
	}
	#interest{
	border-radius:5px;
	
	}
	.content{
		width:800px;
		height:500px;
		margin-left:auto;
		margin-right:auto;
		
	}
	
	.paging{
	    padding:1%;
	    margin-bottom:3%;
	}
	#insertTable{
		 margin-top:100px;
		width:700px;
		border:1px solid lightgray;
		margin-left:auto;
		margin-right:auto;
	}
	#insertTable tr{
		height:40px;
		border-top:1px solid lightgray;
		border-bottom:1px solid lightgray;
	}
	#insertTable th{
		width:200px;
		text-align:center;
	}
	

</style>
</head>
<body>
	<%-- <jsp:include page="../common/menubar.jsp" />
	<h4 align="center">You can get more information by entering additional information!</h4>
	<div class="container">
		<input type="hidden" class="input-sm" id="client_id" name="client_id" value="l7xxcf82f30569374f8593bedddd59b62018">
	<input type="hidden" class="input-sm" id="client_secret" name="client_secret" value="8096f01f6b2048d789198a7c3108950b">
	<input type="hidden" class="input-sm" id="token" name="token">
	<input type="hidden" class="input-sm" id="account_holder_info_type" name="account_holder_info_type">
		
		<form action="addSeller.me" method="post" id="sellerForm">
			<table id="sellerTable">
			<input type="hidden" name="mId" value="${mid}"/>
				<tr>
					<th>이름</th>
					<td><input type="text" name="nickname" class="inputStyle" id="nickname"></td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td><input type="text" name="phone" class="inputStyle" id="phone"></td>
				</tr>
				<tr>
				<th>생년월일</th>
				<td><input type="text" name="birthDay" size="6" maxlength="6" placeholder="생년월일 6자리를 입력하세요" id="birthDay"></td>
				
				</tr>
				<tr>
					<th>계좌번호</th>
					<td><input type="text" name="bankNum" placeholder="'-'없이 입력하세요" id="bankNum"></td>
				</tr>
					<input type="hidden" class="input-sm" id="tran_dtime" name="tran_dtime">
					<input type="hidden" class="input-sm" id="bank_code_std" name="bank_code_std">
				<tr>
					<th>Bankchoice</th>
					<td>
					<select id="bankcode">
					<option value="-">---</option>
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
					</select>
					</td>
					<td><button onclick="return accountCheck()">계좌인증하기</button></td>	
				</tr>
			</table>
				<div align="center">
					<button type="button" onclick="allCheck()">회원가입하기</button>
				</div>
		</form>
		
	</div> --%>
	<jsp:include page="../common/menubar.jsp" />
	
	
	<div class="main">
		<div class="content">
			<form action="addUser.me" method="post" id="userForm" name="userForm"">
				 <input type="hidden" name="mId" value="${mid}" />
					<table id="insertTable">
					<thead>
						<tr>
							<th>이름</th>
							<td >
								<input type="text" name="nickname" id="nickname"/>
								<button type="button" onclick="nicknameCheck()" class="btn btn-success">중복체크</button>
							</td>
						</tr>
						<tr class="comType">
							<th>휴대전화</th>
							<td width="110px;">
							<input type="text" name="phone" id="phone">
							</td>
						</tr>
						<tr class="comType">
							<th>생년월일</th>
							<td width="110px;">
							<input type="text" name="birthDay" size="6" maxlength="6" placeholder="생년월일 6자리를 입력하세요" id="birthDay">
							</td>
						</tr>
						<tr class="comType">
							<th>계좌번호</th>
							<td width="110px;">
							<input type="text" name="bankNum" placeholder="'-'없이 입력하세요" id="bankNum">
							</td>
						</tr>
						<tr class="comType">
							<th>은행선택</th>
							<td width="110px;">
							<select id="bankcode">
					<option value="-">---</option>
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
					</select>
							</td>
						</tr>
						
				</table>
						<div align="center" style="margin-top:50px;"> 
								<button type="submit" class="btn btn-success">등록</button>
						</div>
							
			</form>
		</div>
	

	<script>
		$(function accountCheck(){
		/* 	var name = $("nickname");
			var bankNum =$("bank_num"); */
			
			 
			$("#bank_code_std").val($("#bankcode option:selected").val());
			
			/*  $("#bankcode").change(function() {
		    		$("#bank_code_std").val($("#bankcode option:select").val());
		
				 }); */
			 
			/*  if(isEmptyElem('token')){
		    		showMsg('Access Token을 먼저 획득해 주십시오.');
		    		return;
		    	} */
		    	
		    	$.ajax({
		    		url:  "https://testapi.open-platform.or.kr/v1.0/inquiry/real_name",
		    		type: 'post',
		    		headers: {
		    			'Authorization': ('Bearer ' + $('#token').val())
		    		},
		    		data: js($.extend({}, getFormParamObj('sellerForm'), {
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
		    		
		    				//$("#real_nameFrm").submit();
		    				alert("투자자 인증에 성공하였습니다.");
		    	
		    		}else{
		    			alert("입력 정보가 일치하지 않아 계좌실명인증이 불가합니다. 입력 정보를 다시 한 번 확인해주세요.");
		    		}
		    	});
			 });
	
	function allCheck(){
		 var nickname = $("nickname").val();
		 var bankNum = $("bankCode").val();
		 var phone = $("phone").val();
		 var birth = $("birthDay").val();
		 
		 if(nickname==null&& bankNum=="-"&&phone==null&&birth==null){
			 alert("정보를 모두 다 입력 하셔야 합니다");
			 
			 
		 }else{
			$("#sellerForm").submit();
			 
		 }
		 
		 
	}
	function nicknameCheck(){
		var nickname = $("#nickname").val();
		$.ajax({
			url:"nicknameCheck.me",
			type:"post",
			data:{
				nickname:nickname	
			},
			success: function(data){
				if(data ==0){
					alert("사용가능한 닉네임입니다");
				}else{
					alert("중복되는  닉네임입니다");
				}
			},
			error:function(){
				alert("실패");
			}

		});
	
	
}
	</script>

</body>
</html>
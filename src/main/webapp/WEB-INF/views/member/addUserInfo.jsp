<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>


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
	<jsp:include page="../common/menubar.jsp" />
	
	
	<div class="main">
		<div class="content">
		<div align="center">
			<h3>조금 더 진행하시면 더욱 더 많은 정보가!</h3>
		</div>
			<form action="addUser.me" method="post" id="userForm" name="userForm"">
				 <input type="hidden" name="mId" value="${mid}" />
					<table id="insertTable">
					<thead>
						<tr>
							<th>닉네임</th>
							<td >
								<input type="text" name="nickname" id="nickname"/>
								<button type="button" onclick="nicknameCheck()" class="btn btn-success">중복체크</button>
							</td>
						</tr>
						<tr class="comType">
							<th>국가</th>
							
							<td width="110px;">
							<select name="national" id="national">
							<option value="-">----</option>
							<option value="Ghana">Ghana</option>
							<option value="Gabon">Gabon</option>
							<option value="Guyana">Guyana</option>
							<option value="Gambia">Gambia</option>
							<option value="Guatemala">Guatemala</option>
							<option value="Grenada">Grenada</option>
							<option value="Greece">Greece</option>
							<option value="Guinea">Guinea</option>
							<option value="Guinea-Bissau">Guinea-Bissau</option>
							<option value="Namibia">Namibia</option>
							<option value="Nauru">Nauru</option>
							<option value="Nigeria">Nigeria</option>
							<option value="South Africa">South Africa</option>
							<option value="Netherlands">Netherlands</option>
							<option value="Nepal">Nepal</option>
							<option value="Norway">Norway</option>
							<option value="NewZealand">NewZealand</option>
							<option value="Korea">Korea</option>
							<option value="Denmark">Denmark</option>
							<option value="Dominica">Dominica</option>
							<option value="Germany">Germany</option>
							<option value="Laos">Laos</option>
							<option value="Russia">Russia</option>
							<option value="Romania">Romania</option>
							<option value="Luxembourg">Luxembourg</option>
							<option value="Malaysia">Malaysia</option>
							<option value="Mali">Mali</option>
							<option value="Mexico">Mexico</option>
							<option value="Monaco">Monaco</option>
							<option value="MaldiveIslands">MaldiveIslands</option>
							<option value="Malta">Malta</option>
							<option value="Mongolia">Mongolia</option>
							<option value="USA">USA</option>
							<option value="Myanmar">Myanmar</option>
							<option value="Vanuatu">Vanuatu</option>
							<option value="Bahrain">Bahrain</option>
							<option value="Barbados">Barbados</option>
							<option value="Vatican">Vatican</option>
							<option value="Bangladesh">Bangladesh</option>
							<option value="Vietnam">Vietnam</option>
							<option value="Belgium">Belgium</option>
							<option value="Bulgaria">Bulgaria</option>
							<option value="Brazil">Brazil</option>
							<option value="SaudiArabia">SaudiArabia</option>
							<option value="San Marino">San Marino</option>
							<option value="Senegal">Senegal</option>
							<option value="Serbia">Serbia</option>
							<option value="Somalia">Somalia</option>
							<option value="Sri Lanka">Sri Lanka</option>
							<option value="Sweden">Sweden</option>
							<option value="Swiss">Swiss</option>
							<option value="Spain">Spain</option>
							<option value="Syria">Syria</option>
							<option value="Slovakia">Slovakia</option>
							<option value="Slovenian">Slovenian</option>
							<option value="Singapore">Singapore</option>
							<option value="United Arab Emirates">United Arab Emirates</option>
							<option value="Armenia">Armenia</option>
							<option value="Argentina">Argentina</option>
							<option value="Iceland">Iceland</option>
							<option value="Azerbaijan">Azerbaijan</option>
							<option value="India">India</option>
							<option value="Afghanistan">Afghanistan</option>
							<option value="Algeria">Algeria</option>
							<option value="Angola">Angola</option>
							<option value="Ecuador">Ecuador</option>
							<option value="England">England</option>
							<option value="Yemen">Yemen</option>
							<option value="Oman">Oman</option>
							<option value="Australia">Australia</option>
							<option value="Austria">Austria</option>
							<option value="Jordan">Jordan</option>
							<option value="Uganda">Uganda</option>
							<option value="Uzbekistan">Uzbekistan</option>
							<option value="Ukraine">Ukraine</option>
							<option value="Iran">Iran</option>
							<option value="Israel">Israel</option>
							<option value="Italy">Italy</option>
							<option value="Indonesia">Indonesia</option>
							<option value="Japan">Japan</option>
							<option value="Jamaica">Jamaica</option>
							<option value="Zambia">Zambia</option>
							<option value="Georgia">Georgia</option>
							<option value="China">China</option>
							<option value="Czech Republic">Czech Republic</option>
							<option value="Chile">Chile</option>
							<option value="Cameroon">Cameroon</option>
							<option value="Cape Verde">Cape Verde</option>
							<option value="Kazakhstan">Kazakhstan</option>
							<option value="catarrh">catarrh</option>
							<option value="Cambodia">Cambodia</option>
							<option value="Canada">Canada</option>
							<option value="Kenya">Kenya</option>
							<option value="Comoros">Comoros</option>
							<option value="Costa Rica">Costa Rica</option>
							<option value="Cote d'Ivoire">Cote d'Ivoire</option>
							<option value="Columbia">Columbia</option>
							<option value="Congo">Congo</option>
							<option value="Cuba">Cuba</option>
							<option value="Kuwait">Kuwait</option>
							<option value="Croatia">Croatia</option>
							<option value="Tajikistan">Tajikistan</option>
							<option value="Tanzania">Tanzania</option>
							<option value="Thailand">Thailand</option>
							<option value="Turkey">Turkey</option>
							<option value="Togo">Togo</option>
							<option value="Panama">Panama</option>
							<option value="Paraguay">Paraguay</option>
							<option value="Pakistan">Pakistan</option>
							<option value="Papua New Guinea">Papua New Guinea</option>
							<option value="Palau">Palau</option>
							<option value="Peru">Peru</option>
							<option value="Portugal">Portugal</option>
							<option value="Poland">Poland</option>
							<option value="France">France</option>
							<option value="sebum">sebum</option>
							<option value="Finland">Finland</option>
							<option value="Philippines">Philippines</option>
							<option value="Hungary">Hungary</option>
							<option value="Archach">Archach</option>
							<option value="Somalia">Somalia</option>
							<option value="Taiwan">Taiwan</option>
					</select></td>
							
						</tr>
						<tr class="comType">
							<th>관심분야</th>
							<td width="110px;"><select name="interest" id="interest">
							<option value="-">----</option>
							<option value="뷰티">beauty</option>
							<option value="관광">tourism</option>
							<option value="전통">tradition</option>
							<option value="레져">Leisure</option>
					</select></td>
						</tr>
						
				</table>
						<div align="center" style="margin-top:50px;"> 
								<button type="submit" class="btn btn-success">등록</button>
						</div>
							
			</form>
		</div>
	
		
	</div>
	<script>
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
	
				})
			
			
		}
		function allCheck(){
			var national = $('#national').val();
			var interest = $('#interest').val();
			var nickname =$('#nickname').val();
			
			if(national == "-"&& interest == "-"){
				alert("입력을 해야 회원가입이 가능합니다 ");
			}else{
				alert("회원가입을 축하드립니다 (메인으로이동)")
				$("#userForm").submit();
				
			}
			
		}
	
	</script>
</body>
</html>
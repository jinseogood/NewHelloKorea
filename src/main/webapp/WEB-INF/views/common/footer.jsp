<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<style>
	#google_translate_element select{
		width:161px;
	}
	#etcArea{
		width:1170px;
		height:26px;
		display:block;
	}
	#currency{
		height:18px;
	}
</style>
</head>
<body>
	<footer class="tm-black-bg">
		<div class="container">
		  	<div id="google_translate_element"></div>
		  	<div id="etcArea">
				<select id="currency" onChange="javascript:changeCUR();">
					<option value="NO">Currency</option>
					<option value="AED">UAE Dirham</option>
					<option value="AUD">Australia Dollars</option>
					<option value="BHD">Bahrain Dinar</option>
					<option value="CAD">Canada Dollars</option>
					<option value="CHF">Swiss Franc</option>
					<option value="CNH">China Yuan</option>
					<option value="DKK">Denmark Kroner</option>
					<option value="EUR">Euro</option>
					<option value="GBP">UK Pounds</option>
					<option value="HKD">HK Dollars</option>
					<option value="IDR(100)">Indonesia Rupiah</option>
					<option value="JPY(100)">Japan Yen</option>
					<option value="KRW">SouthKorea Won</option>
					<option value="KWD">Kuwait Dinar</option>
					<option value="MYR">Malaysia Ringgit</option>
					<option value="NOK">Norway Kroner</option>
					<option value="NZD">New Zealand Dollars</option>
					<option value="SAR">SaudiArabia Riyal</option>
					<option value="SEK">Sweden Krona</option>
					<option value="SGD">Singapore Dollars</option>
					<option value="THB">Thailand Baht</option>
					<option value="USD">US Dollars</option>
				</select>
				<a href="helpView" style="float:right; color:#FCDD44;">도움말 센터</a>
			</div>
			<div class="row">
				<p class="tm-copyright-text">Copyright &copy; 2018 Hello Korea</p>
			</div>
		</div>
	</footer>

	<script>
		function googleTranslateElementInit() {
			new google.translate.TranslateElement({pageLanguage: 'en', multilanguagePage: true}, 'google_translate_element');
			jQuery('.goog-logo-link').css('display', 'none');
			jQuery('.goog-te-gadget').css('font-size', '0');
			jQuery('.goog-te-combo').attr("onchange", "javascript:translateVal();");
		}
		
		function translateVal(){
			var tVal=$(".goog-te-combo").val();
			console.log("val : " + tVal);
		  
			$.ajax({
				url:"translateVal",
				type:"POST",
				data:{tVal:tVal},
				success:function(data){
					console.log(data);
				},
				error:function(data){
					console.log(data);
				}
			});
		}
	
		function changeCUR(){
			var cur=$("#currency").val();
			
			console.log(cur);
			
			if(cur == null || cur == "NO"){
				cur="KRW";
			}
			
			$.ajax({
				url:"currencyCheck.pay",
				type:"POST",
				data:{cur:cur},
				dataType:"json",
				success:function(data){
					console.log(data);
					
					if(data.length > 0){
						var sCur;
						
						for(var i=0;i<data.length;i++){
							if(cur == data[i].cur_unit){
								sCur=data[i].kftc_bkpr;
							}
						}
						
						console.log("sCur : " + sCur);
						sCur=sCur.replace(",", ".");
						
						console.log(sCur);
						
						$.ajax({
							url:"currencySetting.pay",
							type:"POST",
							data:{cur:cur, sCur:sCur},
							success:function(data){
								console.log(data);
								
								if(data == 1){
									location.reload();
								}
								else{
									alert("통화 변경 실패");
								}
								
							},
							error:function(data){
								console.log(data);
							}
						});
					}
					else{
						alert("환율 API 요청 만료");
					}
					
				},
				error:function(data){
					console.log(data);
				}
			});
		}
	</script>

</body>
</html>
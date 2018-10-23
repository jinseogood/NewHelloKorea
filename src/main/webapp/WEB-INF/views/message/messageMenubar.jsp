<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face { font-family: 'Chosunilbo_myungjo'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Chosunilbo_myungjo.woff') format('woff'); font-weight: normal; font-style: normal; }
	
	body, div, p, a, h1,h2,h3,h4, input, select {
		font-family: Chosunilbo_myungjo,meiryo,Chosunilbo_myungjo !important
	}

.title{
    width:100%;
    height:48px;
    background-color:#00aef0;
    color:white;
}
</style>
<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
</head>
<body>

<div class="title">
<h3>&nbsp;&nbsp;&nbsp;Message</h3>
<div id="google_translate_element" align="right"></div>
</div>

<script>
function googleTranslateElementInit() {
	new google.translate.TranslateElement({pageLanguage: 'ko'}, 'google_translate_element');
	jQuery('.goog-logo-link').css('display', 'none');
	jQuery('.goog-te-gadget').css('font-size', '0');
}
</script>
</body>
</html>
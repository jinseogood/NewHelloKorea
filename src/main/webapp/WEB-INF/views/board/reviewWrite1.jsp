<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 
<meta charset="UTF-8">
<link href="${ contextPath }/resources/css/jquery-ui.css" rel="stylesheet" type="text/css">

<meta charset="UTF-8">
<title>Hello Korea</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
  <link rel="stylesheet" href="${ contextPath }/resources/css/ccFileUpload.css">


<style>
img.ui-datepicker-trigger {
	width: 20px;
	margin-left: 5px;
	vertical-align: middle;
	cursor: pointer;
}

.web-font {
	font-family: 'Jua', sans-serif;
	font-size: 18px;
	margin-right: 5px;
}

input {
	box-sizing: border-box;
}

#fromDate, #toDate {
	width: 100px;
}

.ui-datepicker-header {
	background: rgb(241, 196, 15);
}

.ui-datepicker-calendar {
	font-family: 'Jua', sans-serif;
}

#monthpicker {
	width: 15%;
}

textarea {
	width: 100%;
}

#review_title {
	width: 100%;
	padding: 8px 5px;
	margin: 8px 0px;
	box-sizing: border-box;
}

.rate-base-layer {
	color: #aaa;
}

.rate-hover-layer {
	color: orange;
}

.rate2 {
	font-size: 35px;
}

.rate2 .rate-hover-layer {
	/* color: pink; */
	color: #aaa;
}

.rate2 .rate-select-layer {
	/* color: red; */
	color: orange;
}
body{ margin:50px 0px; }
        .thumbnail{ padding:0px; }
        .stageParent{ background:#fff; border:3px dashed #444; border-radius:5px; padding:10px; }
        .stage{ min-height:220px; max-height:400px; overflow-y:auto; }
</style>
</head>
<body>

   <jsp:include page="../common/menubar.jsp"/>
   
   
   <section class="container tm-home-section-1" id="more" style = "width:80%; padding:100px">
   <form action="insertReview1.bo?uri=${ uri }&contentid=${contentid}" method = "post" encType = "multipart/form-data">
      <div class="row">
         
      </div> 

      <div class="tm-section-header section-margin-top" >
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>
					<div class="col-lg-4 col-md-6 col-sm-6"><h2 class="tm-section-title">R E V I E W</h2></div>
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>	
	  </div>	
      <div id="google-map" style = "text-align:center; width:100%; height:1000px">
      
      		<div class="col-lg-12 col-md-12 col-sm-12" style = "">
      		<div class="row">		
      		
			</div>
         	<div class="col-lg-6 main_img" style = "align:center">
              	 <img src="${ contextPath }/resources/img/about-1.jpg" alt="image" style = "width:100%; height:270px" />
            </div>
         	<div class="col-lg-6" style = "display:table;">
         		<div style = "vertical-align:middle; display:table-cell; height:270px">
         			<span class = "main_title"><h1>바이스로이 발리</h1></span>
         			<br>
         			<div style = "padding-top:50px">
         				<span>Jln. Lanyahan, Br. Nagi, Ubud 80571, Indonesia</span>
         			</div>
         		</div>
        	</div>
        	</div>
        	<div class="col-lg-12 col-md-12 col-sm-12"><hr>
           	 	<div style = "text-align:left; padding-bottom:20px; height:500px">
        			<span style = "margin-top:20px"><h3>이 시설에 대한 평가</h3></span>
        			<br>
        			<!-- <span class="StarBar">
            		<i class="fa fa-star" style = "font-size:30px"></i>
            		<i class="fa fa-star" style = "font-size:30px"></i>
            		<i class="fa fa-star" style = "font-size:30px"></i>
            		<i class="fa fa-star" style = "font-size:30px"></i>
            		<i class="fa fa-star" style = "font-size:30px"></i>
            		
            		</span> -->
            		
            		<div class="rate2"></div>
   					<input id="input2" type="text" name = "grade">
   					
            		<script src="https://code.jquery.com/jquery-1.11.3.min.js" charset="utf-8"></script>
   					<script src="${ contextPath }/resources/js/rater.js" charset="utf-8"></script>
    				<script> 
    					var a;	
    	
    					(function($){
       				        $(document).ready(function(){
          				    var options = {
         				       max_value: 5,
        				       step_size: 0.5,
       				           selected_symbol_type: 'fontawesome_star',
       				           initial_value: 3,
      				           update_input_field_name: $("#input2")
            				}
            
           					$(".rate2").rate(options);
            				$(".rate2").on("change", function(ev, data){
                				/* console.log(data.from, data.to); */
                				a = data.to;
                				//console.log(a);
                				
            				});
            				
        				});
    					})(jQuery);

    				</script>
            		
            		<br>
            		<br>
            		<br>
            		<div>
            		<span>리뷰제목</span><br>
            			<input type="text" id = "review_title" name = "title" placeholder="방문 목적이나 인상 깊었던 점에 대해 언급하세요." width = "80%">
            		</div>
            		<br>
            		<br>
            		<br>
            		<div>
            		<span>리뷰내용</span><br>
            			<textarea style="resize: none;" name = "text" placeholder="객실 위치, 편의시설등에 대한 고객님의 경험을 공유하세요." rows="10" cols="50"></textarea>
            		</div>
            		<br>
            		<br>
            		<br>
            		
            		<span>여행시기는 언제였나요?</span><br><br>
            				<i class="fa fa-calendar" id = "btn_monthpicker" style = "font-size:40px; "></i><br><br>
            				<input id="monthpicker" name="travel_date" type="text" style = "height:35px; box-sizing:border-box; text-align:center"/>
							<script type="text/javascript" src="${ contextPath }/resources/js/jquery-1.11.1.min.js"></script>
							<script type="text/javascript" src="${ contextPath }/resources/js/jquery-ui.min.js"></script>
							<script type="text/javascript" src="${ contextPath }/resources/js/jquery.mtz.monthpicker.js"></script>
							<script>
								/* MonthPicker 옵션 */
								(function($){
								options = {
									pattern : 'yyyy-mm', // Default is 'mm/yyyy' and separator char is not mandatory
									selectedYear : 2018,
									startYear : 2000,
									finalYear : 2020,
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ]
								};

								/* MonthPicker Set */
								$('#monthpicker').monthpicker(options);

								/* 버튼 클릭시 MonthPicker Show */
								$('#btn_monthpicker').bind('click', function() {
									$('#monthpicker').monthpicker('show');
								});
								})(jQuery);
							</script>

						
						
        		</div>
        	</div>
        	
        	
      </div>
        	<div class="col-lg-12 col-md-12 col-sm-12" style="padding-top:40px"><hr>
        		<span>공유하실 추억은 무엇인가요? (선택사항)</span><br><br>
            	<%-- <button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/starTest.bo'">사진첨부</button> --%>
            	
        <div class="text-center text-primary">
        </div>

 
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div id="consistentCoder" class="text-center"></div>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="label label-info pull-right"><span class="countMe">0</span> files uploaded.</div>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12"> </div>
        <div class="col-lg-12 col-md-12 col-sm-12 stageParent">
            <div id="stage" class="stage"></div>
        </div>

        <div class="col-lg-12 col-md-12 col-sm-12"> </div>
        <div id="response" class="text-center"></div>
    
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="${ contextPath }/resources/js/ccFileUpload.js"></script>
    <script>
    	(function($){
        $(document).ready(function(){
            var options = {
                    'name':'file',
                    'uploadUrl':'upload.bo',
                    'sync':false,
                    'previews':'stage',
                    'response':'response',
                    'counter':'countMe',
                    'columnClass':'col-md-3 text-center',
                    'allowedFiles':['gif','png','jpg','jpeg','xlsx','.psd'],
                    'allowedPreviews':['gif','png','jpg','jpeg'],
                    'animSpeed':'fast'
                  };
            $("#consistentCoder").ccFileUpload(options);
        });
    	})(jQuery);
    </script>
        	</div>
        	<div class="col-lg-12 col-md-12 col-sm-12"><hr>
        		<input type="submit" class="btn btn-secondary" value = "확인">
        		<button type="button" class="btn btn-secondary" onclick="cancel();">취소</button>
        	</div>
        	</form>
   </section>
   
   <!-- white bg -->
   <section class="tm-white-bg section-padding-bottom">
     
   </section>
   <jsp:include page="../common/footer.jsp"/>

<script>

	var contenttypeid = ${ param.contenttypeid };
	var contentid = ${param.contentid};

	function cancel(){
		//location.href="deleteAllUpload.bo?uri=${uri}&contentid="+contentid;
		history.back();
	}	
	
	$(function(){
		$.ajax({
			url:"detailGameInformation.sub",
			type:"GET",
			data:{contenttypeid:contenttypeid, contentid:contentid},
			dataType:"json",
			success:function(data){
				console.log(data);
				var myData = data.response.body.items.item;
				var output = "";
				$(".main_title").html("");
				$(".main_title").text(myData.title);
				if(myData.firstimage == null){
					output = "<img src='${contextPath}/resources/img/noImage.gif' alt='image' style = 'width:100%; height:270px' />";
				}else{
					output = "<img src="+myData.firstimage+" alt='image' style = 'width:100%; height:270px' />";
				}

				$(".main_img").html(output);

			},
			error:function(data){
				console.log(data);
			}
		});
	});
	
</script>
</body>
</html>
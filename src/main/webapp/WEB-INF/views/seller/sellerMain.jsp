<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hello Korea | Seller</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <meta name="description" content="Developed By M Abdur Rokib Promy">
    <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
   
    <!-- Ionicons -->
    <link href="${ contextPath }/resources/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Morris chart -->
    <link href="${ contextPath }/resources/css/morris.css" rel="stylesheet" type="text/css" />
    <!-- jvectormap -->
    <link href="${ contextPath }/resources/css/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <!-- Date Picker -->
    <link href="${ contextPath }/resources/css/datepicker3.css" rel="stylesheet" type="text/css" />
    <!-- fullCalendar -->
    <!-- <link href="css/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" /> -->
    <!-- Daterange picker -->
    <link href="${ contextPath }/resources/css/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
    <!-- iCheck for checkboxes and radio inputs -->
    <link href="${ contextPath }/resources/css/all.css" rel="stylesheet" type="text/css" />
    <!-- bootstrap wysihtml5 - text editor -->
    <!-- <link href="css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" /> -->
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <!-- Theme style -->
    <link href="${ contextPath }/resources/css/style.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
	<style>
		#noti-box{
			height:760px;
		}
	</style>
          
</head>

<body>
	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="../common/sellerMenubar.jsp"/>
	<div class="main">
	
	<!-- Main content -->
    <section class="content">

    	<div class="row" style="margin-bottom:5px;">

			<div class="col-md-3">
				<div class="sm-st clearfix">
					<span class="sm-st-icon st-green"><i class="fa fa-plus-square-o"></i></span>
					<div class="sm-st-info">
						<span><a href="addCompanyView.sell">업체 등록</a></span>
					</div>
				</div>
			</div>
    		<div class="col-md-3">
    			<div class="sm-st clearfix">
    				<span class="sm-st-icon st-red"><i class="fa fa-check-square-o"></i></span>
    				<div class="sm-st-info">
    					<span><a href="reservation.sell">${ rCount } 건</a></span>
       					이번달 예약 내역
    				</div>
    			</div>
    		</div>
			<div class="col-md-3">
				<div class="sm-st clearfix">
					<span class="sm-st-icon st-blue"><i class="fa fa-dollar"></i></span>
					<div class="sm-st-info">
						<span><a href="manageRevenue.sell"><fmt:formatNumber value="${ tPrice }" pattern="#,###"/> 원</a></span>
						다음달 예상 수익
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="sm-st clearfix">
					<span class="sm-st-icon st-violet"><i class="fa fa-bed"></i></span>
					<div class="sm-st-info">
						<span><a href="manageProduct.sell">업체 관리</a></span>
					</div>
				</div>
			</div>
			
		</div>

		<!-- Main row -->
		<div class="row">

			<div class="col-md-8">
				<!--earning graph start-->
				<section class="panel">
					<header class="panel-heading">업체 평점 통계</header>
					<div class="panel-body" style="height:350px; margin-left:auto; margin-right:auto;">
						<div id="goodSTAT" style="width:100%;height:100%;" align="center"></div>
					</div>
				</section>
				<!--earning graph end-->
				
				<script>
					google.charts.load('current', {packages: ['corechart', 'bar']});
					google.charts.setOnLoadCallback(goodStats);
					
					function goodStats(){
						
						$.ajax({
							url:"selectGoodStats.sell",
							type:"POST",
							success:function(data){
								console.log(data);
								
								var goodArr=[["업체명","평점", { role: 'style' }]];
								
								if(data.goodList.length > 0){
									for(var i=1; i <= data.goodList.length; i++){
										goodArr[i] = [data.goodList[i-1].cName, data.goodList[i-1].good, 'color:gold; opacity:0.8'];
									}
								}
								else{
									goodArr[1]=['-',0,'color:gold; opacity:0.1'];
								}
								
								var options={
									colors: ['gold'],										
									bar: {groupWidth : '20%'},										
									vAxis: {minValue: 0, ticks: [0, 1, 2, 3, 4, 5]}
								};
								
								var data = google.visualization.arrayToDataTable(goodArr);
								
								var chart = new google.visualization.ColumnChart(document.getElementById('goodSTAT'));

								chart.draw(data, options);
								
							},
							error:function(data){
								console.log(data);
							}
						});
					}
				</script>
				
				<!--user graph start-->
				<section class="panel">
					<header class="panel-heading">총 수익 통계</header>
					<div class="panel-body" style="height:350px; margin-left:auto; margin-right:auto;">
						<div id="depositSTAT" style="width:100%;height:100%;" align="center"></div>
					</div>
				</section>
				<!--user graph end-->
				
				<script>
					google.charts.load('current', {packages: ['corechart']});
					google.charts.setOnLoadCallback(saleStats);
					
					function saleStats(){
						
						$.ajax({
							url:"selectSaleStats.sell",
							type:"POST",
							success:function(data){
								console.log(data);
								
								var salesArr = [['Term', 'Profit']];
								for(var i=1; i <= data.saleList.length; i++){
									salesArr[i] = [data.saleList[i-1].month, data.saleList[i-1].price];
								}
								
								var data = google.visualization.arrayToDataTable(salesArr);

						        var options = {
						          /* title: 'Company Performance', */
						          hAxis: {title: 'Month',  titleTextStyle: {color: '#333'}},
						          vAxis: {minValue: 0}
						        };

						        var chart = new google.visualization.AreaChart(document.getElementById('depositSTAT'));
						        chart.draw(data, options);
								
								/* $.ajax({
									url:"selectDetailSaleStats.sell",
									type:"POST",
									success:function(iData){
										console.log(iData);
										
										var mLength=[];
										
										for(var i=0;i<data.saleList.length;i++){
											var count=0;
											for(var k=0;k<iData.saleDetailList.length;k++){
												if(data.saleList[i].month == iData.saleDetailList[k].month){
													count++;
												}
											}
											mLength[i]=count;
										}
										
										var nameArr=['월'];
										
										for(var i=1;i<(iData.saleDetailList.length+1);i++){
											console.log(i);
											nameArr[i]=iData.saleDetailList[i].month;
										}
										
										for(var i=0;i<10;i++){
											console.log(nameArr[i]);
										}
										
									},
									error:function(iData){
										console.log(iData);
										console.log("second ajax");
									}
								}); */
								
								
								
							},
							error:function(data){
								console.log(data);
							}
						});
					}
				</script>
				
			</div>
			
			<div class="col-lg-4">
				<!--chat start-->
				<section class="panel">
					<header class="panel-heading">알림 메시지</header>
					<div class="panel-body" id="noti-box">
					
					</div>
				</section>
			</div>
			
			<script>
				$(function(){
					$.ajax({
						url:"selectNotice.sell",
						type:"POST",
						success:function(data){
							console.log(data);
							
							$noticeBody=$("#noti-box");
							$noticeBody.html('');
							
							var output="";
							
							if(data.okList.length > 0){
								for(var i=0;i<data.okList.length;i++){
									output += "<div class='alert alert-success'>";
									output += "<button data-dismiss='alert' class='close close-sm' type='button'><i class='fa fa-times'></i></button>";
									output += "<strong>" + data.okList[i].cName + "</strong>";
									output += " 업체가 <strong>" + data.okList[i].apDate + "</strong> 에 제휴 승인 되었습니다.</div>";
								}
							}
							
							if(data.qList.length > 0){
								for(var i=0;i<data.qList.length;i++){
									output += "<div class='alert alert-info'>";
									output += "<button data-dismiss='alert' class='close close-sm' type='button'><i class='fa fa-times'></i></button>";
									output += "<strong onclick='goDetail(" + data.qList[i].cId + ", " + data.qList[i].contentId + ")'>" + data.qList[i].cName + "</strong>";
									output += " 의 <strong>새 문의가 " + data.qList[i].count + " 건</strong> 등록 되었습니다.</div>";
								}
							}
							
							if(data.rList.length > 0){
								for(var i=0;i<data.rList.length;i++){
									output += "<div class='alert alert-warning'>";
									output += "<button data-dismiss='alert' class='close close-sm' type='button'><i class='fa fa-times'></i></button>";
									output += "<strong onclick='goDetail(" + data.rList[i].cId + ", " + data.rList[i].contentId + ")'>" + data.rList[i].cName + "</strong>";
									output += " 의 <strong>새 리뷰가 " + data.rList[i].count + " 건</strong> 등록 되었습니다.</div>";
								}
							}
							
							$noticeBody.append(output);
							
						},
						error:function(data){
							console.log(data);
						}
					});
				});
				
				function goDetail(cId, contentId){
					location.href="detailHotel?cid=" + cId + "&contentid=" + contentId + "&contenttypeid=32";
				}
			</script>
			
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"/>
	
	    <%--     <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="${ contextPath }/resources/js/jquery.min.js" type="text/javascript"></script>

        <!-- jQuery UI 1.10.3 -->
        <script src="${ contextPath }/resources/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="${ contextPath }/resources/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- daterangepicker -->
        <script src="${ contextPath }/resources/js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>

        <script src="${ contextPath }/resources/js/plugins/chart.js" type="text/javascript"></script>

        <!-- datepicker
        <script src="js/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>-->
        <!-- Bootstrap WYSIHTML5
        <script src="js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>-->
        <!-- iCheck -->
        <script src="${ contextPath }/resources/js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
        <!-- calendar -->
        <script src="${ contextPath }/resources/js/plugins/fullcalendar/fullcalendar.js" type="text/javascript"></script>

        <!-- Director App -->
        <script src="${ contextPath }/resources/js/Director/app.js" type="text/javascript"></script>

        <!-- Director dashboard demo (This is only for demo purposes) -->
        <script src="${ contextPath }/resources/js/Director/dashboard.js" type="text/javascript"></script>

        <!-- Director for demo purposes -->
        <script type="text/javascript">
            $('input').on('ifChecked', function(event) {
                // var element = $(this).parent().find('input:checkbox:first');
                // element.parent().parent().parent().addClass('highlight');
                $(this).parents('li').addClass("task-done");
                console.log('ok');
            });
            $('input').on('ifUnchecked', function(event) {
                // var element = $(this).parent().find('input:checkbox:first');
                // element.parent().parent().parent().removeClass('highlight');
                $(this).parents('li').removeClass("task-done");
                console.log('not');
            });

        </script>
        <script>
            $('#noti-box').slimScroll({
                height: '400px',
                size: '5px',
                BorderRadius: '5px'
            });

            $('input[type="checkbox"].flat-grey, input[type="radio"].flat-grey').iCheck({
                checkboxClass: 'icheckbox_flat-grey',
                radioClass: 'iradio_flat-grey'
            });
		</script>
		<script type="text/javascript">
		    $(function() {
		                "use strict";
		                //BAR CHART
		                var data = {
		                    labels: ["January", "February", "March", "April", "May", "June", "July"],
		                    datasets: [
		                        {
		                            label: "My First dataset",
		                            fillColor: "rgba(220,220,220,0.2)",
		                            strokeColor: "rgba(220,220,220,1)",
		                            pointColor: "rgba(220,220,220,1)",
		                            pointStrokeColor: "#fff",
		                            pointHighlightFill: "#fff",
		                            pointHighlightStroke: "rgba(220,220,220,1)",
		                            data: [65, 59, 80, 81, 56, 55, 40]
		                        },
		                        {
		                            label: "My Second dataset",
		                            fillColor: "rgba(151,187,205,0.2)",
		                            strokeColor: "rgba(151,187,205,1)",
		                            pointColor: "rgba(151,187,205,1)",
		                            pointStrokeColor: "#fff",
		                            pointHighlightFill: "#fff",
		                            pointHighlightStroke: "rgba(151,187,205,1)",
		                            data: [28, 48, 40, 19, 86, 27, 90]
		                        }
		                    ]
		                };
		            new Chart(document.getElementById("linechart").getContext("2d")).Line(data,{
		                responsive : true,
		                maintainAspectRatio: false,
		            });
		
		            });
		            // Chart.defaults.global.responsive = true;
		</script> --%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hello Korea</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <meta name="description" content="Developed By M Abdur Rokib Promy">
    <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
   
    <!-- Ionicons -->
    <link href="${ contextPath }/resources/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Morris chart -->
    <link href="${ contextPath }/resources/css/morris.css" rel="stylesheet" type="text/css" />
    <!-- jvectormap -->
    <link href="${ contextPath }/resources/css/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <!-- bootstrap wysihtml5 - text editor -->
    <!-- <link href="css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" /> -->
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <!-- Theme style -->
    <link href="${ contextPath }/resources/css/style.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
          
          <style type="text/css">

          </style>
      </head>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {
        'packages':['geochart'],
        'mapsApiKey': 'AIzaSyAv6qO0dHIqqLmX9cg6JoSxweaAXfIwr2A'
      });
      google.charts.setOnLoadCallback(drawRegionsMap);

      function drawRegionsMap() {

    	  $.ajax({
				url:"selectNationalStatistics.ad",
				type:"POST",
				success:function(data){
				      
					var nationalArr = [['국가','가입자수(명)']];
					for(var i=1; i <= data.nationalList.length; i++){
						nationalArr[i] = [data.nationalList[i-1].national, data.nationalList[i-1].count];
					}
					
					var data = google.visualization.arrayToDataTable(nationalArr);

				        var options = {
				        		
				        };

				        var chart = new google.visualization.GeoChart(document.getElementById('regions_div'));

				        chart.draw(data, options);
						
				},
				error:function(data){
					console.log("에러");
					console.log(data);
				}
			});
    	  
      }
      
    </script>
    
    <script type='text/javascript'>
     google.charts.load('current', {
       'packages': ['geochart'],
       // Note: you will need to get a mapsApiKey for your project.
       // See: https://developers.google.com/chart/interactive/docs/basic_load_libs#load-settings
       'mapsApiKey': 'AIzaSyAv6qO0dHIqqLmX9cg6JoSxweaAXfIwr2A'
     });
     google.charts.setOnLoadCallback(drawMarkersMap);

      function drawMarkersMap() {
    	  
    	  $.ajax({
				url:"selectCompanyAreaStatistics.ad",
				type:"POST",
				success:function(data){
				      
					var companyAreaArr = [['지역','등록 업체 수']];
					for(var i=1; i <= data.companyAreaList.length; i++){
						companyAreaArr[i] = [data.companyAreaList[i-1].area, data.companyAreaList[i-1].count];
					}
					
				var data = google.visualization.arrayToDataTable(companyAreaArr);

			      var options = {
			        region: 'KR',
			        displayMode: 'markers',
			        colorAxis: {colors: ['green']}
			      };

			      var chart = new google.visualization.GeoChart(document.getElementById('chart_div'));
			      chart.draw(data, options);
						
				},
				error:function(data){
					console.log("에러");
					console.log(data);
				}
			});
    	  
    	  
      
    };
    </script>
    
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      
      function drawChart() {
    	  
    	  $.ajax({
				url:"selectMainSalesStatistics.ad",
				type:"POST",
				success:function(data){
				      
					var salesArr = [['Term','Sales','Profit']];
					for(var i=1; i <= data.salesList.length; i++){
						salesArr[i] = [data.salesList[i-1].term, data.salesList[i-1].sales,
							           data.salesList[i-1].profit];
					}
					
				var data = google.visualization.arrayToDataTable(salesArr);

			        var options = {
			          /* title: 'Company Performance', */
			          hAxis: {title: 'Month',  titleTextStyle: {color: '#333'}},
			          vAxis: {minValue: 0}
			        };

			        var chart = new google.visualization.AreaChart(document.getElementById('chart_div2'));
			        chart.draw(data, options);
						
				},
				error:function(data){
					console.log("에러");
					console.log(data);
				}
			});
      
      }
    </script>
   
<body>


	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="../common/adminMenubar.jsp"/>
	<div class="main">
	
    <script>
     $(function(){
    	 $.ajax({
				url:"selectMain.ad",
				type:"POST",
				success:function(data){
				$("#reportCount").text(data.reportCount + '건');
				$("#questionCount").text(data.questionCount + '건');
				$("#thisMonthProfit").text(data.profit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원');
				$("#companyCount").text(data.companyCount + '건');
				console.log(data.expirationList);
				$(".alert").hide();
				for(var i = 0; i < data.expirationList.length ; i++){
					$(".notifyText").eq(i).html('<strong>' 
                            + data.expirationList[i].cName +'</strong><br>&nbsp;'
		                    + data.expirationList[i].startDate + '부터 '
		                    + data.expirationList[i].endDate + '까지 '
		                    + data.expirationList[i].crTerm + '개월 간의 제휴가 금일부로 종료됩니다.');
		            $("#noti-box").children().eq(i).show();
				}
				
				},
				error:function(data){
					console.log("에러");
					console.log(data);
				}
			});
     });
    </script> 
	<!-- Main content -->
                <section class="content">

                    <div class="row" style="margin-bottom:5px;">


                        <div class="col-md-3">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-red"><i class="fa fa-check-square-o"></i></span>
                                <div class="sm-st-info">
                                    <span><a href="selectReportList.ad" id="reportCount"></a></span>
                                                                                 미해결 신고
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-violet"><i class="fa fa-envelope-o"></i></span>
                                <div class="sm-st-info">
                                    <span><a href="selectQuestionList.ad" id="questionCount"></a></span>
                                                                                미해결 문의
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-blue"><i class="fa fa-dollar"></i></span>
                                <div class="sm-st-info">
                                    <span><a href="selectSalesStatistics.ad" id="thisMonthProfit"></a></span>
                                                                                금월 수익
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-green"><i class="fa fa-paperclip"></i></span>
                                <div class="sm-st-info">
                                    <span><a href="selectCompanyList.ad" id="companyCount"></a></span>
                                                                                금월 미승인 업체
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Main row -->
                    <div class="row">

                        <div class="col-md-8">
                            <!--earning graph start-->
                            <section class="panel">
                                <header class="panel-heading">
                                                                                국가별 회원 분포
                                </header>
                                <div class="panel-body">
                                <div id="regions_div" style="width:800px;height:450px;" align="center"></div>                   
                                </div>
                                        </section>
                                        <!--earning graph end-->
                                        <!--earning graph start-->
                            <section class="panel">
                                <header class="panel-heading">
                                                                                 지역별 업체 분포
                                </header>
                                <div class="panel-body">
                                    <div id="chart_div" style="width:800px; height:450px;"></div>
                                </div>
                                        </section>
                                        <!--earning graph end-->
                                        <!--earning graph start-->
                            <section class="panel">
                                <header class="panel-heading">
                                                                                 매출 통계
                                </header>
                                <div class="panel-body">
                                    <div id="chart_div2" style="width:800px; height:450px;"></div>
                                </div>
                                        </section>
                                        <!--earning graph end-->

                                    </div>
                                    <div class="col-lg-4">

                                        <!--chat start-->
                                        <section class="panel">
                                            <header class="panel-heading">
                                                                                                        제휴 해지일 도래 안내
                                            </header>
                                                <div class="panel-body" id="noti-box" style="height:1565px;">

                                                    <div class="alert alert-block alert-danger">
                                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                                            <i class="fa fa-times"></i>
                                                        </button>
                                                        <div class="notifyText"></div>
                                                    </div>
                                                    <div class="alert alert-success">
                                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                                            <i class="fa fa-times"></i>
                                                        </button>
                                                        <div class="notifyText"></div>
                                                    </div>
                                                    <div class="alert alert-info">
                                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                                            <i class="fa fa-times"></i>
                                                        </button>
                                                        <div class="notifyText"></div>
                                                    </div>
                                                    <div class="alert alert-warning">
                                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                                            <i class="fa fa-times"></i>
                                                        </button>
                                                        <div class="notifyText"></div>
                                                    </div>
                                                    
                                                    <div class="alert alert-block alert-danger">
                                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                                            <i class="fa fa-times"></i>
                                                        </button>
                                                        <div class="notifyText"></div>
                                                    </div>
                                                    <div class="alert alert-success">
                                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                                            <i class="fa fa-times"></i>
                                                        </button>
                                                        <div class="notifyText"></div>
                                                    </div>
                                                    <div class="alert alert-info">
                                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                                            <i class="fa fa-times"></i>
                                                        </button>
                                                        <div class="notifyText"></div>
                                                    </div>
                                                    <div class="alert alert-warning">
                                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                                            <i class="fa fa-times"></i>
                                                        </button>
                                                        <div class="notifyText"></div>
                                                    </div>
                                                    
                                                    <div class="alert alert-block alert-danger">
                                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                                            <i class="fa fa-times"></i>
                                                        </button>
                                                        <div class="notifyText"></div>
                                                    </div>
                                                    <div class="alert alert-success">
                                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                                            <i class="fa fa-times"></i>
                                                        </button>
                                                        <div class="notifyText"></div>
                                                    </div>
                                                    <div class="alert alert-info">
                                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                                            <i class="fa fa-times"></i>
                                                        </button>
                                                        <div class="notifyText"></div>
                                                    </div>
                                                    <div class="alert alert-warning">
                                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                                            <i class="fa fa-times"></i>
                                                        </button>
                                                        <div class="notifyText"></div>
                                                    </div>
                                                    
                                                    <div class="alert alert-block alert-danger">
                                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                                            <i class="fa fa-times"></i>
                                                        </button>
                                                        <div class="notifyText"></div>
                                                    </div>
                                                    <div class="alert alert-success">
                                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                                            <i class="fa fa-times"></i>
                                                        </button>
                                                        <div class="notifyText"></div>
                                                    </div>
                                                    <div class="alert alert-info">
                                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                                            <i class="fa fa-times"></i>
                                                        </button>
                                                        <div class="notifyText"></div>
                                                    </div>
                                                    <div class="alert alert-warning">
                                                        <button data-dismiss="alert" class="close close-sm" type="button">
                                                            <i class="fa fa-times"></i>
                                                        </button>
                                                        <div class="notifyText"></div>
                                                    </div>

                                                </div>
                                        </section>

                      </div>
                               
                               
                               
                               
                                    
                  </div>
                  
              </div>
              <!-- row end -->

	<jsp:include page="../common/footer.jsp"/>
	


</body>
</html>
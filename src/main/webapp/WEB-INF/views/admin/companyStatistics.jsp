<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Korea</title>
<style>
.titleArea{
    padding:3%;
    width:70%;
    margin-left:auto;
    margin-right:auto;
}
.chartArea{
    width:70%;
    margin-left:auto;
    margin-right:auto;
}
.outline{
    width:90%;
    margin-top:2%;
    margin-bottom:5%;
    margin-left:auto;
    margin-right:auto;
    border:1px solid lightgray;
    border-style:dotted;
    border-radius: 10px;
}

#barchart_material{
    margin-top:5%;
} 

</style>

<script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>
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
				console.log(companyAreaArr);
					
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
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart(row) {
    	  
    	  if(row==null){
    		  row = 1;
    	  }
    	  
    	  $.ajax({
				url:"selectCompanyRegistStatistics.ad",
				type:"POST",
				data:{row:row},
				success:function(data){
				      
					var companyRegistArr = [['Month','등록 건수','승인 건수','중도 해지 건수']];
					for(var i=1; i <= data.companyRegistList.length; i++){
						companyRegistArr[i] = [data.companyRegistList[i-1].month, data.companyRegistList[i-1].registCount,
							                   data.companyRegistList[i-1].approvalCount, data.companyRegistList[i-1].terminateCount];
					}
					
				console.log(companyRegistArr);
					
				var data = google.visualization.arrayToDataTable(companyRegistArr);

			        var options = {
			          chart: {
			            /* title: 'Company Performance',
			            subtitle: 'Sales, Expenses, and Profit: 2014-2017', */
			          },
			          bars: 'horizontal' // Required for Material Bar Charts.
			        };

			        var chart = new google.charts.Bar(document.getElementById('barchart_material'));

			        chart.draw(data, google.charts.Bar.convertOptions(options));
						
				},
				error:function(data){
					console.log("에러");
					console.log(data);
				}
			});
    	  
      }
    </script>
    
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawPieChart);
      function drawPieChart() {

    	  $.ajax({
				url:"selectCompanyPeriodStatistics.ad",
				type:"POST",
				success:function(data){
				      
					var companyPeriodArr = [['등록 기간','업체 수']];
					for(var i=1; i <= data.companyPeriodList.length; i++){
						companyPeriodArr[i] = [data.companyPeriodList[i-1].period, data.companyPeriodList[i-1].count];
					}
				console.log(companyPeriodArr);
					
				var data = google.visualization.arrayToDataTable(companyPeriodArr);

			        var options = {
			        		is3D: true,
			        };

			        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
			        chart.draw(data, options);
						
				},
				error:function(data){
					console.log("에러");
					console.log(data);
				}
			});
        
      }
    </script>
</head>
<body>

<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="../common/adminMenubar.jsp"/>
	<div class="main">
	
	<div class="titleArea">
	<div class="row">
                        <div class="col-md-12">
                            <!--breadcrumbs start -->
                            <ul class="breadcrumb">
                                <li><a href="myPageView.ad"><i class="fa fa-home"></i> Home</a></li>
                                <li><a href="selectSalesStatistics.ad">통계</a></li>
                                <li><a href="companyStatisticsView.ad">업체 통계</a></li>
                            </ul>
                            <!--breadcrumbs end -->
                        </div>
                    </div>
	</div>
	
	<div class="chartArea" id="areaChart" align="center">
	<span class="label label-success">지역별 업체 분포</span>
	<div class="outline">
	<div id="chart_div" style="width: 750px; height: 500px;"></div>
	</div>
	</div>
	
	
	<div class="chartArea" id="registChart" align="center">
	<span class="label label-primary">월별 등록 건수</span>
	<div class="outline">
	<div id="barchart_material" style="width: 750px; height: 500px;"></div>
	</div>
	</div>
	
	
	<div class="chartArea" id="peroidChart" align="center">
	<span class="label label-warning">업체 등록기간 분포</span>
	<div class="outline">
	<div id="donutchart" style="width:750px; height:300px;"></div>
	</div>
	</div>
	
	
	</div> 
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
	
	</script>

</body>
</html>
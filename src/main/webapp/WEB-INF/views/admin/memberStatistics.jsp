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
#columnchart_material{
    margin-top:5%;
}
</style>

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
				console.log(nationalArr);
					
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
    
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawPieChart);
      function drawPieChart() {

    	  $.ajax({
				url:"selectInterestStatistics.ad",
				type:"POST",
				success:function(data){
				      
					var interestArr = [['관심 분야','인원 수']];
					for(var i=1; i <= data.interestList.length; i++){
						interestArr[i] = [data.interestList[i-1].interest, data.interestList[i-1].count];
					}
				console.log(interestArr);
					
				var data = google.visualization.arrayToDataTable(interestArr);

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
    
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawBarChart);

      function drawBarChart(row) {
    	  
    	  if(row==null){
    		  row = 1;
    	  }
    	  
    	  $.ajax({
				url:"selectPlatformStatistics.ad",
				type:"POST",
				data:{row:row},
				success:function(data){
				      
					var platformArr = [['Month','Facebook','Google','Email']];
					for(var i=1; i <= data.platformList.length; i++){
						platformArr[i] = [data.platformList[i-1].month, data.platformList[i-1].facebookCount,
							              data.platformList[i-1].googleCount, data.platformList[i-1].emailCount];
					}
					
				console.log(platformArr);
					
				var data = google.visualization.arrayToDataTable(platformArr);

			        var options = {
			          chart: {
			            /* title: 'Company Performance',
			            subtitle: 'Sales, Expenses, and Profit: 2014-2017', */
			          }
			        };

			        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

			        chart.draw(data, google.charts.Bar.convertOptions(options));
						
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
                                <li><a href="memberStatisticsView.ad">회원 통계</a></li>
                            </ul>
                            <!--breadcrumbs end -->
                        </div>
                    </div>
	
	</div>
	
	
	<div class="chartArea" id="nationalChart" align="center">
	<span class="label label-success">국가별 회원 분포</span>
	<div class="outline">
	<div id="regions_div" style="width:700px"></div>
	</div>
	</div>
	
	<div class="chartArea" id="interestChart" align="center">
	<span class="label label-primary">회원 관심분야 분포</span>
	<div class="outline">
	<div id="donutchart" style="width:750px; height:300px;"></div>
	</div>
	</div>
	
	<div class="chartArea" id="platformChart" align="center">
	<span class="label label-warning">플랫폼별 가입자 분포</span>
	<div class="outline">
	<div id="columnchart_material" style="width:750px; height: 500px;"></div>
	</div>
	</div>
	
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	

</body>
</html>
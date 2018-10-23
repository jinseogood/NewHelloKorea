<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.hello.admin.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% ArrayList<SalesStatistics> list =
    (ArrayList<SalesStatistics>)request.getAttribute("list");%>
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
.paging{
    padding:2%;
    margin-bottom:5%;
}
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      
      function drawChart() {
    	 
        var data = google.visualization.arrayToDataTable([
          ['Term', 'Sales', 'Profit']
          <%for(SalesStatistics s : list){%>
              ,['<%=s.getTerm()%>', <%=s.getSales()%>, <%=s.getProfit()%>]
          <%}%>
        ]);

        var options = {
          /* title: 'Company Performance', */
          hAxis: {title: 'Month',  titleTextStyle: {color: '#333'}},
          vAxis: {minValue: 0}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
        chart.draw(data, options);
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
                                <li><a href="selectSalesStatistics.ad">매출 통계</a></li>
                            </ul>
                            <!--breadcrumbs end -->
                        </div>
                    </div>
	</div>
	
	
	<div class="chartArea" id="salesChart" align="center">
	<span class="label label-primary">매출 통계</span>
	<div class="outline">
	<div id="chart_div" style="width:750px; height: 500px;"></div>
	</div>
	
	<div class="paging" align="center">
<ul class="pagination pagination-sm">
<c:if test="${ pi.currentPage <= 1 }">
<li><a>&laquo;</a></li>
            </c:if>
            <c:if test="${ pi.currentPage > 1 }">
                <c:url var="slistBack" value="selectSalesStatistics.ad">
                    <c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
                </c:url>
                <li><a href="${ slistBack }">&laquo;</a></li>
            </c:if>
            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                <c:if test="${ p eq pi.currentPage }">
                <li><a href="#" style="background-color:#ddd;">${ p }</a></li>               
                </c:if>
                <c:if test="${ p ne pi.currentPage }">
                    <c:url var="slistCheck" value="selectSalesStatistics.ad">
                         <c:param name="currentPage" value="${ p }"/>
                    </c:url>
                    <li><a href="${ slistCheck }">${ p }</a></li>  
                </c:if>
            </c:forEach>
            <c:if test="${ pi.currentPage >= pi.maxPage }">
                <li><a>&raquo;</a></li>
            </c:if>
            <c:if test="${ pi.currentPage < pi.maxPage }">
                <c:url var="slistEnd" value="selectSalesStatistics.ad">
                    <c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
                </c:url>
                <li><a href="${ slistEnd }">&raquo;</a></li>
            </c:if>
            </ul>
    </div>
    
	</div>
	
	
	</div> 
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
	
	</script>

</body>
</html>
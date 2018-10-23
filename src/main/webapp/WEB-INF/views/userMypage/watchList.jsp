<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#goodListTable{
		margin-top:80px;
		width:700px;
		border-collapse: collapse;
	    text-align: center;
	    line-height: 1.5;
	}
 tr{
		height:30px;
	}
 thead th{
		padding: 10px;
	    font-weight: bold;
	    text-align: center;
	    vertical-align: top;
	    color: #369;
	    border-bottom: 3px solid #036;
	}
	 tbody th {
	    padding: 10px;
	    font-weight: bold;
	    text-align: center;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	    background: #f3f6f7;
	}
	 td {
	    padding: 10px;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	}
	#foodListTable{
		margin-top:80px;
		width:700px;
		border-collapse: collapse;
	    text-align: center;
	    line-height: 1.5;
	}
	#entertainmentTable{
		margin-top:80px;
		width:700px;
		border-collapse: collapse;
	    text-align: center;
	    line-height: 1.5;
	
	}
</style>
<script type="text/javascript" src="${ contextPath }/resources/js/jquery-1.11.2.min.js"></script>      		<!-- jQuery -->
<script type="text/javascript" src="${ contextPath }/resources/js/bootstrap.min.js"></script>					<!-- bootstrap js -->
<script type="text/javascript" src="${ contextPath }/resources/js/jquery.flexslider-min.js"></script>			<!-- flexslider js -->
<script type="text/javascript" src="${ contextPath }/resources/js/templatemo-script.js"></script>  
</head>
<body>

	
	<jsp:include page="../common/menubar.jsp"/>
	<div class="mainDiv">
		<jsp:include page="../common/userMenubar.jsp"/>
		<div class="row">
                        <div class="col-md-12">
                            <!--breadcrumbs start -->
                            <ul class="breadcrumb">
                                <li><a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>
                                <li><a>관심목록</a></li>
                            </ul>
                            <!--breadcrumbs end -->
                        </div>
                    </div>
		<div role="tabpanel">

		  <!-- Nav tabs -->
		 
		  <ul class="nav nav-tabs" role="tablist" style="width:80%;margin-left:100px;margin-top:30px;">
		    <li role="presentation" class="active"><a href="#lodgment" aria-controls=lodgment role="tab" data-toggle="tab">숙박</a></li>
		    <li role="presentation"><a href="#food" aria-controls="food" role="tab" data-toggle="tab">먹거리</a></li>
		    <li role="presentation"><a href="#entertainment" aria-controls="entertainment" role="tab" data-toggle="tab">오락거리</a></li>
		  </ul>
		
		  <!-- Tab panes -->
		  <div class="tab-content">
		    <div role="tabpanel" class="tab-pane active" id="lodgment">
		    	<div class="lodgmentDiv" style="min-height:600px;">
						<table id="goodListTable" align="center">
							<thead>
								<tr>
									<th width="55px">찜번호</th>
									<th width="150px">관심</th>
									<th width="200px">업체이름</th>
									<th width="200px">업체번호</th>
								</tr>
								</thead>
							<c:forEach var="item" items="${goodsList}">
								<c:if test='${item.lType eq "숙박"}'>
								<tbody>
									<tr>
										<th>${item.lId}</th>
										<td>${item.lType}</td>
										<td>${item.cName }</td>
										<td>${item.cPhone }</td>
									</tr>
								</tbody>
								</c:if>
							</c:forEach>
								
							</table>
					
				
				</div> 
		    </div>
		    <div role="tabpanel" class="tab-pane" id="food">
		    	<div class="foodDiv" style="min-height:600px;">
		    		<table id="foodListTable" align="center">
		    			<thead>
								<tr>
									<th width="55px">찜번호</th>
									<th width="150px">관심</th>
									<th width="200px">업체이름</th>
									<th width="200px">업체번호</th>
								</tr>
								</thead>
								<c:forEach var="item" items="${goodsList}">
								<c:if test='${item.lType eq "먹거리"}'>
								<tbody>
									<tr>
										<th>${item.lId}</th>
										<td>${item.lType}</td>
										<td>${item.cName }</td>
										<td>${item.cPhone }</td>
									</tr>
								</tbody>
								</c:if>
							</c:forEach>
		    		</table>
		    	</div>
		    
		    </div>
		    <div role="tabpanel" class="tab-pane" id="entertainment">
		    		<div class="entertainmentDiv" style="min-height:600px;">
		    			<table id="entertainmentTable" align="center">
		    				<thead>
								<tr>
									<th width="55px">찜번호</th>
									<th width="150px">관심</th>
									<th width="200px">업체이름</th>
									<th width="200px">업체번호</th>
								</tr>
								</thead>
								<c:forEach var="item" items="${goodsList}">
								<c:if test='${item.lType eq "오락거리"}'>
								<tbody>
									<tr>
										<th>${item.lId}</th>
										<td>${item.lType}</td>
										<td>${item.cName }</td>
										<td>${item.cPhone }</td>
									</tr>
								</tbody>
								</c:if>
							</c:forEach>
		    			</table>
		    		</div>
		    </div>
  </div>

</div>
	
	</div>
	
<script>
  $(function () {
    $('#myTab a:last').tab('show')
  })
</script>
<jsp:include page="../common/footer.jsp"/>

</body>
</html>
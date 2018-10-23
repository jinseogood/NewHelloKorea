<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Korea</title>
<style>
.main{
    margin-bottom:5%;
}
.tableArea{
    width:60%;
    margin-left:auto;
    margin-right:auto;
    min-height:480px;
}
.titleArea{
    padding:3%;
    width:70%;
    margin-left:auto;
    margin-right:auto;
}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    text-align: center;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.type09 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    text-align: center;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>
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
                                <li><a href="selectCompanyList.ad">제휴업체 관리</a></li>
                                <li><a href="selectCompanyList.ad">업체 승인·관리</a></li>
                                <li>${list.get(0).cName}</li>
                            </ul>
                            <!--breadcrumbs end -->
                        </div>
                    </div>
	
	
	</div>
		
			<div class="tableArea" align="center">
				<table class="type09" id="detailTable" align="center">
				    <c:if test="${list.get(0).crStatus == 'T'}">
				            <th>안내</th>
				            <td colspan="3">*** 중도 해지 된 상품입니다 ***</td>
                    </c:if>
                    <c:if test="${list.get(0).crStatus == 'E'}">
				            <th>안내</th>
				            <td colspan="3">*** 기간이 만료 된 상품입니다 ***</td>
                    </c:if>
					<tr>
						<th>상호명</th>
						<td>${list.get(0).cName}</td>
						<th>전화번호</th>
						<c:if test="${list.get(0).cPhone != 'undefined'}">
                        <td>${list.get(0).cPhone}</td>
                        </c:if>
                        <c:if test="${list.get(0).cPhone == 'undefined'}">
                        <td></td>
                        </c:if>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3">${list.get(0).cAddress}</td>
					</tr>
					<tr>
						<th>신청일</th>
						<td>${list.get(0).crDate}</td>
						<th>승인일/해지일</th>
						<td>${list.get(0).apDate}</td>
					</tr>
					<c:forEach var="r" items="${list}">
						<tr>
							<th>객실타입</th>
							<td>${r.rType}</td>
							<th>객실 수</th>
							<td>${r.rCount}실</td>
						</tr>
						<tr>
							<th>객실 가격</th>
							<td>${r.rPrice}원</td>
							<th>정원</th>
							<td>${r.rLimit}명</td>
						</tr>
					</c:forEach>
					<tr>
						<th>제휴개월수</th>
						<td>${list.get(0).crTerm}개월</td>
						<th>등록 기간</th>
						<td>${list.get(0).apDate} ~ ${list.get(0).crEDate}</td>
					</tr> 
					<tr>
						<th>첨부 파일</th>
						<td colspan="3">
						<input type="hidden" id="fId1">
						<input type="hidden" id="fId2">
						<a id="file1" onclick="downloadFile1()"></a>
						<br>
						<a id="file2" onclick="downloadFile2()"></a>
						</td>
					</tr>
					<tr>
						<td colspan="4" align="center">
						    <input type="hidden" id="refId" value="${list.get(0).cId}">
                            <input type="hidden" id="crTerm" value="${list.get(0).crTerm}">
							<button type="button" class="btn btn-default" onclick="selectCompanyList()">목록으로</button>&nbsp;&nbsp;
							<c:if test="${list.get(0).apDate == null}">
							<button type="button" class="btn btn-success" onclick="approvalCompany(${list.get(0).crId})">제휴승인</button>
							</c:if>
							<c:if test="${list.get(0).crStatus == 'Y'}">
							<button type="button" class="btn btn-toggle" data-toggle="modal" data-target="#myModal-1">제휴 해지</button>
						    </c:if>
                            
						</td>
					</tr>
				</table>
			</div>
		</div>
		
		<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal-1" class="modal fade">
                                      <div class="modal-dialog">
                                          <div class="modal-content">
                                              <div class="modal-header">
                                                  <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                                                  <h4 class="modal-title" align="center" style="font-weight: bold;">제휴 해지</h4>
                                              </div>
                                              <div class="modal-body">
                                                  <br>
                                                  <form class="form-horizontal" action="terminateCompany.ad" method="post">
                                                      <div class="form-group">
                                                          <label for="cName" class="col-lg-2 col-sm-2 control-label">해지 대상</label>
                                                          <div class="col-lg-10">
                                                              <input type="text" class="form-control" id="cName" name="cName" value="${list.get(0).cName}" readonly>
                                                              <input type="hidden" id="crId" name="crId" value="${list.get(0).crId}">
                                                          </div>
                                                      </div>
                                                      <div class="form-group">
                                                          <label for="reason" class="col-lg-2 col-sm-2 control-label">해지 사유</label>
                                                          <div class="col-lg-10">
                                                              <textarea class="form-control" id="content" name="content" style="height:300px;">
                                                              </textarea>
                                                          </div>
                                                      </div>
                                                      
                                                      <br>
                                                      <div class="form-group" align="center">
                                                              <button type="submit" class="btn btn-info">메세지 발송</button>
             
                                                      
                                               </div>
                                                  </form>

                                              </div>

                                          </div>
                                      </div>
                                  </div>
                                  
                                  

	<script>
	    function selectCompanyList(){
	    	location.href="selectCompanyList.ad";
	    }
	    
	    function approvalCompany(crId){
	    	var cId = $("#refId").val();
	    	var crTerm = $("#crTerm").val();
	    	location.href="updateCompanyRegist.ad?crId="+crId+"&cId="+cId+"&crTerm="+crTerm;
	    }
	    
	    $(function(){
	    	
	    	var refId = $("#refId").val();
	    	
	    	$.ajax({
				url:"selectCompanyFiles.ad",
				type:"POST",
				data:{refId:refId},
				success:function(data){
					console.log(data);
					$("#file1").text(data.fileList0.originName);
					$("#fId1").val(data.fileList0.fId);
					if(data.fileList1 != null){
					  $("#file2").text(data.fileList1.originName);
					  $("#fId2").val(data.fileList1.fId);
					}
				},
				error:function(data){
					console.log("에러");
					console.log(data);
				}
			});
	    });
	    
	    function downloadFile1(){
	    	var fId = $("#fId1").val();
	    	console.log(fId);
	        location.href="downloadFile.ad?fId="+fId;
	    }
        
	    function downloadFile2(){
	    	var fId = $("#fId2").val();
	    	location.href="downloadFile.ad?fId="+fId;
	    }
	</script>
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>
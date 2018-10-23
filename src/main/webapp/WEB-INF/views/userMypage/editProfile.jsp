<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
   body {
    background-color: #e9ebee;
}

.card {
    margin-top: 1em;
  
}

/* IMG displaying */
.person-card {
    margin-top: 5em;
    padding-top: 5em; 
 
}

.person-card .card-title{
    text-align: center;
}
.person-card .person-img{
    width: 10em;
    position: absolute;
    top: 12em;
    left: 50%;
    margin-left: -5em;
    border-radius: 100%;
    overflow: hidden;
    background-color: white;
}

 .container1{
   width:100% !important;
   /* margin-left:auto  !important;
   padding-left:auto  !important; */
   
} 

#insertDiv{
   margin-left:auto;
   margin-right:auto;
   width:500px;
   height:400px;
   margin-top:3em;
}


</style>
<body>
   <div class="container1">
   <jsp:include page="../common/menubar.jsp"/>
    <!-- Sign up form -->
    <jsp:include page="../common/userMenubar.jsp"/>
   
    <form action="editProfile.um" method="post" encType="multipart/form-data" id="">
        <!-- Sign up card -->
        <div class="card person-card">
        
            <div class="card-body">
                <!-- Sex image -->
               <c:if test="${a eq null }">  
               <img id="img_sex" class="person-img"
                    src="https://visualpharm.com/assets/217/Life%20Cycle-595b40b75ba036ed117d9ef0.svg">
                </c:if>
                <c:if test="${a ne null }">
                 <img id="img_sex" class="person-img"
                    src="${contextPath}/resources/uploadFiles/member/${changeName}">
                  </c:if>
                <!-- First row (on medium screen) -->
            </div>
        </div>
        <div id="insertDiv">
        <input type="hidden" value="${mid }"/>
        <label align="center">개인정보를 수정 하실 수 있습니다 !</label>
        <input type="hidden" value="${sessionScope.loginUser.mId}"name="mId">
           <div class="form-group">
                 <label for="email" class="col-form-label">Email</label>
                 <input type="email" class="form-control" id="email" name="email" placeholder="${m.email }" readonly="">
            </div>
            <div class="form-group">
                  <label for="nickname" class="col-form-label">nickname</label>
                  <input type="text" class="form-control" id="nickname" name="nickname"placeholder="${m.nickname }" required>
                   <a onclick="nicknameCheck()">중복 체크 </a>
             </div>
              <div class="form-group">
                  <label for="interest" class="col-form-label">interest</label>
                  <input type="text" class="form-control" name="interest" id="interest" placeholder="${m.interest }"/>
             </div>
              <div class="form-group">
                  <label for="national" class="col-form-label">national</label>
                  <input type="text" class="form-control" name="national" id="national" placeholder="${m.national }" readonly=""/>

             </div>
             <div class="form-group">
                  <label for="profile" class="col-form-label">profile</label>
                  <input type="file" class="form-control" id="profile" name="photo"  required>
             </div>
             
        </div>
        <div style="margin-top: 1em;">
            <button type="submit" class="btn btn-primary btn-lg btn-block">수정 완료</button>
        </div>
        </form>
</div>
<script>
   function nicknameCheck(){
      var nickname = $("#nickname").val();
      $.ajax({
         url:"nicknameCheck.me",
         type:"post",
         data:{
            nickname:nickname   
         },
         success: function(data){
            if(data ==0){
               alert("사용가능한 닉네임입니다");
            }else{
               alert("중복되는  닉네임입니다");
            }
         },
         error:function(){
            alert("실패");
         }

      });
      
      
      
   }
   

</script>
   
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="./common/header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <script type="text/javascript">
    
	$(document).ready(function(){
  		if(${not empty msgType}){
  			// 회원가입 시도
  			if(${msgType eq "성공 메시지"}){
  				$("#msgType").attr("style","background-color:#ADD8E6");
				$("#closeMessage").attr("class","btn-outline-info");
  			}else if(${msgType eq "로그아웃 메시지"}){
  				$("#msgType").attr("style","background-color:#ADD8E6");
				$("#closeMessage").attr("class","btn-outline-primary");
  			}else if(${msgType eq "로그인 성공"}){
  				$("#msgType").attr("style","background-color:#ADD8E6");
				$("#closeMessage").attr("class","btn-outline-primary");
  			}else if(${msgType eq "수정 성공 메시지"}){
  				$("#msgType").attr("style","background-color:#ADD8E6");
				$("#closeMessage").attr("class","btn-outline-primary");
  			}
  			$("#msgModal").modal("show");
  		}
  	});
    
    
    
    </script>
  
  
  </head>
<body>


  <div class="container-fluidp-5 text-white text-center" style="background-color:#A9D0F5">
  <div> <h1>My First Bootstrap 5 Page</h1></div>
  <div class="container-fluidp-5">
  		<div class="container-fluidp mt-3"><img src="${contextPath}/resources/images/main.jpg" style="width: 100%; height : 400px;"></div>
  </div>
	<div>
  	  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-bs-toggle="tab" href="#home">Home</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#menu1">Board</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#menu2">Notice</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="home" class="container tab-pane active"><br>
      <h3>HOME</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div>
    <div id="menu1" class="container tab-pane fade"><br>
      <h3>Board</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    <div id="menu2" class="container tab-pane fade"><br>
      <h3>Notice</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
  </div>
  </div> 
  </div>

  
<!-- <div class="container mt-5">
  <div class="row">
    <div class="col-sm-4">
      <h3>Column 1</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris...</p>
    </div>
    <div class="col-sm-4">
      <h3>Column 2</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris...</p>
    </div>
    <div class="col-sm-4">
      <h3>Column 3</h3>        
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris...</p>
    </div>
  </div>
</div>  -->


	<!-- 회원가입 실패 성공 유무 Modal -->
	<div class="modal" id="msgModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header" id="msgType">
					<h4 class="modal-title">${msgType}</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<p>${msg}</p>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal" id="closeMessage">Close</button>
				</div>

			</div>
		</div>
	</div>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="../common/header.jsp"></jsp:include>
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
  			if(${msgType eq "로그인 실패"}){
  				$("#msgType").attr("style","background-color:#FFC0CB");
				$("#closeMessage").attr("class","btn-outline-danger");
  			}
  			$("#msgModal").modal("show");
  		}
  	});
  	
  	
  </script>
  
  
</head>
<body>
<div class="container mt-3 text-center"">
  <h2>Login</h2>
  <form action="${contextPath}/login.do" method="post">
    <div class="mb-3 mt-3">
      <label for="memId">Id:</label>
      <input type="text" class="form-control" id="memId" placeholder="Enter ID" name="memId" required>
    </div>
    <div class="mb-3">
      <label for="memPw">Password:</label>
      <input type="password" class="form-control" id="memPw" placeholder="Enter password" name="memPw" required>
    </div>
    <div class="form-check mb-3">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember"> Remember me
      </label>
    </div>
    <input type="submit" class="btn btn-primary" value="login">
  </form>
</div>

	<!-- Modal -->
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
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
  			if(${msgType eq "실패 메시지"}){
  				$("#msgType").attr("style","background-color : #FFC0CB");
				$("#closeMessage").attr("class","btn-outline-danger");
  			}
  			$("#msgModal").modal("show");
  		}
  	});
  	
  	
  </script>
  
  
</head>
<body>
<div class="container-fluidp-5 text-white text-center" style="background-color:#A9D0F5" >
  <h2>Profile Upload</h2>
 <!-- enctype
  	   1) application/x-www-form-urlencoded 
  	   : form 태그 안에서 보내는 요청데이터를 key-value 형태로 보낸다
  	   2) multipart/form-data
  	   : 사진 파일 같이 용량이 큰 데이터를 보낼 떄 사용한다 -->
  <form action="${contextPath}/imageUpload.do" method="post" enctype="multipart/form-data">
    <table class="table">
    
		<tr>
			<th class="table-primary" style="width : 120px; vertical-align : middle;">Id</th>
			<td class="table-light"> ${mvo.memId}</td>
		</tr>

		<tr>
			<th class="table-primary" style="width : 120px; height:300px; vertical-align : middle;">image Upload</th>
			<td class="table-light" style="height:300px; vertical-align : middle;">
			<span class="btn btn-default table">이미지를 업로드 해주세요. 
				<input type="file" name="memProfile">
			</span>
			</td>
		</tr>

    <tr>
  		  <td colspan="2"><input type="submit" class="btn btn-primary" value="완료"></td>
 	</tr>
  </table>
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
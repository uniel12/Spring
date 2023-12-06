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
  			// 수정 실패
  			if(${msgType eq "수정 실패 메시지"}){
  				$("#msgType").attr("style","background-color:#FFC0CB");
				$("#closeMessage").attr("class","btn-outline-danger");
  			}
  			$("#msgModal").modal("show");
  		}
  	});
  
 
  	function pwCheck(){
  		// 비밀번호 일치 여부 확인
  		var pw1 = $("#memPw1").val();
  		var pw2 = $("#memPw2").val();
  		
  		if(pw1 !=pw2){
  			// 비밀번호 일치 X
  			$("#pwMessage").text("비밀번호가 일치 하지 않습니다");
  			$("#pwMessage").attr("style","color : red");
  		}else{
  			// 비밀번호 일치 O
  			$("#pwMessage").text("비밀번호가 일치합니다.");
  			$("#pwMessage").attr("style","color : blue");
  			$("#memPw").val(pw1);
  			
  			
  		}
  		
  	}
  	
  	
  	
  	
  </script>
  
  
</head>
<body>
 
<div class="container mt-3 text-center " >

  <h2>SpringMVC03</h2>
  <div class="panel panel-default">
    <div class="panel-heading"><h4>회원 정보 수정</h4></div>
    <div class="panel-body">
    	<form action="${contextPath}/update.do" method="post">
    		<input type="hidden" name="memPw" id="memPw" value="">
    		<input type="hidden" name="memId" value="${mvo.memId}">
    		<table class="table table-bordered" style="text-align : center; border : 1px solid #dddddd">
    			<tr>
    				<td class="table-primary">아이디</td>
    				<td colspan="2">${mvo.memId}</td>
    
    			</tr>
    			<tr>
    				<td style="width : 120px; vertical-align : middle;" class="table-primary" >비밀번호</td>
    				<td colspan="2"><input onkeyup="pwCheck()" type="password" name="memPw1" id="memPw1" class="form-control" placeholder="비밀번호를 입력해주세요." maxlength="20" required></td>
    			</tr>
    			<tr>
    				<td style="width : 120px; vertical-align : middle;" class="table-primary">비밀번호 확인</td>
    				<td colspan="2" ><input onkeyup="pwCheck()" type="password" name="memPw2" id="memPw2" class="form-control" placeholder="비밀번호를 확인해주세요." maxlength="20" required></td>
    			</tr>
    			<tr>
    				<td style="width : 120px; vertical-align : middle;" class="table-primary"></td>
    				<td colspan="2" style="text-align : left; padding-left : 20px"><span id="pwMessage" style="color : red;"></span></td>
    			</tr>
    			<tr>
    				<td style="width : 120px; vertical-align : middle;" class="table-primary">사용자 이름</td>
    				<td colspan="2"><input type="text" value="${mvo.memName}" name="memName" id="memName" class="form-control" placeholder="사용자 이름을 입력해주세요." maxlength="20"></td>
    			</tr>
    			<tr>
    				<td style="vertical-align : middle;" class="table-primary">나이 / 성별</td>
    				<td style=" vertical-align : middle;"><input type="number" value="${mvo.memAge}" name="memAge" id="memAge" class="form-control" placeholder="나이를 입력해주세요." maxlength="1" required></td>
    				<td>
    					<div class="form-group" style="text-align : center; margin : 0 auto;">
    						<div class="btn-group" data-toggle="buttons">
    						
    						<c:choose>
	    						<c:when test="${mvo.memGender eq '남'}">
    							<label class="btn btn-primary form-check-label">
    								<input type="radio" id="memGender" name="memGender"  value="남" checked>남
    							</label>
    							<label class="btn btn-primary form-check-label">
    								<input type="radio" id="memGender" name="memGender" value="여">여
    							</label>
	    							
	    						</c:when>
	    						
	    						<c:otherwise>
    							<label class="btn btn-primary form-check-label">
    								<input type="radio" id="memGender" name="memGender"  value="남" >남
    							</label>
    							<label class="btn btn-primary form-check-label">
    								<input type="radio" id="memGender" name="memGender" value="여" checked>여
    							</label>
	    						</c:otherwise>
	    						
    						</c:choose>
    						
    						</div>
    					</div>
    				</td>
    			</tr>
    			<tr>
    				<td style="width : 120px; vertical-align : middle;" class="table-primary" >이메일</td>
    				<td colspan="2"><input type="email" value="${mvo.memEmail}" name="memEmail" id="memEmail" class="form-control" placeholder="이메일를 입력해주세요." maxlength="20" min="1" max="120" required></td>
    			</tr>
    			<tr>
    				<td colspan ="3">
    				<input type="submit" class="btn btn-outline-success" value="수정">
    				<input type="reset" class="btn btn-outline-warning" value="초기화">
    				</td>
    			</tr>
    		</table>
    	</form>    

    </div>
    <div class="panel-footer">스프링 게시판 - 윤</div>
  </div>
</div>


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

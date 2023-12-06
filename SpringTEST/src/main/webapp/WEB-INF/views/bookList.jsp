<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Book Shop</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
   <script type="text/javascript">
   
 	// 글쓰기 버튼을 눌렀을 때 글쓰기 폼을 보여주는 함수
 	function goForm(){
 	    $("#wform").css("display","block");
 	}
 	
 	
 	// 게시글 등록 기능
 	function goInsert(){
 		// 제목, 내용, 작성자를 DB에 등록
 		// document.querySelector().value
 		// $("#title").val();
 		var fData = $("#frm").serialize();
 		console.log(fData);
 		
 		$.ajax({
 			url : "bookInsert.do",
 			type : "post",
 			data : fData,
 			success : function(){alert("success");},
 			error : function(){alert("error");}
 		});
 		
 		$("#fclear").trigger("click");
 		
 	}
   </script>
</head>

<body>
	<h2>보유 도서 현황</h2>
	<div>
    	<table class="table">
	    	<tr align="left">
	    		<td>번호</td>
	    		<td>제목</td>
	    		<td>작가</td>
	    		<td>출판사</td>
	    		<td>ISBN</td>
	    		<td>보유도서수</td>
	    	</tr>
		  
	    
	    	<!--EL 문법으로 출력하기 -->
	    	<c:forEach var="vo" items="${list}" varStatus="s">
		    	<tr align="center">
		    		<td>${s.count}</td>
		    		<td>${vo.title}</a></td>
		    		<td>${vo.author}</td>
		    		<td>${vo.company}</td>
		    		<td>${vo.company}</td>
		    		<td>${vo.isbn}</td>
		    		<td>${vo.count}</td>
		    	</tr>
	    	</c:forEach>
	    	<tr><td><button class="btn btn-outline-primary" onclick="goForm()">글쓰기</button></td></tr>
    	</table>
	</div>
	
	    <!-- 글쓰기 폼 -->
	<div style="display: none;" id="wform">
	<h2>도서 입력</h2>
	<form id="frm">
	<table class="table">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" class="form-control"></td>
			</tr>
			<tr>
				<td>작가</td>
				<td><input type="text" name="author" class="form-control"></td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><input type="text" name="company" class="form-control"></td>
			</tr>
			<tr>
				<td>ISBN</td>
				<td><input type="text" name="isbn" class="form-control"></td>
			</tr>
			<tr>
				<td>보유도서수</td>
				<td><input type="number" name="count" class="form-control"></td>
			</tr>
			<tr>
			<td colspan="2" align="center">
				<button type="reset" class="btn btn-outline-danger btn-sm" id="fclear">초기화</button>
				<button type="button" class="btn btn-outline-success btn-sm" onclick="goInsert()">등록</button>
			</td>
			</tr>
	</table>
	</form>
	</div>
</body>
</html>

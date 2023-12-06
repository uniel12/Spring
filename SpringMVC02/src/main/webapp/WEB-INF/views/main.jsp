<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <script type="text/javascript">
  	
  $(document).ready(function(){
	  // HTML 구조가 다 로딩이 된 후에 loadList() 실행
	  loadList();
  })
  
  	function loadList(){
  		// BoardController에서 게시글 전체목록을 가져오는 기능
  		// ajax 사용
  		// JavaScript Object Notation -> JS 객체 표현 방식
  		// {key:value, key:value,[{key,vlaue},...],...}
  		$.ajax({
  			url:"board/all",
  			type: "get",
  			dataType:"json",
  			success: makeView, //callback 함수
  			error: ()=>{alert("error");}
  		});
  	}
  	
  	// 성공시 실행할 makeView 함수 -> jsp에 데이터를 뿌려주는 함수
  	function makeView(data){ // data=[{idx:1,title:"하하",...},{},{},..]
  		console.log(data);
  		
  		var listHtml = "<table class='table table-bordered table-hover'>";
  		listHtml+="<tr align='center' class='table-primary'>";
  		listHtml+="<td>번호</td>";
  		listHtml+="<td>제목</td>";
  		listHtml+="<td>작성자</td>";
  		listHtml+="<td>작성일</td>";
  		listHtml+="<td>조회수</td>";
  		listHtml+="</tr>";
  		
  		// jQuery 반복문
  		$.each(data, function(index, obj){
	  		listHtml+="<tr align='center'>";
	  		
	  		listHtml+="<td>"+(index+1)+"</td>";
	  		listHtml+="<td id='t"+obj.idx+"'><a href='javascript:goContent("+obj.idx+")'>"+obj.title+"</a></td>";
	  		listHtml+="<td>"+obj.writer+"</td>";
	  		listHtml+="<td>"+obj.indate+"</td>";
	  		listHtml+="<td>"+obj.count+"</td>";
	  		listHtml+="</tr>";
	  				
  		
	  		// 상세 게시글 보여주기
	  		listHtml += "<tr id='c" + obj.idx + "' style='display: none;'>";
	  		listHtml += "<td>내용</td>";
	  		listHtml += "<td colspan='4'><textarea id='ta" + obj.idx + "' readonly class='form-control' rows='7' >";
	  		listHtml += "</textarea>";
	  		
	 		
	  		//수정, 삭제 버튼 만들기
	  		listHtml += "<span id='up"+obj.idx+"'><button class='btn btn-success' onclick='goUpdateForm(" + obj.idx + ")'>수정</button></span> &nbsp"
	  		listHtml += "<span id='de"+obj.idx+"'><button class='btn btn-warning' onclick='goDelete(" + obj.idx + ")'>삭제</button></span> "
	  		listHtml += "</td>";
	  		listHtml += "</tr>";
  		
  		});
  		
 		// 글쓰기 버튼 추가
 		listHtml+='<tr align="right"><td colspan="5">';
 		listHtml+= '<button class="btn btn-outline-primary" onclick="goForm()">글쓰기</button></td></tr>';
  		listHtml+="</table>";
  		$("#view").html(listHtml);
  		
  		// 다시 목록으로 돌아가기
  		goList();
  	}
  	
  	// 글쓰기 버튼을 눌렀을 때 글쓰기 폼을 보여주는 함수
  	function goForm(){
  	   	$("#view").css("display","none");
  	    $("#wform").css("display","block");
  	}
  	
  	// 목록 버튼을 눌렀을 때 리스트 보여주는 함수
  	function goList(){
  	   	$("#view").css("display","block");
  	    $("#wform").css("display","none");
  	}
  	
  	// 게시글 등록 기능
  	function goInsert(){
  		// 제목, 내용, 작성자를 DB에 등록
  		// document.querySelector().value
  		// $("#title").val();
  		var fData = $("#frm").serialize();
  		console.log(fData);
  		
  		$.ajax({
  			url : "board/new",
  			type : "post",
  			data : fData,
  			success : loadList,
  			error : function(){alert("error");}
  		});
  		
  		$("#fclear").trigger("click");
  		
  	}
  	
  	// 게시글 상세보기 기능
  	function goContent(idx){
  		if($("#c"+idx).css("display") == "table-row"){
  			$("#c"+idx).css("display","none");
  			
  			// 조회수 올리기
  			$.ajax({
  				url : "board/count/"+idx,
  				type : "put",
  				success : loadList,
  	  			error : function(){alert("error");}
  			});
  			
  		}else{ 
  			// 내용 비동기 방식으로 가져온 다음 태그 형식으로 넣어주기 
  			// boardContent.do 라고 요청
  			// 요청 방식 : get
  			// data : {"idx":idx}
  			// dataType : "json"
  			// 성공시 : textarea태그 안에 content 출력
  			
  			$.ajax({
  				url:"board/"+idx,
  				// data : {"idx":idx},
  				dataType : "json",
  				success : function(data){
  					$("#ta"+idx).text(data.content);
		  		},
  				error : function(){
  					alert("error");
  				}
  			});
  			
  			
  			$("#c"+idx).css("display","table-row");
  		}
  	}
  	
  	// 게시글 삭제 기능
  	function goDelete(idx){
  		$.ajax({
  			url : "board/"+idx,
  			type : "delete",
  			// data : {"idx":idx},
  			success : loadList,
  			error : function(){
  				alert("error");
  			}
  		});
  	}
  	
	// 수정화면 만들어주는 기눙
	function goUpdateForm(idx){
		$('#ta'+idx).attr("readonly",false);
		
		// title 부분 input태그로 바꿔주기
		var title = $('#t'+idx).text();
		var newInput = "<input type='text' id='nt"+idx+"' value='"+title+"' class='form-control'>";
		$("#t"+idx).html(newInput);
		// 수정 버튼을 DB값 바꾸는 버튼으로 바꿔주기
		var newButton = "<button class='btn btn-primary' onclick='goUpdate("+idx+")'>수정</button>";
		$("#up"+idx).html(newButton);
		
	}
	
	// 게시글 수정 기능
	function goUpdate(idx){
		var title = $("#nt"+idx).val();
		var content = $("#ta"+idx).val();
		
		$.ajax({
			url : "board/update",
			type : "put", // put 방식은 JSON 형식을 인식 못함
			contentType : "application/json; charset=UTF-8", // put 방식에서는 data 타입 명시
			// javscript에서 쓰이는 자바객체(클래스)를 활용해서 보내줘야 함 ->JSON 이라는 클래스
			data : JSON.stringify({"title":title, "content":content, "idx":idx}), 
			success : loadList,
			error : function(){
  				alert("error");
  			}
		});
	}
  	
  	
  	
  	
  </script>
  
</head>
<body>
 
<div class="container">
  <h2>SpringMVC02</h2>
  <div class="panel panel-default">
    <div class="panel-heading">Board</div>
    <!-- 전체 게시글 조회 -->
    <div class="panel-body" id="view">
 
    </div>
    
    <!-- 글쓰기 폼 -->
	<div class="panel-body" style="display: none;" id="wform">
	<form id="frm">
	<table class="table table-bordered">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" class="form-control"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer" class="form-control"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="7" cols="" name="content" class="form-control"></textarea></td>
			</tr>
			<tr>
			<td colspan="2" align="center">
				<button type="reset" class="btn btn-outline-danger btn-sm" id="fclear">초기화</button>
				<button type="button" class="btn btn-outline-warning btn-sm" onclick="goList()">목록</button>
				<button type="button" class="btn btn-outline-success btn-sm" onclick="goInsert()">등록</button>
			</td>
			</tr>
	</table>
	</form>
	</div>


<div class="panel-footer">스프링 게시판 - 윤</div>
  </div>
</div>


</body>
</html>

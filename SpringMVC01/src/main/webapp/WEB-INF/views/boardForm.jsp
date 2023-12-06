<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h2>SpringMVC01</h2>
		<div class="panel panel-default">
			<div class="panel-heading">Board</div>
			<div class="panel-body">
			
				<form action="boardInsert.do" method="post">
					<table class="table">
					<!-- title, content, writer -->
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
							<button type="submit" class="btn btn-success">등록</button>
							<button type="reset" class="btn btn-warning">초기화</button>
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

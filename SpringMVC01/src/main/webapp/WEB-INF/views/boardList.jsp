<%@page import="com.board.entity.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
 
<div class="container">
  <h2>SpringMVC01</h2>
  <div class="panel panel-default">
    <div class="panel-heading">Board</div>
    <div class="panel-body">
    	<table class="table table-bordered table-hover">
	    	<tr align="center">
	    		<td>번호</td>
	    		<td>제목</td>
	    		<td>작성자</td>
	    		<td>작성일</td>
	    		<td>조회수</td>
	    	</tr>
	    	<!-- 
	    	BoardCotroller에서 받아온 list 데이터를 for문 사용해서 
	    	아래에 tr,td 사용해서 출력해보기
	    	-->
	    	<%
	    	List<Board> list =(List<Board>)request.getAttribute("list");
	    	System.out.println("Board 테이블의 전체 행의 수 : "+list.size());
	    	%>
			<%-- <%for(board vo:list){%>
	    	<tr align="center">
	    		<td><%=vo.getIdx()%></td>
	    		<td><%=vo.getTitle()%></td>
	    		<td><%=vo.getWriter()%></td>
	    		<td><%=vo.getIndate()%></td>
	    		<td><%=vo.getCount()%></td>
	    	</tr>
	    	<%} %> --%> 
		  
	    
	    	<!--EL 문법으로 출력하기 -->
	    	<c:forEach var="vo" items="${list}" varStatus="s">
		    	<tr align="center">
		    		<td>${s.count}</td>
		    		<td><a href="boardContent.do?idx=${vo.idx}">${vo.title}</a></td>
		    		<td>${vo.writer}</td>
		    		<td>${fn:split(vo.indate," ")[0]}</td>
		    		<td>${vo.count}</td>
		    	</tr>
	    	</c:forEach>
    	</table>
	    	<a href="boardForm.do" class="btn btn-primary">글쓰기</a>
    </div>
    <div class="panel-footer">스프링 게시판 - 윤</div>
  </div>
</div>


</body>
</html>

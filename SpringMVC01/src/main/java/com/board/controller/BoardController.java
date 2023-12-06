package com.board.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.entity.Board;
import com.board.mapper.BoardMapper;


// Handler(Controller - POJO) Mapping이 Controller를 찾기 위해 @Controller로 명시해야 함
@Controller
public class BoardController {
	
	// 스프링 컨테이너에 BoardMapper을 주입해서 받아서 쓰겠다.
	@Autowired
	private BoardMapper boardMapper;
	
	
	// 게시글 상세보기 /boardContent.do
	@GetMapping("/boardContent.do")
	public String boardContent(@RequestParam("idx") int idx, Model model) { //boardContent.do?idx={}
		System.out.println("[게시글 상세보기]");
		// 조회수 올리기
		boardMapper.boardCount(idx);
		// boardMapper 사용해서 Board에 담고
		Board board = boardMapper.boardContent(idx);
		// model 영역에 저장 후
		model.addAttribute("board", board);
		// boardContent.jsp
		return "boardContent";
	}
	
	// 게시글 작성 /boardInsert.do
	@PostMapping("/boardInsert.do")
	public String boardInsert(Board board) { // title, content, writer
		System.out.println("[게시글 작성]");
		System.out.println(board.toString());
		boardMapper.boardInsert(board);
		// sendRedirect 방식으로 요청 URL 알려주기
		return "redirect:/boardSelectList.do";
	}
	
	// 게시글 작성하는 jsp로 이동 /boardForm.do
	@GetMapping("/boardForm.do")
	public String boardForm() {
		return "boardForm";
	}
	
	// 게시글 전체조회  /boardSelectList.do
	@GetMapping("/boardSelectList.do")
	public String boardSelectList(Model model){
		System.out.println("[게시글 전체조회]");
		// DB로부터 게시글 정보를 불러오기
		// 번호, 제목, 내용, 작성자, 작성일, 조회수
		// 하나의 게시글 작성
		List<Board> list =boardMapper.boardSelectList();
		
		// vo1, vo2, vo3를 jsp로 보낼건데 -> request가 아닌 좀 더 작은 영역인 model를 사용
		// 객체바인딩 (동적바인딩)
		model.addAttribute("list", list);
		
		return "boardList";
	}
	
	// 게시글 수정 페이지 이동 /boardUpdateForm.do
	@GetMapping("/boardUpdateForm.do/{idx}")
	public String boardUpdateForm(@PathVariable("idx")int idx,Model model) {
		Board board = boardMapper.boardContent(idx);
		model.addAttribute("board",board);
		return "boardUpdateForm";
	}
	
	// 게시글 수정 /boardUpdate.do
	@PostMapping("/boardUpdate.do")
	public String boardUpdate(Board board) { 
		System.out.println("[게시글 수정하기]");
		System.out.println(board.toString());
		// 수정
		boardMapper.boardUpdate(board);
		return "redirect:/boardSelectList.do";
	}
	
	
	
	// 게시글 삭제 /boardDelete.do
	@GetMapping("/boardDelete.do")
	public String boardDelete(@RequestParam("idx") int idx) { //boardContent.do?idx={}
		System.out.println("[게시글 삭제하기]");
		// boardMapper 사용해서 Board에 담고
		boardMapper.boardDelete(idx);
		// boardContent.jsp
		return "redirect:/boardSelectList.do";
	}
	
	
}

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.entity.Board;
import com.board.mapper.BoardMapper;


// Handler(Controller - POJO) Mapping이 Controller를 찾기 위해 @Controller로 명시해야 함
@Controller
public class BoardController {
	
	// 스프링 컨테이너에 BoardMapper을 주입해서 받아서 쓰겠다.
	@Autowired 
	private BoardMapper boardMapper;
	
	// main.jsp로 이동하는 동기방식 메소드
	@RequestMapping("/")
	public String main() {
		return "main";
	}
	
	
	
}

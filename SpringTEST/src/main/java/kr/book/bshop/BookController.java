package kr.book.bshop;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.book.entity.BookVO;
import kr.book.mapper.BookMapper;

import java.util.List;

@Controller
public class BookController {
	
	@Autowired
	private BookMapper mapper;
	
	

	@RequestMapping ("/bookList.do")
	public String bookList(Model model) {
		
		List<BookVO> list = mapper.bookList();
		model.addAttribute("list" , list);
		
		return "bookList";
	}
	
	@RequestMapping("/bookInsert.do")
	@ResponseBody
	public String bookInsert( BookVO vo) {
		mapper.bookInsert(vo);
		return "redirect:/boardList.do";
	}
	
}

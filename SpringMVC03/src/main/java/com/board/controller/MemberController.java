package com.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.entity.Member;
import com.board.mapper.MemberMapper;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class MemberController {

	@Autowired
	private MemberMapper memberMapper;

	// 파일 업로드 기능 -> cos.jar -> MultipartRequest 객체 사용
	@PostMapping("/imageUpload.do")
	public String imageUpload(HttpServletRequest request, HttpSession session, RedirectAttributes rttr) {
		System.out.println("[프로필 업로드]");

		// multipartRequest 객체를 생성하기 위한 매개변수 5가지
		// 1. request 객체
		MultipartRequest multi = null;
		// 2. 사진 저장 경로
		String savePath = request.getSession().getServletContext().getRealPath("resources/profile");
		System.out.println("savePath : " + savePath);
		// 3. 허용 가능 사이즈
		int maxSize = 1024 * 1024 * 100; // 100MB
		// 4. 파일에 대한 인코딩
		String encoding = "UTF-8";
		// 5. 파일 이름 중복제거
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		System.out.println("파일 중복제거 " + rename);
		// ->memId가 필요 -> memId에 해당하는 memProfile을 가지고 오기 위해서
		String memId = ((Member) session.getAttribute("mvo")).getMemId();

		try {

			multi = new MultipartRequest(request, savePath, maxSize, encoding, rename);
			System.out.println("멀티 객체 생성 됐냐?");

			// 이미지 파일인지 판별하기(jpg, png, jpeg, gif)
			// 내가 보낸 파일 가져오기
			File file = multi.getFile("memProfile");

			System.out.println(file.getName());

			if (file != null) {

//		String[] parts = file.getName().split("\\.");
//		String exe = parts[parts.length - 1];
				String exe = file.getName().substring(file.getName().lastIndexOf(".") + 1);

				// 확장자를 다 소문자로 바꿔주기
				exe = exe.toLowerCase(); // 대문자 toUpperCase
				System.out.println(exe);

				boolean imgType = exe.equals("jpg") || exe.equals("png") || exe.equals("jpeg") || exe.equals("gif");
				if (!imgType) {
					// 등록은 됐지만 사진파일이 X -> 지워주기
					file.delete();
					System.out.println("확장자");
					rttr.addFlashAttribute("msgType", "실패 메시지");
					rttr.addFlashAttribute("msg", "이미지 파일만 업로드해주세요.(jpg, png, jpeg, gif)");
					return "redirect:/imageForm.do";
				} else {

					// 기존의 가지고 있는 해당 프로필 사진 삭제
					// ->memId가 필요 -> memId에 해당하는 memProfile을 가지고 오기 위해서
					String oldImg = (memberMapper.registerCheck(memId)).getMemProfile(); // 중복확인 아님 findMember

					File oldFile = new File(savePath + "/" + oldImg);

					// 파일이 존재할 때만 삭제
					if (oldFile.exists()) {
						oldFile.delete();
					}

				}

			}

			// DB에 값 넣어주기
			// memId,newProfile
			String newProfile = multi.getFilesystemName("memProfile");
			Member mvo = new Member();
			mvo.setMemId(memId);
			mvo.setMemProfile(newProfile);
			int cnt = memberMapper.imageUpdate(mvo);

			if (cnt == 1) {
				session.setAttribute("mvo", mvo);
				rttr.addFlashAttribute("msgType", "성공 메시지");
				rttr.addFlashAttribute("msg", "프로필 업로드를 성공했습니다.");
				return "redirect:/";
			} else {
				rttr.addFlashAttribute("msgType", "실패 메시지");
				rttr.addFlashAttribute("msg", "이미지 업로드에 실패했습니다.");
				return "redirect:/imageForm.do";
			}
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("업로드 실패함");
			rttr.addFlashAttribute("msgType", "실패 메시지");
			rttr.addFlashAttribute("msg", "파일을 사이즈를 확인해주세요.(10MB이하만 가능)");
			return "redirect:/imageForm.do";
		} catch (NullPointerException e) {
			rttr.addFlashAttribute("msgType", "실패 메시지");
			rttr.addFlashAttribute("msg", "이미지를 업로드 하지 않았습니다.");
			return "redirect:/imageForm.do";
		}
	}

	// 이미지 폼
	@GetMapping("/imageForm.do")
	public String imageForm() {
		return "member/imageForm";
	}

	// 회원정보 수정
	@PostMapping("/update.do")
	public String Update(Member m, HttpSession session, RedirectAttributes rttr) {
		if (m.getMemId() == null || m.getMemId().equals("") || m.getMemPw() == null || m.getMemPw().equals("")
				|| m.getMemName() == null || m.getMemName().equals("") || m.getMemAge() <= 0 || m.getMemEmail() == null
				|| m.getMemEmail().equals("")) {
 
			// 하나라도 누락된 데이터가 있다면 updateForm.jsp로 이동
			// - 모달 창에 " 모든 내용을 입력해주세요"
			rttr.addFlashAttribute("msgType", "수정 실패 메시지");
			rttr.addFlashAttribute("msg", "모든 정보를 입력해주세요.");
			return "redirect:updateForm.do";
		} else {
			// 3. 회원정보 수정에 성공한 경우 index.jsp로 이동후
			// - 모달창에 "회원정보 수정에 성공하셨습니다."
			// 수정 상태
			int cnt = memberMapper.update(m);

			if (cnt > 0) {
				session.setMaxInactiveInterval(3600); // 1시간
				session.setAttribute("mvo", m);
				rttr.addFlashAttribute("msgType", "수정 성공 메시지");
				rttr.addFlashAttribute("msg", "회원정보 수정에 성공하셨습니다.");
				return "redirect:/";
			} else {
				// 2. 회원정보 수정에 실패한 경우 updateForm.jsp로 이동
				// - 모달창에 "회원정보 수정에 실패하셨습니다."
				rttr.addFlashAttribute("msgType", "수정 실패메시지");
				rttr.addFlashAttribute("msg", "회원가입에 실패했습니다.");
				return "redirect:/updateForm.do";
			}
		}
	}

	// 회원정보 수정하는 폼으로 이동
	@GetMapping("/updateForm.do")
	public String updateForm() {
		return "member/updateForm";
	}

	// 로그인 기능
	@PostMapping("login.do")
	public String login(Member m, HttpSession session, RedirectAttributes rttr) {
		// 실습
		// 입력한 memId와 memPw가 일치하는 DB에서 가져와서

		Member member = memberMapper.login(m);
		if (member != null) {
			// 로그인 성공시
			// - session에 mvo라는 이름으로 저장 후 -> index.jsp로 이동=> 모달 창에 "로그인에 성공했습니다"
			session.setMaxInactiveInterval(3600); // 1시간
			session.setAttribute("mvo", member);
			rttr.addFlashAttribute("msgType", "로그인 성공");
			rttr.addFlashAttribute("msg", m.getMemId() + " 님 로그인에 성공하셨습니다.");
			return "redirect:/";
		} else {
			// 로그인 실패시
			// - loginForm.jsp 로 이동 -> 모달 창에 " 다시 로그인 해주세요"
			rttr.addFlashAttribute("msgType", "로그인 실패");
			rttr.addFlashAttribute("msg", "다시 로그인 해주세요.");
			return "redirect:/loginForm.do";
		}

	}

	// 로그인 폼으로 이동
	@GetMapping("/loginForm.do")
	public String loginForm() {
		return "member/loginForm";
	}

	// 로그아웃 기능
	@GetMapping("/logout.do")
	public String logout(HttpSession session, RedirectAttributes rttr) {
		System.out.println("[로그아웃]");
		session.removeAttribute("mvo");
		rttr.addFlashAttribute("msgType", "로그아웃 메시지");
		rttr.addFlashAttribute("msg", "로그아웃에 성공했습니다.");
		return "redirect:/";
	}

	// 회원가입 기능
	@PostMapping("/join.do")
	public String join(Member m, HttpSession session, RedirectAttributes rttr) {
		System.out.println("[회원가입]");
		System.out.println(m.toString());

		m.setMemId(m.getMemId().replaceAll("\\s", "")); // 받아온 m의 모든 공백 제거
		m.setMemPw(m.getMemPw().replaceAll("\\s", "")); // 받아온 m의 모든 공백 제거
		m.setMemName(m.getMemName().replaceAll("\\s", "")); // 받아온 m의 모든 공백 제거
		m.setMemEmail(m.getMemEmail().replaceAll("\\s", "")); // 받아온 m의 모든 공백 제거

		// RedirectAttributes
		// - redirect 방식으로 페이지 이동을 하는데, 저장해야할 정보가 있을 때
		// request(model) 없어지고, session을 사용하기에는 비효율적
		// 딱 한 번만 데이터를 저장해서 다음 페이지에 뿌려주는 객체

		if (m.getMemId() == null || m.getMemId().equals("") || m.getMemPw() == null || m.getMemPw().equals("")
				|| m.getMemName() == null || m.getMemName().equals("") || m.getMemAge() <= 0 || m.getMemEmail() == null
				|| m.getMemEmail().equals("")) {
			// 회원가입 실패
			// "모든 정보를 입력해주세요."
			rttr.addFlashAttribute("msgType", "실패메시지");
			rttr.addFlashAttribute("msg", "모든 정보를 입력해주세요.");
			return "redirect:joinForm.do";
		} else {
			// 로그인 상태
			int cnt = memberMapper.join(m);

			if (cnt == 1) {
				// 회원가입 성공
				// "회원가입에 성공했습니다."
				session.setAttribute("mvo", m);
				rttr.addFlashAttribute("msgType", "성공 메시지");
				rttr.addFlashAttribute("msg", m.getMemId() + " 님 회원가입에 성공했습니다.");
				return "redirect:/";
			} else {
				// 회원가입 실패
				rttr.addFlashAttribute("msgType", "실패메시지");
				rttr.addFlashAttribute("msg", "회원가입에 실패했습니다.");
				return "redirect:/joinForm.do";
			}
		}
	}

	// 회원가입 폼으로 이동
	@RequestMapping("/joinForm.do")
	public String joinForm() {
		return "member/joinForm";
	}

	// 아이디 중복체크
	@GetMapping("/registerCheck.do")
	public @ResponseBody int registerCheck(@RequestParam("memId") String memId) {
		System.out.println("[아이디 중복체크]");
		Member member = memberMapper.registerCheck(memId);

		if (member != null) {
			return 0;
		} else {
			return 1;
		}
	}
}

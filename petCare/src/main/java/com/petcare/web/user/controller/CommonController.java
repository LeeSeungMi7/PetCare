package com.petcare.web.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {
	@RequestMapping("/home.do")
	public String homeGet() {
		return "home";
	}
	
	@GetMapping("/signinForm.do")
	public String signinFormGet() {
		return "signinForm";
	}
	
	@GetMapping("/hos_joinUser.do")
	public String hosGet() {
		return "hos_joinUser";
	}
	
	@GetMapping("/user_joinUser.do")
	public String userGet() {
		return "user_joinUser";
	}
	
	@GetMapping("/pet_joinUser.do")
	public String petGet() {
		return "pet_joinUser";
	}
	//자랑하기 목록
	@GetMapping("/show.do")
	public String showGet() {
		return "show";
	}
//	
//	//자랑하기 글 상세
//	@GetMapping("/show_board.do")
//	public String show_boardGet() {
//		return "show_board";
//	}
//	
//	//자랑하기 글 수정
//	@GetMapping("/show_rewrite.do")
//	public String show_rewrite() {
//		return "show_rewrite";
//	}
	//자랑하기 목록
	@GetMapping("/show_write.do")
	public String show_write() {
		return "show_write";
	}
	
}

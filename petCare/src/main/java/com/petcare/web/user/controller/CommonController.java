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
	@GetMapping("/show_write.do")
	public String show_write() {
		return "show_write";
	}

	
}

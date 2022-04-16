package com.petcare.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	
	@RequestMapping(value="/partner.do", method=RequestMethod.GET)
	public String test() {
		System.out.println("로그인 화면으로 이동");
		return "index";
	}
	
}

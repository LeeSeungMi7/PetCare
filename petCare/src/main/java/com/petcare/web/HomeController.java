package com.petcare.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
//	테스트 
	@RequestMapping(value="/partner.do", method=RequestMethod.GET)
	public void test() {
		System.out.println("병원 화면으로 이동");
	}
	
}

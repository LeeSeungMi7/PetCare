package com.petcare.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
//	�׽�Ʈ 
	@RequestMapping(value="/partner.do", method=RequestMethod.GET)
	public void test() {
		System.out.println("���� ȭ������ �̵�");
	}
	
}

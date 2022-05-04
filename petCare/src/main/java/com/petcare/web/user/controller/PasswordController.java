package com.petcare.web.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PasswordController {
	
	@RequestMapping(value="/user_password.do")
	public String user_paddword() {
		return "password";
	}
}

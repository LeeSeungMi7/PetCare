package com.petcare.web.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.petcare.web.user.service.MemberService;
import com.petcare.web.user.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
	
	@Autowired
	private final MemberService memberService;
	
	@Inject
	public LoginController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@RequestMapping(value="/user_login.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> user_login(@RequestParam String userId, @RequestParam String userPw, HttpSession session, Model model){
		
		//세션 유지시간 설정 
		session.setMaxInactiveInterval(1800); // 1800 = 60s*30 (30분)

		Map<String, String> map = new HashMap<String, String>();

		MemberVO vo = memberService.user_login(userId);
		
		if (vo == null) {
			System.out.println("없당");
			map.put("msg","idFail");
			return map;	
		}
		
		boolean password = BCrypt.checkpw(userPw, vo.getM_pw());
		if(!password) {
			System.out.println("비번 다름");
			map.put("msg","pwFail");
			return map;
		}
		
		if(vo.getM_role().equals("1") && vo.getM_access().equals("1")) {
			System.out.println("병원 비활성화");
			map.put("msg","status");
			return map;
		}
		if(vo.getM_role().equals("1") && vo.getM_access().equals("0")) {
			session.setAttribute("user", vo);
			System.out.println("병원 로그인");
			map.put("msg","hos_success");
				return map;
		}
		if(vo.getM_access().equals("2")) {
			System.out.println("탈퇴회원");
			map.put("msg","deleteMember");
			return map;
		};
		session.setAttribute("user", vo);
		System.out.println("일반회원");
		map.put("msg","success");
		return map;
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
		memberService.logout(session);
		return "/home";
	}
}


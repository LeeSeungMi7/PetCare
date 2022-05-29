package com.petcare.web.user.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.petcare.web.admin.vo.Ad_encyVO;
import com.petcare.web.user.service.HomeService;
import com.petcare.web.user.vo.HospitalVO;
import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.QnaVO;
import com.petcare.web.user.vo.ShowVO;

@Controller
public class CommonController {
	
	@Autowired
	private HomeService homeService;
	
	@Inject
	public CommonController(HomeService homeService) {
		this.homeService = homeService;
	}
	
	@RequestMapping("/home.do")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		
		List<ShowVO> show = homeService.show();
		List<QnaVO> qna = homeService.qna();
		List<Ad_encyVO> ency = homeService.ency();
		List<MemberVO> hospital = homeService.hospital();
		
		mav.addObject("hospital",hospital);
		mav.addObject("show",show);
		mav.addObject("qna",qna);
		mav.addObject("ency",ency);
		mav.setViewName("home");
		return mav;
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

	
}

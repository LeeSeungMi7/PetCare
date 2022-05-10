package com.petcare.web.admin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.petcare.web.admin.service.AdminService;
import com.petcare.web.admin.vo.AdminVO;
import com.petcare.web.user.vo.MemberVO;

@Controller
public class AdminController {
	@Inject
	AdminService adminService;
	
	@GetMapping("/ad_login.mdo")
	public String ad_loginGet() {
		return "ad_login";
	}
	@RequestMapping("/loginCheck.mdo")
	public ModelAndView loginCheck(@ModelAttribute AdminVO vo, HttpSession session) {
		boolean result = adminService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		if(result == true) {
			mav.setViewName("ad_charts");
			mav.addObject("msg", "success");
		}else {
			mav.setViewName("ad_login");
			mav.addObject("msg", "failure");
		}
		return mav;
	}
	
	@GetMapping("/logout.mdo")
	public ModelAndView logout(HttpSession session) {
		adminService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ad_login");
		mav.addObject("msg", "logout");
		return mav;
	}
	
	@GetMapping("/ad_charts.mdo")
	public String ad_chartsGet() {
		return "ad_charts";
	}

	@GetMapping("/ad_community.mdo")
	public String ad_communityGet() {
		return "ad_community";
	}

	@GetMapping("/ad_encyclopedia.mdo")
	public String ad_encyclopediaGet() {
		return "ad_encyclopedia";
	}

	@RequestMapping(value = "/ad_hospital.mdo", method = RequestMethod.GET)
	public ModelAndView ad_hospitalGet(Model model) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.addObject("AccHosList", adminService.getAccHosList());
		mav.addObject("UnAccHosList", adminService.getUnAccHosList());
		return mav;
	}
	
	@RequestMapping(value = "/update_hospital.mdo", method = RequestMethod.POST)
	public String accHospital(MemberVO vo) throws Exception {
		System.out.println(vo.getM_name());
		String name = vo.getM_name();
		adminService.updateUser(name);
		return "redirect:/ad_hospital.mdo";
	}
	
	@RequestMapping(value = "/ad_user.mdo", method = RequestMethod.GET) 
	public String ad_userGet(Model model) throws Exception{
		model.addAttribute("userList", adminService.getUserList()); 
		return "ad_user"; 
	}

	@GetMapping("/comm_getBoard.mdo")
	public String comm_getBoardGet() {
		return "comm_getBoard";
	}

	@GetMapping("/en_getBoard.mdo")
	public String en_getBoardGet() {
		return "en_getBoard";
	}

	@GetMapping("/en_insert.mdo")
	public String en_insertGet() {
		return "en_insert";
	}
}
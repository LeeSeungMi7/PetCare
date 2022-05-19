package com.petcare.web.admin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.petcare.web.admin.service.AdminService;
import com.petcare.web.admin.vo.AdminVO;
import com.petcare.web.common.utils.Email;
import com.petcare.web.common.utils.EmailSender;

@Controller
public class AdminController {
	@Inject
	AdminService adminService;
	
	@Autowired
	private Email email;
	   
	@Autowired
	private EmailSender emailSender;
	
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

	@RequestMapping(value = "/ad_hospital.mdo", method = RequestMethod.GET)
	public ModelAndView ad_hospitalGet(Model model) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.addObject("AccHosList", adminService.getAccHosList());
		mav.addObject("UnAccHosList", adminService.getUnAccHosList());
		return mav;
	}
	
	@RequestMapping(value = "/update_hospital.mdo", method = RequestMethod.POST)
	@ResponseBody
	public String accHospital(@RequestParam String m_name) throws Exception {
		String name = m_name;
		adminService.updateUser(name);
		return "1";
	}
	@RequestMapping(value = "/delete_hospital.mdo", method = RequestMethod.POST)
	@ResponseBody
	public String delHospital(@RequestParam String m_id) throws Exception {
		System.out.println(m_id);
		String id = m_id;
		adminService.deleteUser(id);
		email.setContent("현재 제휴 병원 승인 자격 미달로 회원가입을 실패하였습니다. 다시 가입 부탁드립니다.");
        email.setReceiver(m_id);
        email.setSubject("[Pet Care 제휴 병원 승인 기각]");
        emailSender.SendEmail(email);
		return "1";
	}
	
	
	@RequestMapping(value = "/ad_user.mdo", method = RequestMethod.GET) 
	public String ad_userGet(Model model) throws Exception{
		model.addAttribute("userList", adminService.getUserList()); 
		return "ad_user"; 
	}
}
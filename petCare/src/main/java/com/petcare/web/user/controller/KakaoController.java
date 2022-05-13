package com.petcare.web.user.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.petcare.web.user.service.KakaoService;
import com.petcare.web.user.service.UserMyPageService;
import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.MyPetVO;



@Controller
public class KakaoController {
	
	@Inject
	private KakaoService kakaoService;
	
	@Inject
	private UserMyPageService user_mypageService;
	

	@RequestMapping(value ="/kakaoLogin.do" , method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> kakao_login(@RequestParam String kakao_id, HttpSession session) {
		MemberVO memberVO = kakaoService.member_check(kakao_id);
		Map<String, String> map = new HashMap();
		MemberVO singIn = new MemberVO();

//		System.out.println(kakao_id);
		if(memberVO == null) { 
			
			singIn.setM_id(kakao_id);
			singIn.setKakao_member("Y");
			singIn.setM_name("카카오회원");
			singIn.setM_role("0");
			kakaoService.SingIn(singIn);
			map.put("msg","로그인");
			session.setAttribute("user", singIn);
			
		}else if(memberVO.getM_id().equals(kakao_id)) {
			
			session.setAttribute("user", memberVO);
			memberVO.getDelete_Member_Date();
			
			if(memberVO.getDelete_Member_Date() != null) {
				
				kakaoService.reset_Delete(memberVO.getM_number());
			}
			map.put("msg","로그인");
		}
//		System.out.println(map.toString());
		return map;
		
	}
	
	@RequestMapping(value="/kakao_myPage_update.do", method=RequestMethod.POST)
	public ModelAndView user_myPage_update(@RequestParam int m_number) {
		
		
		MemberVO memberVO;
		List<MyPetVO> myPetVO = new ArrayList<MyPetVO>();
		ModelAndView mav = new ModelAndView();
		
		memberVO = user_mypageService.user_mypage(m_number);
		myPetVO = user_mypageService.user_myPet(m_number);
				
		if(memberVO.getM_tel() != null) {
		    String tel[] = memberVO.getM_tel().split("-");
		    memberVO.setM_tel1(tel[0]);
		    memberVO.setM_tel2(tel[1]);
		    memberVO.setM_tel3(tel[2]);
		}
		
		mav.addObject("member",memberVO);
		mav.addObject("mypet",myPetVO);

		mav.setViewName("/kakao_user_update");

		return mav;
		
	}
	
	
}

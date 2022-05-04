package com.petcare.web.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.petcare.web.user.service.UserMyPageService;
import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.MyPetVO;
import com.petcare.web.user.vo.ReservationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class User_myPageController {
	
	@Autowired
	private UserMyPageService user_mypageService;
	
	
	@Inject User_myPageController( UserMyPageService user_mypage ){
		this.user_mypageService = user_mypage;
	}
	
	
	@RequestMapping(value="/user_myPage_update.do", method=RequestMethod.POST)
	public ModelAndView user_myPage_update(@RequestParam int m_number) {
		
		
		MemberVO memberVO;
		List<MyPetVO> myPetVO = new ArrayList<MyPetVO>();
		ModelAndView mav = new ModelAndView();
		
		memberVO = user_mypageService.user_mypage(m_number);
		myPetVO = user_mypageService.user_myPet(m_number);
				
	    String tel[] = memberVO.getM_tel().split("-");
	    memberVO.setM_tel1(tel[0]);
	    memberVO.setM_tel2(tel[1]);
	    memberVO.setM_tel3(tel[2]);
		
		mav.addObject("member",memberVO);
		mav.addObject("mypet",myPetVO);

		mav.setViewName("/user_update");

		return mav;
		
	}
	
	//user 내정보 수정
	@RequestMapping(value="/user_mofify.do", method=RequestMethod.POST)
	public void user_mypage_modify(@ModelAttribute MemberVO memberVO){
		
		MemberVO tempMemberVO = memberVO;

		String hashedPw = BCrypt.hashpw(tempMemberVO.getM_pw(), BCrypt.gensalt());
		tempMemberVO.setM_pw(hashedPw);
		
		tempMemberVO.setM_tel(tempMemberVO.getM_tel1()+"-"+tempMemberVO.getM_tel2()+"-"+tempMemberVO.getM_tel3());
		
		if(tempMemberVO.getM_address()!= "" || tempMemberVO.getM_address()!= null) {
			String address[] = tempMemberVO.getM_address().split(" ");
			
			tempMemberVO.setM_sido(address[0] +" "+ address[1]);
			tempMemberVO.setM_dong(address[2] +" "+ address[3]);
		}
	
		tempMemberVO.setM_access("0");
		tempMemberVO.setM_role("0");
		
		System.out.println(tempMemberVO.getMypetVO());
		
//		memberService.user_register(tempMemberVO);
//
//		if(tempMemberVO.getPetList() != null) {
//			log.info("tempMemberVO.getPetList() : " + tempMemberVO.getPetList().toString());
//			log.info("tempMemberVO.getPetList() : " + tempMemberVO.getPetList().size());
//			for(MyPetVO pet : tempMemberVO.getPetList()) {
//				pet.setMp_number(tempMemberVO.getM_number());
//				memberService.userPet_register(pet);
//			}
//		}
		
	}
	
	//내 예약 현황
	@RequestMapping("/user_myreservation.do")
	public ModelAndView myreservation(@RequestParam int m_number) {
		
		ModelAndView mav = new ModelAndView();
		
		List<ReservationVO> reservationList = new ArrayList<ReservationVO>();
		
		reservationList = user_mypageService.reservation(m_number);
		
		mav.addObject("reservationList", reservationList);
		mav.setViewName("/myreservation");
		
		return mav;
	}
	
}

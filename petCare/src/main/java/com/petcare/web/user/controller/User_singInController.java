package com.petcare.web.user.controller;



import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.inject.Inject;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.petcare.web.user.service.MemberService;
import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.MyPetVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class User_singInController {
	
	@Autowired
	private final MemberService memberService;

	
	@Inject
	public User_singInController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@RequestMapping(value = "/user_register.do", method = RequestMethod.POST)
	public String registerPOST(@ModelAttribute MemberVO memberVO){
		
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
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
		Calendar c1 = Calendar.getInstance(); 
		String strToday = sdf.format(c1.getTime()); 
		
		tempMemberVO.setSingin_Member_Date(strToday);		
		
		memberService.user_register(tempMemberVO);

		if(tempMemberVO.getPetList() != null) {
			log.info("tempMemberVO.getPetList() : " + tempMemberVO.getPetList().toString());
			log.info("tempMemberVO.getPetList() : " + tempMemberVO.getPetList().size());
			for(MyPetVO pet : tempMemberVO.getPetList()) {
				pet.setMp_number(tempMemberVO.getM_number());
				memberService.userPet_register(pet);
			}
		}
		
		
		
		return "/user_regCom";
	}
	
	@PostMapping("/user_regCom.do")
	public String partner_RegComGet() {
		return "user_regCom";
	}
	
}

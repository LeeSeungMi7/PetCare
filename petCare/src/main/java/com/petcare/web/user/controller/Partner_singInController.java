package com.petcare.web.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.petcare.web.user.service.FileUploadService;
import com.petcare.web.user.service.MemberService;
import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.MyPetVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class Partner_singInController {
	
	@Autowired
	private final MemberService memberService;
    
	@Autowired
	private FileUploadService fileUploadService;
	
	@Inject
	public Partner_singInController(MemberService memberService) {
		this.memberService = memberService;
	}

   //병원, 회원 이메일 중복체크
	@RequestMapping(value = "/check_email.do" , method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> emailcheck(@RequestParam String email){
		int count = 0;
        Map<String, Object> map = new HashMap<String, Object>();
 
        count = memberService.idcheck(email);
        map.put("cnt", count);
 
        log.info(map.toString());
        return map;
	}
	

	// 회원가입 처리(병원)
	@RequestMapping(value = "/partner_register.do", method = RequestMethod.POST)
	public String registerPOST(@ModelAttribute MemberVO memberVO, @RequestParam("file") MultipartFile file){
		
//		System.out.println("ee");
		MemberVO tempMemberVO = memberVO;

		String hashedPw = BCrypt.hashpw(tempMemberVO.getM_pw(), BCrypt.gensalt());
		tempMemberVO.setM_pw(hashedPw);
		
		tempMemberVO.setM_tel(tempMemberVO.getM_tel1()+"-"+tempMemberVO.getM_tel2()+"-"+tempMemberVO.getM_tel3());
		tempMemberVO.setP_file_name(tempMemberVO.getP_file_name());
		
		if(tempMemberVO.getM_address()!="" || tempMemberVO.getM_address()!=null) {
			String address[] = tempMemberVO.getM_address().split(" ");
			
			tempMemberVO.setM_sido(address[0] +" "+ address[1]);
			tempMemberVO.setM_dong(address[2] +" "+ address[3]);
		}
	
		tempMemberVO.setM_access("1");
		tempMemberVO.setM_role("1");
		
		tempMemberVO.setP_weekday(tempMemberVO.getP_weekday1() + "/" + tempMemberVO.getP_weekday2());
		tempMemberVO.setP_weekend(tempMemberVO.getP_weekend1() + "/" + tempMemberVO.getP_weekend2());
		tempMemberVO.setP_breaktime(tempMemberVO.getP_breaktime1() + "/" + tempMemberVO.getP_breaktime2());
				
		tempMemberVO.setP_file_name(file.getOriginalFilename());
		FileUploadService.FileUploadResult fileResult = fileUploadService.fileUpload(file, "사업자등록증/", tempMemberVO.getP_file_name());
		tempMemberVO.setP_file_path(fileResult.getUrl());
		
	
		memberService.partner_register(tempMemberVO);	
		
		return "/partner_regCom";
		
	}
	
	@PostMapping("/partner_regCom.do")
	public String partner_RegComGet() {
		return "partner_regCom";
	}
	
	
	
	
}

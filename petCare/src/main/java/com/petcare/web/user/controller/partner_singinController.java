package com.petcare.web.user.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.petcare.web.common.utils.AwsS3;
import com.petcare.web.user.service.MemberService;
import com.petcare.web.user.vo.MemberVO;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class partner_singinController {
	
	@Autowired
	private final MemberService memberService;
	
	@Autowired
	public AwsS3 aws = AwsS3.getInstance();
	
	@Inject
	public partner_singinController(MemberService memberService) {
		this.memberService = memberService;
	}

	
	@RequestMapping(value = "/check_email.do")
	@ResponseBody
	public Map<String,Object> emailcheck(@RequestParam String email){
		int count = 0;
        Map<String, Object> map = new HashMap<String, Object>();
 
        count = memberService.idcheck(email);
        map.put("cnt", count);
 
        log.info(map.toString());
        return map;
	}
	

	// 회원가입 처리
	@RequestMapping(value = "/partner_register.do", method = RequestMethod.POST)
	public String registerPOST(@ModelAttribute MemberVO memberVO, @RequestParam MultipartFile file){

		MemberVO tempMemberVO = memberVO;

		String hashedPw = BCrypt.hashpw(tempMemberVO.getM_pw(), BCrypt.gensalt());
		tempMemberVO.setM_pw(hashedPw);
		
		tempMemberVO.setM_tel(tempMemberVO.getM_tel1()+tempMemberVO.getM_tel2()+tempMemberVO.getM_tel3());
		tempMemberVO.setP_file_name(tempMemberVO.getP_file_name());
		
		String address[] = tempMemberVO.getM_address().split(" ");
		
		tempMemberVO.setM_sido(address[0] + address[1]);
		tempMemberVO.setM_dong(address[2] + address[3]);
		
		tempMemberVO.setM_access("1");
		tempMemberVO.setM_role("1");
		
		tempMemberVO.setP_weekday(tempMemberVO.getP_weekday1() + "/" + tempMemberVO.getP_weekday2());
		tempMemberVO.setP_weekend(tempMemberVO.getP_weekend1() + "/" + tempMemberVO.getP_weekend2());
		tempMemberVO.setP_breaktime(tempMemberVO.getP_breaktime1() + "/" + tempMemberVO.getP_breaktime2());
		
		
		final UUID uuid = UUID.randomUUID();
		final String url = "사업자등록증/" + uuid.toString() + tempMemberVO.getP_file_name();
		final String path ="https://petcarebuc.s3.ap-northeast-2.amazonaws.com/";
		tempMemberVO.setP_file_path(path+url);

		memberService.partner_register(tempMemberVO);
	
//		File file = new File(tempMemberVO.getP_file_name());
		
//		aws.upload(file, url);
		
		return"/home";
	}
	
	
	
	
}

package com.petcare.web.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.petcare.web.common.utils.Email;
import com.petcare.web.common.utils.EmailSender;
import com.petcare.web.user.service.MemberService;

@Controller
public class PasswordController {
	
	@Autowired
	private MemberService memberservice;
	
	@Autowired
	private Email email;
	
	@Autowired
	private EmailSender emailSender;
	
	@Inject
	public PasswordController(MemberService memberservice) {
		this.memberservice = memberservice;
	}
	
	@RequestMapping(value="/user_password.do")
	public String user_paddword() {
		return "password";
	}
	
	@RequestMapping(value="/password_send_email.do" , method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> password_send_email(@RequestParam String m_id) {
		
		Map<String,String> map = new HashMap();
		Map<String, String> data = new HashMap();
		int search_id = memberservice.idcheck(m_id);
		
		if( search_id != 1 ) {
			data.put("data","아이디없음");
		}else {
			char[] passwordStr = new char[] {
					'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
					'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
					'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
					'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
					'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
			};//문자 끝
			
			StringBuffer password = new StringBuffer();

			int idx=0;
			
			for(int i=0; i<=10; i++ ){
				idx =(int)(passwordStr.length * Math.random());
				password.append(passwordStr[idx]);
			}
			
			String newPassWord = password.toString();
			
//			System.out.println(password.toString());
			String hashedPw = BCrypt.hashpw(newPassWord, BCrypt.gensalt());

			map.put("m_id", m_id);
			map.put("m_pw", hashedPw);
			int result = memberservice.newPassword(map); //잘들어갔나 확인해야딩
			
			if(result != 1){
				data.put("data","오류");
			}else { //잘들어갔으면 메일전송
				email.setContent(m_id + "님의 새로운 비밀번호는 [   " + password.toString() +"   ] 입니다.");
				email.setReceiver(m_id);
				email.setSubject("[Pet Care 임시비밀번호 발송] 재설정된 비밀번호를 확인해주세요");
				
				try {
					emailSender.SendEmail(email);
					System.out.println("발송 완료");
					data.put("data","발송완료");
				} catch (Exception e) {
					System.out.println("발송 실패");
					e.printStackTrace();
					data.put("data","발송실패");
				}
				
			}
		}//end else
		System.out.println("data :" + data);
		return data;
		
	}
}

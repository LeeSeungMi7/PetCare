package com.petcare.web.user.service;

import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.MyPetVO;

public interface MemberService {
	// 회원가입처리
	
	int user_register(MemberVO MemberVO);
	
	void partner_register(MemberVO MemberVO);
	
	void userPet_register(MyPetVO mypetVO);
	
	int idcheck(String email);

}

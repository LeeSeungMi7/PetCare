package com.petcare.web.user.service;

import com.petcare.web.user.vo.MemberVO;

public interface MemberService {
	// 회원가입처리
	
	void user_register(MemberVO MemberVO);
	
	void partner_register(MemberVO MemberVO);
	
	int idcheck(String email);

}

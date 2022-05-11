package com.petcare.web.user.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.MyPetVO;

public interface MemberService {
	// 회원가입처리
	int user_register(MemberVO MemberVO);
	
	void partner_register(MemberVO MemberVO);
	
	// 회원가입 시 펫 등록
	void userPet_register(MyPetVO mypetVO);
	
	//아이디 체크
	int idcheck(String email);
	
	//로그인
	MemberVO user_login(String userId);
	
	//로그아웃
	void logout(HttpSession session);
	
	//new password
	int newPassword(Map<String,String> map);
	
	
	
}

package com.petcare.web.user.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.petcare.web.user.dao.MemberDAO;
import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.MyPetVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;

	public MemberServiceImpl(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	
// 일반 회원가입	
	@Override
	public int user_register(MemberVO memberVO) {
		 return memberDAO.user_register(memberVO);
	}

//병원 회원가입
	@Override
	public void partner_register(MemberVO memberVO) {
		 memberDAO.partner_register(memberVO);
	}

//이메일 체크
	@Override
	public int idcheck(String email) {
		return memberDAO.emailcheck(email);
	}

// 회원가입시 펫 등록
	@Override
	public void userPet_register(MyPetVO mypetVO) {
		memberDAO.userPet_register(mypetVO);
	}

//	로그인
	@Override
	public MemberVO user_login(String userId) {
		return memberDAO.user_login(userId);
	}

// 로그아웃
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
		
	}

	@Override
	public int newPassword(Map<String, String> map) {
		return memberDAO.newPassword(map);
	}
	

}

package com.petcare.web.user.service;

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

	private JavaMailSender mailSender;
	

	public MemberServiceImpl(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	
	
	@Override
	public int user_register(MemberVO memberVO) {
		 return memberDAO.user_register(memberVO);
	}

	@Override
	public void partner_register(MemberVO memberVO) {
		 memberDAO.partner_register(memberVO);
	}


	@Override
	public int idcheck(String email) {
		return memberDAO.emailcheck(email);
	}


	@Override
	public void userPet_register(MyPetVO mypetVO) {
		memberDAO.userPet_register(mypetVO);
	}
	

}

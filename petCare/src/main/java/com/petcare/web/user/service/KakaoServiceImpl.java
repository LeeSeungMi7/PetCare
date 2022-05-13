package com.petcare.web.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcare.web.user.dao.KakaoDAO;
import com.petcare.web.user.vo.MemberVO;

@Service
public class KakaoServiceImpl implements KakaoService{

	@Autowired
	private KakaoDAO kakaoDAO;
	
	@Override
	public MemberVO member_check(String kakao_id) {
		return kakaoDAO.member_check(kakao_id);
	}

	@Override
	public void SingIn(MemberVO membervo) {
		kakaoDAO.SingIn(membervo);
		
	}

	@Override
	public void reset_Delete(int m_number) {
		kakaoDAO.reset_Delete(m_number);
		
	}

}

package com.petcare.web.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcare.web.user.dao.MyPageDAO;
import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.MyPetVO;
import com.petcare.web.user.vo.ReservationVO;

@Service
public class UserMyPageServiceImpl implements UserMyPageService {
	
	@Autowired
	private MyPageDAO mypage;
	
	//회원정보가져오기
	@Override
	public MemberVO user_mypage(int m_number) {
		return mypage.user_mypage_info(m_number);
	}

	@Override
	public List<MyPetVO> user_myPet(int m_number) {
		return mypage.user_mypage_pet(m_number);
	}
	
	//펫 병원 예약 가져오기
	public List<ReservationVO> reservation(int m_number){
		return mypage.reservation(m_number);
	}


}

package com.petcare.web.user.service;

import java.util.List;

import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.MyPetVO;
import com.petcare.web.user.vo.ReservationVO;

public interface UserMyPageService {
	
	MemberVO user_mypage(int m_number);
	
	List<MyPetVO> user_myPet(int m_number);
	
	List<ReservationVO> reservation(int m_number);
	
	String reservation_partnername(int partner_num);
}

package com.petcare.web.user.service;

import java.util.List;
import java.util.Map;

import com.petcare.web.user.vo.Criteria;
import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.ReservationVO;

public interface PartnerMyPageService {
	
	MemberVO partner_mypage(int m_number);
	
	void partner_modifyfile(MemberVO memberVO);
	
	void partner_modify(MemberVO memberVO);
	
	List<ReservationVO> partner_reservationPage(Criteria criteria);
	
	List<ReservationVO> dateSearch(Map<String, String> mav); 
	
	int totalpage(Criteria criteria);
}

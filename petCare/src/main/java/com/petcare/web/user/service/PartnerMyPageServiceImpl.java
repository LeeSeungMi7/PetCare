package com.petcare.web.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcare.web.user.dao.PartnerMyPageDAO;
import com.petcare.web.user.vo.Criteria;
import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.ReservationVO;

@Service
public class PartnerMyPageServiceImpl implements PartnerMyPageService {
	
	@Autowired
	private PartnerMyPageDAO partnerMyPageDAO;
	
	//마이페이지 정보가져오기
	@Override
	public MemberVO partner_mypage(int m_number) {	
		return partnerMyPageDAO.partner_mypage(m_number);
	}
	
	//병원 수정
	@Override
	public void partner_modifyfile(MemberVO memberVO) {
		partnerMyPageDAO.partner_modifyfile(memberVO);
	}

	@Override
	public void partner_modify(MemberVO memberVO) {
		partnerMyPageDAO.partner_modify(memberVO);	
	}

//예약가져오기
	@Override
	public List<ReservationVO> partner_reservationPage(Criteria criteria) {
		return partnerMyPageDAO.partner_reservationPage(criteria);
	}
	
	@Override
	public List<ReservationVO> dateSearch(Map<String,String> mav) {
		return partnerMyPageDAO.dateSearch(mav);
	}

	@Override
	public int totalpage(Criteria criteria) {	
		return partnerMyPageDAO.totalpage(criteria);
	}
	
	
}
package com.petcare.web.user.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petcare.web.user.vo.Criteria;
import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.ReservationVO;

@Repository
public class PartnerMyPageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public MemberVO partner_mypage(int m_number) {
		return sqlSessionTemplate.selectOne("User_MyPage.user_mypageInfo", m_number);
	}
	
	//파일 o
	public void partner_modifyfile(MemberVO memberVO) {
		sqlSessionTemplate.update("Partner_MyPage.modifypartner_file", memberVO);
	}
	
	public void partner_modify(MemberVO memberVO) {
		sqlSessionTemplate.update("Partner_MyPage.modifypartner", memberVO);
	}
	
	public List<ReservationVO> partner_reservationPage(Criteria criteria){

		return sqlSessionTemplate.selectList("Partner_MyPage.slectReservation", criteria);
	}
	
	public List<ReservationVO> dateSearch(Map<String,String> mav){
		return sqlSessionTemplate.selectList("Partner_MyPage.dateSearch" ,mav);
	}
	
	public int totalpage(Criteria criteria) {
		return sqlSessionTemplate.selectOne("Partner_MyPage.totalpage", criteria);
	}
}
package com.petcare.web.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcare.web.user.dao.MyPageDAO;
import com.petcare.web.user.vo.Criteria;
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
	@Override
	public List<ReservationVO> reservation(Criteria criteria){
		return mypage.reservation(criteria);
	}
	
	//병원 이름 가져오기
	@Override
	public String reservation_partnername(int partner_num) {
		return mypage.reservation_partner_name(partner_num);
	}
	
	//예약 시간 바꾸기
	@Override
	public int reservation_modify(Map<String,String> map) {
		return mypage.reservation_modify(map);
	}
	
	//펫 삭제
	@Override
	public int deleteMyPet(String petNum) {
		return mypage.delteMyPet(petNum);
	}
	
	//회원 수정
	@Override
	public void userModify(MemberVO membervo) {
		 mypage.userModify(membervo);
	}

	@Override
	public void insertAddPet(MyPetVO mypetVO) {
		 mypage.addpet(mypetVO);
		
	}
	//예약 삭제
	@Override
	public int reservation_delete(int index) {
		return mypage.reservation_delete(index);
	}
	//예약현황 페이징처리 위해 총 글수 검색
	@Override
	public int totalpage(Criteria critera) {
		return mypage.totalpage(critera);
	}
	
	//회원 탈퇴
	@Override
	public int delete_member(Map<String,String> map) {
		return mypage.delete_member(map);
	}
	//디비 삭제
	@Override
	public void delete_DB_member() {
		mypage.delete_DB_member();
	}


}

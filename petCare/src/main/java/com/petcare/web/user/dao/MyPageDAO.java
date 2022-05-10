package com.petcare.web.user.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petcare.web.user.vo.Criteria;
import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.MyPetVO;
import com.petcare.web.user.vo.ReservationVO;

@Repository
public class MyPageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public MemberVO user_mypage_info(int m_number) {
		return sqlSessionTemplate.selectOne("User_MyPage.user_mypageInfo", m_number);
	}
	
	public List<MyPetVO> user_mypage_pet(int m_number) {
		return sqlSessionTemplate.selectList("User_MyPage.user_myPetList", m_number);
	}
	
	public List<ReservationVO> reservation(Criteria criteria){
		return sqlSessionTemplate.selectList("User_MyPage.reservationList", criteria);
	}
	
//	병원 이름가져오기
	public String reservation_partner_name(int partner_num) {
		return sqlSessionTemplate.selectOne("User_MyPage.reservation_partner_name", partner_num);
	}
	
//	병원 시간 바꾸기 (예약시간)
	public int reservation_modify(Map<String, String> map) {
		return sqlSessionTemplate.update("User_MyPage.reservation_modify", map);
	}
	
//  내펫 삭제
	public int delteMyPet(String PetNum) {
		return sqlSessionTemplate.delete("User_MyPage.deleteMyPet", PetNum);
	}
//	회원 정보수정
	public void userModify(MemberVO memeberVO) {
		sqlSessionTemplate.update("User_MyPage.modifyUser", memeberVO);
	}
	
//  내펫 추가
	public void addpet(MyPetVO myPetVO) {
		sqlSessionTemplate.insert("MemberDAO.userPet_register", myPetVO);
	}
	
//	예약 취소
	public int reservation_delete(int index) {
		return sqlSessionTemplate.delete("User_MyPage.reservation_delete", index);
	}
	
//	예약 페이지 페이징처리위해
	public int totalpage(Criteria criteria) {
		return sqlSessionTemplate.selectOne("User_MyPage.totalpage", criteria);
	}
}

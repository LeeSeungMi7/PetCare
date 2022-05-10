package com.petcare.web.user.service;

import java.util.List;
import java.util.Map;

import com.petcare.web.user.vo.Criteria;
import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.MyPetVO;
import com.petcare.web.user.vo.ReservationVO;

public interface UserMyPageService {
	
	MemberVO user_mypage(int m_number);
	
	List<MyPetVO> user_myPet(int m_number);
	
	List<ReservationVO> reservation(Criteria criteria);
	
	String reservation_partnername(int partner_num);

	int reservation_modify(Map<String, String> map);
	
	int deleteMyPet(String petNum);
	
	void insertAddPet(MyPetVO mypetVO);
	
	void userModify(MemberVO membervo);
	
	int reservation_delete(int index);
	
	int totalpage(Criteria critera);
	
	int delete_member(Map<String,String> map);
	
	void delete_DB_member();
}

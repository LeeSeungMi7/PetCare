package com.petcare.web.user.service;

import java.util.List;

import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.MyPetVO;

public interface UserMyPageService {
	
	MemberVO user_mypage(int m_number);
	
	List<MyPetVO> user_myPet(int m_number);
	
}

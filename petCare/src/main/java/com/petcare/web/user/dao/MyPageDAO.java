package com.petcare.web.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.MyPetVO;

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
}

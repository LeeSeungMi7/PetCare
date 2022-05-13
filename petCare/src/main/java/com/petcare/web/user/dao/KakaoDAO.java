package com.petcare.web.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petcare.web.user.vo.MemberVO;

@Repository
public class KakaoDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public MemberVO member_check(String kakao_id) {
		return sqlSessionTemplate.selectOne("KakaoDAO.check_id", kakao_id);
	}
	
	public void SingIn(MemberVO membervo) {
		sqlSessionTemplate.insert("MemberDAO.user_register",membervo);
	}
	
	public void reset_Delete(int m_number) {
		sqlSessionTemplate.update("KakaoDAO.reset_Delete",m_number);
	}
}

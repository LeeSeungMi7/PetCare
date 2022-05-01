package com.petcare.web.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.MyPetVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 회원가입처리
	public int user_register(MemberVO memberVO) {
	     return sqlSessionTemplate.insert("MemberDAO.user_register", memberVO);
	}
	
	public void partner_register(MemberVO memberVO) {
		 sqlSessionTemplate.insert("MemberDAO.partner_register", memberVO);
	}
	
	//펫등록
	public void userPet_register(MyPetVO mypet) {
		 sqlSessionTemplate.insert("MemberDAO.userPet_register", mypet);
	}
	
	//메일 중복 체크
	public int emailcheck(String email) {
		return sqlSessionTemplate.selectOne("MemberDAO.checkemail", email);
	}
   	
}

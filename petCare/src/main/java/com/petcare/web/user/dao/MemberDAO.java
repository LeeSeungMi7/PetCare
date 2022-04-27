package com.petcare.web.user.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petcare.web.user.vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 회원가입처리
	public void user_register(MemberVO memberVO) {
	     sqlSessionTemplate.insert("MemberDAO.user_register", memberVO);
	}
	
	public void partner_register(MemberVO memberVO) {
		 sqlSessionTemplate.insert("MemberDAO.partner_register", memberVO);
	}
	
	//메일 중복 체크
	public int emailcheck(String email) {
		return sqlSessionTemplate.selectOne("MemberDAO.checkemail", email);
	}
   	
}

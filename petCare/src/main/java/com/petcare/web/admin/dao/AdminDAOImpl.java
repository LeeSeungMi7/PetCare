package com.petcare.web.admin.dao;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.petcare.web.admin.vo.AdminVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public boolean loginCheck(AdminVO vo) {
		String name = sqlSession.selectOne("admin.loginCheck", vo);
		return (name == null) ? false : true;
	}

	@Override
	public AdminVO getAdmin(AdminVO vo) {
		return sqlSession.selectOne("admin.getAdmin", vo);
	}

	@Override
	public void logout(HttpSession session) {
	}

}

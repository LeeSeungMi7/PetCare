package com.petcare.web.admin.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.petcare.web.admin.vo.AdminVO;
import com.petcare.web.user.vo.MemberVO;

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
	public List<MemberVO> getUserList() throws Exception { 
		return sqlSession.selectList("admin.getUser"); 
	}
	@Override 
	public List<MemberVO> getAccHosList() throws Exception { 
		return sqlSession.selectList("admin.getAccHospital"); 
	}
	@Override 
	public List<MemberVO> getUnAccHosList() throws Exception { 
		return sqlSession.selectList("admin.getUnAccHospital"); 
	}
	@Override
	public void logout(HttpSession session) {
	}
	@Override 
	public void updateUser(String name) throws Exception { 
		sqlSession.update("admin.AccHos", name);
	}
}

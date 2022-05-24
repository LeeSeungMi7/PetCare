package com.petcare.web.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petcare.web.user.vo.Criteria;
import com.petcare.web.user.vo.HospitalVO;
import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.MyPetVO;

@Repository
public class HospitalDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<HospitalVO> commentList(Criteria criteria) {
		return sqlSessionTemplate.selectList("hospital.commentList", criteria);
	}

	public int totalpage(Criteria criteria) {
		return sqlSessionTemplate.selectOne("hospital.totalpage", criteria);
	}

	public void hospital_reply_write(HospitalVO hospitalVO) {
		sqlSessionTemplate.insert("hospital.hospital_reply_write", hospitalVO);
		
	}

	public void hospital_alliance(int[] m_address_class) {
		sqlSessionTemplate.selectList("hospital.hospital_alliance", m_address_class);
	}

	public List<MyPetVO> hospital_reservation_mypet(int m_number) {
		return sqlSessionTemplate.selectList("hospital.hospital_reservation_mypet", m_number);
	}

	public List<MemberVO> hospitalSearchForMapIds(int[] mapIds) {
		return sqlSessionTemplate.selectList("hospital.search_for_map_ids",mapIds);
	}

}

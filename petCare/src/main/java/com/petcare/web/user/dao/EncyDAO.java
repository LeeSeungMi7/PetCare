package com.petcare.web.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petcare.web.admin.vo.Ad_encyVO;
import com.petcare.web.user.vo.Criteria;

@Repository
public class EncyDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Ad_encyVO> enboard_page(Criteria cr) {
		return sqlSessionTemplate.selectList("ad_board.UserEn_boardList", cr);
	}

	public Ad_encyVO enread(int en_number) {
		return sqlSessionTemplate.selectOne("ad_board.getEn_view", en_number);
	}

	// 페이징 처리
	public int totalpage(Criteria cr) {
		return sqlSessionTemplate.selectOne("ad_board.Enboard_totalpage", cr);
	}
	

	public void increaseViewcnt(int en_number) {
		sqlSessionTemplate.update("ad_board.EnincreaseViewcnt", en_number);
	}

}
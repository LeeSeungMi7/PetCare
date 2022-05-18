package com.petcare.web.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petcare.web.admin.vo.Ad_boardVO;
import com.petcare.web.admin.vo.Ad_encyVO;
import com.petcare.web.user.vo.Criteria;

@Repository
public class Ad_boardDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<Ad_boardVO> ad_board_page(Criteria cr) {
		return sqlSessionTemplate.selectList("ad_board.getCm_boardList", cr);
	}
	
	public List<Ad_encyVO> ad_enboard_page(Criteria cr) {
		return sqlSessionTemplate.selectList("ad_board.getEn_boardList", cr);
	}
	
	public Ad_boardVO read(int board_num) {
		return sqlSessionTemplate.selectOne("ad_board.getCM_view", board_num);
	}
	
	public Ad_encyVO enread(int en_number) {
		return sqlSessionTemplate.selectOne("ad_board.getEn_view", en_number);
	}
	
	public void ad_enboardinsert(Ad_encyVO ad_encyVO) {
		sqlSessionTemplate.insert("ad_board.enboardinsert",ad_encyVO);
	}
	public void ad_board_delete(int en_number) {
		sqlSessionTemplate.delete("ad_board.enboard_delete", en_number);
	}
	public void board_delete(int board_num) {
		sqlSessionTemplate.delete("ad_board.coboard_delete", board_num);
	}
	public void ad_enboard_update(Ad_encyVO ad_encyVO) {
		sqlSessionTemplate.update("ad_board.enboard_update",ad_encyVO);
	}
}

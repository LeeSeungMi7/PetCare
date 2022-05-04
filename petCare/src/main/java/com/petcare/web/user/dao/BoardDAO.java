package com.petcare.web.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petcare.web.user.vo.ShowVO;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void boardinsert(ShowVO showVO) {
		sqlSessionTemplate.insert("board.boardinsert",showVO);
	}
}

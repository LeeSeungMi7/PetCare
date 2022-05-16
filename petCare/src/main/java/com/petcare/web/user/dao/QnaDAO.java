package com.petcare.web.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petcare.web.user.vo.CommentVO;
import com.petcare.web.user.vo.Criteria;
import com.petcare.web.user.vo.QnaVO;

@Repository
public class QnaDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void qnaInsert(QnaVO qnaVO) {
		sqlSessionTemplate.insert("qna.qnainsert",qnaVO);
		
	}

//	public List<QnaVO> qna_page(Criteria qnaPage) {
//		return  sqlSessionTemplate.selectList("qna.qna_page", qnaPage);
//	}
//
//	public int maintotalpage(Criteria qnaPage) {
//		System.out.println("dao" + qnaPage.toString());
//		return sqlSessionTemplate.selectOne("qna.maintotalpage", qnaPage);
//	}

}

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

	public List<QnaVO> qna_page(Criteria qnaPage) {
		return  sqlSessionTemplate.selectList("qna.qna_page", qnaPage);
	}

	public int maintotalpage(Criteria qnaPage) {
//		System.out.println("dao" + qnaPage.toString());
		return sqlSessionTemplate.selectOne("qna.maintotalpage", qnaPage);
	}
	//qna_board
	public void increaseViewcnt(int faq_num) {
		sqlSessionTemplate.update("qna.increaseViewcnt", faq_num);
	}

	public List<CommentVO> commentList(Criteria criteria) {
		return sqlSessionTemplate.selectList("qna.commentList", criteria);
	}

	public int totalpage(Criteria criteria) {
		return sqlSessionTemplate.selectOne("qna.totalpage", criteria);
	}

	public QnaVO read(int faq_num) {
		return sqlSessionTemplate.selectOne("qna.read", faq_num);
	}
	//qna_board

	public void qna_reply_write(CommentVO commentQna) {
		sqlSessionTemplate.insert("qna.qna_reply_write", commentQna);
	}

	public void qna_reply_delete(int comment_num) {
		sqlSessionTemplate.delete("qna.qna_reply_delete", comment_num);
	}

	public QnaVO rewrite_view(int faq_num) {
		return sqlSessionTemplate.selectOne("qna.rewrite_view", faq_num);
	}

	public void update(QnaVO qnaVO) {
		sqlSessionTemplate.update("qna.qna_update", qnaVO);	
	}

	public void qna_delete(int faq_num) {
		sqlSessionTemplate.delete("qna.qna_delete", faq_num);
		
	}

	public CommentVO commentRead(int comment_num) {
		return sqlSessionTemplate.selectOne("qna.commentRead", comment_num);
	}
}

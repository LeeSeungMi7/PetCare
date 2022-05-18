package com.petcare.web.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcare.web.user.dao.QnaDAO;
import com.petcare.web.user.vo.CommentVO;
import com.petcare.web.user.vo.Criteria;
import com.petcare.web.user.vo.QnaVO;

@Service
public class QnaServiceImpl implements QnaService{
	
	@Autowired
	private QnaDAO qnaDAO;

	@Override
	public void qnaInsert(QnaVO qnaVO) {
		qnaDAO.qnaInsert(qnaVO);
		
	}

	@Override
	public List<QnaVO> qna_page(Criteria qnaPage) {
		return qnaDAO.qna_page(qnaPage);
	}
	@Override
	public int maintotalpage(Criteria qnaPage) {
		return qnaDAO.maintotalpage(qnaPage);
	}

	//qna_board
	@Override
	public void increaseViewcnt(int faq_num) {
		qnaDAO.increaseViewcnt(faq_num);
		
	}

	@Override
	public List<CommentVO> commentList(Criteria criteria) {
		return qnaDAO.commentList(criteria);
	}

	@Override
	public int totalpage(Criteria criteria) {
		return qnaDAO.totalpage(criteria);
	}

	@Override
	public QnaVO read(int faq_num) {
		return qnaDAO.read(faq_num);
	}
	//qna_board

	@Override
	public void qna_reply_write(CommentVO commentVO) {
		qnaDAO.qna_reply_write(commentVO);
		
	}

	@Override
	public void qna_reply_delete(int comment_num) {
		qnaDAO.qna_reply_delete(comment_num);
	}

	@Override
	public QnaVO rewrite_view(int faq_num) {
		return qnaDAO.rewrite_view(faq_num);
	}

	@Override
	public void update(QnaVO qnaVO) {
		qnaDAO.update(qnaVO);
		
	}

	@Override
	public void qna_delete(int faq_num) {
		qnaDAO.qna_delete(faq_num);
	}
	
	
	

}

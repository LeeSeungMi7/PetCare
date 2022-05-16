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

//	@Override
//	public List<QnaVO> qna_page(Criteria qnaPage) {
//		return qnaDAO.qna_page(qnaPage);
//	}
//
//	@Override
//	public int maintotalpage(Criteria qnaPage) {
//		return qnaDAO.maintotalpage(qnaPage);
//	}
//	
//	
//	

}

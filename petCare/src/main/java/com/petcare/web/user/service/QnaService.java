package com.petcare.web.user.service;

import java.util.List;

import com.petcare.web.user.vo.CommentVO;
import com.petcare.web.user.vo.Criteria;
import com.petcare.web.user.vo.QnaVO;

public interface QnaService {

	void qnaInsert(QnaVO qnaVO);
	//list페이징
	List<QnaVO> qna_page(Criteria qnaPage);
	//list페이징
	int maintotalpage(Criteria qnaPage);
	
	//qna_board
	void increaseViewcnt(int faq_num);
	List<CommentVO> commentList(Criteria criteria);
	int totalpage(Criteria criteria);
	QnaVO read(int faq_num);
	//qna_board
	
	//reply 작성
	void qna_reply_write(CommentVO commentVO);
	
	//reply 삭제
	void qna_reply_delete(int comment_num);
	
	//수정글 나타내기
	QnaVO rewrite_view(int faq_num);
	
	//글 수정하기
	void update(QnaVO qnaVO);
	
	//글 삭제하기
	void qna_delete(int faq_num);
	
	//댓글 리스트 나타내기
	CommentVO commentRead(int comment_num);
}

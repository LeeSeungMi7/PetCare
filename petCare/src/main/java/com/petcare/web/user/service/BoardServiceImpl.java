package com.petcare.web.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcare.web.user.dao.BoardDAO;
import com.petcare.web.user.vo.CommentVO;
import com.petcare.web.user.vo.Criteria;
import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.ShowPageVO;
import com.petcare.web.user.vo.ShowVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDAO;
	
//	자랑하기 등록
	@Override
	public void boardInsert(ShowVO showVO) {
		boardDAO.boardinsert(showVO);	
	}
	
	//조회수
	@Override
	public void increaseViewcnt(int board_num) {
			boardDAO.increaseViewcnt(board_num);		
	}
	//자랑하기 상세
	@Override
	public ShowVO read(int board_num) {
		return boardDAO.read(board_num);
	}
	//수정글 나타내기
	@Override
	public ShowVO rewrite_view(int board_num) {
		return boardDAO.rewrite_view(board_num);
	}
	//수정
	@Override
	public void update(ShowVO showVO) {
		boardDAO.update(showVO);
		
	}
	//삭제
	@Override
	public void board_delete(int board_num) {
		boardDAO.board_delete(board_num);
		
	}
	//화면에 나타내기+페이징
	@Override
	public List<ShowVO> board_page(ShowPageVO showPageVO) {
		return boardDAO.board_page(showPageVO);
	}
	//총 글수
	@Override
	public int totalpage(ShowPageVO showPageVO) {
		return boardDAO.totalpage(showPageVO);
	}
	@Override
	public List<CommentVO> commentList(Criteria criteria) {
		return boardDAO.commentList(criteria);
	}

	@Override
	public int totalpage(Criteria criteria) {
		return boardDAO.totalpage(criteria);
	}

	@Override
	public void board_reply_write(CommentVO commentVO) {
		boardDAO.board_reply_write(commentVO);	
	}

	@Override
	public void board_reply_delete(int comment_num) {
		boardDAO.board_reply_delete(comment_num);
		
	}


	
}

package com.petcare.web.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petcare.web.user.vo.CommentVO;
import com.petcare.web.user.vo.Criteria;
import com.petcare.web.user.vo.ShowPageVO;
import com.petcare.web.user.vo.ShowVO;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//게시물 등록
	public void boardinsert(ShowVO showVO) {
		sqlSessionTemplate.insert("board.boardinsert",showVO);
	}

	public void increaseViewcnt(int board_num) {
		sqlSessionTemplate.update("board.increaseViewcnt", board_num);
	}

	public ShowVO read(int board_num) {
		return sqlSessionTemplate.selectOne("board.board_view", board_num);
	}

	public ShowVO rewrite_view(int board_num) {
		return sqlSessionTemplate.selectOne("board.rewrite_view", board_num);
	}

	public void update(ShowVO showVO) {
		sqlSessionTemplate.update("board.board_update", showVO);
	}

	public void board_delete(int board_num) {
		sqlSessionTemplate.delete("board.board_delete", board_num);
		
	}
	
	//페이징 처리
	public int totalpage(ShowPageVO showPageVO) {
		return sqlSessionTemplate.selectOne("board.board_totalpage", showPageVO);
	}

	public List<ShowVO> board_page(ShowPageVO showPageVO) {
		return sqlSessionTemplate.selectList("board.board_page", showPageVO);
	}
	
	public List<CommentVO> commentList(Criteria criteria){
		return sqlSessionTemplate.selectList("board.boardComment", criteria);
	}
	
	public int totalpage(Criteria criteria){
		return sqlSessionTemplate.selectOne("board.showTotal", criteria);
	}

	public void board_reply_write(CommentVO commentVO) {
		sqlSessionTemplate.insert("board.board_reply_write",commentVO);
		
	}

	public void board_reply_delete(int comment_num) {
		sqlSessionTemplate.delete("board.board_reply_delete", comment_num);
		
	}

	public CommentVO commentRead(int comment_num) {
		return sqlSessionTemplate.selectOne("board.commentRead", comment_num);
	}

	
}

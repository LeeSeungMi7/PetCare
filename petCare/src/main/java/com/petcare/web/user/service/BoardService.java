package com.petcare.web.user.service;

import java.util.List;

import com.petcare.web.user.vo.CommentVO;
import com.petcare.web.user.vo.Criteria;
import com.petcare.web.user.vo.ShowPageVO;
import com.petcare.web.user.vo.ShowVO;

public interface BoardService {
	
	void boardInsert(ShowVO showVO);

//	List<ShowVO> boardlist();

	void increaseViewcnt(int board_num);

	ShowVO read(int board_num);

	ShowVO rewrite_view(int board_num);

	void update(ShowVO showVO);

	void board_delete(int board_num);

//	List<ShowVO> listAll(int start, int end, String searchOption, String keyword);
//
//	int countArticle(String searchOption, String keyword);

	
	int totalpage(ShowPageVO showPageVO);

	List<ShowVO> board_page(ShowPageVO showPageVO);

	List<CommentVO> commentList(Criteria criteria);
	
	int totalpage (Criteria criteria);

	void board_reply_write(CommentVO commentVO);

	void board_reply_delete(int comment_num);

	CommentVO commentRead(int comment_num);

	

}

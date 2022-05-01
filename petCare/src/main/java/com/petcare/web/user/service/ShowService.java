package com.petcare.web.user.service;

import java.util.List;

import com.petcare.web.user.vo.ShowVO;

public interface ShowService {
	//자랑하기
	
	
	void insert_show(ShowVO ShowVO); //작성
	void update_show(ShowVO ShowVO); //수정
	void delete_show(ShowVO showVO); //삭제
	ShowVO getShow(ShowVO showVO);
	List<ShowVO> getShowList(ShowVO showVO); //목록조회
	

	
}

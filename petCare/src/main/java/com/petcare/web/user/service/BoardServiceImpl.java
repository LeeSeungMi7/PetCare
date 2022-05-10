package com.petcare.web.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcare.web.user.dao.BoardDAO;
import com.petcare.web.user.vo.ShowVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDAO;
	
//	자랑하기 등록하게
	@Override
	public void boardInsert(ShowVO showVO) {
		boardDAO.boardinsert(showVO);	
	}
	
}

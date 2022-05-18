package com.petcare.web.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcare.web.admin.dao.Ad_boardDAO;
import com.petcare.web.admin.vo.Ad_boardVO;
import com.petcare.web.admin.vo.Ad_encyVO;
import com.petcare.web.user.vo.Criteria;

@Service
public class Ad_boardServiceImpl implements Ad_boardService {
	@Autowired
	private Ad_boardDAO ad_boardDAO;

	// 화면에 나타내기+페이징
	@Override
	public List<Ad_boardVO> ad_board_page(Criteria cr) {
		return ad_boardDAO.ad_board_page(cr);
	}

	@Override
	public List<Ad_encyVO> ad_enboard_page(Criteria cr) {
		return ad_boardDAO.ad_enboard_page(cr);
	}

	// 자랑하기 상세
	@Override
	public Ad_boardVO read(int board_num) {
		return ad_boardDAO.read(board_num);
	}
	@Override
	public void ad_enboardInsert(Ad_encyVO ad_encyVO) {
		ad_boardDAO.ad_enboardinsert(ad_encyVO);
	}
	@Override
	public void ad_board_delete(int en_number) {
		ad_boardDAO.ad_board_delete(en_number);
		
	}
	@Override
	public Ad_encyVO enread(int en_number) {
		return ad_boardDAO.enread(en_number);
	}
	@Override
	public void board_delete(int board_num) {
		ad_boardDAO.board_delete(board_num);
	}
	@Override
	public void ad_enboardUpdate(Ad_encyVO ad_encyVO) {
		ad_boardDAO.ad_enboard_update(ad_encyVO);
	}
}
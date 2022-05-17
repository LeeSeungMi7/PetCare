package com.petcare.web.admin.service;

import java.util.List;

import com.petcare.web.admin.vo.Ad_boardVO;
import com.petcare.web.admin.vo.Ad_encyVO;
import com.petcare.web.user.vo.Criteria;

public interface Ad_boardService {
	public List<Ad_boardVO> ad_board_page(Criteria cr);
	public List<Ad_encyVO> ad_enboard_page(Criteria cr);
	Ad_boardVO read(int board_num);
	void ad_enboardInsert(Ad_encyVO ad_encyVO);
	void ad_board_delete(int en_number);
	Ad_encyVO enread(int en_number);
	void board_delete(int board_num);
	void ad_enboardUpdate(Ad_encyVO ad_encyVO);
}
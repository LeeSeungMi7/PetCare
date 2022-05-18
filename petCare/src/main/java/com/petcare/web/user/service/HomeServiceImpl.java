package com.petcare.web.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcare.web.admin.vo.Ad_encyVO;
import com.petcare.web.user.dao.HomeDAO;
import com.petcare.web.user.vo.QnaVO;
import com.petcare.web.user.vo.ShowVO;

@Service
public class HomeServiceImpl implements HomeService {
	
	@Autowired
	private HomeDAO homeDAO;
	
	@Override
	public List<ShowVO> show() {
		return homeDAO.show();
	}

	@Override
	public List<QnaVO> qna() {
		return homeDAO.qna();
	}

	@Override
	public List<Ad_encyVO> ency() {
		return homeDAO.ency();
	}

}

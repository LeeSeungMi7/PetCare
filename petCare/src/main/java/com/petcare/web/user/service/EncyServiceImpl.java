package com.petcare.web.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcare.web.admin.vo.Ad_encyVO;
import com.petcare.web.user.dao.EncyDAO;
import com.petcare.web.user.vo.Criteria;

@Service
public class EncyServiceImpl implements EncyService {
	@Autowired
	private EncyDAO encyDAO;

	@Override
	public List<Ad_encyVO> enboard_page(Criteria cr) {
		return encyDAO.enboard_page(cr);
	}

	@Override
	public Ad_encyVO enread(int en_number) {
		return encyDAO.enread(en_number);
	}

	// 총 글수
	@Override
	public int totalpage(Criteria cr) {
		return encyDAO.totalpage(cr);
	}

	// 조회수
	@Override
	public void increaseViewcnt(int en_number) {
		encyDAO.increaseViewcnt(en_number);
	}
}

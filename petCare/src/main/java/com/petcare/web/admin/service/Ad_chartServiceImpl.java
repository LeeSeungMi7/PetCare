package com.petcare.web.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcare.web.admin.dao.Ad_chartDAO;
import com.petcare.web.admin.vo.ChartVO;

@Service
public class Ad_chartServiceImpl implements Ad_chartService {
	@Autowired
	private Ad_chartDAO ad_chartDAO;
	
	@Override
	public List<ChartVO> ad_chart(ChartVO vo){
		return ad_chartDAO.ad_chart(vo);
	}
}

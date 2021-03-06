package com.petcare.web.admin.service;

import java.util.List;
import java.util.Map;

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
	@Override
	public List<ChartVO> updatelinechart(Map<String, Object> map){
		return ad_chartDAO.updatelinechart(map);
	}
	@Override
	public List<ChartVO> barcommchart(ChartVO vo){
		return ad_chartDAO.barcommchart(vo);
	}
	@Override
	public List<ChartVO> barfaqchart(ChartVO vo){
		return ad_chartDAO.barfaqchart(vo);
	}
	@Override
	public List<ChartVO> updatecommchart(Map<String, Object> map){
		return ad_chartDAO.updatecommchart(map);
	}
	@Override
	public List<ChartVO> updatefaqchart(Map<String, Object> map){
		return ad_chartDAO.updatefaqchart(map);
	}
}

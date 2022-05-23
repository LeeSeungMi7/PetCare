package com.petcare.web.admin.service;

import java.util.List;
import java.util.Map;

import com.petcare.web.admin.vo.ChartVO;

public interface Ad_chartService {
	public List<ChartVO> ad_chart(ChartVO vo);
	public List<ChartVO> updatelinechart(Map<String, Object> map);
	public List<ChartVO> barcommchart(ChartVO vo);
	public List<ChartVO> barfaqchart(ChartVO vo);
	public List<ChartVO> updatecommchart(Map<String, Object> map);
	public List<ChartVO> updatefaqchart(Map<String, Object> map);
}

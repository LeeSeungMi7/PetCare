package com.petcare.web.admin.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petcare.web.admin.vo.ChartVO;

@Repository
public class Ad_chartDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ChartVO> ad_chart(ChartVO vo) {
		return sqlSessionTemplate.selectList("ad_chart.getChartList", vo);
	}
	public List<ChartVO> updatelinechart(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("ad_chart.updateLinechart", map);
	}
	public List<ChartVO> barcommchart(ChartVO vo) {
		return sqlSessionTemplate.selectList("ad_chart.getCommentChart", vo);
	}
	public List<ChartVO> barfaqchart(ChartVO vo) {
		return sqlSessionTemplate.selectList("ad_chart.getFAQChart", vo);
	}
	public List<ChartVO> updatecommchart(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("ad_chart.updateCommentchart", map);
	}
	public List<ChartVO> updatefaqchart(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("ad_chart.updateFAQchart", map);
	}
}

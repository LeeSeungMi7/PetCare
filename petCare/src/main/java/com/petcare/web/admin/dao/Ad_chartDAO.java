package com.petcare.web.admin.dao;

import java.util.List;

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
}

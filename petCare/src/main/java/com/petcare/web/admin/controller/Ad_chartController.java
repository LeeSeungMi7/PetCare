package com.petcare.web.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.petcare.web.admin.service.Ad_chartService;
import com.petcare.web.admin.vo.ChartVO;

@Controller
public class Ad_chartController {
	@Inject
	Ad_chartService ad_chartService;
	
	@RequestMapping("/ad_chart.mdo")
	@ResponseBody
	public List<ChartVO> ad_chartget(Model model, ChartVO vo) throws Exception{
		List<ChartVO> chart = ad_chartService.ad_chart(vo);
		model.addAttribute("chartone", chart);
		return chart;
	}
	@GetMapping("/ad_charts.mdo")
	public String ad_chartsGet() {
		return "ad_charts";
	}
	@RequestMapping("/ad_barchart.mdo")
	@ResponseBody
	public Map<String, Object> ad_barchartget(ChartVO vo) {
		
		Map<String, Object> map = new HashMap<String,Object>();
		
		List<ChartVO> barcommchart = ad_chartService.barcommchart(vo);
		List<ChartVO> barfaqchart = ad_chartService.barfaqchart(vo);
		ModelAndView mav = new ModelAndView();
		map.put("barcomm", barcommchart);
		map.put("barfaq", barfaqchart);
		return map;
	}
}
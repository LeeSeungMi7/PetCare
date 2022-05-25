package com.petcare.web.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@RequestMapping("/updatelinechart.mdo")
	@ResponseBody
	public List<ChartVO> updatelinechart(Model model, ChartVO vo,@RequestParam String updatedate1, String updatedate2) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("updateline", vo);
		map.put("updatedate1", updatedate1);
		map.put("updatedate2", updatedate2);
		List<ChartVO> chart = ad_chartService.updatelinechart(map);
		model.addAttribute("updatelinechart", chart);
		return chart;
	}
	@GetMapping("/ad_charts.mdo")
	public String ad_chartsGet(HttpSession session) {
		String url ="";
		if(session.getAttribute("admin")== null) {
			url="/ad_login";
		}else {
			url="/ad_charts";
		}
		return url;
	}
	@RequestMapping("/ad_barchart.mdo")
	@ResponseBody
	public Map<String, Object> ad_barchartget(ChartVO vo) {
		
		Map<String, Object> map = new HashMap<String,Object>();
		
		List<ChartVO> barcommchart = ad_chartService.barcommchart(vo);
		List<ChartVO> barfaqchart = ad_chartService.barfaqchart(vo);
		map.put("barcomm", barcommchart);
		map.put("barfaq", barfaqchart);
		return map;
	}
	@RequestMapping("/updatebarchart.mdo")
	@ResponseBody
	public Map<String, Object> updatebarchart(ChartVO vo,@RequestParam String updatedate3, String updatedate4) {
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("updatebar", vo);
		map.put("updatedate3", updatedate3);
		map.put("updatedate4", updatedate4);
		List<ChartVO> barcommchart = ad_chartService.updatecommchart(map);
		List<ChartVO> barfaqchart = ad_chartService.updatefaqchart(map);
		map.put("barcomm", barcommchart);
		map.put("barfaq", barfaqchart);
		return map;
	}
}
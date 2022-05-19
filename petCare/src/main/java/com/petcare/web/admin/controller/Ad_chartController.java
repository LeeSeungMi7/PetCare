package com.petcare.web.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.petcare.web.admin.service.Ad_chartService;
import com.petcare.web.admin.vo.ChartVO;

@Controller
public class Ad_chartController {
	@Inject
	Ad_chartService ad_chartService;
	
	@RequestMapping("/ad_charts.mdo")
	public @ResponseBody List<ChartVO> ad_chartget(Model model, ChartVO vo) throws Exception{
		List<ChartVO> chart = ad_chartService.ad_chart(vo);
		model.addAttribute("chartone", chart);
		return chart;
	}
}

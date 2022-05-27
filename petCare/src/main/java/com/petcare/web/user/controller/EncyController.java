package com.petcare.web.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.petcare.web.admin.vo.Ad_encyVO;
import com.petcare.web.user.service.EncyService;
import com.petcare.web.user.vo.Criteria;

@Controller
public class EncyController {

	@Autowired
	private final EncyService encyService;

	@Inject
	public EncyController(EncyService encyService) {
		this.encyService = encyService;
	}

	// 페이징+show 나타내기
	@RequestMapping(value = "/ency_BoardList.do")
	public ModelAndView encyboard_page(@RequestParam(defaultValue = "0") int pageNum, @RequestParam(defaultValue="0") int pageConunt) {
		Criteria cr;
		ModelAndView mav = new ModelAndView();

		if (pageNum == 0) {
			cr = new Criteria(1,3,1); // 3글까지 보이게
		} else {
			cr = new Criteria(pageNum, 3, pageConunt);
		}
		List<Ad_encyVO> showenList = new ArrayList<Ad_encyVO>();
		showenList = encyService.enboard_page(cr);
		cr.setTotal(encyService.totalpage(cr));
		cr.setTotal_page((int) Math.ceil(cr.getTotal() * 1.0 / cr.getSize()));
		cr.setBlock_num((int)Math.ceil(cr.getPageConunt()));
		cr.setBlock_start(((cr.getBlock_num() - 1) * 5) + 1);
		cr.setBlock_end((cr.getBlock_start() + 5 - 1));

		if (cr.getBlock_end() > cr.getTotal_page()) {
			cr.setBlock_end(cr.getTotal_page());
		}
		mav.addObject("showEnList", showenList);
		mav.addObject("enPageVO", cr);
		mav.setViewName("/ency_BoardList");
		return mav;
	}

	// 자랑하기 글 상세보기 + 조회수 증가
	@RequestMapping(value = "/ency_Board.do", method = RequestMethod.GET)
	public ModelAndView board_view(@RequestParam int en_number) {
		encyService.increaseViewcnt(en_number); // 조회수 증가 처리
		Ad_encyVO ad_encyVO;
		ModelAndView mav = new ModelAndView();
		ad_encyVO = encyService.enread(en_number);
		mav.addObject("ency_view", ad_encyVO);
		mav.setViewName("/ency_Board");

		return mav;
	}
}

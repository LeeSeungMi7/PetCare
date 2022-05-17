package com.petcare.web.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.petcare.web.admin.service.Ad_boardService;
import com.petcare.web.admin.vo.Ad_boardVO;
import com.petcare.web.admin.vo.Ad_encyVO;
import com.petcare.web.user.service.FileUploadService;
import com.petcare.web.user.vo.Criteria;

@Controller
public class Ad_boardController {
	@Autowired
	private final Ad_boardService ad_boardService;

	@Autowired
	private FileUploadService fileUploadService;

	@Inject
	public Ad_boardController(Ad_boardService ad_boardService) {
		this.ad_boardService = ad_boardService;
	}

	@RequestMapping(value = "/ad_community.mdo")
	public ModelAndView ad_communityGet(Model model) throws Exception {
		Criteria Criteria = null;
		ModelAndView mav = new ModelAndView();
		List<Ad_boardVO> showList = new ArrayList<Ad_boardVO>();
		showList = ad_boardService.ad_board_page(Criteria);
		mav.addObject("Cm_BoardList", showList);
		mav.setViewName("/ad_community");
		return mav;
	}

	@RequestMapping(value = "/ad_encyclopedia.mdo")
	public ModelAndView ad_encyclopediaGet(Model model) throws Exception {
		Criteria Criteria = null;
		ModelAndView mav = new ModelAndView();
		List<Ad_encyVO> showList = new ArrayList<Ad_encyVO>();
		showList = ad_boardService.ad_enboard_page(Criteria);
		mav.addObject("En_BoardList", showList);
		mav.setViewName("/ad_encyclopedia");
		return mav;
	}

	// 자랑하기 글 상세보기 + 조회수 증가
	@RequestMapping("/comm_getboard.mdo")
	public ModelAndView board_view(@RequestParam int board_num) {
		Ad_boardVO ad_boardVO;
		ModelAndView mav = new ModelAndView();
		ad_boardVO = ad_boardService.read(board_num);
		mav.addObject("CM_view", ad_boardVO);
		mav.setViewName("/comm_getBoard");
		return mav;
	}

	@RequestMapping("/en_getboard.mdo")
	public ModelAndView en_getBoardGet(@RequestParam int en_number) {
		Ad_encyVO ad_encyVO;
		ModelAndView mav = new ModelAndView();
		ad_encyVO = ad_boardService.enread(en_number);
		mav.addObject("En_view", ad_encyVO);
		mav.setViewName("/en_getBoard");
		return mav;
	}

	@GetMapping("/en_insert.mdo")
	public String ad_chartsGet() {
		return "/en_insert";
	}

	@RequestMapping(value = "/eninsert.mdo", method = RequestMethod.POST)
	public String en_insertGet(@ModelAttribute Ad_encyVO ad_encyVO, @RequestParam("inserten_file") MultipartFile file) {
		ad_encyVO.setEn_file_name(file.getOriginalFilename());
		FileUploadService.FileUploadResult fileResult = fileUploadService.fileUpload(file, "백과사전/", ad_encyVO.getEn_file_name());
		ad_encyVO.setEn_file_path(fileResult.getUrl());
		ad_boardService.ad_enboardInsert(ad_encyVO);
		System.out.println(ad_encyVO.toString());
		return "redirect:/ad_encyclopedia.mdo";
	}

	// 삭제
	@RequestMapping("/ad_board_delete.mdo")
	public String ad_board_delete(@RequestParam int en_number) {
		ad_boardService.ad_board_delete(en_number);
		return "redirect:ad_encyclopedia.mdo";
	}

	@RequestMapping("/board_delete.mdo")
	public String board_delete(@RequestParam int board_num) {
		ad_boardService.board_delete(board_num);
		return "redirect:ad_community.mdo";
	}

	@RequestMapping(value = "/en_update.mdo", method = RequestMethod.POST)
	public String enupdate(@ModelAttribute Ad_encyVO ad_encyVO, @RequestParam("en_update_file") MultipartFile file) {
		if (file.getOriginalFilename() == "" || file.getOriginalFilename() == null) {
			ad_boardService.ad_enboardUpdate(ad_encyVO);
		} else {
			ad_encyVO.setEn_file_name(file.getOriginalFilename());
			FileUploadService.FileUploadResult fileResult = fileUploadService.fileUpload(file, "백과사전/",
					ad_encyVO.getEn_file_name());
			ad_encyVO.setEn_file_path(fileResult.getUrl());
			ad_boardService.ad_enboardUpdate(ad_encyVO);
		}
		return "redirect:ad_encyclopedia.mdo";
	}
}

package com.petcare.web.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartFile;

import com.petcare.web.user.service.FileUploadService;
import com.petcare.web.user.service.ShowService;
import com.petcare.web.user.vo.ShowVO;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/show")
public class ShowController {
	
	@Autowired
	private FileUploadService fileUploadService;
	
	@Inject
	ShowService showService;
	
	//게시글 목록
	@RequestMapping("/show.do")
	public ModelAndView list() throws Exception{
		List<ShowVO> list = showService.listAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("show/list");
		mav.addObject("list", list);
		return mav;
	}
	
	
	//글 작성 화면
	@GetMapping(value ="/show_write.do")
	public String write(@ModelAttribute ShowVO showVO, @RequestParam("file") MultipartFile file){
		System.out.println(showVO);
		
		ShowVO tempVO = showVO;
		tempVO.setB_file_name(file.getOriginalFilename());
		FileUploadService.FileUploadResult fileResult = fileUploadService.fileUpload(file, "자랑하기대표img/", tempVO.getB_file_name());
		tempVO.setB_file_path(fileResult.getUrl());
		
		System.out.println(showVO);
		showService.insert(showVO);
		System.out.println("글작성cont");
		return "/show";
	}
	
	
	
	
//		List<ShowVO> showList = new ArrayList<ShowVO>();
//		
//		showList = showService.getShowList(showVO);
//		for(ShowVO show : showList) {
//			showVO.setContent(null);
//		}
		
//		ShowMemberVO.setShow_file_name(file.getOriginalFilename());
//		FileUploadService.FileUploadResult fileResult = fileUploadService.fileUpload(file, "자랑하기 사진/", ShowMemberVO.getShow_file_name());
//		ShowMemberVO.setShow_file_path(fileResult.getUrl());
		

	
	//글 상세보기
	@RequestMapping(value="/show_board", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int b_hit, HttpSession session)throws Exception{
		showService.increaseViewcnt(b_hit, session); //조회수 증가
		ModelAndView mav = new ModelAndView(); //데이터와 화면을 함께 전달
		mav.setViewName("show/view");//뷰이름
		mav.addObject("dto", showService.read(b_hit)); //뷰에 전달할 데이터
		System.out.println("자랑하기 글 상세보기");
		return mav;
	}
	
	
	//글 수정하기
	@RequestMapping(value="/show_rewrite.do", method=RequestMethod.GET)
	public String update(@ModelAttribute ShowVO showVO) throws Exception{
		showService.update(showVO);
		System.out.println("자랑하기 글 수정");
		return "redirect:show.do";
	}
	
	//글 삭제
	@RequestMapping("/show_delete.do")
	public String delete(@RequestParam int b_hit) throws Exception{
		showService.delete(b_hit);
		System.out.println("자랑하기 글 삭제");
		return "redirect:show.do";
	}
	
	

	
	
	
}
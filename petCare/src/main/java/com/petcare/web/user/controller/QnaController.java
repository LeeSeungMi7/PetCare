package com.petcare.web.user.controller;

import java.util.Map;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.petcare.web.user.service.FileUploadService;
import com.petcare.web.user.service.QnaService;
import com.petcare.web.user.vo.CommentVO;
import com.petcare.web.user.vo.Criteria;
import com.petcare.web.user.vo.QnaVO;
import com.petcare.web.user.vo.ShowPageVO;
import com.petcare.web.user.vo.ShowVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QnaController {
	
	@Autowired
	private final QnaService qnaService;
	
	@Autowired
	private FileUploadService fileUploadService;
	
	@Inject
	public QnaController(QnaService qnaService) {
		this.qnaService = qnaService;
	}
	
//	//QnA 글작성
	@GetMapping("/qna_write.do")
	public String qna_writeGet() {
		return "qna_write";
	}

	
	//로그인시에만 작성 가능
	@RequestMapping("/check_qna.do")
	@ResponseBody
	public Map<String, String> check_qna(HttpSession session){
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_ok", "0");
		if(session.getAttribute("user") != null) {
			map.put("user_ok", "1");
		}
		return map;
	}
	
	//글 작성하기
	@RequestMapping(value= "/qna_insert.do", method=RequestMethod.POST)
	public String qna_write(@ModelAttribute QnaVO qnaVO, @RequestParam("qna_file")MultipartFile file) {
		if(file.getOriginalFilename() == "" || file.getOriginalFilename()== null) {
			qnaVO.setF_file_name(null);
			qnaVO.setF_file_path(null);
			qnaService.qnaInsert(qnaVO);
		}else {
		qnaVO.setF_file_name(file.getOriginalFilename());
		FileUploadService.FileUploadResult fileResult = fileUploadService.fileUpload(file, "FAQ/", qnaVO.getF_file_name());
		qnaVO.setF_file_path(fileResult.getUrl());
		qnaService.qnaInsert(qnaVO);
		}
		return "redirect:/qna.do";
	}
	
//	
//	//main
//	@RequestMapping(value="qna.do")
//	public ModelAndView qna_page(@RequestParam(defaultValue="0") int pageNum) {
//		Criteria qnaPage;
//
//		   ModelAndView mav = new ModelAndView();
//
//		   if(pageNum == 0) {
//			   qnaPage = new Criteria(1,5); 
//		   }else {
//			   qnaPage = new Criteria(pageNum, 5);
//		   }
//
//		   List<QnaVO> qnaList = new ArrayList<QnaVO>();
//		   qnaList = qnaService.qna_page(qnaPage);
//		   
//		   System.out.println("e"+ qnaList.toString());
//		   
//		   qnaPage.setTotal(qnaService.maintotalpage(qnaPage));	   
//		   qnaPage.setTotal_page((int)Math.ceil(qnaPage.getTotal() * 1.0/qnaPage.getSize()));
//		   qnaPage.setBlock_num((int)Math.ceil(qnaPage.getSize()/ 5));
//		   qnaPage.setBlock_start(((qnaPage.getBlock_num() -1) *5)+1);
//		   qnaPage.setBlock_end((qnaPage.getBlock_start()+5 -1));
//		   
//		   if(qnaPage.getBlock_end() > qnaPage.getTotal_page()) {
//			   qnaPage.setBlock_end(qnaPage.getTotal_page());
//		   }
//		   mav.addObject("qnaPageList", qnaList);
//		   mav.addObject("qnaPage", qnaPage);
//		   mav.setViewName("/qna");
//		   System.out.println("qnaPageList" + qnaList.toString());
//		return mav;
//		
//	}
//	

	

}


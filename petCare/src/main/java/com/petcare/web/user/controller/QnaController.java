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
import com.petcare.web.user.vo.MemberVO;
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
	

	//자랑하기 목록
	@GetMapping("/qna_write.do")
	public String show_write() {
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
			qnaVO.setF_file_path("https://petcarebuc.s3.ap-northeast-2.amazonaws.com/null_img.png");
			qnaService.qnaInsert(qnaVO);
		}else {
		qnaVO.setF_file_name(file.getOriginalFilename());
		FileUploadService.FileUploadResult fileResult = fileUploadService.fileUpload(file, "FAQ/", qnaVO.getF_file_name());
		qnaVO.setF_file_path(fileResult.getUrl());
		qnaService.qnaInsert(qnaVO);
		}
		return "redirect:/qna.do";
	}
	
	
//	//main
	@RequestMapping(value="qna.do")
	public ModelAndView qna_page(@RequestParam(defaultValue="0") int pageNum ,@RequestParam(defaultValue="0") int pageConunt) {
		Criteria qnaPage;

		   ModelAndView mav = new ModelAndView();

		   if(pageNum == 0) {
			   qnaPage = new Criteria(1,3,1); 
		   }else {
			   qnaPage = new Criteria(pageNum, 3 , pageConunt);
		   }

		   List<QnaVO> qnaList = new ArrayList<QnaVO>();
		   
		   qnaPage.setTotal(qnaService.maintotalpage(qnaPage));	   
		   qnaPage.setTotal_page((int)Math.ceil(qnaPage.getTotal() * 1.0/qnaPage.getSize()));
		  
		   
		   qnaPage.setBlock_num((int)Math.ceil(qnaPage.getPageConunt()));
		   qnaPage.setBlock_start((qnaPage.getBlock_num()-1)* 5 + 1);
		   qnaPage.setBlock_end((qnaPage.getBlock_start()+5 -1));
		  
		   qnaList = qnaService.qna_page(qnaPage);
		   
		   
		   if(qnaPage.getBlock_end() > qnaPage.getTotal_page()) {
			   qnaPage.setBlock_end(qnaPage.getTotal_page());
		   }
		   mav.addObject("qnaPageList", qnaList);
		   mav.addObject("qnaPage", qnaPage);
		   mav.setViewName("/qna");

		return mav;
		
	}
	
	//상세보기
	@RequestMapping(value="/qna_board.do", method=RequestMethod.GET)
	public ModelAndView qna_view(@RequestParam int faq_num, @RequestParam(defaultValue="0") int pageNum, @RequestParam(defaultValue="0")int pageConunt) {
		
		Criteria criteria;
		
		if(pageNum == 0) {
			criteria = new Criteria();
		}else {
			criteria = new Criteria(pageNum, 5, pageConunt);
		}
		
		criteria.setFaq_num(faq_num);
		
		qnaService.increaseViewcnt(faq_num); //조회수 증가 처리
		
//		댓글 페이징 하기
		List<CommentVO> cv = qnaService.commentList(criteria);
		criteria.setTotal(qnaService.totalpage(criteria)); 
		criteria.setTotal_page((int)Math.ceil(criteria.getTotal() *1.0/criteria.getSize())); 
		
		criteria.setBlock_num((int)Math.ceil(criteria.getPageConunt()));
		criteria.setBlock_start(((criteria.getBlock_num() -1) * 5 ) +1 ); 
		criteria.setBlock_end(criteria.getBlock_start() + 5 -1); 
		
		if(criteria.getBlock_end() > criteria.getTotal_page()) {
			criteria.setBlock_end(criteria.getTotal_page());
		}
		System.out.println(criteria.toString());
		QnaVO qnaVO;
		ModelAndView mav = new ModelAndView();
		qnaVO = qnaService.read(faq_num);
		mav.addObject("qna_com", cv);
		mav.addObject("criteria", criteria);
		mav.addObject("view", qnaVO);
		mav.setViewName("/qna_board");
		
		return mav;
		
	}
	
	//댓글 작성
	@RequestMapping(value="qna_reply_write.do", method=RequestMethod.POST)
	public String qna_reply_write(@ModelAttribute CommentVO commentVO) {
		commentVO.setC_kind("0");
		qnaService.qna_reply_write(commentVO);

		return "redirect:/qna_board.do?faq_num=" + commentVO.getC_num();
		
	}
	//댓글 삭제
	@RequestMapping("/qna_reply_delete.do")
	public String qna_reply_delete(CommentVO commentVO, HttpSession session) {
		if(session.getAttribute("user") == null) {
			return "redirect:/home.do";
		}else {
			int comment_num = commentVO.getComment_num();
			commentVO = qnaService.commentRead(comment_num);
			MemberVO member = (MemberVO)session.getAttribute("user");
			if(member.getM_number() == commentVO.getC_member_num()) {
				qnaService.qna_reply_delete(commentVO.getComment_num());
				return "redirect:qna.do";
			}else {
				return"redirect:/home.do";
			}
		}
		
	}
	
	@RequestMapping(value="qna_rewrite.do", method=RequestMethod.GET)
	public ModelAndView qna_rewrite_view(@RequestParam int faq_num, HttpSession session) {

		ModelAndView mav = new ModelAndView();
	
		if(session.getAttribute("user") == null) {
			mav.setViewName("redirect:/home.do");
		}else {
			QnaVO qnaVO;
			qnaVO = qnaService.rewrite_view(faq_num);
			
			MemberVO member = (MemberVO)session.getAttribute("user");
			if(member.getM_number() == qnaVO.getF_number()) {
				mav.addObject("rewrite_view", qnaVO);
				mav.setViewName("/qna_rewrite");
			}else {
			mav.setViewName("redirect:/home.do");
			}
		}
		return mav;
	}
	
	
	@RequestMapping(value="qna_update.do", method=RequestMethod.POST)
	public String qna_update(@ModelAttribute QnaVO qnaVO, @RequestParam("qna_update_file")MultipartFile file) {
		
		if(file.getOriginalFilename() == "" || file.getOriginalFilename()== null) {
			qnaService.update(qnaVO);
		}else {
		qnaVO.setF_file_name(file.getOriginalFilename());
		FileUploadService.FileUploadResult fileResult = fileUploadService.fileUpload(file, "FAQ/", qnaVO.getF_file_name());
		qnaVO.setF_file_path(fileResult.getUrl());
		qnaService.update(qnaVO);
		}
		return "redirect:qna_board.do?faq_num=" + qnaVO.getFaq_num();
	}
	@RequestMapping("/qna_delete.do")
	public String qna_delete(@RequestParam int faq_num, HttpSession session) {
		if(session.getAttribute("user") == null) {
			return "redirect:/home.do";
		}else {
			QnaVO qnaVO;
			qnaVO = qnaService.read(faq_num);
			MemberVO member = (MemberVO)session.getAttribute("user");
			if(member.getM_number() == qnaVO.getF_number()) {
				qnaService.qna_delete(faq_num);
				return "redirect:qna.do";
			}else {
				return "redirect:/home.do";
			}
		}
	
	}
	
}


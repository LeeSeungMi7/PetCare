package com.petcare.web.user.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.petcare.web.user.service.BoardService;
import com.petcare.web.user.service.FileUploadService;
import com.petcare.web.user.vo.CommentVO;
import com.petcare.web.user.vo.Criteria;
import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.ShowPageVO;
import com.petcare.web.user.vo.ShowVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BoardController {
   
   
   @Autowired
   private final BoardService boardService;
   
   @Autowired
   private FileUploadService fileUploadService;
   
   @Inject
   public BoardController(BoardService boardService) {
      this.boardService = boardService;
   }
   
   
   //로그인시에만 글작성가능
   @RequestMapping("/check_board.do")
   @ResponseBody
   public Map<String, String> check_board(HttpSession session) {
      
      Map<String, String> map = new HashMap<String, String>();
      
      
      map.put("user_ok","0");
      if(session.getAttribute("user") != null) {
//         로그인할때
         map.put("user_ok","1");
      }

      return map;
   }
   
	//자랑하기 목록
	@GetMapping("/show_write.do")
	public String show_write(HttpSession session) {
	      if(session.getAttribute("user") == null) {
	    	  return "redirect:/home.do";
	      }else {
		return "show_write";
	      }
	}
   
   //자랑하기 글 작성
   @RequestMapping(value = "/show_insert.do" , method=RequestMethod.POST)
   public String board_write(@ModelAttribute ShowVO showVO, @RequestParam("show_file") MultipartFile file) {
	   
	   if(file.getOriginalFilename() == "" || file.getOriginalFilename() == null) {
		   showVO.setB_file_name(null);
		   showVO.setB_file_path("https://petcarebuc.s3.ap-northeast-2.amazonaws.com/null_img.png");
		   boardService.boardInsert(showVO);
		   
	   }else {
      showVO.setB_file_name(file.getOriginalFilename());
      FileUploadService.FileUploadResult fileResult = fileUploadService.fileUpload(file, "자랑하기/", showVO.getB_file_name());
      showVO.setB_file_path(fileResult.getUrl());
      boardService.boardInsert(showVO);
	   }
      return "redirect:/show.do";
   }
  
  
   
   //자랑하기 글 상세보기 + 조회수 증가
   @RequestMapping(value="/show_board.do", method=RequestMethod.GET)
   public ModelAndView board_view(@RequestParam int board_num ,@RequestParam(defaultValue="0") int pageNum, @RequestParam(defaultValue="0") int pageConunt) {
     
	   Criteria criteria;
		
		if(pageNum == 0) {
			criteria = new Criteria();
		}else {
			criteria = new Criteria(pageNum, 5, pageConunt);
		}

		criteria.setBaord_num(board_num);
		
		boardService.increaseViewcnt(board_num);//조회수 증가 처리
		
//		댓글 페이징 하기
		List<CommentVO> cv = boardService.commentList(criteria);
		criteria.setTotal(boardService.totalpage(criteria)); 
		criteria.setTotal_page((int)Math.ceil(criteria.getTotal() *1.0/criteria.getSize())); 
		
		criteria.setBlock_num((int)Math.ceil(criteria.getPageConunt()));
		criteria.setBlock_start(((criteria.getBlock_num() -1) * 5 ) +1 ); 
		criteria.setBlock_end(criteria.getBlock_start() + 5 -1); 
		
		if(criteria.getBlock_end() > criteria.getTotal_page()) {
			criteria.setBlock_end(criteria.getTotal_page());
		}
	   
//		페이징 끝

      ShowVO showVO;
      ModelAndView mav = new ModelAndView();
      showVO = boardService.read(board_num);
      mav.addObject("show_com", cv);
      mav.addObject("criteria", criteria);
      mav.addObject("view", showVO);
      mav.setViewName("/show_board");
      
      return mav;
   }
   
   //수정 글 나타내기
   @RequestMapping(value="/show_rewrite.do", method=RequestMethod.GET)
   public ModelAndView board_rewrite_view(@RequestParam int board_num, HttpSession session) {
      ModelAndView mav = new ModelAndView();
      
      if(session.getAttribute("user") == null) {
    	  mav.setViewName("redirect:/home.do");
      }else {
    	  ShowVO showVO;
          showVO = boardService.rewrite_view(board_num);
          
          MemberVO member = (MemberVO)session.getAttribute("user");
          if(member.getM_number() == showVO.getB_number()) {
              mav.addObject("rewrite_view", showVO);
              mav.setViewName("/show_rewrite");
          }else {
        	  mav.setViewName("redirect:/home.do");
          }
   	  
      }
      return mav;
   }
   //수정하기
   @RequestMapping(value="board_update.do", method=RequestMethod.POST)
   public String board_update(@ModelAttribute ShowVO showVO, @RequestParam("show_update_file") MultipartFile file) {
     
	   if(file.getOriginalFilename() == "" || file.getOriginalFilename()== null) {
		   boardService.update(showVO);
	   }else {
	   
	   showVO.setB_file_name(file.getOriginalFilename());
      FileUploadService.FileUploadResult fileResult = fileUploadService.fileUpload(file, "자랑하기/", showVO.getB_file_name());
      showVO.setB_file_path(fileResult.getUrl());

      boardService.update(showVO);
	   }
      return "redirect:show_board.do?board_num=" + showVO.getBoard_num();
   }
   
   //삭제
   @RequestMapping("/board_delete.do")
   public String board_delete(@RequestParam int board_num, HttpSession session) {
		if(session.getAttribute("user") == null) {
			return "redirect:/home.do";
		}else {
			ShowVO showVO;
		    showVO = boardService.read(board_num);
			MemberVO member = (MemberVO)session.getAttribute("user");
			if(member.getM_number() == showVO.getB_number()) {
				boardService.board_delete(board_num);
				return "redirect:show.do";
			}else {
				return "home";
			}
			
		}

   }
   
   //페이징+show 나타내기
   @RequestMapping(value="show.do")
   public ModelAndView board_page(@RequestParam(defaultValue="0") int pageNum, @RequestParam(defaultValue="0") int pageConunt) {   
	   ShowPageVO showPageVO;

	   ModelAndView mav = new ModelAndView();

	   if(pageNum == 0) {
		   showPageVO = new ShowPageVO(1,4,1); 
	   }else {
		   showPageVO = new ShowPageVO(pageNum, 4, pageConunt);
	   }	   
	   List<ShowVO> showList = new ArrayList<ShowVO>();
	   showList = boardService.board_page(showPageVO);
	   showPageVO.setTotal(boardService.totalpage(showPageVO));	   
	   showPageVO.setTotal_page((int)Math.ceil(showPageVO.getTotal() * 1.0/showPageVO.getSize()));
	   showPageVO.setBlock_num((int)Math.ceil(showPageVO.getPageConunt()));
	   showPageVO.setBlock_start(((showPageVO.getBlock_num() -1) *5)+1);
	   showPageVO.setBlock_end((showPageVO.getBlock_start()+5 -1));
	   
	   if(showPageVO.getBlock_end() > showPageVO.getTotal_page()) {
		   showPageVO.setBlock_end(showPageVO.getTotal_page());
	   }
	   mav.addObject("showPageList", showList);
	   mav.addObject("showPageVO", showPageVO);
	   mav.setViewName("/show");

	   
	return mav;
   }
   
   //댓글 작성
   @RequestMapping(value = "board_reply_write.do",  method=RequestMethod.POST)
   public String board_reply_write(@ModelAttribute CommentVO commentVO) {
	  commentVO.setC_kind("1");
      boardService.board_reply_write(commentVO);
	return "redirect:/show_board.do?board_num=" + commentVO.getC_num();
   }

   @RequestMapping("/board_reply_delete.do")
   public String board_reply_delete(CommentVO commentVO, HttpSession session) {
		if(session.getAttribute("user") == null) {
			return "redirect:/home.do";
		}else {
			int comment_num = commentVO.getComment_num();
			commentVO = boardService.commentRead(comment_num);
			MemberVO member = (MemberVO)session.getAttribute("user");
			if(member.getM_number() == commentVO.getC_member_num()) {
				boardService.board_reply_delete(commentVO.getComment_num());
				return "redirect:show.do";
			}else {
				return "redirect:/home.do";
			}
			
		}
	   
   }
   
   
}
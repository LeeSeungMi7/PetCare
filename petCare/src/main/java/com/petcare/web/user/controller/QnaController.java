package com.petcare.web.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QnaController {
	//QnA 목록
	@GetMapping("/qna.do")
	public String qnaGet() {
		return "qna";
	}
	
	//QnA 글보기
	@GetMapping("/qna_board.do")
	public String qna_baordGet() {
		return "qna_board";
	}
	//QnA 글수정
	@GetMapping("/qna_rewrite.do")
	public String qna_rewriteGet() {
		return "qna_rewrite";
	}
	//QnA 글작성
	@GetMapping("/qna_write.do")
	public String qna_writeGet() {
		return "qna_write";
	}
}

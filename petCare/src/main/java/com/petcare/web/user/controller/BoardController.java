package com.petcare.web.user.controller;

import java.lang.reflect.Member;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.petcare.web.user.service.BoardService;
import com.petcare.web.user.vo.ShowVO;

@Controller
public class BoardController {
	
	
	@Autowired
	private final BoardService boardService;
	
	@Inject
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@RequestMapping("/check_board.do")
	@ResponseBody
	public Map<String, String> check_board(HttpSession session) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		System.out.println(session.getAttribute("user"));
		
		map.put("user_ok","0");
		if(session.getAttribute("user") != null) {
//			로그인할때
			map.put("user_ok","1");
		}

		System.out.println(map);
		return map;
	}
}
	


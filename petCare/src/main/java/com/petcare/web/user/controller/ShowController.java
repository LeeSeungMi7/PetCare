package com.petcare.web.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.petcare.web.user.service.ShowService;
import com.petcare.web.user.vo.ShowVO;


@Controller
@SessionAttributes("show")
public class ShowController {
	
	/* @Autowired */
	private ShowService showService;
	
	
	
	
}
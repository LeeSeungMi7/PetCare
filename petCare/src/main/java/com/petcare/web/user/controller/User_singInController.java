package com.petcare.web.user.controller;



import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.petcare.web.user.service.MyPetService;
import com.petcare.web.user.vo.MyPetVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class User_singInController {
	
	@Autowired
	private MyPetService myPetService;
	
	@Inject
	public User_singInController(MyPetService myPetService) {
		this.myPetService = myPetService;
	}
	
	
	@RequestMapping(value="/petAdd.do" ,  method = RequestMethod.POST)
	@ResponseBody
	public void petAdd(MyPetVO mypetVO){

        List<MyPetVO> myPet = new ArrayList<MyPetVO>();

        myPetService.petadd(mypetVO);
        log.info("펫 등록 성공");
        
	}
	
}

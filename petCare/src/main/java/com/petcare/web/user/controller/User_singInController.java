package com.petcare.web.user.controller;



import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public List<MyPetVO> petAdd(MyPetVO mypetVO){
		
		MyPetVO petVO = mypetVO;
        List<MyPetVO> myPet = new ArrayList<MyPetVO>();
        
        myPet = myPetService.petadd(mypetVO);
        
        for(MyPetVO pet : myPet) {
        	mypetVO.setMp_number(pet.getMp_number());
        	mypetVO.setMp_petAge(pet.getMp_petAge());
        }
        log.info("펫 등록 성공");
        
    
        return myPet;
		
        
	}
	
}

package com.petcare.web.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.petcare.web.user.service.HospitalService;
import com.petcare.web.user.vo.Criteria;
import com.petcare.web.user.vo.HospitalVO;
import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.MyPetVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HospitalController {
	
	@Autowired
	private final HospitalService hospitalService;
	
	@Inject
	public HospitalController(HospitalService hospitalService) {
		this.hospitalService = hospitalService;
	}
	
	@RequestMapping("/hospital.do")
	public String hospitalGet() {
		return "hospital";
	}
//	@RequestMapping("/hospital_detail.do")
//	public String hospitaldetailGet() {
//		return "hospital_detail";
//	}
	
	@RequestMapping("/hospital_reservation.do")
	public String hospitalreservationGet() {
		return "hospital_reservation";
	}
	
	//병원 상세보기
	@RequestMapping(value="hospital_detail.do")
	public ModelAndView hospital_view(@RequestParam int m_number, @RequestParam(defaultValue="0")int pageNum) {
		System.out.println("들어옴");
		System.out.println("m_number: " + m_number);
		Criteria criteria;
		
		
		if(pageNum == 0) {
			criteria = new Criteria();
		}else {
			criteria = new Criteria(pageNum, 5);
		}
		
		criteria.setRw_partner_number(m_number);
		
		List<HospitalVO> cv = hospitalService.commentList(criteria);
		criteria.setTotal(hospitalService.totalpage(criteria)); 
		
		criteria.setTotal_page((int)Math.ceil(criteria.getTotal() *1.0/criteria.getSize())); 
		
		criteria.setBlock_num((int)Math.ceil(criteria.getSize()/ 5)); 
		criteria.setBlock_start(((criteria.getBlock_num() -1) * 5 ) +1 ); 
		criteria.setBlock_end(criteria.getBlock_start() + 5 -1); 
		
		if(criteria.getBlock_end() > criteria.getTotal_page()) {
			criteria.setBlock_end(criteria.getTotal_page());
		}
		
		System.out.println("crt" + criteria.toString());
		ModelAndView mav = new ModelAndView();
		mav.addObject("hos_com", cv);
		mav.addObject("criteria", criteria);
		mav.setViewName("/hospital_detail");
		
		return mav;
	}
	@RequestMapping(value="hospital_reply_write.do", method=RequestMethod.POST)
	public String hospital_reply_write(@ModelAttribute HospitalVO hospitalVO) {
		System.out.println("reply_write" + hospitalVO.toString());
		hospitalService.hospital_reply_write(hospitalVO);
		System.out.println("reply_write" + hospitalVO.toString());
		return "redirect:/hospital.do";
		
	}
	
    @ResponseBody
    @RequestMapping(value = "/hospital_alliance.do", method = RequestMethod.GET)
    public MemberVO[] hospital_alliance(@RequestParam int[] mapIds) {
        try {
            List<MemberVO> memberVOList = hospitalService.hospitalSearchForMapIds(mapIds);
            MemberVO[] memberVoArray = new MemberVO[memberVOList.size()];
            for (int index = 0; index < memberVOList.size(); index++) {
                memberVoArray[index] = memberVOList.get(index);
            }
            return memberVoArray;
        } catch (Exception e) {
            System.out.println(e);
        }

        return null;
    }
	
	
	
	
	//펫예약
	@RequestMapping(value="/hospital_reservation_mypet.do")
	public ModelAndView hospital_reservation_mypet(@RequestParam int m_number) {
		
		List<MyPetVO> myPetVO = new ArrayList<MyPetVO>();
		ModelAndView mav = new ModelAndView();
		myPetVO = hospitalService.hospital_reservation_mypet(m_number);
		mav.addObject("mypet", myPetVO);
		
		mav.setViewName("/hospital_reservation_mypet");
		
		return mav;
	}
	@RequestMapping(value="hospital_reservation_form.do")
	public String hospital_reservation_form(@ModelAttribute MyPetVO myPetVO) {
		return null;
	}
//	
//	@RequestMapping(value="/hospital_reservation_my_pet", method=RequestMethod.POST)
//	@ResponseBody
//	public void hospital_reservation_my_pet(value="myPet[]")List<String> myPetRV{
//		
//	}

	
}

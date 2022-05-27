package com.petcare.web.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.servlet.ModelAndView;

import com.petcare.web.user.service.HospitalService;
import com.petcare.web.user.vo.AnimalReservationVO;
import com.petcare.web.user.vo.Criteria;
import com.petcare.web.user.vo.HospitalVO;
import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.MyPetVO;
import com.petcare.web.user.vo.ReservationVO;

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
	
	@RequestMapping("/hospital_reservation.do")
	public String hospitalreservationGet() {
		return "hospital_reservation";
	}
	
	//병원 상세보기
	@RequestMapping(value="hospital_detail.do")
	public ModelAndView hospital_view(@RequestParam(defaultValue="0") int m_number, @RequestParam(defaultValue="0")int pageNum, @RequestParam(defaultValue="0") int pageConunt) {
		Criteria criteria;
		
		if(pageNum == 0) {
			criteria = new Criteria();
		}else {
			criteria = new Criteria(pageNum, 5, pageConunt);
		}
		
		criteria.setRw_partner_number(m_number);
		
		List<HospitalVO> cv = hospitalService.commentList(criteria);
		criteria.setTotal(hospitalService.totalpage(criteria)); 
		
		criteria.setTotal_page((int)Math.ceil(criteria.getTotal() *1.0/criteria.getSize())); 
		
		criteria.setBlock_num((int)Math.ceil(criteria.getPageConunt()));
		criteria.setBlock_start(((criteria.getBlock_num() -1) * 5 ) +1 ); 
		criteria.setBlock_end(criteria.getBlock_start() + 5 -1); 
		
		if(criteria.getBlock_end() > criteria.getTotal_page()) {
			criteria.setBlock_end(criteria.getTotal_page());
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("hos_com", cv);
		mav.addObject("criteria", criteria);
		mav.setViewName("/hospital_detail");
		
		return mav;
	}
	@RequestMapping(value="hospital_reply_write.do", method=RequestMethod.POST)
	public String hospital_reply_write(@ModelAttribute HospitalVO hospitalVO) {
		hospitalService.hospital_reply_write(hospitalVO);
		return "redirect:/hospital.do";
		
	}
	
	@RequestMapping(value="hospital_reply_delete.do")
	public String hospital_reply_delete(HospitalVO hospitalVO) {
		hospitalService.hospital_reply_delete(hospitalVO);
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
	public ModelAndView hospital_reservation_mypet(@RequestParam int m_number, @RequestParam int hospital_number, HttpSession session) {
		List<MyPetVO> myPetVO = new ArrayList<MyPetVO>();
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("user") == null) {
			mav.setViewName("redirect:/home.do");
		}else {
			MyPetVO mypets = new MyPetVO();
			mypets.setMp_number(m_number);
			MemberVO member = (MemberVO)session.getAttribute("user");
			if(member.getM_number() == mypets.getMp_number()) {
				MemberVO hospitalDetailInfo = hospitalService.hospitalDetail(hospital_number);
				myPetVO = hospitalService.hospital_reservation_mypet(m_number);
				mav.addObject("mypet", myPetVO);
				mav.addObject("hospital", hospitalDetailInfo);

				mav.setViewName("/hospital_reservation_mypet");
				
			}else {
				mav.setViewName("redirect:/home.do");
			}
		}

		return mav;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="hospital_reservation_form.do", method=RequestMethod.POST)
	public String hospital_reservation_form(@RequestParam int userNum, @RequestParam int hospitalNum, @RequestParam String rvDate, @RequestParam String rvHour, @RequestParam String myPets) {
	  
	  
	  String[] myPetsArray = myPets.split(",");
	  int[] myPetsToInt = new int[myPetsArray.length];

	  
	  ReservationVO reservationVO = new ReservationVO();
	  
	  reservationVO.setRv_number(userNum);
	  reservationVO.setRv_partner_number(hospitalNum);
	  reservationVO.setRv_date(rvDate);
	  reservationVO.setRv_time(rvHour);
	  reservationVO.setRv_access("0");

	  hospitalService.hospitalInsert(reservationVO);
	  
	  int reservation_num = reservationVO.getReservation_num();
	  reservationVO.setReservation_num(reservation_num);
	  
	  
	  for(int i = 0; i < myPetsArray.length; i++) {
		    AnimalReservationVO animalReservationVO = new AnimalReservationVO(Integer.parseInt(myPetsArray[i]), reservation_num);
		    hospitalService.hospitalRsvn(animalReservationVO);
		  }
	  
	  return "null";
	}

	
}

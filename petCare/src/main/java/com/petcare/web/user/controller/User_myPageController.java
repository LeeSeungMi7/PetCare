package com.petcare.web.user.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.petcare.web.user.service.UserMyPageService;
import com.petcare.web.user.vo.Criteria;
import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.MyPetVO;
import com.petcare.web.user.vo.ReservationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class User_myPageController {
	
	@Autowired
	private UserMyPageService user_mypageService;
	
	
	@Inject User_myPageController( UserMyPageService user_mypage ){
		this.user_mypageService = user_mypage;
	}
	
	
	@RequestMapping(value="/user_myPage_update.do", method=RequestMethod.POST)
	public ModelAndView user_myPage_update(@RequestParam int m_number) {
		
		
		MemberVO memberVO;
		List<MyPetVO> myPetVO = new ArrayList<MyPetVO>();
		ModelAndView mav = new ModelAndView();
		
		memberVO = user_mypageService.user_mypage(m_number);
		myPetVO = user_mypageService.user_myPet(m_number);
				
	    String tel[] = memberVO.getM_tel().split("-");
	    memberVO.setM_tel1(tel[0]);
	    memberVO.setM_tel2(tel[1]);
	    memberVO.setM_tel3(tel[2]);
		
		mav.addObject("member",memberVO);
		mav.addObject("mypet",myPetVO);

		mav.setViewName("/user_update");

		return mav;
		
	}
	
	//user 내정보 수정
	@RequestMapping(value="/user_mofify.do", method=RequestMethod.POST)
	public String user_mypage_modify(@ModelAttribute MemberVO memberVO, HttpSession session){
		
		MemberVO tempMemberVO = memberVO;

		String hashedPw = BCrypt.hashpw(tempMemberVO.getM_pw(), BCrypt.gensalt());
		tempMemberVO.setM_pw(hashedPw);
		
		tempMemberVO.setM_tel(tempMemberVO.getM_tel1()+"-"+tempMemberVO.getM_tel2()+"-"+tempMemberVO.getM_tel3());
		
		if(tempMemberVO.getM_address()!= "" || tempMemberVO.getM_address()!= null) {
			String address[] = tempMemberVO.getM_address().split(" ");
			
			tempMemberVO.setM_sido(address[0] +" "+ address[1]);
			tempMemberVO.setM_dong(address[2] +" "+ address[3]);
		}
		
		user_mypageService.userModify(tempMemberVO);
					
		if(tempMemberVO.getPetList() != null) {
			
			for(MyPetVO pet : tempMemberVO.getPetList()) {
//				펫 없을때
				if(pet.getMyPet_num() == 0) {
				   pet.setMp_number(tempMemberVO.getM_number());
				   user_mypageService.insertAddPet(pet);
				}
				
			}
		}
		return "home";
	}
	
	//내펫 삭제
	@RequestMapping(value="/delete_MyPet.do",  method=RequestMethod.GET)
	@ResponseBody
	public int delete_Mypet(@RequestParam String petNum) {
		
		int deleteMyPet;
		deleteMyPet = user_mypageService.deleteMyPet(petNum);
		return deleteMyPet;
	}
	
	//내 예약 현황
	@RequestMapping("/user_myreservation.do")
	public ModelAndView myreservation(@RequestParam int m_number, @RequestParam(defaultValue="0") int pageNum) {

		Criteria criteria;
		
		ModelAndView mav = new ModelAndView();
	
		if(pageNum == 0) {
			criteria = new Criteria(1,10); //10글까지 보이게
		}else {
			criteria = new Criteria(pageNum,10);
		}
		criteria.setM_number(m_number);
		
		List<ReservationVO> reservationList = new ArrayList<ReservationVO>();
        
		reservationList = user_mypageService.reservation(criteria);
		criteria.setTotal(user_mypageService.totalpage(criteria));
//		log.info("total : " + total);
//		log.info("criteria.getSize() : " + criteria.getSize());
//		log.info("(int)Math.ceil(total/criteria.getSize()) : " + (int)Math.ceil(total *1.0/criteria.getSize()));
		
		criteria.setTotal_page((int)Math.ceil(criteria.getTotal() *1.0/criteria.getSize()));
		criteria.setBlock_num((int)Math.ceil(criteria.getSize() / 10));
		criteria.setBlock_start(((criteria.getBlock_num() -1) *5)+1);
		criteria.setBlock_end(criteria.getBlock_start()+5 -1);
		
		if(criteria.getBlock_end() > criteria.getTotal_page()) {
			criteria.setBlock_end(criteria.getTotal_page());
		}
//		System.out.println(criteria.toString());
		mav.addObject("reser", reservationList);
		mav.addObject("criteria", criteria);
		mav.setViewName("/myreservation");
		

		return mav;
	}
	
	//예약 수정
	@RequestMapping(value="/reservation_modify.do" , method=RequestMethod.GET)
	@ResponseBody
	public int reservation_modify(@RequestParam String index, String time) {
		
		int update;
		
		Map<String, String> map = new HashMap<String,String>();
		
		map.put("index", index);
		map.put("time", time);
		
		update = user_mypageService.reservation_modify(map);
		
		return update;
	}
	
	//예약 삭제
	@RequestMapping(value="/reservation_delete.do" , method= RequestMethod.GET)
	@ResponseBody
	public int reservation_delete(@RequestParam int index) {
		int result = user_mypageService.reservation_delete(index);
		return result;
	}
	
	//회원 탈퇴(병원, 유저 공통)
	@RequestMapping(value="/delete_member.do", method= RequestMethod.POST)
	@ResponseBody
	public int delete_member(@RequestParam String m_number, HttpSession session) {
		
		Map<String, String> map = new HashMap();
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String deleteMemberDate= sdf.format(date);

		map.put("m_number", m_number);
		map.put("deleteMemberDate", deleteMemberDate);
		
		int result = user_mypageService.delete_member(map); //로그인 비활성화
		user_mypageService.delete_DB_member();
		
		session.invalidate(); //세션 날리기
		return result;
	}
	
}

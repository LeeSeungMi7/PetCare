package com.petcare.web.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.petcare.web.user.service.FileUploadService;
import com.petcare.web.user.service.PartnerMyPageService;
import com.petcare.web.user.vo.Criteria;
import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.ReservationVO;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class Partner_myPageController {
	
	@Autowired
	private PartnerMyPageService partnerMapage;
	
	@Autowired
	private FileUploadService fileUploadService;
	
	@Inject
	public Partner_myPageController(PartnerMyPageService partnerMapage) {
		this.partnerMapage = partnerMapage;
	}

//	마이페이지 연결
	@RequestMapping(value="/partner_mypage_update.do" , method=RequestMethod.POST)
	public ModelAndView partner_mypage(@RequestParam int m_number) {
		
		ModelAndView mav = new ModelAndView();
		
		MemberVO memberVO = partnerMapage.partner_mypage(m_number);
		
		String tel[] = memberVO.getM_tel().split("-");
		memberVO.setM_tel1(tel[0]);
		memberVO.setM_tel2(tel[1]);
		memberVO.setM_tel3(tel[2]);
		
		String weekday[] = memberVO.getP_weekday().split("/");
		memberVO.setP_weekday1(weekday[0]);
		memberVO.setP_weekday2(weekday[1]);
		
		String weekend[] = memberVO.getP_weekend().split("/");
		memberVO.setP_weekend1(weekend[0]);
		memberVO.setP_weekend2(weekend[1]);
		
		String breaktime[] = memberVO.getP_breaktime().split("/");
		memberVO.setP_breaktime1(breaktime[0]);
		memberVO.setP_breaktime2(breaktime[1]);

		mav.addObject("member", memberVO);
		mav.setViewName("hos_update");
		
		return mav;
	}
	
//	병원 마이페이지 수정
	@RequestMapping(value="/partner_modify.do", method=RequestMethod.POST)
	public String partner_modify(@ModelAttribute MemberVO memberVO, @RequestParam("file") MultipartFile file) {
		
		String hashedPw = BCrypt.hashpw(memberVO.getM_pw(), BCrypt.gensalt());
		memberVO.setM_pw(hashedPw);
		
		memberVO.setM_tel(memberVO.getM_tel1()+"-"+memberVO.getM_tel2()+"-"+memberVO.getM_tel3());
		
		if(memberVO.getM_address()!= "" || memberVO.getM_address()!= null) {
			String address[] = memberVO.getM_address().split(" ");
			
			memberVO.setM_sido(address[0] +" "+ address[1]);
			memberVO.setM_dong(address[2] +" "+ address[3]);		
		}
		
		memberVO.setP_weekday(memberVO.getP_weekday1()+"/"+ memberVO.getP_weekday2());
		memberVO.setP_weekend(memberVO.getP_weekend1()+"/"+ memberVO.getP_weekend2());
		memberVO.setP_breaktime(memberVO.getP_breaktime1()+"/"+memberVO.getP_breaktime2());
		
		if(file.getOriginalFilename() == "" || file.getOriginalFilename() == null) {

			partnerMapage.partner_modify(memberVO);
		
		}else {			

			memberVO.setP_file_name(file.getOriginalFilename());
			FileUploadService.FileUploadResult fileResult = fileUploadService.fileUpload(file, "사업자등록증/", memberVO.getP_file_name());
			memberVO.setP_file_path(fileResult.getUrl());
		
			partnerMapage.partner_modifyfile(memberVO);
		}
		return "/home";
		
	}
	
//	병원 예약 연결
	@RequestMapping( value ="/hos_reservation.do")
	public ModelAndView hos_reservation(@RequestParam int m_number,@RequestParam(defaultValue="0") int pageNum) {
		Criteria criteria;
		
		if(pageNum == 0) {
			criteria = new Criteria();
		}else {
			criteria = new Criteria(pageNum, 5);
		}

		criteria.setM_number(m_number);
		
		ModelAndView mav = new ModelAndView();
	
		List<ReservationVO> rv = partnerMapage.partner_reservationPage(criteria);
		criteria.setTotal(partnerMapage.totalpage(criteria)); //총 글 몇개인지 (디비갔다와~)
		
//		log.info("total : " + total);
//		log.info("criteria.getSize() : " + criteria.getSize());
//		log.info("(int)Math.ceil(total/criteria.getSize()) : " + (int)Math.ceil(total*1.0/criteria.getSize()));
		criteria.setTotal_page((int)Math.ceil(criteria.getTotal() *1.0/criteria.getSize())); //총 페이지수 = 게시글수 / 한화면에 보여질 사이즈 (올림)
		
		criteria.setBlock_num((int)Math.ceil(criteria.getSize()/ 5)); // 블록 넘버 구하기 double이라 int로 캐스팅 후 올림 (5는 블록 수)
		criteria.setBlock_start(((criteria.getBlock_num() -1) * 5 ) +1 ); //블록 start (예 : 1, 6, 11)
		criteria.setBlock_end(criteria.getBlock_start() + 5 -1); //블록 끝 (예 : 5,10,15)
		
		if(criteria.getBlock_end() > criteria.getTotal_page()) { //totalpage 보다 블록이 더 클경우 (예 : totalpage2 <end블록 5 )
			criteria.setBlock_end(criteria.getTotal_page()); //블록의 끝변호는 2로 셋팅 
		}
		
//		System.out.println(criteria.toString());
		mav.addObject("reservationInfo", rv);
		mav.addObject("criteria", criteria);
		mav.setViewName("hos_reservation");
		
		return mav;
	}
	
//	명단가져오기
	@RequestMapping(value="/dateSearch.do")
	@ResponseBody
	public List<ReservationVO> dateSearch(@RequestParam String date, String number) {
		
		Map<String, String> mav = new HashMap<String,String>();
		mav.put("date", date);
		mav.put("number", number);
		List<ReservationVO> rv = partnerMapage.dateSearch(mav);

		return rv;
		
	}
	
}
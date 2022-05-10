package com.petcare.web.user.controller;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.petcare.web.common.utils.SMS;
import com.petcare.web.user.service.PartnerMyPageSMS;

@Controller
public class Partner_myPageSMSController {
	
	@Autowired
	private SMS sms;
	
	@Autowired
	private PartnerMyPageSMS partnersms;
	
	@Inject
	public Partner_myPageSMSController(PartnerMyPageSMS partnersms) {
		this.partnersms = partnersms;
	}
	
	@RequestMapping(value="/sms_reservation_ok.do" , method=RequestMethod.POST)
	@ResponseBody
	public int sms_reservation_ok(@RequestParam String number, String pet_num, String petName) {
		
		int result = partnersms.sms_reservation_ok(pet_num);
		String phoneNumber = number.replace("-", "");
		String msg = "[petCare]" + petName +" 예약이 확정되었습니다. 예약시간을 다시한번 확인해주세요.";
		sms.certifiedPhoneNumber(phoneNumber, msg);
		
		return result;
	}
	
	@RequestMapping(value="/sms_reservation_no.do", method=RequestMethod.POST)
	@ResponseBody
	public int sms_reservation_no(@RequestParam String number, String pet_num, String petName) {
		int result = partnersms.sms_reservation_no(pet_num);
		String phoneNumber = number.replace("-", "");
		String msg = "[petCare]" + petName +" 예약이 거절되었습니다. 다른 시간을 예약해주세요.";
		sms.certifiedPhoneNumber(phoneNumber, msg);
		
		return result;
	}
}

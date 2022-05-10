package com.petcare.web.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcare.web.user.dao.PartnerMyPageSMSDAO;

@Service
public class PartnerMyPageSMSImpl implements PartnerMyPageSMS {
	
	@Autowired
	private PartnerMyPageSMSDAO partnerMyPageSMS;
	
	@Override
	public int sms_reservation_ok(String petNum) {	
		return partnerMyPageSMS.sms_reservation_ok(petNum);
	}

	@Override
	public int sms_reservation_no(String petNum) {
		return partnerMyPageSMS.sms_reservation_no(petNum);
	}

}

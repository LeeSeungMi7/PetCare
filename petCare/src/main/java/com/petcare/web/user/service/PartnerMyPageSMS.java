package com.petcare.web.user.service;

public interface PartnerMyPageSMS {
	
	int sms_reservation_ok(String petNum);
	int sms_reservation_no(String petNum);
}

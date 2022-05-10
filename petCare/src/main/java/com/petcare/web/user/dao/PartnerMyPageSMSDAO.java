package com.petcare.web.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PartnerMyPageSMSDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int sms_reservation_ok(String petNum) {
		return sqlSessionTemplate.update("Partner_MyPage.reservation_ok",petNum);
	}
	
	public int sms_reservation_no(String petNum) {
		return sqlSessionTemplate.update("Partner_MyPage.reservation_no",petNum);
	}
}

package com.petcare.web.user.vo;

import lombok.Data;

@Data
public class ReservationVO {
	
	private int reservation_num;
	private String reservation_name; //보호자이름
	private String reservation_tel;  //보호자 번호
	private int rv_number; //보호자 번호
	private int rv_partner_number; //병원번호
	private String partner_name; //병원 이름
	private String rv_date;
	private String rv_time;
	private String rv_access;
	private String rv_petName;

}

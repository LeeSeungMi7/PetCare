package com.petcare.web.user.vo;

import lombok.Data;

@Data
public class ReservationVO {

	private int rv_number;
	private int rv_partner_number;
	private String rv_date;
	private String rv_time;
	private String rv_access;
	private String rv_petName;
}

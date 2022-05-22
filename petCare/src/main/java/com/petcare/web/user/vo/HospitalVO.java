package com.petcare.web.user.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class HospitalVO {
	private int review_num; //기본키 게시글 번호
	private int rw_number; //내 m_number
	private int rw_partner_number; //병원 m_number 리뷰게시글 번호여야함
	private String rw_content; //내용
	SimpleDateFormat dateFormat = new SimpleDateFormat ( "yyyy-MM-dd HH:mm");
	Date time = new Date();
	String rw_date = dateFormat.format(time); //시간
	private String rw_writer; //작성자
	private int m_address_class; //병원ip

}

package com.petcare.web.user.vo;

import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private int m_number;
	private String m_id; 
	private String m_pw;
	private String m_name;
	private String m_tel;	// 전화번호
	private int m_address_class;	// 카카오 api
	private String m_zipcode; // 우편번호
	private String m_address; // 주소(전체)
	private String m_address_detail; // 상세주소
	private String m_sido; // 시, 도
	private String m_dong; // 동
	private String m_role; // ENUM('0', '1') 0:일반사용자 1: 병원
	private String m_access;// ENUM('0', '1') 0: 로그인가능 1: 로그인불가
	private String p_file_name; // 사업자등록 파일명
	private String p_file_path = ""; // 사업자등록 파일경로
	private String p_weekday = ""; // 평일 운영
	private String p_weekend = ""; // 주말 운영
	private String p_breaktime = ""; // 점심 시간
	private String p_24hour = ""; // ENUM('0', '1') 0:24시 아님 1: 24시

	private String m_tel1;
	private String m_tel2;
	private String m_tel3;
	private String p_weekday1;
	private String p_weekday2;
	private String p_weekend1;
	private String p_weekend2;
	private String p_breaktime1;
	private String p_breaktime2;
	
	private List<MyPetVO> petList;
	private MyPetVO mypetVO;
	
}

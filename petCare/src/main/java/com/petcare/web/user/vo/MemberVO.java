package com.petcare.web.user.vo;

import lombok.Data;

@Data
public class MemberVO {
	
	int m_number;
	String m_id; 
	String m_pw;
	String m_name;
	String m_tel;	// 전화번호
	int m_address_class;	// 카카오 api
	String m_zipcode; // 우편번호
	String m_address; // 주소(전체)
	String m_address_detail; // 상세주소
	String m_sido; // 시, 도
	String m_dong; // 동
	String m_role; // ENUM('0', '1') 0:일반사용자 1: 병원
	String m_access;// ENUM('0', '1') 0: 로그인가능 1: 로그인불가
	int m_auth; // 메일인증여부
	String p_file_name = ""; // 사업자등록 파일명
	String p_file_path = ""; // 사업자등록 파일경로
	String p_weekday = ""; // 평일 운영
	String p_weekend = ""; // 주말 운영
	String p_breaktime = ""; // 점심 시간
	String p_24hour = ""; // ENUM('0', '1') 0:24시 아님 1: 24시
	
	String m_tel1;
	String m_tel2;
	String m_tel3;
	String p_weekday1;
	String p_weekday2;
	String p_weekend1;
	String p_weekend2;
	String p_breaktime1;
	String p_breaktime2;
	
	
}

package com.petcare.web.user.vo;

import lombok.Data;

@Data
public class Criteria {
	private int pageNum;
	private int size; //한페이지 당 출력 data 개수
	private int m_number; //회원 번호
	private int baord_num;
	private int faq_num;
	private int rw_partner_number;
	private int total_page;//페이지 전체
	private int total_block; //페이지 블록 전체
	private int block_num; //현재 페이지 블록
	private int block_start; //블록시작
	private int block_end; //블록 마지막
	private int total; //총 글 수
	private int pageConunt;

	public Criteria() {
		this(1,5,1);
	}
	
	public Criteria(int pageNum, int size, int pageConunt) {
		this.pageNum = pageNum;
		this.size =size;
		this.pageConunt = pageConunt;
	}
	
	public int getSkip() {
		return this.pageNum = (pageNum-1) *size;
	}
}

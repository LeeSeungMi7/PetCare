package com.petcare.web.user.service;

import java.util.List;

import com.petcare.web.user.vo.Criteria;
import com.petcare.web.user.vo.HospitalVO;
import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.MyPetVO;

public interface HospitalService {

	List<HospitalVO> commentList(Criteria criteria);

	int totalpage(Criteria criteria);

	void hospital_reply_write(HospitalVO hospitalVO);

	List<MyPetVO> hospital_reservation_mypet(int m_number);

	List<MemberVO> hospitalSearchForMapIds(int[] mapIds);

}

package com.petcare.web.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcare.web.user.dao.HospitalDAO;
import com.petcare.web.user.vo.Criteria;
import com.petcare.web.user.vo.HospitalVO;
import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.MyPetVO;

@Service
public class HospitalServiceImpl implements HospitalService{
	
	@Autowired
	private HospitalDAO hospitalDAO;

	@Override
	public List<HospitalVO> commentList(Criteria criteria) {
		return hospitalDAO.commentList(criteria);
	}

	@Override
	public int totalpage(Criteria criteria) {
		return hospitalDAO.totalpage(criteria);
	}

	@Override
	public void hospital_reply_write(HospitalVO hospitalVO) {
		hospitalDAO.hospital_reply_write(hospitalVO);
		
	}


	@Override
	public List<MyPetVO> hospital_reservation_mypet(int m_number) {
		return hospitalDAO.hospital_reservation_mypet(m_number);
	}

	@Override
	public List<MemberVO> hospitalSearchForMapIds(int[] mapIds) {
		return hospitalDAO.hospitalSearchForMapIds(mapIds);
	}



}

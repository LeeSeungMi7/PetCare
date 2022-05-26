package com.petcare.web.user.service;

import java.util.List;

import com.petcare.web.admin.vo.Ad_encyVO;
import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.QnaVO;
import com.petcare.web.user.vo.ShowVO;

public interface HomeService {
	List<ShowVO> show();
	List<QnaVO> qna();
	List<Ad_encyVO> ency();
	List<MemberVO> hospital();
}

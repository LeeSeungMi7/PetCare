package com.petcare.web.user.service;

import com.petcare.web.user.vo.MemberVO;

public interface KakaoService {
	MemberVO member_check(String kakao_id);
	void SingIn(MemberVO membervo);
	void reset_Delete(int m_number);
}

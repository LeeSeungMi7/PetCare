package com.petcare.web.user.service;

import java.util.List;

import com.petcare.web.admin.vo.Ad_encyVO;
import com.petcare.web.user.vo.Criteria;

public interface EncyService {
	public List<Ad_encyVO> enboard_page(Criteria cr);
	Ad_encyVO enread(int en_number);
	void increaseViewcnt(int en_number);
	int totalpage(Criteria cr);
}

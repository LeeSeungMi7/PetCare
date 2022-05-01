package com.petcare.web.admin.service;

import javax.servlet.http.HttpSession;

import com.petcare.web.admin.vo.AdminVO;

public interface AdminService {
	public AdminVO getAdmin(AdminVO vo);
	public void logout(HttpSession session);
	public boolean loginCheck(AdminVO vo, HttpSession session);
}

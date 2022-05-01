package com.petcare.web.admin.dao;

import javax.servlet.http.HttpSession;

import com.petcare.web.admin.vo.AdminVO;

public interface AdminDAO {
	public boolean loginCheck(AdminVO vo);
	public AdminVO getAdmin(AdminVO vo);
	public void logout(HttpSession session);
}

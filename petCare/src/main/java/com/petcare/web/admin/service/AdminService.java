package com.petcare.web.admin.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.petcare.web.admin.vo.AdminVO;
import com.petcare.web.user.vo.MemberVO;

public interface AdminService {
	public AdminVO getAdmin(AdminVO vo);
	public void logout(HttpSession session);
	public boolean loginCheck(AdminVO vo, HttpSession session);
	public List<MemberVO> getUserList() throws Exception;
	public List<MemberVO> getAccHosList() throws Exception;
	public List<MemberVO> getUnAccHosList() throws Exception;
	public void updateUser(String name) throws Exception;
}

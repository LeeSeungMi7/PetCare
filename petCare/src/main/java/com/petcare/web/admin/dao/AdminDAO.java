package com.petcare.web.admin.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.petcare.web.admin.vo.AdminVO;
import com.petcare.web.user.vo.MemberVO;

public interface AdminDAO {
	public boolean loginCheck(AdminVO vo);
	public AdminVO getAdmin(AdminVO vo);
	public void logout(HttpSession session);
	public List<MemberVO> getUserList() throws Exception;
	public List<MemberVO> getAccHosList() throws Exception;
	public List<MemberVO> getUnAccHosList() throws Exception;
	public void updateUser(String name) throws Exception;
	public void deleteUser(String name) throws Exception;
}
package com.petcare.web.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcare.web.user.dao.MyPetDAO;
import com.petcare.web.user.vo.MyPetVO;

@Service
public class MyPetServiceImpl implements MyPetService {
	
	@Autowired
	private MyPetDAO mypetDAO;
	
	@Override
	public List<MyPetVO> petadd(MyPetVO mypetVO) {
		return mypetDAO.petadd(mypetVO);
	}

}

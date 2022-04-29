package com.petcare.web.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petcare.web.user.vo.MyPetVO;

@Repository
public class MyPetDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//펫 임시등록
	public void petadd(MyPetVO myPetVO){
		sqlSessionTemplate.insert("MyPetDAO.add_pet", myPetVO);
	}
}

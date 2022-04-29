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
	public List<MyPetVO> petadd(MyPetVO myPetVO){
		return sqlSessionTemplate.selectList("MyPetDAO.add_pet", myPetVO);
	}
}

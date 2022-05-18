package com.petcare.web.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petcare.web.admin.vo.Ad_encyVO;
import com.petcare.web.user.vo.QnaVO;
import com.petcare.web.user.vo.ShowVO;

@Repository
public class HomeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;	
	
	 public List<ShowVO> show(){
		return sqlSessionTemplate.selectList("Home.Show");
	 }
	
	 public List<QnaVO> qna() {
		return sqlSessionTemplate.selectList("Home.Qna");
	 }
	
	public List<Ad_encyVO> ency() {
		return sqlSessionTemplate.selectList("Home.Ency");
	}
}

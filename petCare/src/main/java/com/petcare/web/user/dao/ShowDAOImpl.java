package com.petcare.web.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.petcare.web.user.vo.ShowVO;

@Repository
public class ShowDAOImpl implements ShowDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//게시글 작성
	@Override
	public void insert(ShowVO showVO) {
		System.out.println(showVO);
		sqlSessionTemplate.insert("show.insert", showVO);
		
	}
	//게시글 상세보기
	@Override
	public ShowVO read(int b_hit) {
		return sqlSessionTemplate.selectOne("show.updateArticle", b_hit);
	}
	
	//게시글 수정
	@Override
	public void update(ShowVO showVO){
		sqlSessionTemplate.update("show.updateArticle", showVO);
		
	}
	
	//게시글 삭제
	@Override
	public void delete(int b_hit) {
		sqlSessionTemplate.delete("board.deleteArticle", b_hit);
		
	}

	//게시글 목록 조회
	@Override
	public List<ShowVO> listAll() {
		return sqlSessionTemplate.selectList("show.listAll");
	}

	//게시글 조회수 증가
	@Override
	public void increaseViewcnt(int b_hit) {
		sqlSessionTemplate.update("board.increaseViewcnt", b_hit);
		
	}


}

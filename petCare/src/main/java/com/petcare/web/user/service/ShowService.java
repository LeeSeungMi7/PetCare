package com.petcare.web.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.petcare.web.user.vo.ShowVO;

public interface ShowService {
	//자랑하기
	
	//게시글 작성
	public void insert(ShowVO showVO);
	//게시글 상세보기
	public ShowVO read(int b_hit);
	//게시글 수정
	public void update(ShowVO showVO) throws Exception;
	//게시글 삭제
	public void delete(int b_hit) throws Exception;
	//게시글 전체 목록
	public List<ShowVO> listAll()throws Exception;
	//게시글 조회
	public void increaseViewcnt(int b_hit, HttpSession session) throws Exception;

	
}

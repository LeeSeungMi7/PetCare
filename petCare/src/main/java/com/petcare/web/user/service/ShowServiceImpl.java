package com.petcare.web.user.service;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcare.web.user.dao.ShowDAO;
import com.petcare.web.user.vo.ShowVO;

@Service
public class ShowServiceImpl implements ShowService{

	@Autowired
	private ShowDAO showDao;
	
	//게시글 쓰기
	@Override
	public void insert(ShowVO showVO){
		System.out.println(showVO);
		String title = showVO.getB_title(); //제목
		String content = showVO.getB_content(); //내용	
	}
	
	//게시글 상세보기
	@Override
	public ShowVO read(int b_hit){
		return showDao.read(b_hit);
	}
	//게시글 수정
	@Override
	public void update(ShowVO showVO){
		showDao.update(showVO);
	}
	//게시글 삭제
	@Override
	public void delete(int b_hit){
		showDao.delete(b_hit);
	}
	//게시글 목록
	@Override
	public List<ShowVO> listAll(){
		return showDao.listAll();
	}
	@Override
	public void increaseViewcnt(int b_hit, HttpSession session){
		long update_time=0;
		//세션에 저장된 조회시간 검색
		if(session.getAttribute("update_time_"+b_hit) != null) {
			update_time = (long)session.getAttribute("update_time_" + b_hit);
		}
		//시스템의 현재시간을 current_time에 저장
		long current_time = System.currentTimeMillis();
		if(current_time - update_time > 5*1000) {
			showDao.increaseViewcnt(b_hit);
			//세션에 시간을 저장
			session.setAttribute("update_time_" + b_hit, current_time);
		}
	}
	
	
	
	
}

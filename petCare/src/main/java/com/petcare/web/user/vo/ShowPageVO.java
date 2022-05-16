package com.petcare.web.user.vo;

import lombok.Data;

@Data
public class ShowPageVO {
	private int pageNum;
	private int size; //한페이지 당 출력 data 개수
	private int total_page;//페이지 전체
	private int total_block; //페이지 블록 전체
	private int block_num; //현재 페이지 블록
	private int block_start; //블록시작
	private int block_end; //블록 마지막
	private int total; //총 글 수
	
	public ShowPageVO() {
		this(1,5);
	}
	
	public ShowPageVO(int pageNum, int size) {
		this.pageNum = pageNum;
		this.size =size;
	}
	
	public int getSkip() {
		return this.pageNum = (pageNum-1) *size;
	}
	
//	public static final int PAGE_SCALE = 4; //페이지당 게시물 수
//	public static final int BLOCK_SCALE=4; //화면당 페이지 수
//	private int curPage; //현재 페이지 수
//	private int prevPage; //이전 페이지
//	private int nextPage; //다음 페이지
//	private int totPage; //전체 페이지 갯수
//	private int totBlock; //전체 페이지 블록 갯수
//	private int curBlock; //현재 페이지 블록
//	private int prevBlock; //이전 페이지 블록
//	private int nextBlock; //다음 페이지 블록
//	
//	private int pageBegin; //#{start}
//	private int pageEnd; //#{end}
//	private int blockBegin; //현재 페이지 블록의 시작번호
//	private int blockEnd; //현재 페이지 블록의 끝번호
//	
//	public ShowPageVO (int count, int curPage) {
//		curBlock = 1; //현재 페이지 블록 번호
//		this.curPage = curPage; //현재 페이지 설정
//		setTotPage(count); //전체 페이지 갯수 계산
//		setPageRange();
//		setTotBlock(); //전체 페이지 블록 갯수 계산
//		setBlockRange();//페이지 블록의 시작, 끝 번호 계산
//	}
//	public void setBlockRange() { //현재 페이지가 몇번째 페이지 블록에 속하는지 계산
//		curBlock = (int)Math.ceil((curPage-1) / BLOCK_SCALE)+1;
//		blockBegin = (curBlock-1)*BLOCK_SCALE+1;
//		blockEnd = blockBegin+BLOCK_SCALE-1;
//		if(blockEnd > totPage) blockEnd = totPage;
//		prevPage = (curPage == 1)? 1:(curBlock-1)*BLOCK_SCALE;
//		nextPage = curBlock > totBlock ? (curBlock*BLOCK_SCALE) : (curBlock*BLOCK_SCALE)+1;
//		if(nextPage >= totPage) nextPage = totPage;
//	}
//	public void setPageRange() {
//		pageBegin = (curPage-1)*PAGE_SCALE+1;
//		pageEnd = pageBegin+PAGE_SCALE-1;
//	}
//	public int getCurPage() {
//		return curPage;
//	}
//	public void setCurPage(int curPage) {
//		this.curPage = curPage;
//	}
//	public int getPrevPage() {
//		return prevPage;
//	}
//	public void setPrevPage(int prevPage) {
//		this.prevPage = prevPage;
//	}
//	public int getNextPage() {
//		return nextPage;
//	}
//	public void setNextPage(int nextPage) {
//		this.nextPage = nextPage;
//	}
//	public int getTotPage() {
//		return totPage;
//	}
//	public void setTotPage(int count) {
//		totPage = (int) Math.ceil(count*1.0 / PAGE_SCALE);
//	}
//	public int getTotBlock() {
//		return totBlock;
//	}
//	public void setTotBlock() {
//		totBlock = (int)Math.ceil(totPage / BLOCK_SCALE);
//	}
//	public int getCurBlock() {
//		return curBlock;
//	}
//	public void setCurBlock(int curBlock) {
//		this.curBlock = curBlock;
//	}
//	public int getPrevBlock() {
//		return prevBlock;
//	}
//	public void setPrevBlock(int prevBlock) {
//		this.prevBlock = prevBlock;
//	}
//	public int getNextBlock() {
//		return nextBlock;
//	}
//	public void setNextBlock(int nextBlock) {
//		this.nextBlock = nextBlock;
//	}
//	public int getPageBegin() {
//		return pageBegin;
//	}
//	public void setPageBegin(int pageBegin) {
//		this.pageBegin = pageBegin;
//	}
//	public int getPageEnd() {
//		return pageEnd;
//	}
//	public void setPageEnd(int pageEnd) {
//		this.pageEnd = pageEnd;
//	}
//	public int getBlockBegin() {
//		return blockBegin;
//	}
//	public void setBlockBegin(int blockBegin) {
//		this.blockBegin = blockBegin;
//	}
//	public int getBlockEnd() {
//		return blockEnd;
//	}
//	public void setBlockEnd(int blockEnd) {
//		this.blockEnd = blockEnd;
//	}
//	
	
}

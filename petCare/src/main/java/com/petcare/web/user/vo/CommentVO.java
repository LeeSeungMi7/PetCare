package com.petcare.web.user.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class CommentVO {
	private int comment_num;
	private int c_num; //게시글 번호
	private String c_writer;//작성자
	private int c_member_num; //회원번호
	private String c_kind; //자랑하기는 1
	private String c_content; //내용
	SimpleDateFormat dateFormat = new SimpleDateFormat ( "yyyy-MM-dd HH:mm");
	Date time = new Date();
	String c_date = dateFormat.format(time); //시간
	private String c_pro; //m_role값
}

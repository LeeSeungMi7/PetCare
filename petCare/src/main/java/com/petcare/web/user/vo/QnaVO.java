package com.petcare.web.user.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {
	   private int faq_num;
	   private int f_number;
	   private String f_writer; //작성자
	   private String f_title; //제목
	   SimpleDateFormat dateFormat = new SimpleDateFormat ( "yyyy-MM-dd HH:mm");
	   Date time = new Date();
	   String f_date = dateFormat.format(time); //시간
	   private String f_content; //내용
	   private int f_hit; //조회수
	   private String f_file_name; //파일이름
	   private String f_file_path; //파일경로
	   private String f_pro; //
	
	
	
}

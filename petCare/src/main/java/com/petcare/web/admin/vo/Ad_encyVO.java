package com.petcare.web.admin.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class Ad_encyVO {
	   private int en_number;
	   private String en_title; //제목
	   SimpleDateFormat dateFormat = new SimpleDateFormat ( "yyyy-MM-dd HH:mm");
	   Date time = new Date();
	   String en_date = dateFormat.format(time); //시간
	   private String en_content; //내용
	   private int en_hit; //조회수
	   private String en_file_name; //파일이름
	   private String en_file_path; //파일경로
}
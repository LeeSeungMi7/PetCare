package com.petcare.web.user.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class ShowVO {

   private int board_num;
   private int b_number;
   private String b_writer; //작성자
   private String b_title; //제목
   SimpleDateFormat dateFormat = new SimpleDateFormat ( "yyyy-MM-dd HH:mm");
   Date time = new Date();
   String b_date = dateFormat.format(time); //시간
   private String b_content; //내용
   private int b_hit; //조회수
   private String b_file_name; //파일이름
   private String b_file_path; //파일경로
   
}

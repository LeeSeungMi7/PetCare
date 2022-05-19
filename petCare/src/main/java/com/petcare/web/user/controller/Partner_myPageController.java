package com.petcare.web.user.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.petcare.web.user.service.FileUploadService;
import com.petcare.web.user.service.PartnerMyPageService;
import com.petcare.web.user.vo.Criteria;
import com.petcare.web.user.vo.MemberVO;
import com.petcare.web.user.vo.ReservationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class Partner_myPageController {
	
	@Autowired
	private PartnerMyPageService partnerMapage;
	
	@Autowired
	private FileUploadService fileUploadService;
	
	@Inject
	public Partner_myPageController(PartnerMyPageService partnerMapage) {
		this.partnerMapage = partnerMapage;
	}
	
	@RequestMapping(value="/partner_mypage_password.do")
	public String user_mypage_password() {
		return "partner_now_password";
	}
	
	@RequestMapping(value="/Partner_password_check.do")
	@ResponseBody
	public Map<String,Integer> password_check(@RequestParam int m_number, String password, HttpSession session) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		MemberVO member = (MemberVO) session.getAttribute("user");
		
		boolean pass = BCrypt.checkpw(password, member.getM_pw());
		if(!pass) {
			map.put("mas", 0);
		}else {
			map.put("mas", 1);
		}
		return map;
	}
//	마이페이지 연결
	@RequestMapping(value="/partner_mypage_update.do" , method=RequestMethod.POST)
	public ModelAndView partner_mypage(@RequestParam int m_number) {
		
		ModelAndView mav = new ModelAndView();
		MemberVO memberVO = partnerMapage.partner_mypage(m_number);
		
		String tel[] = memberVO.getM_tel().split("-");
		memberVO.setM_tel1(tel[0]);
		memberVO.setM_tel2(tel[1]);
		memberVO.setM_tel3(tel[2]);
		
		String weekday[] = memberVO.getP_weekday().split("/");
		memberVO.setP_weekday1(weekday[0]);
		memberVO.setP_weekday2(weekday[1]);
		
		String weekend[] = memberVO.getP_weekend().split("/");
		memberVO.setP_weekend1(weekend[0]);
		memberVO.setP_weekend2(weekend[1]);
		
		String breaktime[] = memberVO.getP_breaktime().split("/");
		memberVO.setP_breaktime1(breaktime[0]);
		memberVO.setP_breaktime2(breaktime[1]);

		mav.addObject("member", memberVO);
		mav.setViewName("hos_update");
		
		return mav;
	}
	
//	병원 마이페이지 수정
	@RequestMapping(value="/partner_modify.do", method=RequestMethod.POST)
	public String partner_modify(@ModelAttribute MemberVO memberVO, @RequestParam("file") MultipartFile file) {
		
		if(memberVO.getP_24hour()!="") {
			memberVO.setP_24hour("1");
		}else {
			memberVO.setP_24hour("0");
		}
		
		String hashedPw = BCrypt.hashpw(memberVO.getM_pw(), BCrypt.gensalt());
		memberVO.setM_pw(hashedPw);
		
		memberVO.setM_tel(memberVO.getM_tel1()+"-"+memberVO.getM_tel2()+"-"+memberVO.getM_tel3());
		
		if(memberVO.getM_address()!= "" || memberVO.getM_address()!= null) {
			String address[] = memberVO.getM_address().split(" ");
			
			memberVO.setM_sido(address[0] +" "+ address[1]);
			memberVO.setM_dong(address[2] +" "+ address[3]);		
		}
		
		memberVO.setP_weekday(memberVO.getP_weekday1()+"/"+ memberVO.getP_weekday2());
		memberVO.setP_weekend(memberVO.getP_weekend1()+"/"+ memberVO.getP_weekend2());
		memberVO.setP_breaktime(memberVO.getP_breaktime1()+"/"+memberVO.getP_breaktime2());
		
		if(file.getOriginalFilename() == "" || file.getOriginalFilename() == null) {

			partnerMapage.partner_modify(memberVO);
		
		}else {			

			memberVO.setP_file_name(file.getOriginalFilename());
			FileUploadService.FileUploadResult fileResult = fileUploadService.fileUpload(file, "사업자등록증/", memberVO.getP_file_name());
			memberVO.setP_file_path(fileResult.getUrl());
		
			partnerMapage.partner_modifyfile(memberVO);
		}
		return "/home";
		
	}
	
//	병원 예약 연결
	@RequestMapping( value ="/hos_reservation.do")
	public ModelAndView hos_reservation(@RequestParam int m_number,@RequestParam(defaultValue="0") int pageNum) {
		Criteria criteria;
		
		if(pageNum == 0) {
			criteria = new Criteria();
		}else {
			criteria = new Criteria(pageNum, 5);
		}

		criteria.setM_number(m_number);
		
		ModelAndView mav = new ModelAndView();
	
		List<ReservationVO> rv = partnerMapage.partner_reservationPage(criteria);
		criteria.setTotal(partnerMapage.totalpage(criteria)); //총 글 몇개인지 (디비갔다와~)
		
//		log.info("total : " + total);
//		log.info("criteria.getSize() : " + criteria.getSize());
//		log.info("(int)Math.ceil(total/criteria.getSize()) : " + (int)Math.ceil(total*1.0/criteria.getSize()));
		criteria.setTotal_page((int)Math.ceil(criteria.getTotal() *1.0/criteria.getSize())); //총 페이지수 = 게시글수 / 한화면에 보여질 사이즈 (올림)
		
		criteria.setBlock_num((int)Math.ceil(criteria.getSize()/ 5)); // 블록 넘버 구하기 double이라 int로 캐스팅 후 올림 (5는 블록 수)
		criteria.setBlock_start(((criteria.getBlock_num() -1) * 5 ) +1 ); //블록 start (예 : 1, 6, 11)
		criteria.setBlock_end(criteria.getBlock_start() + 5 -1); //블록 끝 (예 : 5,10,15)
		
		if(criteria.getBlock_end() > criteria.getTotal_page()) { //totalpage 보다 블록이 더 클경우 (예 : totalpage2 <end블록 5 )
			criteria.setBlock_end(criteria.getTotal_page()); //블록의 끝변호는 2로 셋팅 
		}
		
//		System.out.println(criteria.toString());
		mav.addObject("reservationInfo", rv);
		mav.addObject("criteria", criteria);
		mav.setViewName("hos_reservation");
		
		return mav;
	}
	
//	명단가져오기
	@RequestMapping(value="/dateSearch.do")
	@ResponseBody
	public List<ReservationVO> dateSearch(@RequestParam String date, String number) {
		
		Map<String, String> mav = new HashMap<String,String>();
		mav.put("date", date);
		mav.put("number", number);
		List<ReservationVO> rv = partnerMapage.dateSearch(mav);

		return rv;
		
	}
	
//	엑셀
	@RequestMapping("/excel_down.do")
	public void excel_down(@RequestParam String date, String number, HttpServletResponse response) throws IOException {
		
		Map<String, String> mav = new HashMap<String,String>();
		
		mav.put("date", date);
		mav.put("number", number);
		List<ReservationVO> rv = partnerMapage.dateSearch(mav);
		

		Workbook wb = new HSSFWorkbook();
        Sheet sheet = wb.createSheet();
		
		Font font = wb.createFont();

		font.setFontName("맑은 고딕");
		font.setFontHeight((short)(14*20)); //사이즈
		font.setBoldweight(Font.BOLDWEIGHT_BOLD); //볼드 (굵게)


		sheet.setDefaultColumnWidth(20); 
		sheet.setDefaultRowHeightInPoints(20); 
	
		Row titleRow = sheet.createRow(0); 
		int titleColNum = 0;

		Cell titleCell = titleRow.createCell(titleColNum); 
		titleCell.setCellValue("우리병원 예약 목록 [ " + date + "]");
		
		
		Row headRow = sheet.createRow(2);
		int headerCol = 0;

		CellStyle dataStyle = wb.createCellStyle();
		
		dataStyle.setAlignment(CellStyle.ALIGN_CENTER); //가운데 정렬
		dataStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER); //높이 가운데 정렬
		//배경색
		dataStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		dataStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
		//테두리 선 (우,좌,위,아래)
		dataStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
		dataStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		dataStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
		dataStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		
		CellStyle cell = wb.createCellStyle();
		cell.setAlignment(CellStyle.ALIGN_LEFT); //가운데 정렬
		cell.setVerticalAlignment(CellStyle.VERTICAL_CENTER); //높이 가운데 정렬
		
		//테두리 선 (우,좌,위,아래)
		cell.setBorderRight(HSSFCellStyle.BORDER_THIN);
		cell.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		cell.setBorderTop(HSSFCellStyle.BORDER_THIN);
		cell.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		
		
		Cell headerCell = headRow.createCell(headerCol++);
		headerCell.setCellValue("번호");
		headerCell.setCellStyle(dataStyle);

		headerCell = headRow.createCell(headerCol++);
		headerCell.setCellValue("날짜");
		headerCell.setCellStyle(dataStyle);

		headerCell = headRow.createCell(headerCol++);
		headerCell.setCellValue("예약시간");
		headerCell.setCellStyle(dataStyle);

		headerCell = headRow.createCell(headerCol++);
		headerCell.setCellValue("보호자 이름");
		headerCell.setCellStyle(dataStyle);

		headerCell = headRow.createCell(headerCol++);
		headerCell.setCellValue("전화 번호");
		headerCell.setCellStyle(dataStyle);

		headerCell = headRow.createCell(headerCol++);
		headerCell.setCellValue("반려동물");
		headerCell.setCellStyle(dataStyle);

		// 데이터 삽입
		int rowNum = 3;
		int cellNum = 0;
		Row dataRow = null; // 반복문으로 돌릴거양
		Cell dataCell = null;

		
		 for (int i=0; i <rv.size(); i++) { 
		 cellNum = 0; dataRow =
		 sheet.createRow(rowNum++);

		  dataCell = dataRow.createCell(cellNum++); // 열 한줄씩 추가
		  dataCell.setCellValue(i+1);
		  dataCell.setCellStyle(cell);
		  
		  dataCell = dataRow.createCell(cellNum++);
		  dataCell.setCellValue(rv.get(i).getRv_date());
		  dataCell.setCellStyle(cell);
		  
		  dataCell = dataRow.createCell(cellNum++);
		  dataCell.setCellValue(rv.get(i).getRv_time());
		  dataCell.setCellStyle(cell);
		  
		  dataCell = dataRow.createCell(cellNum++);
		  dataCell.setCellValue(rv.get(i).getReservation_name());
		  dataCell.setCellStyle(cell);
		  
		  dataCell = dataRow.createCell(cellNum++);
		  dataCell.setCellValue(rv.get(i).getReservation_tel());
		  dataCell.setCellStyle(cell);
		  
		  dataCell = dataRow.createCell(cellNum++);
		  dataCell.setCellValue(rv.get(i).getRv_petName());
		  dataCell.setCellStyle(cell);

		  
		 }

		 	response.setContentType("ms-vnd/excel");
			response.setHeader("Content-Disposition", "attachment;filename=list.xls");
			wb.write(response.getOutputStream());
		 
		   

		 
	}
	
}
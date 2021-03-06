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
//	??????????????? ??????
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
	
//	?????? ??????????????? ??????
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
			FileUploadService.FileUploadResult fileResult = fileUploadService.fileUpload(file, "??????????????????/", memberVO.getP_file_name());
			memberVO.setP_file_path(fileResult.getUrl());
		
			partnerMapage.partner_modifyfile(memberVO);
		}
		return "redirect:/logout.do";
		
	}
	
//	?????? ?????? ??????
	@RequestMapping( value ="/hos_reservation.do")
	public ModelAndView hos_reservation(@RequestParam int m_number,@RequestParam(defaultValue="0") int pageNum, @RequestParam(defaultValue="0") int pageConunt, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberVO member = (MemberVO) session.getAttribute("user");
		if(member.getM_number()==m_number) {
			Criteria criteria;
			
			if(pageNum == 0) {
				criteria = new Criteria();
			}else {
				criteria = new Criteria(pageNum, 5, pageConunt);
			}
	
			criteria.setM_number(m_number);
			
			List<ReservationVO> rv = partnerMapage.partner_reservationPage(criteria);
			criteria.setTotal(partnerMapage.totalpage(criteria)); //??? ??? ???????????? (???????????????~)
			
//			log.info("criteria.getSize() : " + criteria.getSize());
//			log.info("(int)Math.ceil(total/criteria.getSize()) : " + (int)Math.ceil(total*1.0/criteria.getSize()));
			criteria.setTotal_page((int)Math.ceil(criteria.getTotal() *1.0/criteria.getSize())); //??? ???????????? = ???????????? / ???????????? ????????? ????????? (??????)
			
			criteria.setBlock_num((int)Math.ceil(criteria.getPageConunt())); // ?????? ?????? ????????? double?????? int??? ????????? ??? ?????? (5??? ?????? ???)
			criteria.setBlock_start(((criteria.getBlock_num() -1) * 5 ) +1 ); //?????? start (??? : 1, 6, 11)
			criteria.setBlock_end(criteria.getBlock_start() + 5 -1); //?????? ??? (??? : 5,10,15)

			
			if(criteria.getBlock_end() > criteria.getTotal_page()) { //totalpage ?????? ????????? ??? ????????? (??? : totalpage2 <end?????? 5 )
				criteria.setBlock_end(criteria.getTotal_page()); //????????? ???????????? 2??? ?????? 
			}
			
			mav.addObject("reservationInfo", rv);
			mav.addObject("criteria", criteria);
			mav.setViewName("hos_reservation");
		}else {
			mav.setViewName("error");
		}
		
		return mav;
	}
	
//	??????????????????
	@RequestMapping(value="/dateSearch.do")
	@ResponseBody
	public List<ReservationVO> dateSearch(@RequestParam String date, String number) {
		
		Map<String, String> mav = new HashMap<String,String>();
		mav.put("date", date);
		mav.put("number", number);
		List<ReservationVO> rv = partnerMapage.dateSearch(mav);

		return rv;
		
	}
	
//	??????
	@RequestMapping("/excel_down.do")
	public void excel_down(@RequestParam String date, String number, HttpServletResponse response) throws IOException {
		
		Map<String, String> mav = new HashMap<String,String>();
		
		mav.put("date", date);
		mav.put("number", number);
		List<ReservationVO> rv = partnerMapage.dateSearch(mav);
		

		Workbook wb = new HSSFWorkbook();
        Sheet sheet = wb.createSheet();
		
		Font font = wb.createFont();

		font.setFontName("?????? ??????");
		font.setFontHeight((short)(14*20)); //?????????
		font.setBoldweight(Font.BOLDWEIGHT_BOLD); //?????? (??????)


		sheet.setDefaultColumnWidth(20); 
		sheet.setDefaultRowHeightInPoints(20); 
	
		Row titleRow = sheet.createRow(0); 
		int titleColNum = 0;

		Cell titleCell = titleRow.createCell(titleColNum); 
		titleCell.setCellValue("???????????? ?????? ?????? [ " + date + "]");
		
		
		Row headRow = sheet.createRow(2);
		int headerCol = 0;

		CellStyle dataStyle = wb.createCellStyle();
		
		dataStyle.setAlignment(CellStyle.ALIGN_CENTER); //????????? ??????
		dataStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER); //?????? ????????? ??????
		//?????????
		dataStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		dataStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
		//????????? ??? (???,???,???,??????)
		dataStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
		dataStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		dataStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
		dataStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		
		CellStyle cell = wb.createCellStyle();
		cell.setAlignment(CellStyle.ALIGN_LEFT); //????????? ??????
		cell.setVerticalAlignment(CellStyle.VERTICAL_CENTER); //?????? ????????? ??????
		
		//????????? ??? (???,???,???,??????)
		cell.setBorderRight(HSSFCellStyle.BORDER_THIN);
		cell.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		cell.setBorderTop(HSSFCellStyle.BORDER_THIN);
		cell.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		
		
		Cell headerCell = headRow.createCell(headerCol++);
		headerCell.setCellValue("??????");
		headerCell.setCellStyle(dataStyle);

		headerCell = headRow.createCell(headerCol++);
		headerCell.setCellValue("??????");
		headerCell.setCellStyle(dataStyle);

		headerCell = headRow.createCell(headerCol++);
		headerCell.setCellValue("????????????");
		headerCell.setCellStyle(dataStyle);

		headerCell = headRow.createCell(headerCol++);
		headerCell.setCellValue("????????? ??????");
		headerCell.setCellStyle(dataStyle);

		headerCell = headRow.createCell(headerCol++);
		headerCell.setCellValue("?????? ??????");
		headerCell.setCellStyle(dataStyle);

		headerCell = headRow.createCell(headerCol++);
		headerCell.setCellValue("????????????");
		headerCell.setCellStyle(dataStyle);

		// ????????? ??????
		int rowNum = 3;
		int cellNum = 0;
		Row dataRow = null; // ??????????????? ????????????
		Cell dataCell = null;

		
		 for (int i=0; i <rv.size(); i++) { 
		 cellNum = 0; dataRow =
		 sheet.createRow(rowNum++);

		  dataCell = dataRow.createCell(cellNum++); // ??? ????????? ??????
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
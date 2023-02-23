package com.kh.kmanager.bo.order.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.kmanager.bo.order.model.service.OrderService;
import com.kh.kmanager.bo.order.model.vo.Order;

@Controller
public class Bo_OrderController {
	
	@Autowired
	public OrderService orderService;

	/**
	 * BO 전체 주문내역 조회 페이지 이동 처리 및 현재 월의 전체 주문내역 조회를 해주는 메소드 - 백성현
	 * @return : BO 전체 주문내역 조회 페이지 이동
	 */
	@RequestMapping("allOrderList.bo")
	public String selectAllOrder(Model model) {
		
		String nowMonth = new SimpleDateFormat("yyyy-MM").format(new Date());
		int listCount = orderService.selectListCount(nowMonth);
		
		ArrayList<Order> list = orderService.selectAllOrderList(nowMonth);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("list", list);
		
		return "bo/boOrder/boSelectAllOrder";
	}
	
	/**
	 * BO 전체 주문내역 조회 페이지의 검색옵션으로 검색해주는 메소드 - 백성현
	 * @return : ajax 데이터
	 */
	@ResponseBody
	@RequestMapping(value="optionSearch.bo", produces="application/json; charset=UTF-8")
	public String selectOrder_Option(String currentDate, String endDate, String search_orderNo, String search_keyword, String keywordType) {
		
		HashMap<String, String> option = new HashMap<String, String>();
		option.put("currentDate", currentDate);
		option.put("endDate", endDate);
		option.put("orderNo", search_orderNo);
		option.put("keyword", search_keyword);
		option.put("keywordType", keywordType);
		
		ArrayList<Order> list = orderService.selectOrderList(option);
		
		for(int i = 0; i < list.size(); i++) {
			
			// System.out.println(list.get(i));
			// System.out.println(list.get(i).getPrintOrder());
			// System.out.println(list.get(i).printOrder());
			
			list.get(i).setPrintOrder(list.get(i).printOrder());
		}
		
		return new Gson().toJson(list);
	}
	
	/**
	 * BO 전체 주문내역 조회 페이지의 주문내역들 중 선택한 내역들 엑셀다운로드 메소드 - 백성현
	 */
	@RequestMapping("excelDownload_OrderList.bo")
	public void excelDown_OrderList(String[] orderArr_input, HttpServletResponse response) throws IOException {

		String[] arr = orderArr_input;

		ArrayList<Order> list = new ArrayList<>();
		
		for(String s : arr) {
			
			Order o = new Order();
			String[] prop = s.split("/");
			
			o.setOrderNo(prop[0].split("=")[1]);
			o.setOrderDate(prop[1].split("=")[1]);
			o.setOrderPrice(Integer.parseInt(prop[2].split("=")[1]));
			o.setCouponYn(prop[3].split("=")[1]);
			o.setOrderStatus(prop[4].split("=")[1]);
			o.setProductNo(Integer.parseInt(prop[5].split("=")[1]));
			o.setConNo(Integer.parseInt(prop[6].split("=")[1]));
			o.setProductName(prop[7].split("=")[1]);
			o.setConName(prop[8].split("=")[1]);
			o.setPaymentBill(Integer.parseInt(prop[9].split("=")[1]));
			o.setSellerName(prop[10].split("=")[1]);
			o.setBuyConfirmDate(prop[11].split("=")[1]);
			o.setPoCouponPrice(Integer.parseInt(prop[12].split("=")[1]));
			o.setBoCouponPrice(Integer.parseInt(prop[13].split("=")[1]));
			o.setCommission(Integer.parseInt(prop[14].split("=")[1]));
			
			list.add(o);
		}
		
		// 엑셀로 가공
	    Workbook workbook = new HSSFWorkbook();
	    
	    // 시트 생성
	    Sheet sheet = workbook.createSheet("1");
	    
	    // 행, 열, 열번호
	    Row row = null;
	    Cell cell = null;
	    int rowNo = 0;
	    
	    // 테이블 헤더용 스타일
	    CellStyle headStyle = workbook.createCellStyle();
	    // 가는 경계선
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);
	    // 배경 노란색
	    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    // 데이터용 경계 스타일 테두리 지정
	    CellStyle bodyStyle = workbook.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);
	    
	    // 헤더명 설정
	    String[] headerArray = {"구매확정일시", "주문일시", "주문번호", "상품명", "입점업체명", "주문자명", "주문금액", "업체할인금액", "키보더할인액", "결제금액", "판매수수료", "결제수단"};
	    row = sheet.createRow(rowNo++);
	    
	    for(int i = 0; i < headerArray.length; i++) {
	    	
	    	cell = row.createCell(i);
	    	cell.setCellStyle(headStyle);
	    	cell.setCellValue(headerArray[i]);
	    }
	    
	    // 데이터 셀 작성
	    for(Order excelData : list) {
	    	
	    	row = sheet.createRow(rowNo++);
	    	
	    	cell = row.createCell(0);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(excelData.getBuyConfirmDate());
	    	
	    	cell = row.createCell(1);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(excelData.getOrderDate());
	    	
	    	cell = row.createCell(2);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(excelData.getOrderNo());
	    	
	    	cell = row.createCell(3);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(excelData.getProductName());
	    	
	    	cell = row.createCell(4);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(excelData.getSellerName());
	    	
	    	cell = row.createCell(5);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(excelData.getConName());
	    	
	    	cell = row.createCell(6);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(excelData.getOrderPrice());
	    	
	    	cell = row.createCell(7);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(excelData.getPoCouponPrice());
	    	
	    	cell = row.createCell(8);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(excelData.getBoCouponPrice());
	    	
	    	cell = row.createCell(9);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(excelData.getPaymentBill());
	    	
	    	cell = row.createCell(10);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(excelData.getCommission());
	    	
	    	cell = row.createCell(11);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue("카드"); 
	    }
	    
	    // 컨텐츠 타입과 파일명 지정
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode("전체주문내역조회.xls", "UTF-8"));
	    
	    // 엑셀 출력
	    workbook.write(response.getOutputStream());
	    workbook.close();
	}
	
}

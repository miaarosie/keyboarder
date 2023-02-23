package com.kh.kmanager.po.order.controller;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.kmanager.member.model.vo.Member;
import com.kh.kmanager.po.order.model.service.JKW_OrderService;
import com.kh.kmanager.po.order.model.vo.PoOrder;

@Controller
public class JKW_PoOrderController {

	@Autowired
	private JKW_OrderService JKW_OrderService;
	
	/**
	 * PO 배송관리 전체조회
	 * * 주멋돌
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("delivery.poOrder")
	public String deliveryMain(Model model, HttpSession session) {
		
		if(session.getAttribute("searchDate") != null) {
			
			session.removeAttribute("searchDate");
		}
		
		Member m = (Member)session.getAttribute("loginUser");
		
		int selNo = m.getSellerNo();
		
		int status1 = JKW_OrderService.orderStatus1(selNo);
		
		int status2 = JKW_OrderService.orderStatus2(selNo);
		
		int status3 = JKW_OrderService.orderStatus3(selNo);
		
		int status4 = JKW_OrderService.orderStatus4(selNo);
		
		int orderCount = JKW_OrderService.orderCount(selNo);
		
		ArrayList<PoOrder> ordList = JKW_OrderService.orderList(selNo);
		
		model.addAttribute("status1", status1);
		model.addAttribute("status2", status2);
		model.addAttribute("status3", status3);
		model.addAttribute("status4", status4);
		model.addAttribute("orderCount", orderCount);
		model.addAttribute("ordList", ordList);
		
		return "po/poOrder/poOrderDeliveryMain";
	}
	
	/**
	 * PO 배송관리 월별 조회
	 * * 주멋돌
	 * @param model
	 * @param session
	 * @param searchDeliveryMonth
	 * @return
	 */
	@RequestMapping("SearchDate.poOrder")
	public String deliverySearchDate(Model model, HttpSession session, String searchDeliveryMonth) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		int selNo = m.getSellerNo();
		
		String searchDate = searchDeliveryMonth + "-01";
		
		session.setAttribute("searchDate", searchDeliveryMonth);
		
		PoOrder poOrder = new PoOrder(selNo, searchDate);
				
		int dateStatus1 = JKW_OrderService.dateOrderStatus1(poOrder);
		
		int dateStatus2 = JKW_OrderService.dateOrderStatus2(poOrder);
		
		int dateStatus3 = JKW_OrderService.dateOrderStatus3(poOrder);
		
		int dateStatus4 = JKW_OrderService.dateOrderStatus4(poOrder);
		
		int dateOrderCount = JKW_OrderService.dateOrderCount(poOrder);
		
		ArrayList<PoOrder> dateList = JKW_OrderService.deliverySearchDate(poOrder);
				
		model.addAttribute("dateStatus1", dateStatus1);
		model.addAttribute("dateStatus2", dateStatus2);
		model.addAttribute("dateStatus3", dateStatus3);
		model.addAttribute("dateStatus4", dateStatus4);
		model.addAttribute("dateOrderCount", dateOrderCount);
		model.addAttribute("dateList", dateList);
		model.addAttribute("searchDate", searchDate);
		
		return "po/poOrder/poOrderDeliveryMain";
	}
	
	/**
	 * PO 전자세금 계산서 
	 * - 엑셀 다운로드(월 선택시 해당 월만 엑셀 다운로드)
	 * * 주멋돌
	 * @param response
	 * @param model
	 * @param session
	 * @throws Exception
	 */
	@RequestMapping("excelDownload.poOrder")
	public void excelDownload(HttpServletResponse response, Model model, HttpSession session) throws Exception {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		int selNo = m.getSellerNo();
						
		ArrayList<PoOrder> ordList = JKW_OrderService.orderList(selNo);
		
		// 셀 생성
	    HSSFWorkbook objWorkBook = new HSSFWorkbook();
        HSSFSheet objSheet = null;
        HSSFRow objRow = null;
        HSSFCell objCell = null;
        
        // 제목 폰트
        HSSFFont font = objWorkBook.createFont();
        font.setFontHeightInPoints((short)10);
        font.setFontName("맑은 고딕");
        
        //제목 스타일에 폰트 적용, 정렬</span>
        HSSFCellStyle styleHd = objWorkBook.createCellStyle(); // 제목 스타일
        styleHd.setFont(font);
        
        objSheet = objWorkBook.createSheet("첫번째 시트"); // 워크 시트 생성
        
        // 1행
        objRow = objSheet.createRow(0);
        objRow.setHeight ((short)0x150);
        
    	objCell = objRow.createCell(0);
        objCell.setCellValue("주문번호");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(1);
        objCell.setCellValue("배송상태");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(2);
        objCell.setCellValue("상품코드");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(3);
        objCell.setCellValue("상품명");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(4);
        objCell.setCellValue("판매단가");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(5);
        objCell.setCellValue("할인쿠폰");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(6);
        objCell.setCellValue("판매자부담할인액");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(7);
        objCell.setCellValue("키보더부담할인액");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(8);
        objCell.setCellValue("주문금액");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(9);
        objCell.setCellValue("구매자ID");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(10);
        objCell.setCellValue("수령자명");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(11);
        objCell.setCellValue("결제일");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(12);
        objCell.setCellValue("주문확정여부");
        objCell.setCellStyle(styleHd);

        // 2행
        for(int i = 0; i < ordList.size(); i++) {
        	
	        objRow = objSheet.createRow(i + 1);
	        objRow.setHeight ((short)0x150);
	        	
        	int count = 0;
        	
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(ordList.get(i).getOrderNo());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        if(ordList.get(i).getOrderStatus().equals("1")) {
	        	
		        objCell = objRow.createCell(count);
		        objCell.setCellValue("배송중");
		        objCell.setCellStyle(styleHd);
	        }
	        else if(ordList.get(i).getOrderStatus().equals("2")) {
	        	
		        objCell = objRow.createCell(count);
		        objCell.setCellValue("배송완료");
		        objCell.setCellStyle(styleHd);
	        }
	        else if(ordList.get(i).getOrderStatus().equals("3")) {
	        	
		        objCell = objRow.createCell(count);
		        objCell.setCellValue("구매확정");
		        objCell.setCellStyle(styleHd);
	        }
	        else if(ordList.get(i).getOrderStatus().equals("4")) {
				
			    objCell = objRow.createCell(count);
			    objCell.setCellValue("환불");
			    objCell.setCellStyle(styleHd);
			}
	        
	        count++;
	        		        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(ordList.get(i).getProductNo());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(ordList.get(i).getProductName());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(ordList.get(i).getProductPrice());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        if(ordList.get(i).getKeyCouponPrice() != 0) {
	        	
		        objCell = objRow.createCell(count);
		        objCell.setCellValue(ordList.get(i).getKeyCouponPrice());
		        objCell.setCellStyle(styleHd);
	        }
	        else if(ordList.get(i).getStoCouponPrice() != 0) {
	        	
	        	objCell = objRow.createCell(count);
		        objCell.setCellValue(ordList.get(i).getStoCouponPrice());
		        objCell.setCellStyle(styleHd);
	        }
	        else {
	        	
	        	objCell = objRow.createCell(count);
		        objCell.setCellValue("0");
		        objCell.setCellStyle(styleHd);
	        }
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(ordList.get(i).getKeyCouponPrice());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(ordList.get(i).getStoCouponPrice());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(ordList.get(i).getOrderPrice());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(ordList.get(i).getConId());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(ordList.get(i).getConName());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(ordList.get(i).getOrderDate());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        if(ordList.get(i).getOrderStatus().equals("3")) {
		        
	        	objCell = objRow.createCell(count);
		        objCell.setCellValue("Y");
		        objCell.setCellStyle(styleHd);
	        }
	        else {
	        	
	        	objCell = objRow.createCell(count);
		        objCell.setCellValue("N");
		        objCell.setCellStyle(styleHd);
	        }
        }
        
        response.setContentType("Application/Msexcel");
        response.setHeader("Content-Disposition", "ATTachment; Filename=" 
        		+ URLEncoder.encode(ordList.get(0).getSellerName() + "_배송관리", "UTF-8") + ".xls");
        
	    OutputStream fileOut  = response.getOutputStream();
	    objWorkBook.write(fileOut);
	    fileOut.close();
	
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
	}
	
	@RequestMapping("dateExcelDownload.poOrder")
	public void dateExcelDownload(HttpServletResponse response, Model model, HttpSession session, String searchDate) throws Exception {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		int selNo = m.getSellerNo();
				
		PoOrder poOrder = new PoOrder(selNo, searchDate);
		
		ArrayList<PoOrder> ordList = JKW_OrderService.deliverySearchDate(poOrder);
								
		// 셀 생성
	    HSSFWorkbook objWorkBook = new HSSFWorkbook();
        HSSFSheet objSheet = null;
        HSSFRow objRow = null;
        HSSFCell objCell = null;
        
        // 제목 폰트
        HSSFFont font = objWorkBook.createFont();
        font.setFontHeightInPoints((short)10);
        font.setFontName("맑은 고딕");
        
        //제목 스타일에 폰트 적용, 정렬</span>
        HSSFCellStyle styleHd = objWorkBook.createCellStyle(); // 제목 스타일
        styleHd.setFont(font);
        
        objSheet = objWorkBook.createSheet("첫번째 시트"); // 워크 시트 생성
        
        // 1행
        objRow = objSheet.createRow(0);
        objRow.setHeight ((short)0x150);
        
    	objCell = objRow.createCell(0);
        objCell.setCellValue("주문번호");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(1);
        objCell.setCellValue("배송상태");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(2);
        objCell.setCellValue("상품코드");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(3);
        objCell.setCellValue("상품명");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(4);
        objCell.setCellValue("판매단가");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(5);
        objCell.setCellValue("할인쿠폰");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(6);
        objCell.setCellValue("판매자부담할인액");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(7);
        objCell.setCellValue("키보더부담할인액");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(8);
        objCell.setCellValue("주문금액");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(9);
        objCell.setCellValue("구매자ID");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(10);
        objCell.setCellValue("수령자명");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(11);
        objCell.setCellValue("결제일");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(12);
        objCell.setCellValue("주문확정여부");
        objCell.setCellStyle(styleHd);

        // 2행
        for(int i = 0; i < ordList.size(); i++) {
        	
	        objRow = objSheet.createRow(i + 1);
	        objRow.setHeight ((short)0x150);
	        	
        	int count = 0;
        	
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(ordList.get(i).getOrderNo());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        if(ordList.get(i).getOrderStatus().equals("1")) {
	        	
		        objCell = objRow.createCell(count);
		        objCell.setCellValue("배송중");
		        objCell.setCellStyle(styleHd);
	        }
	        else if(ordList.get(i).getOrderStatus().equals("2")) {
	        	
		        objCell = objRow.createCell(count);
		        objCell.setCellValue("배송완료");
		        objCell.setCellStyle(styleHd);
	        }
	        else if(ordList.get(i).getOrderStatus().equals("3")) {
	        	
		        objCell = objRow.createCell(count);
		        objCell.setCellValue("구매확정");
		        objCell.setCellStyle(styleHd);
	        }
	        else if(ordList.get(i).getOrderStatus().equals("4")) {
				
			    objCell = objRow.createCell(count);
			    objCell.setCellValue("환불");
			    objCell.setCellStyle(styleHd);
			}
	        
	        count++;
	        		        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(ordList.get(i).getProductNo());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(ordList.get(i).getProductName());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(ordList.get(i).getProductPrice());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        if(ordList.get(i).getKeyCouponPrice() != 0) {
	        	
		        objCell = objRow.createCell(count);
		        objCell.setCellValue(ordList.get(i).getKeyCouponPrice());
		        objCell.setCellStyle(styleHd);
	        }
	        else if(ordList.get(i).getStoCouponPrice() != 0) {
	        	
	        	objCell = objRow.createCell(count);
		        objCell.setCellValue(ordList.get(i).getStoCouponPrice());
		        objCell.setCellStyle(styleHd);
	        }
	        else {
	        	
	        	objCell = objRow.createCell(count);
		        objCell.setCellValue("0");
		        objCell.setCellStyle(styleHd);
	        }
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(ordList.get(i).getKeyCouponPrice());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(ordList.get(i).getStoCouponPrice());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(ordList.get(i).getOrderPrice());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(ordList.get(i).getConId());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(ordList.get(i).getConName());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(ordList.get(i).getOrderDate());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        if(ordList.get(i).getOrderStatus().equals("3")) {
		        
	        	objCell = objRow.createCell(count);
		        objCell.setCellValue("Y");
		        objCell.setCellStyle(styleHd);
	        }
	        else {
	        	
	        	objCell = objRow.createCell(count);
		        objCell.setCellValue("N");
		        objCell.setCellStyle(styleHd);
	        }
        }
        
        response.setContentType("Application/Msexcel");
        response.setHeader("Content-Disposition", "ATTachment; Filename=" 
        		+ URLEncoder.encode(ordList.get(0).getSellerName() + "_" + ordList.get(0).getExcelDate() + "월_배송관리", "UTF-8") + ".xls");
        
	    OutputStream fileOut  = response.getOutputStream();
	    objWorkBook.write(fileOut);
	    fileOut.close();
	
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
	}
	
	
	
}


































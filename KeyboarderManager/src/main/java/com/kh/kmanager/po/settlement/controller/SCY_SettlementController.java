package com.kh.kmanager.po.settlement.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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
import com.kh.kmanager.po.settlement.model.service.SettlementService;
import com.kh.kmanager.po.settlement.model.vo.Settlement;
import com.kh.kmanager.po.settlement.model.vo.Withdraw;

@Controller
public class SCY_SettlementController {
	
	@Autowired
	private SettlementService settlementService;

	@RequestMapping("excelDownload.kmoney")
	public void excelDownloadKmoney(Withdraw w, HttpServletResponse response, Model model, HttpSession session) throws Exception {
		
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		
		w.setSellerNo(sellerNo);
		
		ArrayList<Withdraw> wlist = settlementService.selectWithdrawRequestList(w);
		
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
        
        objSheet = objWorkBook.createSheet(w.getStartDate() + " ~ " + w.getEndDate() + " 출금신청내역"); // 워크 시트 생성
        
        // 1행
        objRow = objSheet.createRow(0);
        objRow.setHeight((short)0x150);
        
    	objCell = objRow.createCell(0);
        objCell.setCellValue("요청업체명");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(1);
        objCell.setCellValue("출금요청일");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(2);
        objCell.setCellValue("출금요청금액");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(3);
        objCell.setCellValue("출금요청계좌번호");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(4);
        objCell.setCellValue("예금주");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(5);
        objCell.setCellValue("처리결과");
        objCell.setCellStyle(styleHd);
        
        // 2행 ~ 마지막행
        for(int i = 0; i < wlist.size(); i++) {
        	
	        objRow = objSheet.createRow(i + 1);
	        objRow.setHeight ((short)0x150);
	        	
        	int count = 0;
        	
	        objCell = objRow.createCell(count++);
	        objCell.setCellValue(wlist.get(i).getSellerName());
	        objCell.setCellStyle(styleHd);
	        
	        objCell = objRow.createCell(count++);
	        objCell.setCellValue(wlist.get(i).getWithdrawDate());
	        objCell.setCellStyle(styleHd);
	        		        
	        objCell = objRow.createCell(count++);
	        objCell.setCellValue(wlist.get(i).getWithdrawMoney());
	        objCell.setCellStyle(styleHd);
	        	        
	        objCell = objRow.createCell(count++);
	        objCell.setCellValue(wlist.get(i).getAccountNo());
	        objCell.setCellStyle(styleHd);
	        
	        objCell = objRow.createCell(count++);
	        objCell.setCellValue(wlist.get(i).getRepName());
	        objCell.setCellStyle(styleHd);
	        
	        if(wlist.get(i).getReqResult().equals("N")) {
		        objCell = objRow.createCell(count++);
		        objCell.setCellValue("미처리");
		        objCell.setCellStyle(styleHd);
		        
	        } else {
	        	objCell = objRow.createCell(count);
		        objCell.setCellValue("완료");
		        objCell.setCellStyle(styleHd);
	        }
        }
        
        response.setContentType("Application/Msexcel");
        response.setHeader("Content-Disposition", "ATTachment; Filename=" 
        		+ URLEncoder.encode(wlist.get(0).getSellerName() + "_K-Money_출금신청내역" + w.getStartDate() + "_" + w.getEndDate(), "UTF-8") + ".xls");
        
	    OutputStream fileOut  = response.getOutputStream();
	    objWorkBook.write(fileOut);
	    fileOut.close();
	
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
	}
	
	//정산 내역 상세보기 전체 엑셀 다운로드_성진
	@RequestMapping("excelDownload.sDetail")
	public void excelDownloadSettlementDetail(HttpSession session, PoOrder o, Model model, HttpServletResponse response) throws IOException {
		
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		o.setSellerNo(sellerNo);
		String sellerName= ((Member)session.getAttribute("loginUser")).getSellerName();
	
		ArrayList<PoOrder> list = settlementService.excelDownloadSettlementDetail(o);
		      
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
        
        objSheet = objWorkBook.createSheet(o.getStartDate() + " ~ " + o.getEndDate() + "정산상세내역"); // 워크 시트 생성
        
        // Header
        objRow = objSheet.createRow(0);
        objRow.setHeight ((short)0x150);
        
        objCell = objRow.createCell(0);
        objCell.setCellValue("구분");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(1);
        objCell.setCellValue("취소여부");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(2);
        objCell.setCellValue("매출일");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(3);
        objCell.setCellValue("주문번호");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(4);
        objCell.setCellValue("주문자");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(5);
        objCell.setCellValue("상품번호");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(6);
        objCell.setCellValue("상품명");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(7);
        objCell.setCellValue("판매단가");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(8);
        objCell.setCellValue("할인쿠폰");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(9);
        objCell.setCellValue("수수료");
        objCell.setCellStyle(styleHd);
        
      //body
        for(int i=0; i<list.size(); i++) {
        	 objRow = objSheet.createRow(i + 1);
 	        objRow.setHeight ((short)0x150);
 	        	
         	int count = 0;
         	
         	String orderStatus="";
         	
         	switch(list.get(i).getOrderStatus(	)) {
         	
         	case "1" : orderStatus= "배송중"; 	break;
         	case "2" : orderStatus= "배송완료"; 	break;
         	case "3" :orderStatus= "구매확정"; 	break;
         	case "4" :orderStatus= "환불"; 		break;
         	}
         	
         	// 구분
         	objCell = objRow.createCell(count);
	        objCell.setCellValue(orderStatus);
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        
	        // 취소여부
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(orderStatus);
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 매출일
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getOrderDate());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 주문번호
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getOrderNo());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 주문자
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getConName());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 상품번호
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getProductNo());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 상품명
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getProductName());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 판매단가
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getPrice());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 할인쿠폰
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getCouponPrice());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 수수료
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getCommition());
	        objCell.setCellStyle(styleHd);
	        count++;
        }
        
        response.setContentType("Application/Msexcel");
        response.setHeader("Content-Disposition", "ATTachment; Filename=" 
        		+ URLEncoder.encode(sellerName + "_정산상세내역", "UTF-8") + ".xls");
        
	    OutputStream fileOut  = response.getOutputStream();
	    objWorkBook.write(fileOut);
	    fileOut.close();
	
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
	}
}

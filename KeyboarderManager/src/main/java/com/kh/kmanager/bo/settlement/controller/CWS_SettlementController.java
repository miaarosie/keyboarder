package com.kh.kmanager.bo.settlement.controller;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.kmanager.bo.settlement.model.service.CWS_SettlementService;
import com.kh.kmanager.bo.settlement.model.vo.CWS_Settlement;
import com.kh.kmanager.member.model.vo.Member;

@Controller
public class CWS_SettlementController {

	private LocalDate now;
	private DateTimeFormatter formatter;
	private String formatedNow;
	
	@Autowired
	private CWS_SettlementService settlementService;
	
	@RequestMapping("commitionSales.bo")
	public String commitionSalesPage(HttpSession session) {
		
		if(session.getAttribute("searchCondition")!=null) {
			session.removeAttribute("searchCondition");
		}
		
		ArrayList <Member> sellerList = settlementService.selectSeller();
		ArrayList <CWS_Settlement> list = settlementService.selectSellerCommition();							
		
        // 현재 날짜 구하기
        now = LocalDate.now();
 
        // 포맷 정의	
        formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
 
        // 포맷 적용
        formatedNow = now.format(formatter);     
        
        // 결과값 필터링
        for(int i = 0; i < list.size(); i++) {
        	
			if(list.get(i).getSettleDate()!=null) {
				
	        	int day2 = Integer.parseInt(formatedNow.substring(8)); // 오늘이 몇일인지
	        	
	        	int month1 = Integer.parseInt(list.get(i).getSettleDate().substring(5, 7)); // 정산월
	        	int month2 = Integer.parseInt(formatedNow.substring(5, 7)); // 오늘이 몇달인지
	        	
	        	int year1 = Integer.parseInt(list.get(i).getSettleDate().substring(0, 4)); // 정산연도
	        	int year2 = Integer.parseInt(formatedNow.substring(0, 4)); // 오늘이 몇년도인지
	        	
	        	if(month1 == month2 && year1 == year2) { // 정산일이 오늘 기준 월과 연도가 같으면(아직 이번달이 끝나지 않은 경우)
	        		list.remove(list.get(i)); // 해당 행 제거
	        		--i;
	        	} else if(month1 == 12 // 정산일이 12월일때,
	        			&& month2 == 1 // 이번달이 1월이면서
	        			&& year1 == (year2 - 1) // 정산연도가 오늘 연도 기준 작년이며
	        			&& day2 < 2) {   // 오늘이 2일보다 전일때
	        		list.remove(list.get(i));
	        		--i;
	        	} else if(year1 == year2 && month1 == (month2 - 1) && day2 < 2) { // 정산월이 12월이 아니고, 오늘 기준 저번달이고, 오늘이 아직 3일이 안됐을 때   
	        		list.remove(list.get(i));
	        		--i;
	        	}
				
			} else {
				list.remove(i);
				--i;
			}
        	

        }
        
        for(int i = 0; i < list.size(); i++) {
        	
        	if(list.get(i).getSettleDate()!=null) {
        		
        		// 날짜 양식 맞춰주기 (월을 뽑아오므로 1일 붙여주기)
        		String endSettleDate = list.get(i).getSettleDate();
        		
        		int settleDateYear = Integer.parseInt((endSettleDate.substring(0, 4)));
        		int settleDateMonth = Integer.parseInt((endSettleDate.substring(5, 7)));       
                
                // 해당 월의 마지막 일수 구하기
                Calendar cal = Calendar.getInstance();

                cal.set(settleDateYear, settleDateMonth, 1);

                endSettleDate = list.get(i).getSettleDate() + "-" + cal.getActualMaximum(Calendar.DAY_OF_MONTH);
                
                list.get(i).setSettleDate(endSettleDate);
        		
        	}
        	

        }

		
        
		session.setAttribute("sellerList", sellerList);
		
		session.setAttribute("list", list);
		
		return "bo/boSettlement/commitionSales";
	}
	
	@RequestMapping("searchSettlement.bo")
	public String searchBoSettlement(HttpSession session, Model model, String seller, String searchSettlementDate) {
		
		String searchDate = searchSettlementDate + "-01";
		
		CWS_Settlement searchCondition = new CWS_Settlement(seller, searchDate);
		
		ArrayList <CWS_Settlement> list = settlementService.searchSellerCommition(searchCondition);
		
        // 현재 날짜 구하기
        now = LocalDate.now();
 
        // 포맷 정의	
        formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
 
        // 포맷 적용
        formatedNow = now.format(formatter);     
        
        
        
        // 결과값 중 이번달 건 빼기(이번달이 안끝난 경우)
        for(int i = 0; i < list.size(); i++) {
        	
        	if(list.get(i).getSettleDate()!=null) {
        		
            	if(list.get(i).getSettleDate().equals(formatedNow.substring(0, 7))) { // 결과값이 이번달과 같으면
            		list.remove(list.get(i)); // 해당 행 제거
            		--i;
            	}
        		
        	} else {
				list.remove(i);
				--i;
			}
        	

        }

        for(int i = 0; i < list.size(); i++) {
        	
        	if(list.get(i).getSettleDate()!=null) {
        		
        		
        		// 날짜 양식 맞춰주기 (월을 뽑아오므로 1일 붙여주기)
        		String endSettleDate = list.get(i).getSettleDate();
        		
        		int settleDateYear = Integer.parseInt((endSettleDate.substring(0, 4)));
        		int settleDateMonth = Integer.parseInt((endSettleDate.substring(5, 7)));       
                
                // 해당 월의 마지막 일수 구하기
                Calendar cal = Calendar.getInstance();

                cal.set(settleDateYear, settleDateMonth, 1);

                endSettleDate = list.get(i).getSettleDate() + "-" + cal.getActualMaximum(Calendar.DAY_OF_MONTH);
                
                list.get(i).setSettleDate(endSettleDate);
        	}
        	
        }

        session.setAttribute("searchCondition", searchCondition);
		session.setAttribute("list", list);
		
		return "bo/boSettlement/commitionSales";
	}
	
	@ResponseBody
	@RequestMapping(value="sellerBillModal.bo")
	public CWS_Settlement sellerBillModal(HttpSession session, String sellerName, String settleDate, int commition) {	
		
		String requestDate = settleDate.substring(0, 7); // 'yyyy-mm'
		
		CWS_Settlement modalRequest = new CWS_Settlement(sellerName, requestDate);
		
		CWS_Settlement result = settlementService.sellerBillModal(modalRequest);
		
		result.setSettleDate(settleDate); // 테이블의 값(해당 달의 말일)을 그대로 넣어주기  
        result.setModalWriteDate(settleDate);
        result.setCommition(commition);
        result.setSupplyValue((int)(commition/1.1));
        result.setTaxAmount(commition - (int)(commition/1.1));
        
        
		return result;		
	}
	
	@RequestMapping("storeSettlement.bo")
	public String storeSettlementPage(HttpSession session) {
		
		if(session.getAttribute("searchCondition")!=null) {
			session.removeAttribute("searchCondition");
		}
		
		ArrayList <Member> sellerList = settlementService.selectSeller();
		ArrayList <CWS_Settlement> list = settlementService.selectStoreSettlement();
		
		
		for(int i = 0; i < list.size(); i ++) {
			if(list.get(i).getSettleDate()!=null) {
				list.get(i).setSettleDate(list.get(i).getSettleDate().substring(0, 10));
				list.get(i).setTotalOrderPrice(list.get(i).getOrderPrice() - list.get(i).getScouponPrice() - list.get(i).getKcouponPrice());
				list.get(i).setTotalDeductible(list.get(i).getScouponPrice() + list.get(i).getKcouponPrice() - list.get(i).getCommition() + list.get(i).getKcouponPrice());
				list.get(i).setTotalCouponPrice(list.get(i).getScouponPrice() + list.get(i).getKcouponPrice());
			} else {
				list.remove(i);
				--i;
			}			
		};
		
		
		session.setAttribute("sellerList", sellerList);
		session.setAttribute("list", list);
		
		return "bo/boSettlement/storeSettlement";
	}
	
	
	@RequestMapping("searchStoreSettlement.bo")
	public String searchStoreSettlement(HttpSession session, String seller, String searchSettlementDate1, String searchSettlementDate2) {
		
		CWS_Settlement searchCondition = new CWS_Settlement(1, seller, searchSettlementDate1, searchSettlementDate2);
		
		ArrayList <CWS_Settlement> list = settlementService.searchStoreSettlement(searchCondition);
		
		for(int i = 0; i < list.size(); i ++) {
			if(list.get(i).getSettleDate()!=null) {
				list.get(i).setSettleDate(list.get(i).getSettleDate().substring(0, 10));
				list.get(i).setTotalOrderPrice(list.get(i).getOrderPrice() - list.get(i).getScouponPrice() - list.get(i).getKcouponPrice());
				list.get(i).setTotalDeductible(list.get(i).getScouponPrice() + list.get(i).getKcouponPrice() - list.get(i).getCommition() + list.get(i).getKcouponPrice());
				list.get(i).setTotalCouponPrice(list.get(i).getScouponPrice() + list.get(i).getKcouponPrice());
			} else {
				list.remove(i);
				--i;
			}

		};

		session.setAttribute("searchCondition", searchCondition);
		session.setAttribute("list", list);
		
		return "bo/boSettlement/storeSettlement";
	}
	
	@RequestMapping("excelSettlement.bo")
	public void excelDownload(HttpServletResponse response, Model model, HttpSession session) throws Exception {
		
		ArrayList <CWS_Settlement> list = settlementService.selectStoreSettlement();
		
		for(int i = 0; i < list.size(); i ++) {
			if(list.get(i).getSettleDate()!=null) {
				list.get(i).setSettleDate(list.get(i).getSettleDate().substring(0, 10));
				list.get(i).setTotalOrderPrice(list.get(i).getOrderPrice() - list.get(i).getScouponPrice() - list.get(i).getKcouponPrice());
				list.get(i).setTotalDeductible(list.get(i).getScouponPrice() + list.get(i).getKcouponPrice() - list.get(i).getCommition() + list.get(i).getKcouponPrice());
				list.get(i).setTotalCouponPrice(list.get(i).getScouponPrice() + list.get(i).getKcouponPrice());
			} else {
				list.remove(i);
				--i;
			}

		};
		
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
        objCell.setCellValue("정산일");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(1);
        objCell.setCellValue("업체코드");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(2);
        objCell.setCellValue("업체명");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(3);
        objCell.setCellValue("주문금액(a)");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(4);
        objCell.setCellValue("입점사부담액(b)");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(5);
        objCell.setCellValue("keyboar-der 부담액(c)");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(6);
        objCell.setCellValue("합계(b+c)");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(7);
        objCell.setCellValue("총 주문금액(a-(b+c))");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(8);
        objCell.setCellValue("판매수수료(d)");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(9);
        objCell.setCellValue("수수료할인액(e)");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(10);
        objCell.setCellValue("총 공제액((b+c)-d+e)");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(11);
        objCell.setCellValue("정산액(k-money 전환액, (a-d+e))");
        objCell.setCellStyle(styleHd);
        

        // 2행
        for(int i = 0; i < list.size(); i++) {
        	
	        objRow = objSheet.createRow(i + 1);
	        objRow.setHeight ((short)0x150);
	        objSheet.autoSizeColumn(i);
	        
        	int count = 0;
        	
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getSettleDate());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getSellerNo());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        		        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getSellerName());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getOrderPrice());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getScouponPrice());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getKcouponPrice());
	        objCell.setCellStyle(styleHd);

	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getTotalCouponPrice());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getTotalOrderPrice());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getCommition());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getKcouponPrice());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getTotalDeductible());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getSettleDept());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
        }
        
        response.setContentType("Application/Msexcel");
        response.setHeader("Content-Disposition", "ATTachment; Filename=" 
        		+ URLEncoder.encode("입점업체 정산", "UTF-8") + ".xls");
        
	    OutputStream fileOut  = response.getOutputStream();
	    objWorkBook.write(fileOut);
	    fileOut.close();
	
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
	}
		
	@RequestMapping("excelSearchSettlement.bo")
	public void searchedExcelDownload(HttpServletResponse response, Model model, HttpSession session, String conditionName, String conditionDate1, String conditionDate2) throws Exception {
		
		CWS_Settlement searchCondition = new CWS_Settlement(1, conditionName, conditionDate1, conditionDate2);
		
		ArrayList <CWS_Settlement> list = settlementService.searchStoreSettlement(searchCondition);
		
		for(int i = 0; i < list.size(); i ++) {
			if(list.get(i).getSettleDate()!=null) {
				list.get(i).setSettleDate(list.get(i).getSettleDate().substring(0, 10));
				list.get(i).setTotalOrderPrice(list.get(i).getOrderPrice() - list.get(i).getScouponPrice() - list.get(i).getKcouponPrice());
				list.get(i).setTotalDeductible(list.get(i).getScouponPrice() + list.get(i).getKcouponPrice() - list.get(i).getCommition() + list.get(i).getKcouponPrice());
				list.get(i).setTotalCouponPrice(list.get(i).getScouponPrice() + list.get(i).getKcouponPrice());
			} else {
				list.remove(i);
				--i;
			}

		};
		
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
        objCell.setCellValue("정산일");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(1);
        objCell.setCellValue("업체코드");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(2);
        objCell.setCellValue("업체명");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(3);
        objCell.setCellValue("주문금액(a)");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(4);
        objCell.setCellValue("입점사부담액(b)");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(5);
        objCell.setCellValue("keyboar-der 부담액(c)");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(6);
        objCell.setCellValue("합계(b+c)");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(7);
        objCell.setCellValue("총 주문금액(a-(b+c))");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(8);
        objCell.setCellValue("판매수수료(d)");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(9);
        objCell.setCellValue("수수료할인액(e)");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(10);
        objCell.setCellValue("총 공제액((b+c)-d+e)");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(11);
        objCell.setCellValue("정산액(k-money 전환액, (a-d+e))");
        objCell.setCellStyle(styleHd);
        

        // 2행
        for(int i = 0; i < list.size(); i++) {
        	
	        objRow = objSheet.createRow(i + 1);
	        objRow.setHeight ((short)0x150);
	        objSheet.autoSizeColumn(i);
	        
        	int count = 0;
        	
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getSettleDate());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getSellerNo());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        		        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getSellerName());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getOrderPrice());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getScouponPrice());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getKcouponPrice());
	        objCell.setCellStyle(styleHd);

	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getTotalCouponPrice());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getTotalOrderPrice());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getCommition());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getKcouponPrice());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getTotalDeductible());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getSettleDept());
	        objCell.setCellStyle(styleHd);
	        
	        count++;
	        
        }
        
        response.setContentType("Application/Msexcel");
        response.setHeader("Content-Disposition", "ATTachment; Filename=" 
        		+ URLEncoder.encode(conditionName + "(" + conditionDate1 + ")-(" + conditionDate2 + ")", "UTF-8") + ".xls");
        
	    OutputStream fileOut  = response.getOutputStream();
	    objWorkBook.write(fileOut);
	    fileOut.close();
	
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
	}
	
}

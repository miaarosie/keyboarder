package com.kh.kmanager.po.settlement.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.kmanager.po.order.model.vo.PoOrder;
import com.kh.kmanager.po.settlement.model.vo.Settlement;
import com.kh.kmanager.po.settlement.model.vo.Withdraw;

public interface SettlementService {

	// 출금신청내역 insert 용 - 채영
	public int insertWithdraw(Withdraw w);
	
	// 출금신청내역 리스트 조회용 - 채영
	public ArrayList<Withdraw> selectWithdrawRequestList(Withdraw w);

	// k-money 잔액관리 메인페이지용 - 채영
	public Settlement selectKmoneySettlement(int sellerNo);

	//정산 상세보기 페이지-성진
	public ArrayList<Settlement>selectSettleDetailList(PoOrder o);

	//정산 합산 내역 조회-성진
	public ArrayList<Settlement> selectSettleSumList(PoOrder o);
	
	// 정산내역전제조회 - 장미
	public ArrayList<Settlement> selectSettleTotalList(Settlement set);
	
	// 정산내역 기간별조회 - 장미
	public ArrayList<Settlement> searchSettleList(Settlement set);
	
	// 전자세금계산서 조회 - 건우
	ArrayList<Settlement> selectElectronicList(int selNo);
	
	// 전자세금계산서 모달 팝업 - 건우
	Settlement sellerBillModal(Settlement modalRequest);
	
	// 전자세금계산서 날짜 조회 - 건우
	ArrayList<Settlement> selectElectronicDateList(Settlement settlement); 
	
	// 정산내역 전체조회 (당월) 엑셀다운로드 -장미
	ArrayList<Settlement> settleExcelTotalList(Settlement set);
	
	// 정산내역 기간조회 엑셀다운로드 -장미
	ArrayList<Settlement> searchSettleExcelList(Settlement set);
	
	// PO 수수료 내역 조회 - 백성현
	Settlement selectCommissionList(HashMap<String, String> optionDefault);
	
	// PO 수수료 내역 조회기간 옵션 조회 - 백성현
	ArrayList<Settlement> selectCommissionList_Option(HashMap<String, String> option);

	//정산내역 상세조회 엑셀다운로드(성진)
	public ArrayList<PoOrder> excelDownloadSettlementDetail(PoOrder o);
}

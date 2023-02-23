package com.kh.kmanager.po.settlement.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kmanager.po.order.model.vo.PoOrder;
import com.kh.kmanager.po.settlement.model.dao.PoSettlementDao;
import com.kh.kmanager.po.settlement.model.vo.Settlement;
import com.kh.kmanager.po.settlement.model.vo.Withdraw;

@Service
public class SettlementServiceImpl implements SettlementService {

	@Autowired
	private PoSettlementDao settlementDao;
	
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 출금신청내역 insert 용 메소드 - 채영
	 */
	@Override
	public int insertWithdraw(Withdraw w) {
		return settlementDao.insertWithdraw(sqlSession, w);
	}

	/**
	 * 출금신청내역 전체 리스트 조회용 - 채영
	 */
	@Override
	public ArrayList<Withdraw> selectWithdrawRequestList(Withdraw w) {
		return settlementDao.selectWithdrawRequestList(sqlSession, w);
	}

	/**
	 * K-money 잔액관리 메인페이지용 금액 조회용 - 채영
	 * @return : 총 잔액, 정산확정금액, 정산예정금액, 송금예정잔액, 출금가능금액
	 */
	@Override
	public Settlement selectKmoneySettlement(int sellerNo) {
		return settlementDao.selectKmoneySettlement(sqlSession, sellerNo);
	}

	@Override
	public ArrayList<Settlement> selectSettleDetailList(PoOrder o) {
		return settlementDao.selectSettleDetailList(sqlSession, o);
	}

	@Override
	public ArrayList<Settlement>selectSettleSumList(PoOrder o) {
	
		return settlementDao.selectSettleSumList(sqlSession, o);
		}

	/**
	 * 정산내역전체조회 - 장미
	 */
	@Override
	public ArrayList<Settlement> selectSettleTotalList(Settlement set) {
		return settlementDao.selectSettleTotalList(sqlSession, set);
	}

	/**
	 * 정산내역 기간조회 -장미
	 */
	@Override
	public ArrayList<Settlement> searchSettleList(Settlement set) {
		return settlementDao.searchSettleList(sqlSession, set);
	}

	/**
	 * 정산내역 전체(당월)조회 엑셀다운로드 - 장미
	 */
	@Override
	public ArrayList<Settlement> settleExcelTotalList(Settlement set) {
		return settlementDao.settleExcelTotalList(sqlSession, set);
	}

	/**
	 * 정산내역 기간조회 엑셀다운로드 -장미
	 */
	@Override
	public ArrayList<Settlement> searchSettleExcelList(Settlement set) {
		return settlementDao.searchSettleExcelList(sqlSession, set);
	}
	
	/**
	 * PO 수수료 내역 조회 - 백성현
	 */
	@Override
	public Settlement selectCommissionList(HashMap<String, String> optionDefault) {
		return settlementDao.selectCommissionList(sqlSession, optionDefault);
	}

	/**
	 * PO 전자세금 계산서
	 * 세금계산서 전체 조회
	 * * 주멋돌 
	 */
	@Override
	public ArrayList<Settlement> selectElectronicList(int selNo) {
		
		return settlementDao.selectElectronicList(sqlSession, selNo);
	}
	
	/**
	 * PO 전자세금 계산서
	 * 세금계산서 확인 클릭 시 모달창 팝업
	 * * 주멋돌 
	 */
	@Override
	public Settlement sellerBillModal(Settlement modalRequest) {
		
		Settlement result = settlementDao.sellerBillModal(sqlSession, modalRequest);
		
		return result;
	}
	
	/**
	 * PO 전자세금 계산서
	 * 월 선택 시 해당 월 조회
	 * * 주멋돌 
	 */
	@Override
	public ArrayList<Settlement> selectElectronicDateList(Settlement settlement) {
		
		return settlementDao.selectElectronicDateList(sqlSession, settlement);
	}

	/**
	 * PO 수수료 내역 옵션 조회 - 백성현
	 */
	@Override
	public ArrayList<Settlement> selectCommissionList_Option(HashMap<String, String> option) {
		return settlementDao.selectCommissionList_Option(sqlSession, option);
	}

	/**
	 * PO 정산 상세내역 엑셀 다운로드- 나성진
	 */
	@Override
	public ArrayList<PoOrder> excelDownloadSettlementDetail(PoOrder o) {
		return settlementDao.excelDownloadSettlementDetail(sqlSession, o);
	}
	

	
	}


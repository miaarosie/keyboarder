package com.kh.kmanager.bo.settlement.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kmanager.bo.settlement.model.dao.CWS_SettlementDao;
import com.kh.kmanager.bo.settlement.model.vo.CWS_Settlement;
import com.kh.kmanager.member.model.vo.Member;

@Service
public class CWS_SettlementServiceImpl implements CWS_SettlementService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CWS_SettlementDao settlementDao;
	
	@Override
	public ArrayList<Member> selectSeller() {
		
		ArrayList<Member> sellerList = settlementDao.selectSeller(sqlSession);
		
		return sellerList;
	}
	
	@Override
	public ArrayList<CWS_Settlement> selectSellerCommition() {
		
		ArrayList<CWS_Settlement> list = settlementDao.selectSellerCommition(sqlSession); 
		
		return list;
	}

	@Override
	public ArrayList<CWS_Settlement> searchSellerCommition(CWS_Settlement searchCondition) {
		
		ArrayList<CWS_Settlement> list = settlementDao.searchSellerCommition(sqlSession, searchCondition);
		
		return list;
	}

	@Override
	public CWS_Settlement sellerBillModal(CWS_Settlement modalRequest) {
		
		CWS_Settlement result = settlementDao.sellerBillModal(sqlSession, modalRequest);
		
		return result;
	}

	@Override
	public ArrayList<CWS_Settlement> selectStoreSettlement() {
		
		ArrayList<CWS_Settlement> list = settlementDao.selectStoreSettlement(sqlSession); 
		
		return list;
	}

	@Override
	public ArrayList<CWS_Settlement> searchStoreSettlement(CWS_Settlement searchCondition) {
		
		ArrayList<CWS_Settlement> list = settlementDao.searchStoreSettlement(sqlSession, searchCondition); 
		
		return list;
		
	}


}

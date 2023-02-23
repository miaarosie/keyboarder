package com.kh.kmanager.po.order.model.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.po.order.model.vo.PoOrder;



@Repository
public class PoOrderDao {
	
	// 구매확정 전체 조회
	public ArrayList<PoOrder> selectDecisionOrder(SqlSessionTemplate sqlSession, PoOrder poOrder) {
		
		return (ArrayList)sqlSession.selectList("poorderMapper.selectDecisionOrder", poOrder);
	}
	
	// 구매확정 기간별 조회
	public ArrayList<PoOrder>  searchPoOrderDecision(SqlSessionTemplate sqlSession, PoOrder poOrder) {

		return (ArrayList)sqlSession.selectList("poorderMapper.searchPoOrderDecision", poOrder);
	}
	
	public int selectListCount(SqlSessionTemplate sqlSession, HashMap<String, String> optionDefault) {

		return sqlSession.selectOne("poorderMapper.selectListCount_default", optionDefault);
	}
	
	public ArrayList<PoOrder> selectAllOrderList(SqlSessionTemplate sqlSession, HashMap<String, String> optionDefault) {
		
		return (ArrayList)sqlSession.selectList("poorderMapper.selectAllOrderList", optionDefault);
	}
	
	public ArrayList<PoOrder> selectOrderList(SqlSessionTemplate sqlSession, HashMap<String, String> option) {
		
		return (ArrayList)sqlSession.selectList("poorderMapper.selectOrderList", option);
	}
	
	// 구매확정내역 엑셀다운로드
	public ArrayList<PoOrder> orderDecisionList(SqlSessionTemplate sqlSession, PoOrder poOrder) {
		return (ArrayList)sqlSession.selectList("poorderMapper.orderDecisionList", poOrder);
	}
	
	// 구매확정내역 기간별조회 엑셀다운로드
	public ArrayList<PoOrder> searchExcelDecisionList(SqlSessionTemplate sqlSession, PoOrder poOrder) {
		return (ArrayList)sqlSession.selectList("poorderMapper.searchExcelDecisionList", poOrder);
	}
	
	public int refundOrder(SqlSessionTemplate sqlSession, PoOrder pgd) {
		return sqlSession.update("poorderMapper.refundOrder", pgd);
	}

	public int refundPayment(SqlSessionTemplate sqlSession, PoOrder pgd) {
		return sqlSession.update("poorderMapper.refundPayment", pgd);
	}
	
}

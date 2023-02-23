package com.kh.kmanager.po.order.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.po.order.model.vo.PoOrder;

@Repository
public class JKW_OrderDao {

	/**
	 * PO 배송관리 
	 * 전체 조회 배송중 개수 확인
	 */
	public int orderStatus1(SqlSessionTemplate sqlSession, int selNo) {
		
		return sqlSession.selectOne("poorderMapper.orderStatus1", selNo);
	}
	
	/**
	 * PO 배송관리 
	 * 전체 조회 배송완료 개수 확인
	 */
	public int orderStatus2(SqlSessionTemplate sqlSession, int selNo) {
			
		return sqlSession.selectOne("poorderMapper.orderStatus2", selNo);
	}
	
	/**
	 * PO 배송관리 
	 * 전체 조회 구매확정 개수 확인
	 */
	public int orderStatus3(SqlSessionTemplate sqlSession, int selNo) {
		
		return sqlSession.selectOne("poorderMapper.orderStatus3", selNo);
	}
	
	/**
	 * PO 배송관리 
	 * 전체 조회 환불 개수 확인
	 */
	public int orderStatus4(SqlSessionTemplate sqlSession, int selNo) {
		
		return sqlSession.selectOne("poorderMapper.orderStatus4", selNo);
	}
	
	/**
	 * PO 배송관리 
	 * 전체 조회 주문건수 확인
	 */
	public int orderCount(SqlSessionTemplate sqlSession, int selNo) {
		
		return sqlSession.selectOne("poorderMapper.orderCount", selNo);
	}
	
	/**
	 * PO 배송관리 
	 * 전체 조회
	 */
	public ArrayList<PoOrder> orderList(SqlSessionTemplate sqlSession, int selNo){
		
		return (ArrayList)sqlSession.selectList("poorderMapper.orderList", selNo);
	}

	/**
	 * PO 배송관리 
	 * 월별 조회
	 */
	public ArrayList<PoOrder> deliverySearchDate(SqlSessionTemplate sqlSession, PoOrder poOrder) {
		
		return (ArrayList)sqlSession.selectList("poorderMapper.deliverySearchDate", poOrder);
	}

	/**
	 * PO 배송관리 
	 * 월별 조회 배송중 개수 확인
	 */
	public int dateOrderStatus1(SqlSessionTemplate sqlSession, PoOrder poOrder) {
		
		return sqlSession.selectOne("poorderMapper.dateOrderStatus1", poOrder);
	}

	/**
	 * PO 배송관리 
	 * 월별 조회 배송완료 개수 확인
	 */
	public int dateOrderStatus2(SqlSessionTemplate sqlSession, PoOrder poOrder) {
		
		return sqlSession.selectOne("poorderMapper.dateOrderStatus2", poOrder);
	}

	/**
	 * PO 배송관리 
	 * 월별 조회 구매확정 개수 확인
	 */
	public int dateOrderStatus3(SqlSessionTemplate sqlSession, PoOrder poOrder) {
		
		return sqlSession.selectOne("poorderMapper.dateOrderStatus3", poOrder);
	}

	/**
	 * PO 배송관리 
	 * 월별 조회 환불 개수 확인
	 */
	public int dateOrderStatus4(SqlSessionTemplate sqlSession, PoOrder poOrder) {
		
		return sqlSession.selectOne("poorderMapper.dateOrderStatus4", poOrder);
	}

	/**
	 * PO 배송관리 
	 * 월별 조회 주문건수 확인
	 */
	public int dateOrderCount(SqlSessionTemplate sqlSession, PoOrder poOrder) {
		
		return sqlSession.selectOne("poorderMapper.dateOrderCount", poOrder);
	}
	
	
}
































package com.kh.keyboarder.order.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.keyboarder.order.model.vo.Order;

@Repository
public class JKW_OrderDao {

	/**
	 * FO 주문내역 전체 조회 
	 * * 주멋돌
	 */
	public ArrayList<Order> foTotalViewList(SqlSessionTemplate sqlSession, int conNo){
		
		return (ArrayList)sqlSession.selectList("orderMapper.foTotalViewList", conNo);
	}
	
	/**
	 * FO 주문내역 월별 조회 
	 * * 주멋돌
	 */
	public ArrayList<Order> foSearchDate(SqlSessionTemplate sqlSession, Order order){
		
		return (ArrayList)sqlSession.selectList("orderMapper.foSearchDate", order);
	}
	
	/**
	 * FO 주문내역 상세 조회 
	 * * 주멋돌
	 */
	public Order foDetailViewList(SqlSessionTemplate sqlSession, String ordNo) {
		
		return sqlSession.selectOne("orderMapper.foDetailViewList", ordNo);
	}
}

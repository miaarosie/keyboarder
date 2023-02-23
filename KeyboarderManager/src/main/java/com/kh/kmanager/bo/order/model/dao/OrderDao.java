package com.kh.kmanager.bo.order.model.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.bo.order.model.vo.Order;

@Repository
public class OrderDao {

	public int selectListCount(SqlSessionTemplate sqlSession, String nowMonth) {
		
		return sqlSession.selectOne("boOrderMapper.selectListCount_default", nowMonth);
	}
	
	public ArrayList<Order> selectAllOrderList(SqlSessionTemplate sqlSession, String nowMonth) {
		
		return (ArrayList)sqlSession.selectList("boOrderMapper.selectAllOrderList", nowMonth);
	}
	
	public ArrayList<Order> selectOrderList(SqlSessionTemplate sqlSession, HashMap<String, String> option) {
		
		return (ArrayList)sqlSession.selectList("boOrderMapper.selectOrderList", option);
	}
	
}

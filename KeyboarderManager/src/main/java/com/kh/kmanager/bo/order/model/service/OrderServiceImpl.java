package com.kh.kmanager.bo.order.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kmanager.bo.order.model.dao.OrderDao;
import com.kh.kmanager.bo.order.model.vo.Order;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	public OrderDao orderDao;
	
	@Autowired
	public SqlSessionTemplate sqlSession;

	
	@Override
	public int selectListCount(String nowMonth) {
		return orderDao.selectListCount(sqlSession, nowMonth);
	}

	@Override
	public ArrayList<Order> selectAllOrderList(String nowMonth) {
		return orderDao.selectAllOrderList(sqlSession, nowMonth);
	}

	@Override
	public ArrayList<Order> selectOrderList(HashMap<String, String> option) {
		return orderDao.selectOrderList(sqlSession, option);
	}

}

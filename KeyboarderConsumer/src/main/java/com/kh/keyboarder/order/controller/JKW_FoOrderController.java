package com.kh.keyboarder.order.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.keyboarder.member.model.vo.Member;
import com.kh.keyboarder.order.model.service.JKW_OrderService;
import com.kh.keyboarder.order.model.vo.Order;

@Controller
public class JKW_FoOrderController {
	
	@Autowired
	private JKW_OrderService JKW_OrderService;
	
	/**
	 * FO 주문내역 전체 조회
	 * * 주멋돌
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("foTotalView.order")
	public String foTotalView(Model model, HttpSession session) {
		
		if(session.getAttribute("searchDate") != null) {
			
			session.removeAttribute("searchDate");
		}
		
		Member m = (Member)session.getAttribute("loginUser");
		
		int conNo = m.getConNo();
		
		ArrayList<Order> orderList = JKW_OrderService.foTotalViewList(conNo);
		
		model.addAttribute("orderList", orderList);	
		
		return "order/foOrderTotalView";
	}
	
	/**
	 * FO 주문내역 월별 조회
	 * * 주멋돌
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("foSearchDate.order")
	public String foSearchDate(Model model, HttpSession session, String searchOrderMonth) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		int conNo = m.getConNo();
		
		String searchDate = searchOrderMonth + "-01";
		
		session.setAttribute("searchDate", searchOrderMonth);
		
		Order order = new Order(conNo, searchDate);
		
		ArrayList<Order> dateList = JKW_OrderService.foSearchDate(order);
				
		model.addAttribute("dateList", dateList);
		
		return "order/foOrderTotalView";
	}
	
	/**
	 * FO 주문내역 상세 조회
	 * * 주멋돌
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("foDetailView.order")
	public String foDetailView(Model model, String ordNo) {
		
		Order orderDetailList = JKW_OrderService.foDetailViewList(ordNo);
				
		model.addAttribute("orderDetailList", orderDetailList);
		
		return "order/foOrderDetailView";
	}
	
}

































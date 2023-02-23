package com.kh.kmanager.common.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.kmanager.common.model.service.PoMainPageService;
import com.kh.kmanager.common.model.vo.PoMainData;
import com.kh.kmanager.common.notice.model.service.NoticeService;
import com.kh.kmanager.common.notice.model.vo.Notice;
import com.kh.kmanager.member.model.vo.Member;
import com.kh.kmanager.po.settlement.model.vo.Settlement;

@Controller
public class MainPageController {

	@Autowired
	private PoMainPageService mainPageService;
	
	@Autowired
	private NoticeService noticeService;
	
	/**
	 * po 메인으로 이동
	 */
	@RequestMapping("pomain")
	public String poMain(Model model) {
		
		ArrayList<Notice> nlist = noticeService.selectMainNoticeList();
		
		model.addAttribute("nlist", nlist);
		
		return "common/pomain";
	}
	
	/**
	 * bo 메인으로 이동
	 */
	@RequestMapping("bomain")
	public String boMain() {
		
		return "common/bomain";
	}
	
	/**
	 * 로그인 페이지로 이동
	 */
	@RequestMapping("loginForm")
	public String loginForm() {
		
		return "/common/login";
	}
	
	/**
	 * 해당 로그인 유저의 주문 내역 요약 보기 - 채영
	 * @return : 신규주문, 배송중, 구매확정, 주문금, 정산금
	 */
	@ResponseBody
	@RequestMapping(value="mainOrder.po", produces="application/json; charset=UTF-8")
	public String mainOrderSummary(HttpSession session) {
		
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		
		PoMainData pmd = mainPageService.mainOrderSummary(sellerNo);
		
		return new Gson().toJson(pmd);		
	}
	
	/**
	 * 해당 로그인 유저의 판매현황 요약 보기 - 채영
	 * @return : 결제금액, 결제건, 결제취소건
	 */
	@ResponseBody
	@RequestMapping(value="mainPayment.po", produces="application/json; charset=UTF-8")
	public String mainPaymentSummary(HttpSession session) {
		
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		
		PoMainData pmd = mainPageService.mainPaymentSummary(sellerNo);
		
		return new Gson().toJson(pmd);		
	}
	
	/**
	 * 해당 로그인 유저의 판매현황 그래프 - 채영
	 */
	@ResponseBody
	@RequestMapping(value="mainBarGraph.po", produces="application/json; charset=UTF-8")
	public String mainBarGraph(HttpSession session) {
		
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		
		ArrayList<PoMainData> pmd = mainPageService.mainBarGraph(sellerNo);
		
		return new Gson().toJson(pmd);
	}
	
	/**
	 * 해당 로그인 유저의 상품현황 - 채영
	 */
	@ResponseBody
	@RequestMapping(value="mainProduct.po", produces="application/json; charset=UTF-8")
	public String mainProductSummary(HttpSession session) {
		
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		
		PoMainData pmd = mainPageService.mainProductSummary(sellerNo);
		
		return new Gson().toJson(pmd);
	}
}

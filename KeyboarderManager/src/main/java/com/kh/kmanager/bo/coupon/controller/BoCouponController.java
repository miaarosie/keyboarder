package com.kh.kmanager.bo.coupon.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.kmanager.bo.coupon.model.service.BoCouponService;
import com.kh.kmanager.bo.coupon.model.vo.BoCoupon;
import com.kh.kmanager.bo.store.model.service.StoreService;
import com.kh.kmanager.bo.store.model.vo.Store;

import oracle.net.aso.b;

@Controller
public class BoCouponController {
	
	@Autowired
	private BoCouponService couponService;
	
	@Autowired
	private StoreService storeService;

	/**
	 * bo 쿠폰 전체 조회 화면 - 채영
	 * @return
	 */
	@RequestMapping("coupon.bo")
	public String couponMain(BoCoupon bc) {
		
		return "bo/boCoupon/boCouponList";
	}
	
	/**
	 * bo 쿠폰 등록 화면 - 채영
	 * @return
	 */
	@RequestMapping("registCoupon.bo")
	public String registerCoupon(Model model) {
		
		ArrayList<Store> slist = storeService.selectStoreList();
		
		model.addAttribute("slist", slist);
		
		return "bo/boCoupon/boCouponInsert";
	}
	
	/**
	 * 
	 * @param bc
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="loadCoupon.bo", produces="application/json; charset=UTF-8")
	public String loadCoupon(BoCoupon bc) {
		
		ArrayList<BoCoupon> list = couponService.selectCouponList(bc);
		
		return new Gson().toJson(list);
	}
	
	/**
	 * 사용 가능 쿠폰 리스트 조회 ajax - 채영
	 * @param bc : 검색 기간
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="ableCoupon.bo", produces="application/json; charset=UTF-8")
	public String ableCoupon(BoCoupon bc) {
		
		// 쿠폰 리스트 조회
		bc.setCouponStmt("Y");
		
		ArrayList<BoCoupon> list = couponService.selectCouponList(bc);
		
		return new Gson().toJson(list);
	}
	
	/**
	 * 사용 만료 쿠폰 리스트 조회 ajax - 채영
	 * @param bc : 검색 기간
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="expireCoupon.bo", produces="application/json; charset=UTF-8")
	public String expireCoupon(BoCoupon bc) {
		
		// 쿠폰 리스트 조회
		bc.setCouponStmt("N");
		
		ArrayList<BoCoupon> list = couponService.selectCouponList(bc);
		
		return new Gson().toJson(list);
	}
	
	/**
	 * 쿠폰 신규 등록 - 채영
	 * @param bc : 등록할 쿠폰명, 유효기간, 상품번호 등 쿠폰 정보
	 * @return
	 */
	@RequestMapping("insertCoupon.bo")
	public String insertCoupon(BoCoupon bc, HttpSession session) {
				
		int result = couponService.insertCoupon(bc);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "쿠폰 등록에 성공했습니다.");
		} else {
			session.setAttribute("alertMsg", "쿠폰 등록 처리에 실패했습니다.");
		}
		
		return "redirect:/coupon.bo";
	}
	
	/**
	 * 쿠폰 사용내역 조회 - 채영
	 * @param bc : 사용일 기준 검색 기간
	 * @return
	 */
	@RequestMapping("usedCoupon.bo")
	public String usedCouponList(Model model, BoCoupon bc) {
		
		ArrayList<BoCoupon> clist = couponService.usedCouponList(bc);
		
		model.addAttribute("clist", clist);
		
		return "bo/boCoupon/boCouponUsedList";
	}
	
	/**
	 * 쿠폰 사용내역 검색 - 채영
	 * @param bc : 사용일 기준 검색 기간
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="searchUsedCoupon.bo", produces="application/json; charset=UTF-8")
	public String searchUsedCouponList(BoCoupon bc) {
		
		ArrayList<BoCoupon> clist = couponService.usedCouponList(bc);
		return new Gson().toJson(clist);
	}
	
	/**
	 * 사용 가능 쿠폰 전체 조회 페이지 - 채영
	 * @return
	 */
	@RequestMapping("couponAble.bo")
	public String ableCouponList() {
		
		return "bo/boCoupon/boAbleCouponList";
	}
	
	/**
	 * 사용 만료 쿠폰 전체 조회 페이지 - 채영
	 * @return
	 */
	@RequestMapping("couponExpire.bo")
	public String expireCouponList() {
		return "bo/boCoupon/boExpireCouponList";
	}
	
	/**
	 * 사용가능쿠폰에 대해서만 수정페이지로 이동 - 채영
	 * @param cno : 쿠폰식별키
	 */
	@RequestMapping("couponDetail.bo")
	public String detailCoupon(String cno, Model model) {
		
		BoCoupon bc = couponService.selectCoupon(cno);
		
		model.addAttribute("bc", bc);
		
		return "bo/boCoupon/boCouponDetail";
	}
	
	/**
	 * 사용가능쿠폰에 대해서만 수정 기능 - 채영
	 */
	@RequestMapping("updateCoupon.bo")
	public String updateCoupon(BoCoupon bc, HttpSession session) {
		
		int result = couponService.updateCoupon(bc);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "쿠폰 수정에 성공했습니다.");
		} else {
			session.setAttribute("alertMsg", "쿠폰 수정에 실패했습니다.");
		}
		
		return "redirect:/coupon.bo";
	}
	
}

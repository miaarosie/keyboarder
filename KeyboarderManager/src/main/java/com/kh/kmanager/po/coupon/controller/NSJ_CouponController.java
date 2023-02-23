package com.kh.kmanager.po.coupon.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.kmanager.bo.coupon.model.vo.BoCoupon;
import com.kh.kmanager.member.model.vo.Member;
import com.kh.kmanager.po.coupon.model.service.CouponService;
import com.kh.kmanager.po.coupon.model.vo.Coupon;
import com.kh.kmanager.po.product.model.vo.Product;

@Controller
public class NSJ_CouponController {
	@Autowired
	private CouponService couponService;

	/**
	 * po 쿠폰 등록하는 화면 으로 이동-성진
	 * 
	 * @return
	 */
	@RequestMapping("mainCoupon.po")
	public String prodcutListforCoupon(Model model, HttpSession session) {

		int sellerNo = ((Member) session.getAttribute("loginUser")).getSellerNo();
		ArrayList<Product> list = couponService.prodcutListforCoupon(sellerNo);

		if (list != null) {
			model.addAttribute("list", list);
		}
		return "/po/poCoupon/PoCouponInsert";

	}

	/**
	 * po 쿠폰 등록하는 메소드-성진
	 * 
	 * @return
	 */
	@RequestMapping("insertCoupon.po")
	public String insertCoupon(Coupon c, HttpSession session) {

		int sellerNo = ((Member) session.getAttribute("loginUser")).getSellerNo();
		
		c.setSellerNo(sellerNo);
		// => 만약 안 했을 경우 c의 sellerNo 이 0인 상태
		
		int result = couponService.insertCoupon(c);

		if (result > 0) {
			session.setAttribute("alertMsg", "쿠폰 등록에 성공했습니다.");
		} else {
			session.setAttribute("alertMsg", "쿠폰 등록에 실패했습니다.");
		}

		return "redirect:/mainCoupon.po";
	}

	/**
	 * po 사용가능쿠폰 전체조회 -성진
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="able.co",produces="application/json; charset=UTF-8")
	public String showAbleCouponList(Coupon c){
	
		c.setCouponStmt("Y");
		
		ArrayList<Coupon> list = couponService.showAbleCouponList(c);
		
		return new Gson().toJson(list);
	}
	
	
	@RequestMapping("SearchAble.co")
	public String ableCouponSearch(Coupon c, HttpSession session, Model model) {
		
		int sellerNo = ((Member) session.getAttribute("loginUser")).getSellerNo();
		c.setSellerNo(sellerNo);
		// c.setCreateDate(createDate);
	
	
		ArrayList<Coupon> list = couponService.ableCouponSearch(c);
		
		if(list!=null) {
			model.addAttribute("list", list);
		}
		return "po/poCoupon/poAbleCouponList";
		
	}
	
	/**
	 * 사용 가능 쿠폰 전체 조회 페이지 리턴
	 * @return
	 */
	@RequestMapping("ableCoupon.po")
	public String ableCouponList(Model model,Coupon c,HttpSession session) {
		int sellerNo = ((Member) session.getAttribute("loginUser")).getSellerNo();
		
		c.setSellerNo(sellerNo);
		
		c.setCouponStmt("Y");
		
		ArrayList<Coupon> list = couponService.showAbleCouponList(c);
		
		model.addAttribute("list", list);
		
		return "po/poCoupon/poAbleCouponList";
	}
	
	/**
	 * 사용만료 쿠폰 전체 조회 페이지
	 * @return
	 */
	@RequestMapping("expireCoupon.po")
	public String expireCouponList(Model model,Coupon c,HttpSession session) {

		int sellerNo = ((Member) session.getAttribute("loginUser")).getSellerNo();
		c.setSellerNo(sellerNo);
		c.setCouponStmt("N");
		
		ArrayList<Coupon> list = couponService.showAbleCouponList(c);
		model.addAttribute("list", list);
		return "po/poCoupon/poShowExpiredCouponList";
	}
	
	

	/**
	 * po 사용만료쿠폰 기간조회 -성진
	 * 
	 * @return
	 */

	@RequestMapping("Searchexpire.co")
	public String searchExCouponList(Coupon c, HttpSession session, Model model){
	
		int sellerNo = ((Member) session.getAttribute("loginUser")).getSellerNo();
		
		c.setSellerNo(sellerNo);
		
		ArrayList<Coupon> list = couponService.searchExCouponList(c);
		
		if(list!=null) {
			model.addAttribute("list", list);
		}
		return "po/poCoupon/poShowExpiredCouponList";
	
	}

	/**
	 * po 쿠폰 사용내역 전체화면 -성진
	 * 
	 * @return
	 */

	@RequestMapping("usedCList.po")
	public String poCouponUsedList(Model model,Coupon c,HttpSession session) {
		
		int sellerNo = ((Member) session.getAttribute("loginUser")).getSellerNo();
		
		c.setSellerNo(sellerNo);
		
		ArrayList<Coupon> list = couponService.poCouponUsedList(c);
		
		model.addAttribute("list", list);
		
		return "po/poCoupon/CouponsuedPo";
		
		}
	/**
	 * po 쿠폰 사용내역 기간검색 -성진
	 * 
	 * @return
	 */

	@RequestMapping("searchCUsed.po")
	public String searchPoCouponUsed(Model model,Coupon c, HttpSession session) {
		
		int sellerNo = ((Member) session.getAttribute("loginUser")).getSellerNo();
		
		c.setSellerNo(sellerNo);
		
		ArrayList<Coupon> list = couponService.searchPoCouponUsed(c);
		
		model.addAttribute("list", list);
		
		if(list!=null) {
			
			model.addAttribute("list", list);
		}
		return "po/poCoupon/CouponsuedPoSearch";
	}
	/**
	 * po 쿠폰 전체내역화면-성진
	 * 
	 * @return
	 */
		@RequestMapping("CouponList.po")
		public String showCouponListPo(Model model, Coupon c, HttpSession session) {
			
			int sellerNo = ((Member) session.getAttribute("loginUser")).getSellerNo();
			
			c.setSellerNo(sellerNo);
			
			ArrayList<Coupon> list = couponService.showCouponListPo(c);
			
			if(list!=null) {
				
				model.addAttribute("list", list);
			}
		
			return "po/poCoupon/poshowAllCouponList";
			
		}
		
		/**
		 * po 쿠폰 전체내역조회-성진
		 * 
		 * @return
		 */
		
		@RequestMapping("SearchCoupon.po")
		public String CouponDetailSearch(Model model,Coupon c, HttpSession session) {
			int sellerNo = ((Member) session.getAttribute("loginUser")).getSellerNo();
			
			c.setSellerNo(sellerNo);
			
			ArrayList<Coupon> list = couponService.CouponDetailSearch(c);
			
			model.addAttribute("list", list);
			
			if(list!=null) {
		
			}
			
			return "po/poCoupon/poshowAllCouponList";
			
	}
		/**
		 * po 쿠폰 수정하는 메소드 -성진
		 * 
		 * @return
		 */
		@RequestMapping("updateCoupon.po")
		public String updateCouponPo( Coupon c, HttpSession session) {
			
			int sellerNo = ((Member) session.getAttribute("loginUser")).getSellerNo();
			c.setSellerNo(sellerNo);
			int result = couponService.updateCouponPo(c);	
			
			if (result > 0) {
				session.setAttribute("alertMsg", "쿠폰 수정에 성공했습니다.");
			} else {
				session.setAttribute("alertMsg", "쿠폰 수정에 실패했습니다.");
			}
		
			return  "redirect:/CouponList.po";
		}
		

		/**
		 * po 쿠폰의 상세페이지 이동
		 * 
		 * @return
		 */
		
		@RequestMapping("detailCoupon.po")
		public ModelAndView detailCoupon(String couponNo, ModelAndView mv) {
			
			
			
			Coupon c = couponService.detailCoupon(couponNo);
			

			mv.addObject("c", c).setViewName("po/poCoupon/PoCoupondetail");

			return mv;
		
	}
}


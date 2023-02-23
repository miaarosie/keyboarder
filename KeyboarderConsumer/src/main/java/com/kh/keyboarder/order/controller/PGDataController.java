package com.kh.keyboarder.order.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.keyboarder.member.model.vo.Member;
import com.kh.keyboarder.order.model.service.PGDataService;
import com.kh.keyboarder.order.model.vo.PGData;

@Controller
public class PGDataController {
	
	@Autowired
	private PGDataService service;
		
	
	@RequestMapping("purchase.fo")
	public String requestPay(PGData pgd,HttpSession session) {
		
		int conNo = ((Member)session.getAttribute("loginUser")).getConNo();
		pgd.setConNo(conNo);
		
		int amount = Integer.parseInt(pgd.getAmount()); // 실결제금액
		pgd.setOrderPrice(amount + pgd.getCouponPrice()); // 주문금액
		pgd.setPaymentBill(amount); // 결제금액

		// 쿠폰종류별 수수료 계산
		int commition = 0;
		if (pgd.getCouponNo().charAt(0) == 'X') { // 쿠폰 없음
			commition = (int)(pgd.getOrderPrice() * 0.15);
		} else if (pgd.getCouponNo().charAt(0) == 'k') { // 스토어 쿠폰
			commition = (int)(pgd.getOrderPrice() * 0.15);
		} else { // 키보더 쿠폰
			commition = (int)(pgd.getOrderPrice() * 0.15) - pgd.getCouponPrice();
		}
		
		pgd.setCommition(commition); // 수수료
		
		pgd.setSettleDept(pgd.getOrderPrice() - pgd.getCommition()); // 정산금액
		pgd.setSupplyValue((int)(pgd.getPaymentBill() / 1.1)); // 공급가액
		pgd.setTaxAmount(pgd.getPaymentBill() - pgd.getSupplyValue()); // 세액
		
		// System.out.println(pgd);
		
		int result = 0;
		
		if (pgd.getCouponNo().charAt(0) == 'X') {
			result = service.insertOrderNoCoupon(pgd);
		} else {			
			result = service.insertOrder(pgd);
		}
		
		if (result > 0) {
			session.setAttribute("alertMsg", "상품의 결제가 완료되었습니다.");
			return "redirect:/foProductNotice.pro";
		} else {
			session.setAttribute("alertMsg", "결제 실패");
			return "redirect:/foProductNotice.pro";
		}
	}
	
	@RequestMapping(value="refundPay.fo")
	public String refundPay(PGData pgd, HttpSession session) throws IOException {
		
		// System.out.println(pgd);
		
		//int amount = service.selectRefundAmount(pgd);		
		String token = service.getToken();
		int amount = service.paymentInfo(pgd.getPaymentNo(), token);
		
		service.payMentCancel(token, pgd.getPaymentNo(), amount, "단순 변심 취소");
		
		int result = service.orderCancel(pgd);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "결제 취소 완료");
			return "redirect:/foProductNotice.pro";
		} else {
			session.setAttribute("alertMsg", "결제 취소 실패");
			return "redirect:/foProductNotice.pro";
		}
	}
	
	@RequestMapping("confirmPay.fo")
	public String confirmPay(PGData pgd, HttpSession session) {
		
		int result = service.confirmPay(pgd);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "구매 확정에 성공했습니다.");
		} else {
			session.setAttribute("alertMsg", "구매 확정에 실패했습니다.");
		}
		
		return "redirect:/foTotalView.order";
	}
}

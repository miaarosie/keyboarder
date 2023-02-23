package com.kh.kmanager.bo.store.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.kmanager.bo.store.model.service.StoreService;
import com.kh.kmanager.bo.store.model.vo.Store;

@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;
	
	/**
	 * 입점업체관리 메인 페이지 띄우는 용도 - 채영
	 * @return : 입점업체 관리 페이지, 입점업체 목록
	 */
	@RequestMapping("store.bo")
	public String storeMain(Model model) {
		
		ArrayList<Store> list = storeService.selectStoreList();
		
		model.addAttribute("list", list);
		
		return "bo/boStore/boStoreMain";
	}
	
	/**
	 * 입점업체 상세 페이지 띄우는 용도 - 채영
	 * @return : 해당 입점업체 상세 조회 결과
	 */
	@RequestMapping("storeDetail.bo")
	public String storeDetail(Store store, Model model) {
		
		Store s = storeService.selectStore(store);
		
		model.addAttribute("s", s);
		
		return "bo/boStore/boStoreDetail";
	}
	
	/**
	 * 입점업체 정보 수정용 - 채영
	 * @return : 수정된 입점업체 상세페이지
	 */
	@RequestMapping("updateStore.bo")
	public String updateStore(Store s, HttpSession session) {
		
		int result = storeService.updateStore(s);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "입점업체 정보를 성공적으로 변경했습니다.");
			return "redirect:/storeDetail.bo?sellerNo=" + s.getSellerNo();
		} else {
			session.setAttribute("alertMsg", "입점업체 정보 변경에 실패했습니다.");
			return "redirect:/store.bo";
		}		
	}
	
	/**
	 * 입점업체 삭제용 - 채영
	 * @param s : 삭제할 업체 정보
	 * @return : 입점업체 목록
	 */
	@RequestMapping("deleteStore.bo")
	public String deleteStore(Store s, HttpSession session) {
		
		int result = storeService.deleteStore(s);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "입점업체 탈퇴 처리가 성공적으로 완료되었습니다.");
			return "redirect:/store.bo";
		} else {
			session.setAttribute("alertMsg", "입점업체 탈퇴 처리에 실패했습니다.");
			return "redirect:/storeDetail.bo?sellerNo=" + s.getSellerNo();
		}		
	}
	
	/**
	 * 입점업체 승인용 - 채영
	 * @param s : 승인할 업체 식별키
	 * @return : 업체목록페이지
	 */
	@RequestMapping("identify.bo")
	public String idenfityStore(Store s, HttpSession session) {
		
		int result = storeService.identifyStore(s);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "입점업체를 성공적으로 승인했습니다.");
		} else {
			session.setAttribute("alertMsg", "입점업체 승인에 실패했습니다.");
		}
		
		return "redirect:/store.bo";
	}
	
	/**
	 * 입점업체 계좌 변경용 - 채영
	 * @param s : 변경할 업체 식별키, 계좌번호
	 * @return
	 */
	@RequestMapping("updateAccount.bo")
	public String updateStoreAccount(Store s, HttpSession session) {
		
		int result = storeService.updateStoreAccount(s);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "입점업체 계좌를 성공적으로 변경했습니다.");
		} else {
			session.setAttribute("alertMsg", "입점업체 계좌변경에 실패했습니다.");
		}
		
		return "redirect:/store.bo";
	}
}

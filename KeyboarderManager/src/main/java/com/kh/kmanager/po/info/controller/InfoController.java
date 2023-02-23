package com.kh.kmanager.po.info.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.kmanager.member.model.vo.Member;
import com.kh.kmanager.po.info.model.service.InfoService;

@Controller
public class InfoController {

	@Autowired
	private InfoService infoService;
	
	@RequestMapping("updateInfoPage.po")
	public String updateInfoPage(HttpSession session) {
		
		return "po/poInfo/poInfoUpdate";
		
	}
	
	// 이메일 중복확인
	@ResponseBody
	@RequestMapping(value="emailCheck.me", produces="text/html; charset=UTF-8")
	public String emailCheck(String checkEmail) {
		int count = infoService.emailCheck(checkEmail);
		return(count>0)?  "NNNNN" : "NNNNY";
	}
	
	@RequestMapping("updateInfo.po")
	public String updateInfo(HttpSession session, Model model, String sellerName, String updateRepName, String updateLocation, String updateSellerEmail, String updateSellerPhone, String updateAccountNo) {
		
		Member updatePo = new Member(sellerName, updateRepName, updateSellerEmail, updateSellerPhone, updateAccountNo, updateLocation);
		
		int result = infoService.updateInfo(updatePo);
		
		Member loginUserRefresh = infoService.refreshInfo(updatePo.getSellerName()); 
		
		if(result>0) {
			session.setAttribute("loginUser", loginUserRefresh);
			session.setAttribute("alertMsg", "정보가 수정되었습니다.");
			return "redirect:/updateInfoPage.po";
		} else {
			session.setAttribute("alertMsg", "정보 수정에 실패했습니다.");
			return "redirect:/updateInfoPage.po";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="secession.po")
	public String secession(HttpSession session, String sellerName) {
		
		int num = infoService.secession(sellerName);
		String result;
		
		if(num > 0) {
			result = "true";
		} else {
			result = "false";
		};
		
		return result;
		
	}
	
	@RequestMapping("afterSecession.po")
	public String afterSecession(HttpSession session) {
		
		session.invalidate();
		
		return "common/login";
	}
}

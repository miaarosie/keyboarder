package com.kh.kmanager.common.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.kmanager.member.model.service.CWS_MemberService;
import com.kh.kmanager.member.model.vo.Member;

@Controller
public class CWS_MemberController {

	private final String EMAIL_CONFIRM_VIEW = "sign/emailConfirm";
	
	
	@Autowired
	private CWS_MemberService memberService;
	
	@RequestMapping("loginPage.me")
	public String loginPage() {
		
		return "redirect:/";
	}
	
	@RequestMapping("login.me")
	public String loginMember(Member m, 
								    HttpSession session,
								    String sellerId,
								    String saveId, 
								    HttpServletResponse response) {
		
		// 아이디 저장 기능용 쿠키
		if(saveId != null && saveId.equals("y")) {
			// 요청 시 전달값 중에 saveId 가 y 라면 saveId 라는 키값으로 현재 아이디값을 쿠키 생성
			Cookie cookie = new Cookie("saveId", m.getSellerId());
			cookie.setMaxAge(24 * 60 * 60 * 1); // 유효기간 1일
			response.addCookie(cookie);
		} else {
			// 요청 시 전달값 중에 saveId 가 y	가 아니라면 쿠키 삭제(동일한 이름의 쿠키 생성)
			Cookie cookie = new Cookie("saveId",  m.getSellerId());
			cookie.setMaxAge(0); // 쿠키가 삭제되는 효과
			response.addCookie(cookie);
		}		
		
		Member loginUser = memberService.loginMember(m);

		if(loginUser == null) { // 아이디나 비밀번호가 일치하지 않을때
			
			session.setAttribute("alertMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			
			return "redirect:/";
			
		} else { // 아이디, 비밀번호가 일치할 때
			

			
			if(loginUser.getSellerId().equals("admin")) { // 관리자로 로그인 했을때
				
				session.setAttribute("alertMsg", "로그인 성공");
				
				session.setAttribute("loginUser", loginUser);
				
				return "redirect:/bomain";
				
			} else { // 판매자로 로그인 했을때
				
				if(loginUser.getMailAuth() != 1) { // 이메일이 인증되지 않았을 때
					
					session.setAttribute("alertMsg", "이메일 인증 후 로그인해주세요.");
					
					return "redirect:/";
					
				} else if(loginUser.getIdentifyStatus().equals("N")) {
					
					session.setAttribute("alertMsg", "승인되지 않은 판매자입니다.");
					
					return "redirect:/";
					
				} else { // 이메일 인증됬을 때
					
					session.setAttribute("alertMsg", "로그인 성공");
					
					session.setAttribute("loginUser", loginUser);
					session.setAttribute("sellerNo", loginUser.getSellerNo());
					return "redirect:/pomain";	
				}
				
			}
			
		}
		
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		
		// 세션 무효화
		session.invalidate();
		
		// 다시 로그인페이지로
		return "redirect:/";
	}
	
	@RequestMapping("forgotId.me")
	public String forgotId(HttpSession session) {
		
		return "common/forgotId";
	}
	
	@ResponseBody
	@RequestMapping(value="findId.me")
	public String findId(String corpNo) {
		
		String sellerId = memberService.findId(corpNo);
		
		return sellerId;
	}
	
	@RequestMapping("forgotPwd.me")
	public String forgotPwd(HttpSession session) {
		
		return "common/forgotPwd";
	}
	
	@RequestMapping("initializePwdForm.me")
	public String initializePwdForm(HttpSession session, String corpNo, String sellerId) {
		
		Member user = new Member(sellerId, corpNo, "");
		
		Member seller = memberService.initializePwdForm(user);
		
		if(seller != null) {
			
			session.setAttribute("seller", seller.getSellerId());
			
			return "common/initializePwdForm";
		} else {
			return "common/initializePwdError";
		}
	}

	@RequestMapping("initializePwd.me")
	public String initializePwd(HttpSession session, Model model, String sellerId, String newPwd) {
		
		Member user = new Member(sellerId, "", newPwd);
		
		int result = memberService.initializePwd(user);
		
		if(result > 0) { // 비밀번호 변경 성공
			
			session.setAttribute("alertMsg", "비밀번호가 변경되었습니다. 변경된 비밀번호로 로그인하여 주십시오.");
			
			return "redirect:/loginPage.me";
			
		} else { // 비밀번호 변경 실패
			
			model.addAttribute("errorMsg", "회원정보 변경 실패");
			
			return "common/errorPage";
			
		}
				
	}
	
	@RequestMapping("poEnroll1.me")
	public String enrollForm1() {
		return "common/poEnroll_1";
	}
	
	@RequestMapping("poEnroll2.me")
	public String enrollForm2() {
		return "common/poEnroll_2";
	}
	
	//아이디중복체크
	@ResponseBody
	@RequestMapping(value="corpNoCheck.me", produces="text/html; charset=UTF-8")
	public String corpNoCheck(String corpNo) {
		int count = memberService.corpNoCheck(corpNo);
		return(count>0)? "NNNNN" : "NNNNY";
	}
	
	@RequestMapping("poEnrollForm.me")
	public String enrollForm2(HttpSession session, String corpNo) {
		
		session.setAttribute("corpNo", corpNo);
		
		return "common/poEnrollForm";
		
	}
	
	@RequestMapping(value="insert.me", method=RequestMethod.POST)
	public String insertMember(Member m, MultipartFile logoFile, Model model, HttpSession session) throws Exception {

		if(!logoFile.getOriginalFilename().equals("")) {
			
			// 파일명 수정 작업 후 서버에 업로드 시키기
			// 예) "flower.png" => "2022112210405012345.png"
			// 1. 원본파일명 뽑아오기
			String originName = logoFile.getOriginalFilename(); // "flower.png"
			
			// 2. 원본파일로부터 확장자만 뽑기
			String ext = originName.substring(originName.lastIndexOf(".")); // ".png"
			
			// 3. 모두 이어 붙이기
			String changeName = m.getSellerId() + "Logo" + ext;
			
			// 4. 업로드 하고자 하는 서버의 물리적인 실제 경로 알아내기
			String savePath = session.getServletContext().getRealPath("/resources/images/");
			
			// 5. 경로와 수정파일명을 합체 후 파일을 업로드해주기
			try {
				logoFile.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}		
			m.setLogoAttachment(changeName);
		} 

		Member newSeller = new Member(m.getSellerName()
								    , m.getRepName()
								    , m.getSellerId()
								    , m.getSellerPwd()
								    , m.getSellerEmail()
								    , m.getSellerPhone()
								    , m.getCorpNo()
								    , m.getAccountNo()
								    , m.getLocation()
								    , m.getLogoAttachment());
		
		int result = memberService.insertMember(newSeller);
		
		if(result>0) {
			return "common/poEnroll_done";
		} else {
			model.addAttribute("errorMsg", "회원가입에 실패했습니다.");
			return "common/errorPage";
		}
	}
	
	// 이메일인증확인
	@GetMapping("/registerEmail")
	public String eamilConfirm(Member m) throws Exception{
		memberService.updateMailAuth(m);
		return "/common/emailAuthSuccess";
	}
	
	//아이디중복체크
	@ResponseBody
	@RequestMapping(value="idCheck.me", produces="text/html; charset=UTF-8")
	public String idCheck(String checkId) {
		int count = memberService.idCheck(checkId);
		return(count>0)? "NNNNN" : "NNNNY";
	}
	
}

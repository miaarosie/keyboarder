package com.kh.keyboarder.member.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kh.keyboarder.member.model.service.JM_MemberService;
import com.kh.keyboarder.member.model.service.MailService;
import com.kh.keyboarder.member.model.vo.Member;

@Controller
public class JM_MemberController {
	private final String EMAIL_CONFIRM_VIEW = "sign/eamilConfirm";
	
	@Autowired
	private JM_MemberService memberService;
	@Autowired
	private MailService mailSerivce;
	
	// 로그인
	@RequestMapping("login.me")
	public String loginMember(Member m, HttpSession session, String id, String saveId, HttpServletResponse response) {
		// 이메일 인증했는지 확인
		if(memberService.emailAuthFail(m.getConId()) == 1) {
			return "member/emailAuthFail";
		} else {
			Member loginUser = memberService.loginMember(m);
			if(loginUser == null) {
				session.setAttribute("errorMsg", "로그인에 실패하였습니다.");
			} else {
				session.setAttribute("loginUser", loginUser);
			}
			return "redirect:/";
		}
	}
	
	// 로그아웃
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	/**
	 * 회원가입시 약관동의 - 장미
	 * @return
	 */
	@RequestMapping("termsForm.me")
	public String termsForm() {
		return "member/memberTermsForm";
	}
	
	
	@RequestMapping("enroll.me")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	
	@RequestMapping(value="insert.me", method=RequestMethod.POST)
	public String insertMember(Member m , Model model, HttpSession session) throws Exception {
		//System.out.println(m.getAddress());
		//System.out.println(m.getConEmail());
		int result = memberService.insertMember(m);
		
		if(result>0) {
			session.setAttribute("alertMsg", "회원가입에 성공하였습니다. 이메일 인증 후 로그인 해주세요.");
			return "redirect:/";
		} else {
			model.addAttribute("errorMsg", "회원가입에 실패했습니다.");
			return "redirect:/";
		}
	}
	
	/**
	 * 이메일 인증 확인 - 장미
	 * @param m
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/registerEmail")
	public String eamilConfirm(Member m) throws Exception{
		memberService.updateMailAuth(m);
		return "/member/emailAuthSuccess";
	}
	
	// 아이디 중복확인
	@ResponseBody
	@RequestMapping(value="idCheck.me", produces="text/html; charset=UTF-8")
	public String idCheck(String checkId) {
		int count = memberService.idCheck(checkId);
		return(count>0)? "NNNNN" : "NNNNY";
	}
	
	// 이메일 중복확인
	@ResponseBody
	@RequestMapping(value="emailCheck.me", produces="text/html; charset=UTF-8")
	public String emailCheck(String checkEmail) {
		int count = memberService.emailCheck(checkEmail);
//		System.out.println(count);
		return(count>0)?  "NNNNN" : "NNNNY";
	}
	
	// 아이디찾기 페이지이동
	@RequestMapping(value="findIdForm.me")
	public String findId() {
		return "/member/findIdForm";
	}
	
	// 아이디찾기
	@ResponseBody
	@RequestMapping(value="findId.me", produces="text/html; charset=UTF-8")
	public String findId(Member m, HttpSession session) {
		String conId = memberService.findId(m);
		return (conId != null) ? conId : "NNNNN";
	}
	
	// 비밀번호찾기 페이지이동
	@RequestMapping(value="findPwdForm.me")
	public String findPwd() {
		return "/member/findPwdForm";
	}
	
	/**
	 * 비밀번호찾기(변경용) 본인인증 - 장미
	 * @param email
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="findPwd.me", produces="text/html; charset=UTF-8")
	public String findPwd(String email) {
		return mailSerivce.pwdEmail(email);
	}
	
	@RequestMapping("pChange.me")
	public String changePwd(Member m, HttpSession session, Model model) {
		int result = memberService.changePwd(m);
		if(result>0) {
			session.setAttribute("alertMsg", "성공적으로 비밀번호가 변경되었습니다.");
			return "redirect:/";
		} else {
			model.addAttribute("errorMsg", "비밀번호 변경실패");
			return "redirect:/";
		}
	}
}

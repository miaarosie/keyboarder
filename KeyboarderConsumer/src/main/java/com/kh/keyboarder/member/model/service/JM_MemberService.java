package com.kh.keyboarder.member.model.service;

import com.kh.keyboarder.member.model.vo.Member;

public interface JM_MemberService {
	// 로그인
	Member loginMember(Member m);
	
	// 회원가입
	int insertMember(Member m) throws Exception;
	
	// 아이디 중복체크
	int idCheck(String ckeckId);
	
	// 이메일 중복체크
	int emailCheck(String checkEmail);
	
	// 이메일 인증
	int updateMailKey(Member m);
	int updateMailAuth(Member m);
	int emailAuthFail(String id);

	// 아이디 찾기
	String findId(Member m);

	// 비밀번호변경
	int changePwd(Member m);

	
	

}

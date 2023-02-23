package com.kh.keyboarder.member.model.service;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kh.keyboarder.member.model.dao.JM_MemberDao;
import com.kh.keyboarder.member.model.vo.MailHandler;
import com.kh.keyboarder.member.model.vo.Member;
import com.kh.keyboarder.member.model.vo.TempKey;

@Service
public class JM_MemberServiceImpl  implements JM_MemberService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private JM_MemberDao memberDao;
	
	@Autowired
	JavaMailSender mailSender;

	/**
	 * 로그인 -장미
	 */
	@Override
	public Member loginMember(Member m) {
		Member loginUser = memberDao.loginMember(sqlSession, m);
		return loginUser;
	}

	/**
	 * 회원가입+이메일인증메일전송  -장미
	 */
	@Override
	public int insertMember(Member m) throws Exception {
		
		// 랜덤 문자열을 생성해서 mail_key 컬럼에 넣어주기
		String mail_key = new TempKey().getKey(30, false); // 랜덤키길이설정
		m.setMailKey(mail_key);
		
		// 회원가입
		int result = memberDao.insertMember(sqlSession, m);
		memberDao.updateMailKey(sqlSession, m);
		
		// 회원가입이 완료되면 인증을 위한 이메일 발송
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("Keyboar-der 회원가입 인증메일입니다."); // 메일 제목
		sendMail.setText( // 메일 내용
					"<h1>Keyboar-der 메일인증 </h1>" +
					"<br>Keyboar-der가입을 환영합니다." +
					"<br>아래 [이메일 인증 확인] 을 눌러주신 후 Keyboar-der를 이용해주시길 바랍니다." +
					"<br><a href='http://192.168.40.26:8888/keyboarder/registerEmail?conEmail="+m.getConEmail() +
					"&mailKey=" +mail_key+"'target='_blank'>이메일 인증 확인</a>");
		sendMail.setFrom("KeyboarderOfficial@gmail.com", "(주)키보더");
		sendMail.setTo(m.getConEmail());
		sendMail.send();
		
		return result;
	}
	
	/**
	 * 이메일인증  -장미
	 */
	@Override
	public int updateMailKey(Member m) {
		return memberDao.updateMailKey(sqlSession, m);
	}

	@Override
	public int updateMailAuth(Member m) {
		return memberDao.updateMailAuth(sqlSession, m);
	}

	@Override
	public int emailAuthFail(String id) {
		return memberDao.emailAuthFail(sqlSession, id);
	}
	
	/**
	 * 아이디중복체크  -장미
	 */
	@Override
	public int idCheck(String checkId) {
		return memberDao.idCheck(sqlSession, checkId);
	}

	/**
	 * 이메일중복체크-장미
	 */
	@Override
	public int emailCheck(String checkEmail) {
		return memberDao.emailCheck(sqlSession, checkEmail);
	}

	/**
	 * 아이디 찾기 - 장미
	 */
	@Override
	public String findId(Member m) {
		return memberDao.findId(sqlSession, m);
	}

	/**
	 * 비밀번호변경 - 장미
	 */
	@Override
	public int changePwd(Member m) {
		return memberDao.changePwd(sqlSession, m);
	}

	
}

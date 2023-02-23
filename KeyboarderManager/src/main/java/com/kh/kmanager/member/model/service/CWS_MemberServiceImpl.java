package com.kh.kmanager.member.model.service;

import javax.mail.MessagingException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kh.kmanager.member.model.dao.CWS_MemberDao;
import com.kh.kmanager.member.model.vo.MailHandler;
import com.kh.kmanager.member.model.vo.Member;
import com.kh.kmanager.member.model.vo.TempKey;

@Service
public class CWS_MemberServiceImpl implements CWS_MemberService  {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CWS_MemberDao memberDao;
	
	@Autowired
	JavaMailSender mailSender;
	
	@Override
	public Member loginMember(Member m) {
		Member loginUser = memberDao.loginMember(sqlSession, m);
		return loginUser;
	}
	
	@Override
	public int corpNoCheck(String corpNo) {
		int result = memberDao.corpNoCheck(sqlSession, corpNo);
		return result;
	}

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
					"<br><a href='http://192.168.40.26:8888/kmanager/registerEmail?sellerEmail="+m.getSellerEmail() +
					"&mailKey=" +mail_key+"'target='_blank'>이메일 인증 확인</a>");
		sendMail.setFrom("KeyboarderOfficial@gmail.com", "(주)키보더");
		sendMail.setTo(m.getSellerEmail());
		sendMail.send();
		
		return result;
	}

	@Override
	public int idCheck(String checkId) {
		return memberDao.idCheck(sqlSession, checkId);
	}

	@Override
	public String findId(String corpNo) {
		String sellerId = memberDao.findId(sqlSession, corpNo);
		return sellerId;
	}

	@Override
	public Member initializePwdForm(Member user) {
		Member seller = memberDao.initializePwdForm(sqlSession, user);
		return seller;
	}

	@Override
	public int initializePwd(Member user) {
		int result = memberDao.initializePwd(sqlSession, user);
		return result;
	}

	@Override
	public int updateMailKey(Member m) {
		return memberDao.updateMailKey(sqlSession, m);
	}

	@Override
	public int updateMailAuth(Member m) {
		return memberDao.updateMailAuth(sqlSession, m);
	}

	@Override
	public int emailAuthFail(String sellerId) {
		return memberDao.emailAuthFail(sqlSession, sellerId);
	}



	
	
}

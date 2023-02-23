package com.kh.kmanager.common.inquiry.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kmanager.common.inquiry.model.dao.InquiryDao;
import com.kh.kmanager.common.inquiry.model.vo.Inquiry;
import com.kh.kmanager.common.model.vo.PageInfo;

@Service
public class InquiryServiceImpl implements InquiryService{
	
	@Autowired
	private InquiryDao inquiryDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount(int sellerNo) {
		return inquiryDao.selectListCount(sqlSession, sellerNo);
	}

	@Override
	public ArrayList<Inquiry> selectList(PageInfo pi, int sellerNo) {
		return inquiryDao.selectList(sqlSession, pi, sellerNo);
	}

	@Override
	public Inquiry selectInquiry(int inquiryNo) {
		return inquiryDao.selectInquiry(sqlSession, inquiryNo);
	}

	@Override
	public int insertInquiry(Inquiry i) {
		return inquiryDao.insertInquiry(sqlSession, i);
	}

	@Override
	public Inquiry selectReplyList(int inquiryNo) {
		return inquiryDao.selectReplyList(sqlSession, inquiryNo);
	}

	@Override
	public int insertReply(Inquiry r) {
		return inquiryDao.insertReply(sqlSession, r);
	}

}

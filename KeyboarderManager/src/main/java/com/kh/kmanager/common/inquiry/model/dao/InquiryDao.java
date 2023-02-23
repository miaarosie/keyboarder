package com.kh.kmanager.common.inquiry.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.common.inquiry.model.vo.Inquiry;
import com.kh.kmanager.common.model.vo.PageInfo;

@Repository
public class InquiryDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession, int sellerNo) { 
		return sqlSession.selectOne("inquiryMapper.selectListCount", sellerNo);
	}
	
	public ArrayList<Inquiry> selectList(SqlSessionTemplate sqlSession, PageInfo pi, int sellerNo) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("inquiryMapper.selectList", sellerNo, rowBounds);
	}
	
	public int insertInquiry(SqlSessionTemplate sqlSession, Inquiry i) { 
		return sqlSession.insert("inquiryMapper.insertInquiry", i);
	}

	public Inquiry selectInquiry(SqlSessionTemplate sqlSession, int inquiryNo) {
		return sqlSession.selectOne("inquiryMapper.selectInquiry", inquiryNo);
	}
	
	public Inquiry selectReplyList(SqlSessionTemplate sqlSession, int inquiryNo) {
		return sqlSession.selectOne("inquiryMapper.selectReplyList", inquiryNo);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Inquiry r) {
		return sqlSession.insert("inquiryMapper.insertReply", r);
	}
}

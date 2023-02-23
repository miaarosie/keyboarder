package com.kh.kmanager.common.inquiry.model.service;

import java.util.ArrayList;

import com.kh.kmanager.common.inquiry.model.vo.Inquiry;
import com.kh.kmanager.common.model.vo.PageInfo;

public interface InquiryService {
	// 문의글 총 개수
	int selectListCount(int sellerNo); 
	
	// 문의글 리스트조회
	ArrayList<Inquiry> selectList(PageInfo pi, int sellerNo);
	
	// 문의글 상세조회
	Inquiry selectInquiry(int inquiryNo);
	
	// 문의글 작성
	int insertInquiry(Inquiry i);
	
	Inquiry selectReplyList(int inquiryNo); // 답변조회
	int insertReply(Inquiry r); // 답변작성(관리자만)
}

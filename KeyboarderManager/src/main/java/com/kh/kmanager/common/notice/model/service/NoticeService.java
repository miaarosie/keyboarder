package com.kh.kmanager.common.notice.model.service;

import java.util.ArrayList;

import com.kh.kmanager.common.model.vo.PageInfo;
import com.kh.kmanager.common.notice.model.vo.Notice;

public interface NoticeService {

	// 공지사항 리스트 조회 서비스 + 페이징처리
	int selectListCount();
	ArrayList<Notice> selectNoticeList(PageInfo pi);
	
	// 공지사항 상세 조회 서비스 + 조회수 증가 (조회수 증가는 PO가 조회할때만)
	int increaseCount(int noticeNo);
	Notice selectNotice(int noticeNo);
	
	// 공지사항 작성 서비스 (BO 만 가능)
	int insertNotice(Notice n);
	
	// 공지사항 삭제 서비스 (BO 만 가능)
	int deleteNotice(int noticeNo);
	
	// 공지사항 수정 서비스 (BO 만 가능)
	int updateNotice(Notice n);
	
	// 메인페이지에서 공지사항 최신글 5개 불러오기
	ArrayList<Notice> selectMainNoticeList();
}

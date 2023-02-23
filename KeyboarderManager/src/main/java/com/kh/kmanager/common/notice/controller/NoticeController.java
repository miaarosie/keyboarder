package com.kh.kmanager.common.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.kmanager.common.model.vo.PageInfo;
import com.kh.kmanager.common.notice.model.service.NoticeService;
import com.kh.kmanager.common.notice.model.vo.Notice;
import com.kh.kmanager.common.template.Pagination;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;

	/**
	 * BO 공지사항 리스트 조회 및 페이지로 이동 처리를 해주는 메소드 - 백성현
	 * @return : BO 공지사항 리스트 조회 페이지 이동
	 */
	@RequestMapping("noticeList.bo")
	public String boSelectNoticeList(@RequestParam(value="cpage", defaultValue="1")int currentPage, Model model) {
		
		int listCount = noticeService.selectListCount();
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Notice> list = noticeService.selectNoticeList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "common/noticeListView";
	}
	
	/**
	 * BO 공지사항 작성 페이지로 단순이동 처리를 해주는 메소드 - 백성현
	 * @return : BO 공지사항 작성 페이지 이동
	 */
	@RequestMapping("noticeEnrollForm.bo")
	public String boEnrollFormNotice() {
		
		return "common/boNoticeEnrollForm";
	}
	
	/**
	 * BO 공지사항 상세페이지 조회 메소드 - 백성현
	 * @return : BO 공지사항 상세조회 페이지 이동
	 */
	@RequestMapping("noticeDetail.bo")
	public ModelAndView boSelectNotice(int nno, ModelAndView mv, HttpSession session) {
		
		// BO 는 공지사항 상세조회 시 조회수 증가되지 않게 설정
		Notice n = noticeService.selectNotice(nno);
		
		if(n != null) { // 공지사항 상세조회 성공
			
			mv.addObject("n", n).setViewName("common/noticeDetailView");
		}
		else { // 공지사항 상세조회 실패
			
			// 에러페이지로 포워딩?? => 아직 에러페이지 jsp파일 없음
			// 해당부분은 추후 회의해서 결정하는걸로 / 에러페이지 방식으로 진행하면 에러메세지 객체를 어떤방식(session, ModelAndView)으로 보낼지? 
			// 우선 session scope 에 alert 로 오류메시지 전달 후 공지사항 리스트 페이지로 포워딩
			session.setAttribute("alertMsg", "공지사항 상세조회 실패");
			mv.setViewName("redirect:/noticeList.bo");
		}
		
		return mv;
	}
	
	/**
	 * BO 공지사항 수정 페이지로 이동 처리를 해주는 메소드 - 백성현
	 * @return : BO 공지사항 수정 페이지 이동
	 */
	@RequestMapping("noticeUpdateForm.bo")
	public String boUpdateFormNotice(int nno, Model model) {
		
		// 공지사항 수정페이지 포워딩 전에 수정할 공지사항의 정보 조회 (기존의 상세보기 서비스 재활용)
		Notice n = noticeService.selectNotice(nno);
		
		model.addAttribute("n", n);
		
		return "common/boNoticeUpdateForm";
	}
	
	/**
	 * BO 공지사항 수정 처리를 해주는 메소드 - 백성현
	 * @return : BO 공지사항 수정 처리 후 수정한 공지사항 상세조회 페이지로 이동
	 */
	@RequestMapping("noticeUpdate.bo")
	public String boUpdateNotice(Notice n, HttpSession session) {
		
		int result = noticeService.updateNotice(n);
		
		if(result > 0) { // 공지사항 수정 성공 시
			
			session.setAttribute("alertMsg", "공지사항 수정 완료");
		}
		else { // 공지사항 수정 실패 시
			
			session.setAttribute("alertMsg", "공지사항 수정 실패");
		}
		
		// 성공, 실패 여부 상관없이 최종적으로 수정시도하였던 공지사항의 상세조회 페이지로 리다이렉트
		return "redirect:/noticeDetail.bo?nno=" + n.getNoticeNo();
	}
	
	/**
	 * BO 공지사항 작성 메소드 - 백성현
	 * @return : 공지사항 리스트 조회 페이지로 리다이렉트
	 */
	@RequestMapping("insertNotice.bo")
	public ModelAndView boInsertNotice(Notice n, HttpSession session, ModelAndView mv) {
		
		int result = noticeService.insertNotice(n);
		
		if(result > 0) { // 공지사항 작성 성공
			
			session.setAttribute("alertMsg", "공지사항 등록 완료");
		}
		else { // 공지사항 작성 실패
			
			session.setAttribute("alertMsg", "공지사항 작성 실패");
		}
		
		// 성공, 실패 여부 상관없이 최종적으로 공지사항 리스트 페이지로 url 재요청
		mv.setViewName("redirect:/noticeList.bo");
		
		return mv;
	}
	
	/**
	 * BO 공지사항 삭제 메소드 - 백성현
	 * @return
	 */
	@RequestMapping("noticeDelete.bo")
	public String boDeleteNotice(int nno, HttpSession session) {
		
		int result = noticeService.deleteNotice(nno);
		
		if(result > 0) { // 공지사항 삭제 성공 => 성공 alert 창 띄운 후 공지사항 리스트 페이지로 리다이렉트
			
			session.setAttribute("alertMsg", "공지사항 삭제 완료");
			return "redirect:/noticeList.bo";
		}
		else { // 공지사항 삭제 실패 => 실패 alert 창 띄운 후 삭제시도 하였던 공지사항 상세조회 페이지로 리다이렉트
			
			session.setAttribute("alertMsg", "공지사항 삭제 실패");
			return "redirect:/noticeDetail.bo?nno=" + nno;
		}
	}
	

	
	
	/**
	 * PO 공지사항 리스트 조회 및 페이지로 이동 처리를 해주는 메소드 - 백성현
	 * @return : PO 공지사항 리스트 조회 페이지 이동
	 */
	@RequestMapping("noticeList.po")
	public String poSelectNoticeList(@RequestParam(value="cpage", defaultValue="1")int currentPage, Model model) {
		
		int listCount = noticeService.selectListCount();
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Notice> list = noticeService.selectNoticeList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "common/noticeListView";
	}
	
	/**
	 * PO 공지사항 상세페이지 조회 메소드 - 백성현
	 * @return : PO 공지사항 상세조회 페이지 이동
	 */
	@RequestMapping("noticeDetail.po")
	public ModelAndView poSelectNotice(int nno, ModelAndView mv, HttpSession session) {
		
		// 해당 공지사항 조회수 증가 먼저 실행
		int result = noticeService.increaseCount(nno);
		
		if(result > 0) { // 조회수 증가 성공 시
			
			// 공지사항 상세조회 실행
			Notice n = noticeService.selectNotice(nno);
			
			mv.addObject("n", n).setViewName("common/noticeDetailView");
		}
		else { // 조회수 증가 실패 시
			
			// 에러페이지로 포워딩?? => 아직 에러페이지 jsp파일 없음
			// 해당부분은 추후 회의해서 결정하는걸로 / 에러페이지 방식으로 진행하면 에러메세지 객체를 어떤방식(session, ModelAndView)으로 보낼지? 
			// 우선 session scope 에 alert 로 오류메시지 전달 후 공지사항 리스트 페이지로 포워딩
			session.setAttribute("alertMsg", "공지사항 상세조회 실패");
			mv.setViewName("redirect:/noticeList.po");
		}
		
		return mv;
	}
	
	
}

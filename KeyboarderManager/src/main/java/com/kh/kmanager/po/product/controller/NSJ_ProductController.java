package com.kh.kmanager.po.product.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.kmanager.member.model.vo.Member;
import com.kh.kmanager.po.product.model.service.NSJ_ProductService;
import com.kh.kmanager.po.product.model.vo.Product;

@Controller
public class NSJ_ProductController {

	@Autowired
	NSJ_ProductService productService;

	/**
	 * po 전체 상품 조회 메소드 -성진
	 * 
	 * @return
	 */
	// po상품 메인화면 띄워주기
	@RequestMapping("show.pro")
	public String showProduct(Model model, Product p, HttpSession session) {
		
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		p.setSellerNo(sellerNo);
		ArrayList<Product> list = productService.showProduct(sellerNo);
		

		// WEB-INF/views/po/poProduct/
		
		model.addAttribute("list", list);
		return "po/poProduct/poProductManageMain";
	}

	/**
	 * po 상세 상품 조회-성진
	 * 
	 * @return
	 */
	@RequestMapping("detail.pro")
	public ModelAndView detailProduct(int productNo, ModelAndView mv) {

		Product p = productService.detailProduct(productNo);

		mv.addObject("p", p).setViewName("po/poProduct/poProductUpdate");

		return mv;
	}

	/**
	 * po 상품 수정 메소드 -성진
	 * 
	 * @return //
	 */
	@RequestMapping("update.pro")
	public String updateProduct(Product p, MultipartFile[] reupfile, HttpSession session, String[] originfile) throws Exception {
		
		// 새로넘어온 첨부파일이 있는 경우 => 기존 넘어온 첨부파일을 삭제
		
		// 반복을 돌리면서 검사 => 0 ~ 3번째 인덱스까지 filename 에 제대로된 값이 있는지 (일반포문)
		// 만약 제대로된 값이 있따면 거기에 대한 컬럼만 update 해주기
		
		// 수정 파일명 만들기
		String path = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		// 로직 추가 전 => p 에는 update 시 필요한 정보들이 모두 담겨있어야함
		// 기존파일들의 수정명만 일일이 다 필드에 담기
		p.setAttachment1(originfile[0]);
		p.setAttachment2(originfile[1]);
		p.setAttachment3(originfile[2]);
		p.setAttachment4(originfile[3]);
		
		// 이 로직은 지금 reupfile 기준으로 수정할 파일이 있을 경우 => 기존 필드값을 수정파일의 수정명으로 덮어씌우는 작업
		for(int i = 0; i < reupfile.length; i++) {
			
			if(!reupfile[i].getOriginalFilename().equals("")) { // 수정파일이 있을 경우
				
				String originFileName = reupfile[i].getOriginalFilename();// 원본 파일 명
				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				String ext = originFileName.substring(originFileName.lastIndexOf("."));
				
				// 매 파일마다 새로운 파일명이 되도록
				String saveFileName = String.format("%s%d%s", currentTime, i, ext);
				
				reupfile[i].transferTo(new File(path, saveFileName));
				switch(i) {
				case 0 : 
					p.setAttachment1(saveFileName);
					break;
				case 1 :
					p.setAttachment2(saveFileName);
					break;
				case 2 : 
					p.setAttachment3(saveFileName);
					break;
				case 3 : 
					p.setAttachment4(saveFileName);
					break;
				}
				
				// 해당 자리와 맞는 기존파일을 삭제
				new File(path + originfile[i]).delete();
			}
		}
	
		
		/*
		String path = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		for(int i = 0; i < reupfile.length; i++) {
			
			if (!reupfile[i].getOriginalFilename().equals("")) {
							
				String originFileName = reupfile[i].getOriginalFilename();// 원본 파일 명
				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				String ext = originFileName.substring(originFileName.lastIndexOf("."));
				String saveFileName = String.format("%s%d%s", currentTime, i, ext);
				
				if (i == 0) {
					reupfile[i].transferTo(new File(path, saveFileName));
					p.setAttachment1(saveFileName);
					new File(path + reupfile[i].getOriginalFilename()).delete();

				} else if (i == 1) {
					reupfile[i].transferTo(new File(path, saveFileName));
					p.setAttachment2(saveFileName);
					new File(path + reupfile[i].getOriginalFilename()).delete();
					
				} else if (i == 2) {
					reupfile[i].transferTo(new File(path, saveFileName));
					p.setAttachment3(saveFileName);
					new File(path + reupfile[i].getOriginalFilename()).delete();
					
				} else {
					
					reupfile[i].transferTo(new File(path, saveFileName));
					p.setAttachment4(saveFileName);
					new File(path + reupfile[i].getOriginalFilename()).delete();
				}
				
			}
		}
		*/ // 검증용 로직
		
		int result = productService.updateProduct(p);

		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 상품정보가 수정되었습니다.");
		}

		return "redirect:/show.pro";		
	}

	
	

	@RequestMapping("insert.pro")
	public ModelAndView insertProduct(List<MultipartFile> upfile, Product p, MultipartHttpServletRequest request, HttpSession session,
			ModelAndView mv) throws Exception {

		String path = request.getSession().getServletContext().getRealPath("/resources/uploadFiles/");

		File fileDir = new File(path);

		if (!fileDir.exists()) {
			fileDir.mkdirs();
		}

		long time = System.currentTimeMillis();

		for (int i = 0; i < upfile.size(); i++) {

			String originFileName = upfile.get(i).getOriginalFilename(); // 원본 파일 명
			String saveFileName = String.format("%d_%s", time, originFileName);

			try {
				// 파일생성
				upfile.get(i).transferTo(new File(path, saveFileName));
				
				switch(i) {
				case 0 : 
					p.setAttachment1(saveFileName);
					break;
				case 1 : 
					p.setAttachment2(saveFileName);
					break;
				case 2 : 
					p.setAttachment3(saveFileName);
					break;
				case 3 : 
					p.setAttachment4(saveFileName);
					break;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}


		int result = productService.insertProduct(p);
		System.out.println(result);
		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 상품이 등록 되었습니다.");

			mv.setViewName("redirect:/show.pro");
		} else { // 실패 => 에러페이지로 포워딩

			// mv.addObject("errorMsg", "게시글 작성 실패");
			// mv.setViewName("common/errorPage");

			// addObject 메소드의 반환형은 ModelAndView 타입임
			// => 다음과 같이 메소드 체이닝도 가능하다.
			mv.addObject("errorMsg", "게시글 작성 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}

	
	/**
	 * po 상품 삭제 메소드-성진
	 * 
	 * @return //
	 */
	@RequestMapping("delete.pro")
	public String deleteProduct(int productNo, HttpSession session, Model model) {

		int result = productService.deleteProduct(productNo);

		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 상품이 비공개처리되었습니다.");

		} else {
			session.setAttribute("alertMsg", "상품 비공개에 실패했습니다.");
		}
		return "redirect:/show.pro";
	}

	@RequestMapping("insertEnroll.pro")
	public String insertEnrollForm() {

		return "po/poProduct/poProductInsert";
	}

	/**
	 * 판매중인 상품의 수를 세는 메소드-성진
	 * 
	 * @return
	 */
	  @ResponseBody
	  @RequestMapping(value="count.pro", produces="application/json; charset=UTF-8") 
	  public String countProduct(Model model,int sellerNo) {
		  
		  Product p = productService.countProduct(sellerNo); 
		  // System.out.println(p);
		   return new Gson().toJson(p);
	  }
		 
	/**
	 * 상품이름으로 검색하는 메소드-성진
	 * 
	 * @return
	 */
	@RequestMapping("select.pro")
	public String selectProduct(Product p, Model model, String productName,HttpSession session) {
		// System.out.println(productName);
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		p.setSellerNo(sellerNo);
		ArrayList<Product> list = null;
		
		if (productName.equals("")) {
			list = productService.showProduct(sellerNo);
		} else {
			list = productService.selectProduct(p);
		}

		model.addAttribute("list", list);

		return "po/poProduct/poProductManageMain";

	}
	
	 
	/**
	 * 상품을 다시 공개처리 해주는 메소드-성진
	 * 
	 * @return
	 */@RequestMapping("change.pro")
	public String changeelectProduct (int productNo, HttpSession session, Model model) {
		
		
		 int result= productService.changeProduct(productNo);
		 
		 if (result > 0) {
				session.setAttribute("alertMsg", "성공적으로 상품이 공개처리되었습니다.");

			} else {
				session.setAttribute("alertMsg", "상품 공개에 실패했습니다.");
			}
			return "redirect:/show.pro";
	}

}


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>K-MANAGER</title>
</head>
<body>

  <!-- 왼쪽 사이드바 -->
  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">

    <!-- Brand Logo --> <!-- 로그인 계정 로고, 상호명 -->
    <a href="/kmanager/pomain" class="brand-link">
      <!-- <i class="ion-android-person fas fa-fw"></i> -->
      <c:choose>
      	<c:when test="${ empty loginUser.logoAttachment }">
	      <img src="resources/images/defaultLogo.png" class="brand-image img-circle elevation-3" style="opacity: 1; margin-right: 15px;">
      	</c:when>
      	<c:otherwise>
      		<img src="resources/images/${ loginUser.logoAttachment }" class="brand-image img-circle elevation-3" style="opacity: .8">
      	</c:otherwise>
      </c:choose>
      <span class="brand-text font-weight-light">${ loginUser.sellerName }</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      
      <!-- 사이드바 검색 (메뉴 검색) -->
      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">

        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        
          <!-- 메뉴바 제목 -->
          <li class="nav-header">KEYBOAR-DER 마켓 관리</li>
        
          <!-- 하위 메뉴 있는 메뉴 -->
          <li class="nav-item">
            <a href="show.pro" class="nav-link">
              <i class="nav-icon fa-solid fa-bag-shopping"></i>
              <p>상품 관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <!-- 하위 메뉴 -->
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="show.pro" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>상품 전체 조회</p>
                </a>
              </li>
            </ul>
          </li>


          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-solid fa-cart-shopping"></i>
              <p>주문관리
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="delivery.poOrder" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>배송 관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="decision.po" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>구매확정 내역</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="allOrderList.po" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>전체 주문내역</p>
                </a>
              </li>
            </ul>
          </li>

          <li class="nav-item">
            <a href="insert.sco" class="nav-link">
              <i class="nav-icon fas  fa-gift"></i>
              <p>쿠폰 관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="mainCoupon.po" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>쿠폰 등록</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="CouponList.po" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>쿠폰 조회/수정</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="expireCoupon.po" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>만료 쿠폰 조회</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="ableCoupon.po" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>사용가능 쿠폰 조회</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="usedCList.po" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>쿠폰 사용내역</p>
                </a>
              </li>
            </ul>
          </li>

          <li class="nav-item">
            <a href="" class="nav-link">
              <i class="nav-icon fas fa-solid fa-file-invoice"></i>
              <p>정산 관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="list.se" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>정산내역 조회</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="settleView.po" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>정산 상세내역</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="commissionList.po" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>수수료 내역</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="electronicTaxInvoice.po" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>전자세금계산서 관리</p>
                </a>
              </li>
            </ul>
          </li>

          <li class="nav-item">
            <a href="kmoney.po" class="nav-link">
              <i class="nav-icon fa-sharp fas fa-solid fa-receipt"></i>
              <p>정산 예정금 조회</p>
            </a>
          </li>

          <!-- 메뉴바 제목 -->
          <li class="nav-header">마이페이지</li>

          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-solid fa-gear"></i>
              <p>판매자정보 관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="updateInfoPage.po" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>판매자 정보 수정</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="kmoney.po" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>K-MONEY 잔액관리</p>
                </a>
              </li>
            </ul>
          </li>
          
          <li class="nav-item">
            <a href="list.iq" class="nav-link">
              <i class="nav-icon fas fa-solid fa-comment-dots"></i>
              <p>1:1 문의</p>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="noticeList.po" class="nav-link">
              <i class="nav-icon fas fa-solid fa-circle-exclamation"></i>
              <p>공지사항</p>
            </a>
          </li>
          
		</ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
    
</body>
</html>
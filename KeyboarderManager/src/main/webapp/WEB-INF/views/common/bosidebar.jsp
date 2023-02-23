
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

  <!-- 왼쪽 사이드바 -->
  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">

    <!-- Brand Logo --> <!-- 로그인 계정 로고, 상호명 -->
    <a href="/kmanager/bomain" class="brand-link">
      <!-- <i class="ion-android-person fas fa-fw"></i> -->
      <img src="resources/images/defaultLogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: 1; margin-right: 15px;">
      <span class="brand-text font-weight-light">관리자</span>
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
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-solid fa-cart-shopping"></i>
              <p>주문 관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <!-- 하위 메뉴 -->
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="allOrderList.bo" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>전체 주문내역 조회</p>
                </a>
              </li>
            </ul>
          </li>

          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas  fa-gift"></i>
              <p>쿠폰 관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="coupon.bo" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>쿠폰 전체 조회</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="registCoupon.bo" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>쿠폰 등록</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="couponExpire.bo" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>만료 쿠폰 조회</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="couponAble.bo" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>사용가능 쿠폰 조회</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="usedCoupon.bo" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>쿠폰 사용내역</p>
                </a>
              </li>
            </ul>
          </li>

          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-solid fa-file-invoice"></i>
              <p>정산 관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="commitionSales.bo" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>수수료 매출 조회</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="storeSettlement.bo" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>입점업체 정산금 관리</p>
                </a>
              </li>
            </ul>
          </li>

         <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-solid fa-chart-pie"></i>
              <p>매출/상품 통계
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="salesStatics.bo" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>전체 매출 통계</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="SalesProduct.bo" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>전체 상품 통계</p>
                </a>
              </li>
            </ul>
          </li>

          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-solid fa-gear"></i>
              <p>KEYBOAR-DER +
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="store.bo" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>입점업체 관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="noticeList.bo" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>공지사항 관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="list.iq" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>1:1 문의 관리</p>
                </a>
              </li>
            </ul>
          </li>
          
		</ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
    
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-MANAGER :: 정산 상세 조회</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style>
.content {margin : auto;}   
    
 td{
  padding-left:15px;
  }
 #coupone_list{
 border-collapse: collapse;
	}
#coupone_view{
 border-collapse: collapse;
}

#settementList{

margin:auto;
overflow-y:scroll;
height:470px;
}

 </style>
</head>
<body class="hold-transition sidebar-mini"> <!-- 모든 body 태그에 적용 -->

<jsp:include page="/WEB-INF/views/common/poheader.jsp" />

<jsp:include page="/WEB-INF/views/common/posidebar.jsp" />

<!-- 콘텐츠 영역 전체 래퍼 -->
	<form id="selectSettleDetailList" action="searchSettle.po" method="post">   
	<div class="content-wrapper">
		<br>
		<!-- 콘텐츠 영역 제목 -->
		<div class="content-header">
		  <div class="container-fluid">
		    <div class="row mb-2">
		      <div class="col-sm-6">
		        <h1 class="m-0" style="margin-left:20px;">&nbsp;&nbsp;정산 상세내역</h1>
		      </div><!-- /.col -->
		    </div><!-- /.row -->
		  </div><!-- /.container-fluid -->
		</div>
			
			<!-- 실제 콘텐츠 영역 -->
			
		<div class="content" style="width:95%;" >
		 <div class="card" style="padding:30px;">
			 <div>
			 	<span style="font-size :25px; margin-left:20px; margin-right:50px;">조회기간</span>
			 	<input type="date" style="height:45px;" name="startDate" value="${param.startDate }">&nbsp; ~ &nbsp; <input type="date" name="endDate" value="${param.endDate }" style="height:45px;"></td>
			 </div>
			 <div align="center">  
			 	 <button class="btn btn-dark" style="width:100px; margin-right:10px;">검색</button>  
			     <button class="btn btn-outline-secondary" style="width:100px;">초기화</button>  
			      
			     <button class="btn btn-outline-secondary"  type="button" style="width:200px; float:right;" onclick="location.href='excelDownload.sDetail'" >
			      엑셀다운로드</button> 
			      
			 </div>
	    </div>  
		<br>
			   
		<div class="card">
		<table width="100%" class="table-bordered" align="center";>
		       <thead>
		        <tr align="center">
		           <th rowspan="2">판매량</th>
		           <th rowspan="2">실 상품 판매금액</th>
		           <th rowspan="2">배송비</th>
		           <th colspan="2">할인금액</th>
		           <th colspan="3">수수료정보</th>
		           <th rowspan="2">정산확정금액</th>
		        </tr>
		
		        <tr align="center">
		           <th>KEYBOAR-DER쿠폰</th>
		           <th>업체쿠폰</th>
		           <th>판매수수료</th>
		           <th>수수료할인</th>
		           <th>최종수수료</th>
		    	</tr>
		    <tbody>
		       	<c:forEach var="o" items="${list2}">
		        <tr align="center">
		            <td>${o.orderNo }</td>
		            <td>${o.orderPrice}</td>
		            <td>${o.orderNo*2500}</td>
		            <td>${o.keyboarderCouponPrice}</td>
		            <td>${o.marketCouponPrice}</td>
            		<td>${o.commitionFin}</td>
		            <td>${o.keyboarderCouponPrice}</td>
		            <td>${o.commition}</td>
		            <td>${o.settleDept }</td>
		    	</tr>
		       </c:forEach>
		    </tbody>
		</table>
	</div>
	<br>
		
	<div id="settementList" class="card">
	<table  id="coupone_view" class="table table-bordered" align="center" style="width:100%;">
				<thead align="center"> 
				<tr>
				   <th style="vertical-align:middle;" rowspan="2">구분</th>
				   <th style="vertical-align:middle;" rowspan="2">취소여부</th>
				   <th style="vertical-align:middle;" rowspan="2">매출일</th>
				   <th colspan="4" >주문상품정보</th>
				   <th colspan="3">주문결제정보</th>
				</tr>
				
				<tr>
				    <th>주문번호</th>
				    <th>주문자</th>
				    <th>상품번호</th>
				    <th>상품명</th>
				    <th>판매단가</th>
				    <th>할인쿠폰</th>
				    <th>수수료</th>
				</tr>
				</thead>
				<tbody style="background-color:white;">
				
			<c:forEach var="o" items="${list}">
				<tr>
				    <td align="center">${o.orderStatus==3?"구매확정" : "미확정"}</td>
				    <td align="center">${o.orderStatus==3?"구매확정" : "미확정"}</td>
				    <td align="center">${o.orderDate}</td>
				    <td align="center">${o.orderNo}</td>
				    <td align="center">${o.conName}</td>
				    <td align="center">${o.productNo}</td>
				    <td>${o.productName}</td>
				    <td align="center">${o.price}</td>
				    <td align="center">${o.couponPrice}</td>
				    <td align="center">${o.commition}</td>
					</tr>
					 </c:forEach>
					</tbody>
				</table>
				</div>
			</div>
		</div>
	</form>
		</body>
	</html>






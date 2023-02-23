<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-MANAGER :: 정산내역 전체조회</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style>
        #orderConfirmForm {
            width: 95%;
            height: 480px;
            margin: auto;
        }
        #date{ 
            height : 70px;
        }
        #searchbtn {
        	width: 70px;  
        	height: 35px; 
        	background-color:black; 
        	line-height: 1px; 
        	margin-left: 30px;
        }
        #orderConfirmList {
            height : 550px;
            margin :auto; 
	       	margin-bottom: 30px; 
	       	font-size: 13px;
	       	overflow-y: scroll;
        }
      
    </style>
</head>
<body class="hold-transition sidebar-mini"> <!-- 모든 body 태그에 적용 -->

<jsp:include page="/WEB-INF/views/common/poheader.jsp" />

<jsp:include page="/WEB-INF/views/common/posidebar.jsp" />

<!-- 콘텐츠 영역 전체 래퍼 -->
<div class="content-wrapper">
<br>
<!-- 콘텐츠 영역 제목 -->
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0" style="margin-left:20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;정산내역 전체조회</h1>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>

<!-- 실제 콘텐츠 영역 -->
<div class="content">
	<div id="orderConfirmForm">
        <div id="info" class="card">
            <p style="margin-top : 20px; margin-left:20px;">
                ⦁ &nbsp;&nbsp;정산확정금액은 구매자가 구매확정 후 K-Money 로 전환됩니다. <br>
                ⦁ &nbsp;&nbsp;지급된 K-Money 는 판매자님의 출금 요청 후 영업일 기준 3일 이내에 입금됩니다.
            </p>
        </div>
        <br>
        
        <div id="date" class="card">
         <form action="searchSettlementTotal.po">
        	 <div style="line-height: 70px; margin-left: 20px;">
                <span style="margin-right : 70px; font-size: 20px;">조회기간</span>
                <input type="month" style="height: 35px;" id="searchSettleDate" name="searchSettleDate" value="${ searchSettleDate }">
                <input type="submit" class="btn btn-dark" value="검색" id="searchbtn">
                 <input type="button" class="btn btn-outline-secondary" value="초기화" id="resetbtn" onclick="location.href='list.se'">
            </div>
        </form>
        </div>
        <br>

        <div id="orderConfirmList" class="card">
            <div id="excelbtn">
                <c:choose>
                    <c:when test="${ not empty  searchSettleDate }">
                        <a href="excelDownloadSearch.se?searchSettleDate=${ searchSettleDate }">
                            <button type="button" class="btn btn-outline-secondary" style="float:right; margin-right: 35px; margin-top :20px; margin-bottom:20px;">
                                엑셀다운로드
                            </button>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="excelDownloadTotal.se">
                            <button type="button" class="btn btn-outline-secondary" style="float:right; margin-right: 35px; margin-top :20px; margin-bottom:20px;">
                                엑셀다운로드
                            </button>
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>

            <table class="table table-bordered" align="center" style="width:95%; ">
                <thead align="center">
                    <tr>
                    	<th width="13%">주문번호</th>
                        <th width="10%">정산일</th>
                        <th width="8%">상품번호</th>
                        <th width="8%">상품금액</th>
                        <th width="7%">배송비</th>
                        <th width="10%">총 판매금액</th>
                        <th width="10%">판매수수료</th>
                        <th width="14%">KEYBOAR-DER 쿠폰</th>
                        <th width="10%">입점사 쿠폰</th>
                        <th width="10%">정산확정금액</th>
                    </tr>
                </thead>
                <tbody style="background-color : white;">
                    <c:forEach var="s" items="${ list }">
                        <tr align="center">
                            <td>${ s.orderNo }</td>
                            <td>${ s.settleDate }</td>
                            <td>${ s.productNo }
                            <td>${s.price } 원</td>
                            <td>2500원</td>
                            <td>${ s.paymentBill } 원</td>
                            <td>${ s.commition } 원</td>
                            <td>${ s.keyCouponPrice } 원</td>
                            <td>${ s.stoCouponPrice } 원</td>
                            <td>${ s.settleDept } 원</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>
        </div>
    </div>
	
</div> <!-- /.content -->
<script>
	/* $(function() {
		var date = new Date();
		String(date);
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		
		document.getElementById("searchSettleDate").value = year+"-"+month;
		
	}) */
</script>
</div> <!-- /.content-wrapper -->
</body>
</html>
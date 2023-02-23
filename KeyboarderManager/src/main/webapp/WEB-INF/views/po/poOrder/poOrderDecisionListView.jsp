<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-MANAGER :: 구매확정내역조회</title>

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
            margin: auto;
            margin-top: 30px;
        }

        #date {  
            height : 70px;
        }
        
        #searchbtn {
        	width: 70px;  
        	height: 35px; 
        	background-color:black; 
        	line-height: 1px; 
        	margin-left: 30px;
        }
        
        #resetbtn {
        	width: 70px;  
        	height: 35px; 
        	margin-left : 10px;
        }
        
        #excelbtn {

        }
        
        #decisionList {
        	height : 500px;
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
        <h1 class="m-0" style="margin-left:20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;구매확정 내역조회</h1>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>

<!-- 실제 콘텐츠 영역 -->
<div class="content">
		<div id="orderConfirmForm" >
        <div id="info" class="card">
            <p style="margin-top : 15px; margin-left:15px;">
                ⦁ &nbsp;&nbsp;자동 구매확정 : 배송완료 후 7일 후 자동 구매확정됩니다. <br>
                ⦁ &nbsp;&nbsp;구매확정이 완료되면 K-Money로 지급되며, 관련자료는 [정산관리>정산내역조회] 에서 확인하실 수 있습니다. <br>
                ⦁ &nbsp;&nbsp;개인정보보호 목적으로 개인정보는 상당 기간 경과 후 블라인드 처리되며, A/S 목적으로 확인이 필요한 경우 고객센터로 문의바랍니다.
            </p>
        </div>
        <br>
       <div id="date" class="card">
       	<form action="searchDecision.po">
       		<div style="line-height: 70px; margin-left: 20px;">
                <span style="margin-right : 70px; font-size: 20px;">조회기간</span>
                <input type="month" style="height: 35px;" id="searchDecisionDate" name="searchDecisionDate" value="${ searchDecisionDate }">
                <input type="submit" class="btn btn-dark" value="검색" id="searchbtn">
                <input type="button" class="btn btn-outline-secondary" value="초기화" id="resetbtn" onclick="location.href='decision.po'">
            </div>
       	</form>
            
        </div>
       <br>
       
        <div id="decisionList" class="card">
            <div id="excelbtn">
                <c:choose>
                    <c:when test="${ not empty searchDecisionDate }">
                        <a href="excelDownloadSearch.po?searchDecisionDate=${ searchDecisionDate }">
                            <button type="submit" class="btn btn-outline-secondary" style="float:right; margin-right: 35px; margin-top :20px;">
                                엑셀다운로드
                            </button>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="excelDownloadDecision.po" width="100%">
                            <button type="submit" class="btn btn-outline-secondary" style="float:right; margin-right: 35px; margin-top :20px;">
                                엑셀다운로드
                            </button>
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>
            <br>
        
            <table class="table table-bordered" align="center" style="width:95%; ">
                <thead align="center">
                    <tr>
                        <th width="12%">주문번호</th>
                        <th width="10%">구매확정일</th>
                        <th width="12%">K-Money지급일</th>
                        <th width="8%">상품번호</th>
                        <th width="32%">상품명</th>
                        <th width="10%">주문금액</th>
                        <th width="8%">구매자ID</th>
                        <th width="8%">구매자명</th>
                    </tr>
                </thead>
                <tbody style="background-color : white;">
                    <c:forEach var="o" items="${ list }" >
                    	<tr>
                        <td align="center">${ o.orderNo }</td>
                        <td align="center">${ o.settleDate }</td>
                        <td align="center">${ o.keyMoneyDate}</td>
                        <td align="center">${ o.productNo }</td>
                        <td>${ o.productName }</td>
                        <td align="center">${ o.orderPrice} 원</td>
                        <td align="center">${ o.conId }</td>
                        <td align="center">${ o.conName }</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br><br>
        </div>
    </div>
</div> <!-- /.content -->
<script>/* 
	$(function() {
		var date = new Date();
		String(date);
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		
		document.getElementById("searchDecisionDate").value = year+"-"+month;
		
		//console.log(location.href);
	}) */
</script>
</div> <!-- /.content-wrapper -->
</body>
</html>
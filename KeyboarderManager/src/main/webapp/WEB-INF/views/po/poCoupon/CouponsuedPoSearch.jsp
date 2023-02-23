<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-MANAGER :: 쿠폰사용내역</title>
<style>
#listArea, #searchArea {
	width: 95%;
	margin: auto;
}
#searchArea { padding: 30px; }
#searchArea table { width: 100%; }
#listArea {
	height: 500px;
	overflow: auto;
}
td{
padding-left:5px;
padding-top:20px;
}

#listTable{
    border-collapse: collapse;
    width: 100%;
}
#listTable td {
	text-align: center;
	height: 50px;
	padding-top: 5px;
}
#listTable thead th {
	background-color: gray;
	text-align: center;
	color: white;
	position: sticky;
	top: 0;
	height: 50px;
}
#listTable tbody {
	margin-top: 25px;
}
input[type=date] {
	display: inline-block;
}
#select {
	width: 34.5%;
}
</style>
</head>
<body class="hold-transition sidebar-mini">

<jsp:include page="../../common/poheader.jsp" />

<jsp:include page="../../common/posidebar.jsp" />
	
<form id=" poCouponUsedList" action="searchCUsed.po" method="post">

<div class="content-wrapper">
<br>
<!-- 콘텐츠 영역 제목 -->
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${loginUser.sellerName}&nbsp;쿠폰 사용 내역
        </h1>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>

<div class="content">

<div id="searchArea" class="card">
	<table>
        <tr>
           <td width="15%">발급대상</td>
           <td>
           		<input type="radio" checked>&nbsp;전체 &nbsp;
           </td>
        </tr>
   		<tr>
	        <td>사용기간 기준 기간 검색</td>
	        <td>
	        	<input type="date" id="fromDate" name="fromDate" value="${param.fromDate}" class="form-control col-lg-2">&nbsp;~&nbsp;<input type="date" id="toDate" name="toDate"  value="${param.toDate}"class="form-control col-lg-2">
	        	
	        
	        </td>  
   		</tr>
	</table>
      
    <div align="center"> 
        <button type="button" onclick="location.href='usedCList.po'" class="btn btn-outline-secondary">초기화</button>&nbsp;
        <button type="submit" class="btn btn-secondary">조회</button>
    </div>
</div> <!-- /#searchArea -->

<br><br>

<div id="listArea" class="card">

	<table id="listTable" class="table-bordered">
    	<thead>
            <tr>
               <th width="">주문번호</th>
               <th width="">쿠폰명</th>
               <th width="">상품명</th>
               <th width="">사용일</th>
               <th width="">주문금액</th>
               <th width="">할인금액</th>
               <th width="">실결제금액</th>
        	</tr>
    	</thead>
        <tbody id="couponList">
        	<c:forEach var="c" items="${ list }">
        		<tr>
        			<td>${ c.orderNo }</td>
        			<td>${ c.couponName }</td>
        			<td>${ c.productName }</td>
        			<td>${ c.orderDate }</td>
        			<td>${ c.orderPrice }</td>
        			<td>${ c.couponPrice }</td>
        			<td>${ c.paymentBill }</td>
        		</tr>
        	</c:forEach>
        </tbody>
	</table>
</div><!-- /#listArea -->

</div> <!-- /.content -->
</div> <!-- /.content-wrapper -->

</form>




</body>
</html>
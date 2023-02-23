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
<style>
.content {
	border: 1px solid white;
	padding: 50px;
}

#mainSummary {
	height: 150px;
	margin: 50px;
	padding: 20px;
}
#mainSummary table {
	font-size: 20px;
	width: 100%;
	height: 80%;
	text-align: center;
	margin-top: 20px;
}
#mainSummary tbody td {
	font-size: 28px;
	vertical-align: bottom;
}

#mid-status {
	height: 250px;
	margin: 50px;
	padding: 20px;
}
#mid-status table {
	width: 100%;
	height: 100%;
}
#mid-status thead, #left-status thead, #right-status thead {
	height: 25%;
	font-size: 20px;
}
.align-right {
	text-align: right;
	padding-right: 50px;
}

#btm-status {
	height: 300px;
	width: 94%;
	margin: auto;
}
#left-status, #right-status {
	height: 100%;
	padding: 20px;
}
#left-status {
	width: 67%;
	float: left;
	position: relative;
}
#right-status {
	width: 30%;
	float: right;
}

#left-status table {
	width: 45%;
	height: 100%;
}
#right-status table {
	width: 100%;
	height: 100%;
}

#mainSummary, #mid-status, #left-status, #right-status {
	background-color: white;
}
.atag {
	font-size: 14px;
	color: blue;
	font-weight: normal;
	float: right;
}
.tableBox {
	width: 50%;
	height: 95%;
	position: absolute;
	left: 15px;
	top: 15px;
}
.tableBox table {
	width: 100% !important;
	height: 100%;
}
.tableBox .atag {
	position: absolute;
	left: 380px;
	top: 30px;
}

.graphBox {
	width:50%; 
	height: 95%;
	margin: 0px;
	position: absolute;
	right: 15px;
	top: 15px;
}
.noticeatag {
	color: black;
}
</style>
</head>
<body class="hold-transition sidebar-mini">

<jsp:include page="/WEB-INF/views/common/poheader.jsp" />

<jsp:include page="/WEB-INF/views/common/posidebar.jsp" />

<!-- 콘텐츠 영역 전체 래퍼 -->
<div class="content-wrapper">
	
	<!-- 실제 콘텐츠 영역 -->
	<div class="content">
	
		<div id="mainSummary" class="card">
			<table>
				<thead>
					<tr>
						<th width="20%">신규주문</th>
						<th width="20%">배송중</th>
						<th width="20%">구매확정</th>
						<th width="20%">주문금</th>
						<th width="20%">정산금</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td id="newOrder"></td>
						<td id="shipping"></td>
						<td id="confirmed"></td>
						<td id="sumOrder"></td>
						<td id="sumSettle"></td>
					</tr>
				</tbody>
			</table>
		</div> <!-- /.mainSummary -->
	
		<div id="mid-status" class="card">
			<table>
				<thead>
					<tr>
						<th colspan="2">
							정산현황
							<a href="settleView.po" class="atag align-right">전체보기</a>
						</th>
						<th colspan="2">
							상품현황
							<a href="show.pro" class="atag align-right">전체보기</a>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td width="40%">정산예정</td>
						<td width="10%" class="align-right preSettlement">0</td>
						<td width="40%">판매중 상품</td>
						<td width="10%" class="align-right" id="showProduct"></td>
					</tr>
					<tr>
						<td>정산확정</td>
						<td class="align-right confirmSettlement">0</td>
						<td>판매가능 상품수</td>
						<td class="align-right" id="hideProduct"></td>
					</tr>
					<tr>
						<td>출금가능</td>
						<td class="align-right ableBalance">0</td>
						<td></td>
						<td class="align-right"></td>
					</tr>
				</tbody>
			</table>
		</div> <!-- /.mid-status -->
		
		<div id="btm-status">
			<div id="left-status" class="card">
			
			<div class="tableBox">
			<a href="allOrderList.po" class="atag align-right">전체보기</a>
				<table>
				<thead>
					<tr>
						<th colspan="2">판매현황</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td width="90%">결제금액</td>
						<td width="10%" class="align-right" id="paymentBill"></td>
					</tr>
					<tr>
						<td>결제건</td>
						<td class="align-right" id="paymentCount"></td>
					</tr>
					<tr>
						<td>결제취소건</td>
						<td class="align-right" id="refundCount"></td>
					</tr>
				</tbody>
			</table>
			</div>
			<div class="graphBox">
				<canvas id="barCanvas" height="150"></canvas>
			</div>
			</div>
			
			<div id="right-status" class="card">
				<table>
					<thead>
						<tr>
							<th>공지사항</th>
							<td align="right">
								<a href="noticeList.po" class="atag">전체보기</a>
							</td>
						</tr>
					</thead>
					<tbody id="notice">
					<c:choose>
					<c:when test="${ not empty nlist }">
						<c:forEach var="n" items="${ nlist }">
							<tr>
								<td><a class="noticeatag" href="noticeDetail.bo?nno=${ n.noticeNo }">${ n.noticeTitle }</a></td>
								<td align="right">${ n.writeDate }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="2">
								현재 작성된 공지사항이 없습니다.
							</td>
						</tr>
					</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>
		</div> <!-- /.btm-status -->
	
	</div> <!-- /.content -->

</div> <!-- /.content-wrapper -->

<script>
function selectOrderSummary() {
	$.ajax({
		url: "mainOrder.po",
		success: function(data) {
			$("#newOrder").text(data.newOrder);
			$("#shipping").text(data.shipping);
			$("#confirmed").text(data.confirmed);
			$("#sumOrder").text(data.sumOrder);
			$("#sumSettle").text(data.sumSettle);
		},
		error: function() {
			console.log("주문 통신실패");
		}
	});
}

function selectSettlement() {
	$.ajax({
		url: "mainSettlement.po",
		success: function(data) {
			$(".confirmSettlement").text(data.confirmSettlement);
			$(".preSettlement").text(data.preSettlement);
			$(".ableBalance").text(data.ableBalance);
		},
		error: function() {
			console.log("정산 통신실패");
		}
	});
}

function selectProduct() {
	$.ajax({
		url: "mainProduct.po",
		success: function(data) {
			$("#showProduct").text(data.showProduct);
			$("#hideProduct").text(data.hideProduct);
		},
		error: function() {
			console.log("상품 통신실패");
		}
	});
}

function selectPayment() {
	$.ajax({
		url: "mainPayment.po",
		success: function(data) {
			$("#paymentBill").text(data.paymentBill);
			$("#paymentCount").text(data.paymentCount);
			$("#refundCount").text(data.refundCount);
		},
		error: function() {
			console.log("판매현황 통신실패");
		}
	});
}

function barChart() {
	
	$.ajax({
		url: "mainBarGraph.po",
		success: function(data) {			
			
			
			const ctx = document.getElementById('barCanvas').getContext('2d');
			
			const myChart = new Chart(ctx, {
			    type: 'bar',
			    data: {
			        labels: [data[0].orderDate+'월'
			        	   , data[1].orderDate+'월'
			        	   , data[2].orderDate+'월'
			        	   , data[3].orderDate+'월' ],
			        datasets: [{
			        	type: 'bar',
			            label: '월별 매출',
			            data: [data[0].orderPrice
				        	   , data[1].orderPrice
				        	   , data[2].orderPrice
				        	   , data[3].orderPrice],
			            backgroundColor: [
			            	'rgba(13, 110, 253, 1)',
			            	'rgba(13, 110, 253, 1)',
			            	'rgba(13, 110, 253, 1)',
			            	'rgba(13, 110, 253, 1)'
			            ],
			            borderColor: [
			            	'rgba(13, 110, 253, 1)',
			            	'rgba(13, 110, 253, 1)',
			            	'rgba(13, 110, 253, 1)',
			            	'rgba(13, 110, 253, 1)'
			            ],
			            borderWidth: 1,
			            order: 1
			        }]			    	
			    }, options: {
			    	maintainAspectRatio: false,
			    	aspectRatio: 1,
			        scales: {
			            y: {
			                beginAtZero: true
			        		}
		        	}
				}
			});
		},
		error: function() {
			console.log("에이작스 통신실패");
		}
	});
}

$(function() {
	selectSettlement();
	selectOrderSummary();
	selectPayment();
	barChart();
	selectProduct();
});

setInterval(function() {
	selectSettlement();
	selectOrderSummary();
	selectPayment();
	barChart();
	selectProduct();
}, 60000);
</script>

</body>
</html>
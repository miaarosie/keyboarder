<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="resources/css/poOrder.css" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">

	<jsp:include page="../../common/poheader.jsp" />

	<jsp:include page="../../common/posidebar.jsp" />
	
	<!-- 콘텐츠 영역 전체 래퍼 -->
	<div class="content-wrapper">
	<br>
		<!-- 콘텐츠 영역 제목 -->
		<div class="content-header">
		  <div class="container-fluid">
		    <div class="row mb-2">
		      <div class="col-sm-6">
		        <h1 class="m-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전체 주문내역 조회</h1>
		      </div><!-- /.col -->
		    </div><!-- /.row -->
		  </div><!-- /.container-fluid -->
		</div>
		
		<!-- 실제 콘텐츠 영역 -->
		<div class="content">
			<div id="selectOption" class="card" style="margin:auto; border: none;">
				<table id="option_table">
					<tr>
						<th width="10%" style="padding-left: 20px;">조회기간 *</th>
						<td width="10%">
							<select id="selectbox_date" class="form-control">
								<option selected disabled>선택 안 함</option>
								<option value="1week">1주일</option>
								<option value="1month">1개월</option>
								<option value="3month">3개월</option>
							</select>
						</td>
						<td width="10%">
							<input type="date" id="currentDate" name="currentDate" value="" class="form-control">
						</td>
						<td width="3px" style="text-align:center">~</td>
						<td width="10%">
							<input type="date" id="endDate" name="endDate" value="" class="form-control">
						</td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<th style="padding-left: 20px;">검색어</th>
						<td>
							<select id="selectbox_keyword" class="form-control">
								<option value="keyword_orderNo">주문번호</option>
								<option value="keyword_productName">상품명</option>
								<option value="keyword_conName">구매자명</option>
							</select>
						</td>
						<td colspan="3">
							<input type="text" style="width:100%;" id="search_keyword" placeholder="주문번호를 입력해주세요" class="form-control">
						</td>
						<td>
							<button id="search_btn" onclick="searchFormSubmit();" class="btn btn-secondary">검색</button>
						</td>
					</tr>
				</table>
			</div>

			<br>

			<div id="allOrder_result" class="card" style="margin:auto; border: none; height:600px;">
				<div id="result_div" style="height: 50px;">
					<div id="result_count">주문건&nbsp;&nbsp;${ listCount }</div>
					<div id="result_btn">
						<button class="btn btn-outline-secondary" onclick="excelDownloadSubmit();">엑셀 다운로드</button>
					</div>
				</div>
				<div id="table_div" style="overflow-y: scroll;">
					<table id="result_table" border="1" class="table-bordered">
						<thead>
							<tr>
								<td width="2%"><input type="checkbox" id="chkAll" onclick="checkAll('chk[]', this.checked);"></td>
								<td width="7%">상태</td>
								<td width="8%">주문일시</td>
								<td width="10%">주문번호</td>
								<td>상품명</td>
								<td width="3%">수량</td>
								<td width="6%">주문금액</td>
								<td width="8%">구매자ID</td>
								<td width="6%">구매자명</td>
								<td width="6%">환불처리</td>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${ not empty list }">
									<c:forEach var="o" items="${ list }">
										<tr style="height: 50px;">
											<td><input type="checkbox" name="chk[]" onclick="isAllCheck(this.name, 'chkAll');" value="${ o.printOrder() }"></td>
											<td>${ o.orderStatus }</td>
											<td>${ o.orderDate }</td>
											<td data-toggle="modal" data-target="#orderDetailModal_${ o.orderNo }"><a href="#">${ o.orderNo }</a></td>
											<td>${ o.productName }</td>
											<td>1</td>
											<td>${ o.orderPrice }</td>
											<td>${ o.conId }</td>
											<td>${ o.conName }</td>
											<td>
												<c:choose>
													<c:when test="${ o.orderStatus eq '구매확정' or o.orderStatus eq '환불'  }">
														<button type="button" class="btn btn-secondary" disabled>환불</button>
													</c:when>
													<c:otherwise>
														<button type="button" onclick="refundPay('${ o.orderNo }', '${ o.paymentNo }');" class="btn btn-secondary">환불</button>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										
									</c:forEach>
								</c:when>
								<c:otherwise>
								
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		<div id="modal_area">
			<c:if test="${ not empty list }">
				<c:forEach var="m" items="${ list }">
					<!-- 주문번호 누르면 나오는 모달창 -->
					<!-- The Modal -->
					<div class="modal fade" id="orderDetailModal_${ m.orderNo }">
						<div class="modal-dialog">
							<div class="modal-content">
				
								<!-- Modal Header -->
								<div class="modal-header">
									<h4 class="modal-title">주문정보 : 1건</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
				
								<!-- Modal body -->
								<div class="modal-body">
									<div id="orderDetail">
										<table id="orderDetail_table">
											<tr style="border-top:2px solid black;">
												<td style="border-left:none;">주문번호</td>
												<td colspan="3" style="border-right:none;">${ m.orderNo }</td>
											</tr>
											<tr>
												<td width="25%" style="border-left:none;">주문상태</td>
												<td>${ m.orderStatus }</td>
												<td width="25%">구매확정일자</td>
												<td width="20%" style="border-right:none;">${ m.settleDate }</td>
											</tr>
											<tr>
												<td style="border-left:none;">상품번호</td>
												<td colspan="3" style="border-right:none;">${ m.productNo }</td>
											</tr>
											<tr>
												<td style="border-left:none;">상품명</td>
												<td colspan="3" style="border-right:none;">${ m.productName }</td>
											</tr>
											<tr>
												<td style="border-left:none;">수량</td>
												<td>1</td>
												<td>판매단가</td>
												<td style="border-right:none;">${ m.supplyValue }</td>
											</tr>
											<tr>
												<td style="border-left:none;">할인쿠폰종류</td>
												<td>${ m.couponType }</td>
												<td>할인금액</td>
												<td style="border-right:none;">${ m.couponPrice }</td>
											</tr>
											<tr>
												<td style="border-left:none;">주문금액</td>
												<td>${ m.orderPrice }</td>
												<td>배송비</td>
												<td style="border-right:none;">2500</td>
											</tr>
											<tr style="border-bottom:2px solid black;">
												<td style="border-left:none;">실상품판매금액</td>
												<td>${ m.price }</td>
												<td>실결제금액</td>
												<td style="border-right:none;">${ m.paymentBill }</td>
											</tr>
										</table>
									</div>
				
									<div id="expectedSettlement">
										<br>
										<h4>정산예정금액확인</h4>
										<table id="expectedSettlement_table">
											<tr style="border-top:2px solid black;">
												<td width="28%" style="border-left:none;">정산기준금액</td>
												<td width="72%" style="border-right:none;">${ m.orderPrice }</td>
											</tr>
											<tr>
												<td style="border-left:none;">수수료율</td>
												<td style="border-right:none;">15%</td>
											</tr>
											<tr>
												<td style="border-left:none;">판매수수료(예상)</td>
												<td style="border-right:none;">${ m.commission }</td>
											</tr>
											<tr style="border-bottom:2px solid black;">
												<td style="border-left:none;">정산예정금액</td>
												<td style="border-right:none;">${ m.paymentBill - m.commission }</td>
											</tr>
										</table>
									</div>
									<br>
									<div id="orderDetailModal_info">
										<p>전체주문내역에서 조회하시는 정산예정금액은 주문상품별 예상되는 금액으로, <br>
											정확한 정산금액은 ‘정산관리’ 메뉴에서 확인해주세요.</p>
									</div>
				
								</div>
				
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
		
		<form id="excelDownload" action="excelDownload_OrderList.po" method="post">
		</form>

	
	</div> <!-- /.content-wrapper -->

	<script>
		function refundPay(orderNo, paymentNo) {
			
			location.href = "refundPay.fo?orderNo=" + orderNo + "&paymentNo=" + paymentNo;
		}
	</script>


	<script>
		// 체크박스 전체 선택/해제
		function checkAll(boxNames, chkMode) {
			
			const el = document.getElementsByName(boxNames);
			for(let i = 0; i < el.length; i++) {
				
				if(!el[i].disabled) {
					el[i].checked = chkMode;
				}
			}
		}
		
		// 전체 체크 여부
		function isAllCheck(boxNames, allChkName) {
			const el = document.getElementsByName(boxNames);
			let checkboxCnt = 0;
			let checkedCnt = 0;
			
			for(let i = 0; i < el.length; i++) {
				if(!el[i].disabled) {
					checkboxCnt += 1;
				} else if(el[i].checked) {
					checkedCnt += 1;
				}
			}
			
			let chkMode = false;
			
			// 체크박스 개수와 체크 된 체크박스 개수와 일치할 경우
			if(checkboxCnt == checkedCnt) {
				chkMode = true;
			} else {
				chkMode = false;
			}
			
			// 일치할 경우 전체 체크박스는 체크, 일치하지 않을 경우 해제
			document.getElementById(allChkName).checked = chkMode;
		}
	</script>
		
	<script>
		var today = new Date();
		var today_str = today.getFullYear() + "-" + ("0"+(today.getMonth() + 1)).slice(-2) + "-" + ("0"+today.getDate()).slice(-2);
		
		$("#selectbox_date").change(function() {
			
			if($(this).val() == "1week") {
				var week = new Date(today_str);
				week.setDate(week.getDate() - 7);
				var week_str = week.getFullYear() + "-" + ("0"+(week.getMonth() + 1)).slice(-2) + "-" + ("0"+week.getDate()).slice(-2);
				
				$("#currentDate").val(week_str);
				$("#endDate").val(today_str);
				
			} else if($(this).val() == "1month") {
				var month = new Date(today_str);
				month.setMonth(month.getMonth() - 1);
				var month_str = month.getFullYear() + "-" + ("0"+(month.getMonth() + 1)).slice(-2) + "-" + ("0"+month.getDate()).slice(-2);
				
				$("#currentDate").val(month_str);
				$("#endDate").val(today_str);
				
			} else if($(this).val() == "3month") {
				var month3 = new Date(today_str);
				month3.setMonth(month3.getMonth() - 3);
				var month3_str = month3.getFullYear() + "-" + ("0"+(month3.getMonth() + 1)).slice(-2) + "-" + ("0"+month3.getDate()).slice(-2);
				
				$("#currentDate").val(month3_str);
				$("#endDate").val(today_str);
				
			} else {
				$("#currentDate").val("");
				$("#endDate").val("");
				
			}
		});
		
		
		$("#selectbox_keyword").change(function() {
			
			if($(this).val() == "keyword_orderNo") {
				$("#search_keyword").attr("placeholder", "주문번호를 입력해주세요");
				
			} else if($(this).val() == "keyword_productName") {
				$("#search_keyword").attr("placeholder", "상품명을 입력해주세요");
				
			} else {
				$("#search_keyword").attr("placeholder", "구매자명을 입력해주세요");
				
			}
		});
	</script>

	<script>
		function searchFormSubmit() {
			
			if($("#currentDate").val() != "" && $("#endDate").val() != "") {
				
				$.ajax({
					url : "optionSearch.po",
					data : { currentDate : $("#currentDate").val(),
							 endDate : $("#endDate").val(),
							 keyword : $("#search_keyword").val(),
							 keywordType : $("#selectbox_keyword").val()
						   },
					success : function(result) {
						
						var resultStr = "";
						
						for(var i = 0; i < result.length; i++) {
							
							resultStr += "<tr style='height:50px;'>"
											+ "<td><input type='checkbox' name='chk[]' onclick='isAllCheck(this.name, 'chkAll');' value='" + result[i].printOrder + "'></td>"
											+ "<td>" + result[i].orderStatus + "</td>"
											+ "<td>" + result[i].orderDate + "</td>"
											+ "<td data-toggle='modal' data-target='#orderDetailModal_" + result[i].orderNo + "'><a href='#'>" + result[i].orderNo + "</a></td>"
											+ "<td>" + result[i].productName + "</td>"
											+ "<td>1</td>"
											+ "<td>" + result[i].orderPrice + "</td>"
											+ "<td>" + result[i].conId + "</td>"
											+ "<td>" + result[i].conName + "</td>"
											+ "<td>"
											
							if(result[i].orderStatus == "구매확정" || result[i].orderStatus == "환불") {
								resultStr += "<button type='button' class='btn btn-secondary' disabled>환불</button>"
											+ "</td>"
											+ "</tr>"
								
							} else {
								resultStr += "<button type='button' onclick='refundPay('" + result[i].orderNo + "', '" + result[i].paymentNo + "');' class='btn btn-secondary'>환불</button>"
											+ "</td>"
											+ "</tr>"
							}
						}
						
						$("#result_table>tbody").html(resultStr);
						$("#result_count").html("주문건&nbsp;&nbsp;" + result.length);
						
						
						// modal 창 생성
						var modalStr = "";
						
						if(result.length > 0) {
							
							for(var m = 0; m < result.length; m++) {
								
								modalStr += "<div class='modal fade' id='orderDetailModal_" + result[m].orderNo + "'>"
											+ "<div class='modal-dialog'>"
												+ "<div class='modal-content'>"
													+ "<div class='modal-header'>"
														+ "<h4 class='modal-title'>주문정보 : 1건</h4>"
														+ "<button type='button' class='close' data-dismiss='modal'>&times;</button>"
													+ "</div>"
													+ "<div class='modal-body'>"
														+ "<div id='orderDetail'>"
															+ "<table id='orderDetail_table'>"
																+ "<tr style='border-top:2px solid black;'>"
																	+ "<td style='border-left:none;'>주문번호</td>"
																	+ "<td colspan='3' style='border-right:none;'>" + result[m].orderNo + "</td>"
																+ "</tr>"
																+ "<tr>"
																	+ "<td width='25%' style='border-left:none;'>주문상태</td>"
																	+ "<td>" + result[m].orderStatus + "</td>"
																	+ "<td width='25%'>구매확정일자</td>"
																	+ "<td width='20%' style='border-right:none;'>" + result[m].settleDate + "</td>"
																+ "</tr>"
																+ "<tr>"
																	+ "<td style='border-left:none;'>상품번호</td>"
																	+ "<td colspan='3' style='border-right:none;'>" + result[m].productNo + "</td>"
																+ "</tr>"
																+ "<tr>"
																	+ "<td style='border-left:none;'>상품명</td>"
																	+ "<td colspan='3' style='border-right:none;'>" + result[m].productName + "</td>"
																+ "</tr>"
																+ "<tr>"
																	+ "<td style='border-left:none;'>수량</td>"
																	+ "<td>1</td>"
																	+ "<td>판매단가</td>"
																	+ "<td style='border-right:none;'>" + result[m].supplyValue + "</td>"
																+ "</tr>"
																+ "<tr>"
																	+ "<td style='border-left:none;'>할인쿠폰종류</td>"
																	+ "<td>" + result[m].couponType + "</td>"
																	+ "<td>할인금액</td>"
																	+ "<td style='border-right:none;'>" + result[m].couponPrice + "</td>"
																+ "</tr>"
																+ "<tr>"
																	+ "<td style='border-left:none;'>주문금액</td>"
																	+ "<td>" + result[m].orderPrice + "</td>"
																	+ "<td>배송비</td>"
																	+ "<td style='border-right:none;'>2500</td>"
																+ "</tr>"
																+ "<tr style='border-bottom:2px solid black;'>"
																	+ "<td style='border-left:none;'>실상품판매금액</td>"
																	+ "<td>" + result[m].price + "</td>"
																	+ "<td>실결제금액</td>"
																	+ "<td style='border-right:none;'>" + result[m].paymentBill + "</td>"
																+ "</tr>"
															+ "</table>"
														+ "</div>"
														+ "<div id='expectedSettlement'>"
															+ "<br>"
															+ "<h4>정산예정금액확인</h4>"
															+ "<table id='expectedSettlement_table'>"
																+ "<tr style='border-top:2px solid black;'>"
																	+ "<td width='28%' style='border-left:none;'>정산기준금액</td>"
																	+ "<td width='72%' style='border-right:none;'>" + result[m].orderPrice + "</td>"
																+ "</tr>"
																+ "<tr>"
																	+ "<td style='border-left:none;'>수수료율</td>"
																	+ "<td style='border-right:none;'>15%</td>"
																+ "</tr>"
																+ "<tr>"
																	+ "<td style='border-left:none;'>판매수수료(예상)</td>"
																	+ "<td style='border-right:none;'>" + result[m].commission + "</td>"
																+ "</tr>"
																+ "<tr style='border-bottom:2px solid black;'>"
																	+ "<td style='border-left:none;'>정산예정금액</td>"
																	+ "<td style='border-right:none;'>" + (result[m].paymentBill - result[m].commission) + "</td>"
																+ "</tr>"
															+ "</table>"
														+ "</div>"
														+ "<br>"
														+ "<div id='orderDetailModal_info'>"
															+ "<p>전체주문내역에서 조회하시는 정산예정금액은 주문상품별 예상되는 금액으로, <br> 정확한 정산금액은 ‘정산관리’ 메뉴에서 확인해주세요.</p>"
														+ "</div>"
													+ "</div>"
												+ "</div>"
											+ "</div>"
										+ "</div>"
							}
							
							$("#modal_area").html(modalStr);
						}
					},
					error : function() {
						console.log("오류");
					}
				});
			}
			else {
				alert("조회기간을 입력해주세요");	
			}
		}
	</script>
	
	<script>
		function excelDownloadSubmit() {
			
			let orderList = $("#result_table>tbody input[type=checkbox]:checked");
			let orderArr = [];
			
			orderList.each(function() { // 각 배열의 인덱스에 들은 요소들에 반복적으로 접근 (input 자체에 접근)
				orderArr.push($(this).val());
			});
			
			if(orderArr == "") {
				alert("내역 체크 후 엑셀 다운로드 버튼을 눌러주세요");
			} else {
				var excelDownList = ""; 
				
				for(let a = 0; a < orderArr.length; a++) {
					
					excelDownList += "<input type='hidden' name='orderArr_input' value='" + orderArr[a]  + "'>";
				}
				
				$("#excelDownload").html(excelDownList);
				$("#excelDownload").submit();
			}
		}
	</script>

</body>
</html>
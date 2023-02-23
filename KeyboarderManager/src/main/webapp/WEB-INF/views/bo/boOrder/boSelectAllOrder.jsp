<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="resources/css/boOrder.css" rel="stylesheet">
<style>
.card {
	width: 95%;
	margin: auto;
}
#allOrder_result {
	height: 550px;
}
</style>
</head>
<body class="hold-transition sidebar-mini">

	<jsp:include page="../../common/boheader.jsp" />

	<jsp:include page="../../common/bosidebar.jsp" />
	
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
			<div id="selectOption" class="card">
				<table id="option_table">
					<tr>
						<th width="10%" style="padding-left: 20px;">조회기간 *</th>
						<td width="10%">
							<select id="selectbox_date">
								<option selected disabled>선택 안 함</option>
								<option value="1week">1주일</option>
								<option value="1month">1개월</option>
								<option value="3month">3개월</option>
							</select>
						</td>
						<td width="10%">
							<input type="date" id="currentDate" name="currentDate" value="">
						</td>
						<td width="3px" style="text-align:center">~</td>
						<td>
							<input type="date" id="endDate" name="endDate" value="">
						</td>
						<td width="10%"></td>
					</tr>
					<tr>
						<th style="padding-left: 20px;">주문번호</th>
						<td colspan="4">
							<input type="text" style="width:100%" placeholder="주문번호를 입력해주세요" id="search_orderNo">
						</td>
						<td>
							<button id="search_btn" onclick="searchFormSubmit();" class="btn">검색</button>
						</td>
					</tr>
					<tr>
						<th style="padding-left: 20px;">검색어</th>
						<td>
							<select id="selectbox_keyword">
								<option value="keyword_sellerName">입점업체명</option>
								<option value="keyword_productName">상품명</option>
								<option value="keyword_conName">주문자명</option>
							</select>
						</td>
						<td colspan="3">
							<input type="text" style="width:100%" id="search_keyword" placeholder="업체명을 입력해주세요">
						</td>
						<td>
							<button id="search_btn" onclick="searchFormSubmit();" class="btn">검색</button>
						</td>
					</tr>
				</table>
			</div>

			<br>

			<div id="allOrder_result" class="card">
				<div id="result_div">
					<div id="result_count">주문건&nbsp;&nbsp;${ listCount }</div>
					<div id="result_btn">
						<button onclick="excelDownloadSubmit();" class="btn btn-outline-secondary">엑셀 다운로드</button>
					</div>
				</div>
				<div id="table_div" style="overflow-x:scroll;">
					<table id="result_table" border="1" class="table-bordered">
						<thead>
						<tr>
							<td width="2%"><input type="checkbox" id="chkAll" onclick="checkAll('chk[]', this.checked);"></td>
							<td width="6%">구매확정일시</td>
							<td width="6%">주문일시</td>
							<td width="8%">주문번호</td>
							<td>상품명</td>
							<td width="7%">입점업체명</td>
							<td width="5%">주문자명</td>
							<td width="5%">주문금액</td>
							<td width="6%">업체할인금액</td>
							<td width="6%">키보더할인액</td>
							<td width="5%">결제금액</td>
							<td width="5%">판매수수료</td>
							<td width="5%">결제수단</td>
						</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${ not empty list }">
									<c:forEach var="o" items="${ list }">
										<tr>
											<td><input type="checkbox" name="chk[]" onclick="isAllCheck(this.name, 'chkAll');" value="${ o.printOrder() }"></td>
											<td>${ o.buyConfirmDate }</td>
											<td>${ o.orderDate }</td>
											<td>${ o.orderNo }</td>
											<td>${ o.productName }</td>
											<td>${ o.sellerName }</td>
											<td>${ o.conName }</td>
											<td>${ o.orderPrice }</td>
											<td>${ o.poCouponPrice }</td>
											<td>${ o.boCouponPrice }</td>
											<td>${ o.paymentBill }</td>
											<td>${ o.commission }</td>
											<td>카드</td>
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
		
		<form id="excelDownload" action="excelDownload_OrderList.bo" method="post">
		</form>
		
		
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
				
				if($(this).val() == "keyword_sellerName") {
					$("#search_keyword").attr("placeholder", "업체명을 입력해주세요");
					
				} else if($(this).val() == "keyword_productName") {
					$("#search_keyword").attr("placeholder", "상품명을 입력해주세요");
					
				} else {
					$("#search_keyword").attr("placeholder", "주문자명을 입력해주세요");
					
				}
			});
		</script>
		
		<script>
			function searchFormSubmit() {
					
					if($("#currentDate").val() != "" && $("#endDate").val() != "") {
						
						$.ajax({
							url : "optionSearch.bo",
							data : {currentDate:$("#currentDate").val(),
									endDate:$("#endDate").val(),
									search_orderNo:$("#search_orderNo").val(),
									search_keyword:$("#search_keyword").val(),
									keywordType:$("#selectbox_keyword").val()
									},
							success : function(result) {
								
								var resultStr = "";
								
								for(var i = 0; i < result.length; i++) {
									
									resultStr += "<tr>"
													+ "<td><input type='checkbox' name='chk[]' onclick='isAllCheck(this.name, 'chkAll');' value='" + result[i].printOrder + "'></td>"
													+ "<td>" + result[i].buyConfirmDate + "</td>"
													+ "<td>" + result[i].orderDate + "</td>"
													+ "<td>" + result[i].orderNo + "</td>"
													+ "<td>" + result[i].productName + "</td>"
													+ "<td>" + result[i].sellerName + "</td>"
													+ "<td>" + result[i].conName + "</td>"
													+ "<td>" + result[i].orderPrice + "</td>"
													+ "<td>" + result[i].poCouponPrice + "</td>"
													+ "<td>" + result[i].boCouponPrice + "</td>"
													+ "<td>" + result[i].paymentBill + "</td>"
													+ "<td>" + result[i].commission + "</td>"
													+ "<td>카드</td>"
												+ "</tr>"
								}
								
								$("#result_table>tbody").html(resultStr);
								$("#result_count").html("주문건&nbsp;&nbsp;" + result.length);
							},
							error : function() {
								console.log("에러");
							}
						});
					}
					else {
						alert("조회기간을 입력해주세요");
					}
			}
		</script>
	
	</div> <!-- /.content-wrapper -->


</body>
</html>
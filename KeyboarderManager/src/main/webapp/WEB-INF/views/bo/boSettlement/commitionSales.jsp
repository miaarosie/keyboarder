<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-MANAGER :: 수수료 매출 내역</title>
	<style>
		
		.card {
			width: 95%;
			margin: auto;
		}
		
		#searchConditions>div {
			float : left;
			/* font-size : 20px; */
			font-weight : 600;
		}
		
		#conditionTable {
			height: 130px;
			/* font-size : 22px; */
		}
		
		/* #conditionTalbe>td {
			width : 200px;
		} */
		
		#conditionTalbe>td>div {
			width : 200px;
		}
		
		#searchCondition2 select {
			/* width : 170px; */
			/* font-size : 20px; */
		}
		
						
		/* #searchButton {
			background-Color : #323232;
			color : white;
			font-size : 20px;
			padding : 5px 30px 5px 30px;
			border-radius : 5px;
		}
		
		#resetButton {
			background-Color : white;
			font-size : 20px;
			padding : 5px 20px 5px 20px;
			border-radius : 5px;			
		} */
		
		input[type=button], input[type=submit] {
			width: 100px;
		}
		
		#result_div {
			height : 60px;
		}
		 
		
		#result_div>div {
			float : left;
		}

		#table_div {
			text-align : center;
		} 
		
		#result_count, #result_count_content {
			display : inline;
		}
		
        th {
            height : 30px;
            background-color: rgb(244, 245, 249);
        }

        .provider {
            background-color: rgb(255, 225, 225);
            color : rgb(185, 88, 86);
        }

        .supplier {
            background-color: rgb(242, 245, 255);
            color : rgb(25, 88, 195);
        }
        
        table a {
        	text-decoration : none;
        	color : black;
        }				
        
        #allOrder_result {
        	height: 600px;
        }
	</style>
	    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
 	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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
		        <h1 class="m-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수수료 매출내역 조회</h1>
		      </div><!-- /.col -->
		    </div><!-- /.row -->
		  </div><!-- /.container-fluid -->
		</div>
		
		<!-- 실제 콘텐츠 영역 -->
		<div class="content">
		
			<form id="searchSettlementForm" action="searchSettlement.bo">
				<div id="searchConditions" class="card">
					<table id="conditionTable">
						<c:choose>
							<c:when test="${ not empty searchCondition }">
								<tr>							
									<td width="15%">
									<input type="hidden" id="TFCondition" value="notEmptyCondition">
									<input type="hidden" id="conditionName" value="${ searchCondition.sellerName }">
									<input type="hidden" id="conditionDate1" value="${ searchCondition.settleDate }">	
									<div id="searchCondition1" style="margin-left : 20px;">입점사</div>
									</td>
									<td width="35%">
										<div id="searchCondition2" style="padding-right : 20px; width:100%;">
											<select id="sellerList" name="seller" class="form-control">
												<option value="allStore">전체</option>
												<c:forEach var="sl" items="${ sellerList }">
													<option id="${ sl.sellerName }" value="${ sl.sellerName }">${ sl.sellerName }</option> 
												</c:forEach>
											</select>							
										</div>							
									</td>
									<td width="50%">
										<input type="submit" id="searchButton" value="조회" class="btn btn-secondary">
									</td>
								</tr>
								<tr>					
									<td><div id="searchCondition3" style="margin-left : 20px;">정산년월</div></td>
									<td>
										<div id="searchCondition4" style="margin-right : 20px;">
											<input type="month" id="settleDate" name="searchSettlementDate" class="form-control">
										</div>							
									</td>
									<td>
										<a href="commitionSales.bo"><input type="button" id="resetButton" value="초기화" class="btn btn-outline-secondary"></a>
									</td>
								</tr>							
							</c:when>
							<c:otherwise>
								<tr>
									<td width="15%"><div id="searchCondition1" style="margin-left : 20px;">입점사</div></td>
									<td width="35%">
										<div id="searchCondition2" style="padding-right : 20px; width:100%;">
											<select id="sellerList" name="seller" class="form-control">
												<option value="allStore">전체</option>
												<c:forEach var="sl" items="${ sellerList }">
													<option value="${ sl.sellerName }">${ sl.sellerName }</option> 
												</c:forEach>
											</select>							
										</div>							
									</td>
									<td width="50%">
										<input type="submit" id="searchButton" value="조회" class="btn btn-secondary">
									</td>
								</tr>
								<tr>					
									<td><div id="searchCondition3" style="margin-left : 20px;">정산년월</div></td>
									<td>
										<div id="searchCondition4" style="margin-right : 20px;">
											<input type="month" id="settleDate" name="searchSettlementDate" class="form-control">
										</div>							
									</td>
									<td>
										<a href="commitionSales.bo"><input type="button" id="resetButton" value="초기화" class="btn btn-outline-secondary"></a>
									</td>
								</tr>							
							</c:otherwise>
						</c:choose>
					</table>																	
				</div>					
			</form>
						<br>
			<div id="allOrder_result" class="card">
				<div id="result_div">
					<div style="font-size : 25px; margin: 20px 0px 30px 20px;">지불내역&nbsp;&nbsp;</div>
					<div id="result_count" style="font-size : 25px; margin: 20px 0px 30px 20px;">
						총<div id="result_count_content" style="color:red;"> <c:out value="${ list.size() }"/></div> 건
					</div>
				</div>
				<div id="table_div" style="overflow:scroll; width:99%; height:600px; text-align:center; margin-left : 10px;">
					<table id="result_table" border="1" width="99%" class="table-bordered">
						<thead style="background-color:darkgray; font-weight:bold;">
							<tr>
								<td>협력사번호</td>
								<td>협력사명</td>
								<td>정산일</td>
								<td>
								입점사 실결제금액<br>
								(주문금액 - 쿠폰금액)
								</td>
								<td>주문금액</td>
								<td>입점사 쿠폰금액</td>
								<td>
								KEYBOAR-DER<br>
								할인액	
								</td>							
								<td>KEYBOAR-DER<br>매출액</td>
								<td>계산서발행액</td>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${ not empty list }">
									<% int i = 0; %>
									<c:forEach var="sl1" items="${ list }" varStatus="status" >
										<tr id="settlement${status.index}">
											<td>${ sl1.sellerNo }</td>
											<td><input type="hidden" class="modalsHidden1" value="${ sl1.sellerName }">${ sl1.sellerName }</td>
											<td><input type="hidden" class="modalsHidden2" value="${ sl1.settleDate }">${ sl1.settleDate }</td>
											<td>${ sl1.realPayPrice }</td>
											<td>${ sl1.orderPrice }</td>
											<td>${ sl1.scouponPrice }</td>
											<td>${ sl1.kcouponPrice }</td>
											<td><input type="hidden" class="modalsHidden3" value="${ sl1.commition }">${ sl1.commition }</td>
											<td>
												<a data-toggle="modal" href="#myModal" style="cursor:pointer;" class="btn modalCalls">
												상세보기
												</a>
											</td>											
										</tr>
										<% i++; %>
									</c:forEach>								
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="9">조회된 결과가 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>

						</tbody>
					</table>
				    <!-- 로그인 클릭 시 뜨는 모달 (기존에는 안보이다가 위의 a 클릭 시 보임) -->
				    <div class="modal fade" id="myModal">
				        <div class="modal-dialog modal-xl">
				            <div class="modal-content">                                 
				                    <!-- Modal body -->
				                    <div class="modal-body">
				                        <table border="1" style="width:1100px; text-align: center;">
				                            <tr>
				                                <th colspan="10" style="height:35px; width: 500px;">전자세금 계산서</th>
				                            </tr>
				                            <tr>
				                                <th rowspan="5" class="provider" style="width: 2%; writing-mode:vertical-lr; background-color:rgb(255, 183, 183); color: rgb(226, 68, 72);">공급자</th>
				                                <th class="provider" style="width : 105px;">등록번호</th>
				                                <td style="width : 160px;">851-87-00622</td>
				                                <th class="provider" style="width : 105px;">종사업장<br>번호</th>
				                                <td style="width : 145px;">서울 강남 <br> 제2014-01호 </td>
				                                <th rowspan="5" class="supplier" style="width: 2%; writing-mode:vertical-lr; background-color:rgb(194, 217, 242); color: rgb(51, 113, 207);">공급받는자</th>
				                                <th class="supplier" style="width : 105px;">등록번호</th>
				                                <td style="width : 160px;" id="mResultCorpNo"></td>
				                                <th class="supplier" style="width : 105px;">종사업장<br>번호</th>
				                                <td style="width : 145px;"></td>
				                            </tr>
				                            <tr>
				                                <th class="provider">상호<br>(법인명)</th>
				                                <td>(주)키보더</td>
				                                <th class="provider">성명</th>
				                                <td>서채영</td>
				                                <th class="supplier">상호<br>(법인명)</th>
				                                <td id="mResultSellerName"></td>
				                                <th class="supplier">성명</th>
				                                <td id="mResultRepName"></td>
				                            </tr>
				                            <tr>
				                                <th class="provider">사업장<br>주소</th>
				                                <td colspan="3">서울특별시 영등포구 선유동2로 57 이레빌딩</td>
				                                <th class="supplier">사업장<br>주소</th>
				                                <td colspan="3" id="mResultLocation"></td>
				                            </tr>
				                            <tr>
				                                <th class="provider">업태</th>
				                                <td>도소매</td>
				                                <th class="provider">종목</th>
				                                <td>컴퓨터 주변기기</td>
				                                <th class="supplier">업태</th>
				                                <td>제조업</td>
				                                <th class="supplier">종목</th>
				                                <td>컴퓨터 주변기기</td>                            
				                            </tr>
				                            <tr>
				                                <th class="provider">이메일</th>
				                                <td colspan="3">keyboarderofficial@gmail.com</td>
				                                <th class="supplier">이메일</th>
				                                <td colspan="3" id="mResultSellerEmail"></td>
				                            </tr>
				                            <tr style="height : 30px;">
				                                <th colspan="2">작성일자</th>
				                                <th colspan="2">공급가액</th>
				                                <th colspan="2">세액</th>
				                                <th>수정사유</th>
				                                <th colspan="3">비고</th>
				                            </tr>
				                            <tr style="height : 30px;">
				                                <td colspan="2" id="mResultWriteDate"></td>
				                                <td colspan="2" id="mResultSupplyValue"></td>
				                                <td colspan="2" id="mResultTaxAmount"></td>
				                                <td></td>
				                                <td colspan="3"></td>
				                            </tr>
				                            <tr>
				                                <th colspan="2">정산일</th>				                               
				                                <th colspan="3">품목</th>				                              
				                                <th>수량</th>
				                                <th>단가</th>
				                                <th>공급가액</th>
				                                <th>세액</th>
				                                <th>비고</th>
				                            </tr>
				                            <tr style="height : 30px;">
				                                <td colspan="2" id="mResultSettleDate"></td>				                                
				                                <td colspan="3" id="mResultProductName"></td>        				                              
				                                <td>1</td>
				                                <td id="mResultPrice"></td>
				                                <td id="mResultSupplyValue2"></td>
				                                <td id="mResultTaxAmount2"></td>
				                                <td></td>
				                            </tr>
				                            <tr style="height : 30px;">
				                                <th colspan="2">합계금액</th>
				                                <th colspan="2">현금</th>
				                                <th>수표</th>
				                                <th>어음</th>
				                                <th>외상매출금</th>
				                                <th colspan="3" rowspan="2">이 금액을 (청구)함</th>                       
				                            </tr>
				                            <tr style="height : 30px;">
				                                <td colspan="2" id="mResultBPA"></td>
				                                <td colspan="2" id="mResultBPA2"></td>
				                                <td></td>
				                                <td></td>
				                                <td></td>
				                            </tr>
				                        </table>
				                        <div style="text-align:center; margin-top:5px; font-weight : bold;">본 인쇄물은 키보더(www.keyboarder.com)에서 발급 또는 전송 입력된 전자 (세금) 계산서 입니다.</div>
				                    </div>
				            	</div>
				            </div>
				        </div>
				</div>
			</div>
		</div>
	</div> <!-- /.content-wrapper -->

<script>
	$(function() {
		
		
		// 지정한 날짜를 알맞은 형식으로 보내도록
		var date = new Date();
	
		String(date);
		
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();
		
		$("#modalToday").text(year+"-"+month+"-"+day); // 모달 작성일(오늘) 부분
		
		document.getElementById("settleDate").value = year + "-" + month;


		var clickEle = $(".modalCalls"); // a 태그를 클래스화 해서 전부 가져옴(화면상 갯수만큼)
		clickEle.on("click",function() { 
			var indexNo = clickEle.index(this); // indexNo을 클릭한 a 태그의 번호로 부여 (n 번째 태그인지)
			var sellerName = $(".modalsHidden1").eq(indexNo).val(); // input 태그를 0부터 증감하여 부여했으므로 n(=indexNo)번째 hidden input의  value를 modalOrderNo으로 변수 선언하겠다.
			var settleDate = $(".modalsHidden2").eq(indexNo).val();
			var commition = $(".modalsHidden3").eq(indexNo).val();
			// 모달에 값넣어주기
			$("#myModal").on("show.bs.modal", function (e) {
						
				$.ajax({
					url : "sellerBillModal.bo",
					async : false, // 동기식으로 바꾸겠다(비동기식은 모달먼저 띄우고 데이터를 받아오는데, 동기식으로 하면 데이터를 받아오는 것에 맞춰서 모달을 띄움)
					data : {sellerName : sellerName, settleDate : settleDate, commition : commition},
					success : function(result) {

						$("#mResultCorpNo").text(result.corpNo);
						$("#mResultSellerName").text(result.sellerName);
						$("#mResultRepName").text(result.repName);
						$("#mResultLocation").text(result.location);
						$("#mResultSellerEmail").text(result.sellerEmail);
						$("#mResultWriteDate").text(result.modalWriteDate);
						$("#mResultSupplyValue").text(result.supplyValue);
						$("#mResultTaxAmount").text(result.taxAmount);
						$("#mResultSettleDate").text(result.settleDate);
						$("#mResultProductName").text("수수료 매출");
						$("#mResultPrice").text(result.commition);
						$("#mResultSupplyValue2").text(result.supplyValue);
						$("#mResultTaxAmount2").text(result.taxAmount);
						$("#mResultBPA").text(result.commition);
						$("#mResultBPA2").text(result.commition);
						
					}, error : function() {
						console.log("모달 호출용 ajax 통신 실패")
					}
				});
				
			});
		});
		
		// 검색 결과 유지
		var TFCondition = $("#TFCondition").val();
		
		if(TFCondition == "notEmptyCondition") {
			
			var conditionName = $("#conditionName").val();
			var conditionDate1 = $("#conditionDate1").val();
			
			document.getElementById(conditionName).selected = true;
			document.getElementById("settleDate").value = conditionDate1.substr(0, 7);
			
		} else {
			
			// 지정한 날짜를 알맞은 형식으로 보내도록
			var date = new Date();
			
			String(date);
			
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			
			document.getElementById("settleDate").value = year + "-" + month;
		}		
		
		// 검색 결과 입점사명, 조회 기간 기본값으로 설정
		/*
		var searchSellerName = document.getElementById("searchSellerName").value;
		
		for(var i = 0; i < sellerNameOption.length; i++) {
			if(searchSellerName $(".nameOption:")) {
				sellerNameOption[i].selected = true;
			};
			
		};
		*/
		
		/* 나중에 검색기능을 모달로 구현하려할때 작성할 부분ㄴ
		$("#searchButton").click(function() {
			
			var seller = $("#sellerList").val();		
			var searchSettlementDate = $("#settleDate").val();
			
			$.ajax({
				url : "searchSettlement.bo",
				data : {seller : seller, searchSettlementDate : searchSettlementDate},
				success : function(result) {
					
				}
				
			});
			
		});
		*/
		
		// 초기화버튼
		$("#resetButton").click(function() {
			
			location.href="commitionSales.bo";
		});
		
	});

</script>

</body>
</html>
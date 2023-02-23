<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-MANAGER :: 전자세금계산서</title>

    <style>
        div{
            /* border: 1px solid red; */
            box-sizing: border-box;
            margin: auto;
        }

		#electronic-list>thead>tr{
			height: 50px;
			text-align: center;
		}
		
		#electronic-list>tbody>tr{
			height: 30px;
			text-align: center;
		}
		
		.electronic-information-notice{
			width: 92%;
			height: 235px;
			overflow-y: scroll;
		}
		
		#electronic-list{
		    border: 0px;
		    border-collapse: collapse;	
		}
		
		#electronic-list>thead>tr{
			position: sticky;
		    top: 0px;
		    background-color: lightgray !important;	
		}
		
		.electronic-view-all{
			width: 97%;
		}
		
    </style>
    
     <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
 	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="hold-transition sidebar-mini">

	<jsp:include page="/WEB-INF/views/common/poheader.jsp" />

	<jsp:include page="/WEB-INF/views/common/posidebar.jsp" />

	<div class="content-wrapper">

		<div class="content">

			<div class="electronic-view-all">
		        <div class="electronic-header">
		            <h2 style="padding: 20px 50px; margin: 0px;">전자세금계산서 관리</h2>
		        </div>
		
		        <div class="electronic-date-tracking card" style="height: 100px;">
		            <br>
		            <form action="poElectronicSearchDate.settlement">
		                <div id="electronic-lookup" style="display: inline-block; padding: 6px 50px; margin: 0px; width: 25%;">
		                    <div style="display: inline-block; width: 48%; font-size: 25px;">
		                       	 조회기간
		                    </div>
		                    <c:choose>
		                    	<c:when test="${ not empty searchDate }">
		                    		<input type="hidden" id="TFCondition" value="notEmptyCondition">
									<input type="hidden" id="conditionDate1" value="${ searchDate }">	
		                    		<input type="month" id="electronicMonth" name="searchElectronicMonth" style="width:50%">
		                    	</c:when>
		                    	<c:otherwise>
		                    		<input type="month" id="electronicMonth" name="searchElectronicMonth" style="width:50%">
		                    	</c:otherwise>
		                    </c:choose>
		                </div>
		                <div id="electronic-button" style="display: inline-block; width: 55%; margin-top: 2px; padding-right: 250px; padding-left: -30px;">
		                    <button type="submit" class="btn btn-dark" style="width: 17%; font-size: 13px; height: 40px;">
		                        	검색하기
		                    </button>
		                    &nbsp;&nbsp;
			                 <button type="button" class="btn btn-outline-dark" id="resetButton" style="width: 17%; font-size: 13px; height: 40px;" onclick="location.href='electronicTaxInvoice.po'">
			                 		초기화
			                 </button>
		                </div>
		            </form>        
		        </div>
		
		        <br>
		
		        <div class="card" style="height: 600px;">
		            <div>
		                <h3 style="padding: 20px 30px; margin: 0px;">전자세금계산서 조회</h3>
		            </div>
		            <div class="electronic-information-notice" style="height: 300px;">
	                    <table border="1" width="100%" id="electronic-list" align="center">
	                        <thead>
	                            <tr>
	                                <th width="15%">정산기간</th>
	                                <th width="13%">계산서 종류</th>
	                                <th width="16%">합계</th>
	                                <th width="18%">공급가액</th>
	                                <th width="18%">세액</th>
	                                <th width="15%">세금계산서</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                        	<c:choose>
	                        		<c:when test="${ not empty dateList }">
	                        			<c:forEach var="elec" items="${ dateList }">
				                            <tr>
				                            	<input type="hidden" class="modalsHidden1" value="${ elec.sellerName }">
												<input type="hidden" class="modalsHidden2" value="${ elec.settleDate }">
												<input type="hidden" class="modalsHidden3" value="${ elec.commition }">
				                                <td>${ elec.settleDate }</td>
				                                <td>매입</td>
				                                <td>${ elec.supplyValue + elec.taxAmount }</td>
				                                <td>${ elec.supplyValue }</td>
				                                <td>${ elec.taxAmount }</td>
				                                <td data-toggle="modal" data-target="#myModal">
				                                	<a data-toggle="modal" href="#myModal" style="cursor:pointer;" class="btn modalCalls">
														세금계산서 확인
													</a>
				                                </td>
				                            </tr>
			                            </c:forEach>
	                        		</c:when>
	                        		<c:when test="${ empty dateList and not empty elecList }">
			                        	<c:forEach var="elec" items="${ elecList }">
				                            <tr>
				                            	<input type="hidden" class="modalsHidden1" value="${ elec.sellerName }">
												<input type="hidden" class="modalsHidden2" value="${ elec.settleDate }">
												<input type="hidden" class="modalsHidden3" value="${ elec.commition }">
				                                <td>${ elec.settleDate }</td>
				                                <td>매입</td>
				                                <td>${ elec.supplyValue + elec.taxAmount }</td>
				                                <td>${ elec.supplyValue }</td>
				                                <td>${ elec.taxAmount }</td>
				                                <td data-toggle="modal" data-target="#myModal">
				                                	<a data-toggle="modal" href="#myModal" style="cursor:pointer; color :blue; text-decoration : underline;" class="btn modalCalls">
														세금계산서 확인
													</a>
				                                </td>
				                            </tr>
			                            </c:forEach>
	                            	</c:when>
	                        	</c:choose>    	
	                        </tbody>
	                    </table>
	                    
		            </div>
		            <br>
		            <div style="margin-right: 830px;">
		            	<p style="padding: 20px; margin: 0px; font-size: 13px;">
		            		 전자세금계산서 확인은 익월 2일(영업일 기준) 이후 가능합니다.<br>
       						부가세법 따라 개인판매자에게도 주민등록번호로 전자세금계산서가 자동 발급됩니다.

							<br><br>
							
							전자세금계산서 종류<br>
      						OM수수료매입 : 전월 1일~말일까지 OM수수료 비용에 대하여 발행되는 계산서입니다.<br>
		            	</p>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
	
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
                                <th>외상매입금</th>
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
	

<script>
	$(function() {
		
		/*
		// 지정한 날짜를 알맞은 형식으로 보내도록
		var date = new Date();
	
		String(date);
		
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();
		
		$("#modalToday").text(year+"-"+month+"-"+day); // 모달 작성일(오늘) 부분
		
		document.getElementById("settleDate").value = year + "-" + month;
		*/

		var clickEle = $(".modalCalls"); // a 태그를 클래스화 해서 전부 가져옴(화면상 갯수만큼)
		clickEle.on("click",function() { 
			var indexNo = clickEle.index(this); // indexNo을 클릭한 a 태그의 번호로 부여 (n 번째 태그인지)
			var sellerName = $(".modalsHidden1").eq(indexNo).val(); // input 태그를 0부터 증감하여 부여했으므로 n(=indexNo)번째 hidden input의  value를 modalOrderNo으로 변수 선언하겠다.
			var settleDate = $(".modalsHidden2").eq(indexNo).val();
			var commition = $(".modalsHidden3").eq(indexNo).val();
			
			console.log(sellerName);
			// 모달에 값넣어주기
			$("#myModal").on("show.bs.modal", function (e) {
						
				$.ajax({
					url : "poSellerBillModal.bo",
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
		
		/*$(function(){
    		
    		var date = new Date();
    		
    		String(date);
    		
    		var year = date.getFullYear();
    		var month = date.getMonth() + 1;
    		
    		document.getElementById("electronicMonth").value = year + "-" + month;
    		
    		$("#resetButton").click(function() {
    			
    			location.href="electronicTaxInvoice.po";
    		});
    		
    	});*/
    	
    	// 검색 결과 유지***
		var TFCondition = $("#TFCondition").val();
		
		if(TFCondition == "notEmptyCondition") {
			
			var conditionDate1 = $("#conditionDate1").val();
			
			document.getElementById("electronicMonth").value = conditionDate1;
			
		} else {
			
			// 지정한 날짜를 알맞은 형식으로 보내도록
			var date = new Date();
			
			String(date);
			
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			
			document.getElementById("electronicMonth").value = year + "-" + month;
		}		
    	
	});

</script>
</body>
</html>
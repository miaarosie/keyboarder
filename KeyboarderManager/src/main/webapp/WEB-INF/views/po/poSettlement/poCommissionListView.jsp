<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="resources/css/poCommissionList.css" rel="stylesheet">
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
		        <h1 class="m-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수수료 내역 조회</h1>
		      </div><!-- /.col -->
		    </div><!-- /.row -->
		  </div><!-- /.container-fluid -->
		</div>
		
		<!-- 실제 콘텐츠 영역 -->
		<div class="content">
			<div id="selectOption" class="card">
				<table id="option_table">
					<tr>
						<th width="10%" style="padding-left: 20px;">조회기간</th>
						<td width="10%">
							<input type="month" id="currentMonth" min="2022-09" class="form-control">
						</td>
						<td width="10px" style="text-align:center">&nbsp;~&nbsp;</td>
						<td width="10%">
							<input type="month" id="endMonth" min="2022-09" class="form-control">
						</td>
						<td></td>
					</tr>
					<tr>
						<td id="hr_td" colspan="5"><hr></td>
					</tr>
					<tr>
						<td id="option_btns" colspan="5" style="text-align:center;">
							<input type="button" id="search_btn" value="검색" class="btn btn-secondary" onclick="searchFormSubmit();">&nbsp;&nbsp;&nbsp;
							<input type="reset" id="reset_btn" onclick="resetOption();" class="btn btn-outline-secondary">
						</td>
					</tr>
				</table>
			</div>

			<br><br>

			<div id="allCommission_result" class="card">
				<div id="result_div">
					 <h4>총 합계</h4>
				</div>
				<hr><br>
				<div id="table_div">
					<table id="result_table" class="table-bordered">
						<thead>
							<tr>
								<th width="25%">기간</th>
								<th width="25%">수수료 합계 (a-b)</th>
								<th width="25%">판매 수수료 (a)</th>
								<th width="25%">수수료 할인액 (b)</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${ lastMonth }</td>
								<td>${ commission.commition - commission.keyCouponPrice }</td>
								<td>${ commission.commition }</td>
								<td>${ commission.keyCouponPrice }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div> <!-- /.content-wrapper -->

	<script>
		function resetOption() {

			$("#option_table input[type=month]").val("");
		}
	</script>
	
	<script>
		var today = new Date();
		var today_str = today.getFullYear() + "-" + ("0"+(today.getMonth() + 1)).slice(-2);
	
		function searchFormSubmit() {
			
			if($("#currentMonth").val() != "" && $("#endMonth").val() != "") {
				
				if($("#currentMonth").val() == today_str || $("#endMonth").val() == today_str) {
					
					alert("이번달 수수료 내역은 조회 불가합니다");
				} else {
					
					$.ajax({
						url : "optionSearch_commissionList.po",
						data : { currentMonth : $("#currentMonth").val(),
								 endMonth : $("#endMonth").val(),
							   },
						success : function(result) {
							
							var resultStr = "";
							
							for(var i = 0; i < result.length; i++) {
								
								resultStr += "<tr>"
												+ "<td>" + result[i].settleDate + "</td>"
												+ "<td>" + (result[i].commition - result[i].keyCouponPrice) + "</td>"
												+ "<td>" + result[i].commition + "</td>"
												+ "<td>" + result[i].keyCouponPrice + "</td>"
											+ "</tr>"
							}
							
							$("#result_table>tbody").html(resultStr);
						},
						error : function() {
							console.log("오류");
						}
					});
				}
			}
			else {
				alert("조회기간을 입력해주세요");	
			}
		}
	</script>

</body>
</html>
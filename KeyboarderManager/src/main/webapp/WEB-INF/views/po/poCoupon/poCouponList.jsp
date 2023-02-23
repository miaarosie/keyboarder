<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-MANAGER :: 쿠폰 관리</title>
<style>
#listArea, #searchArea {
	width: 95%;
	margin: auto;
}
#searchArea { padding: 30px; }
#searchArea table { width: 100%; }
#listArea {
	height: 470px;
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
}
#listTable thead th {
	background-color: gray;
	text-align: center;
	color: white;
	position: sticky;
	top: 0;
	height: 50px;
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

	<form id="showExCouponList" action="Searchexpire.co" method="post">
	
		<div class="content-wrapper">
		<br>
		<!-- 콘텐츠 영역 제목 -->
		<div class="content-header">
		  <div class="container-fluid">
		    <div class="row mb-2">
		      <div class="col-sm-6">
		        <h1 class="m-0">
		        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${loginUser.sellerName}&nbsp;쿠폰관리
		        </h1>
		      </div><!-- /.col -->
		    </div><!-- /.row -->
		  </div><!-- /.container-fluid -->
		</div>

			<div class="content">
			
			<div id="searchArea" class="card">
				<table>
			        <tr>
			           <td width="10%">발급대상 *</td>
			           <td>
			           		<input type="radio" checked>&nbsp;전체 &nbsp;
			           </td>
			    <tr>
	        <td>쿠폰상태 *&nbsp;</td>
	        <td>
	   			
	   		
	        	<select class="form-control" id="select">
	        		<option value="0" selected>선택 안 함</option>
	            	<option value="Y" name="couponStmt">사용가능</option>
	            	<option value="N" name="couponStmt">만료</option>
	        	</select>
	        </td>
	    </tr>
   		<tr>
			   		
			   		<tr>
				        <td>발행일 기준 기간 검색</td>
				        <td>
				        	<input type="date" name="fromDate" value="${param.fromDate}" id="fromDate" class="form-control col-lg-2">&nbsp;~&nbsp;<input type="date" id="toDate" name="toDate" value="${param.toDate}"class="form-control col-lg-2">
				        	
				        </td>  
			   		</tr>
				</table>
			      
			    <div align="center"> 
			        <button type="button" onclick="location.href='CouponList.po'" class="btn btn-outline-secondary">초기화</button>&nbsp;
			        <button type="submit" class="btn btn-secondary">조회</button>
			    </div>
			</div> <!-- /#searchArea -->
			
			<br><br>
			
			<div id="listArea" class="card">
			
				<table id="listTable" class="table-bordered">
			    	<thead>
			    	
			            <tr>
			               <th width="10%">쿠폰번호</th>
			               <th width="25%">쿠폰이름</th>
			               <th width="10%">쿠폰금액</th>
			               <th width="5%" >할인액</th>
			               <th width="25%">상품명</th>
			               <th width="7%">쿠폰상태</th>
			               <th width="9%">발급일</th>
			               <th width="9%" >만료일</th>
			        	</tr>
			       
			    	</thead>
			        <tbody id="couponList">
			        <c:forEach var="c" items="${list}">
			            <tr>
			               <td width="10%">${c.couponNo}</td>
			               <td width="25%">${c.couponName}</td>
			               <td width="10%">${c.couponPrice}</td>
			               <td width="5%" >${c.couponPrice}</td>
			               <td width="25%">${c.productName}</td>
			               <td width="7%">${c.couponStmt}</td>
			               <td width="9%">${c.createDate}</td>
			               <td width="9%" >${c.dueDate}</td>
			        	</tr>
			            </c:forEach>
			        </tbody>
				</table>
			
			</div><!-- /#listArea -->
			
			</div> <!-- /.content -->
			</div> <!-- /.content-wrapper -->
			
			</form>
			
			
			<script>
			//기간검색
			function reset() {
				$("#select option:eq(2)").prop("selected", true);
				$("#fromDate").val("");
				$("#toDate").val("");
			}
			
						/* 
			function showList(){
				
				$.ajax({
					
					url:"able.co",
					
					data:{
						
						sellerNo :"${loginUser.sellerNo }"
					},
				
					success : function(result) {
						var resultStr = "";
						
						for(var i =0; i<result.length; i++){
							resultStr += "<tr>"
										+"<td>" + result[i].couponNo +"</td>"
										+"<td>" + result[i].couponName +"</td>"
										+"<td>" +result[i].couponPrice +"</td>"
										+"<td>" +result[i].couponPrice +"</td>"
										+"<td>" +result[i].productName +"</td>"
										+"<td>" +result[i].couponStmt +"</td>"
										+"<td>" +result[i].createDate  +"</td>"
										+"<td>" +result[i].dueDate     +"</td>"
										+"</tr>";
										
						}
						
						$("#couponList").html(resultStr);				
					},
					
					error: function() {
						console.log("loadCoupon 실패");
					}
				});
					
			} */
			/*
			function searchCoupon() {
				
				if ($("#select option:selected").val() == 1) {
					
					$.ajax({
						url: "SearchAble.co",
						data: {
							sellerNo :"${loginUser.sellerNo }",
							fromDate: $("#fromDate").val(),
							toDate: $("#toDate").val()
						},
						success: function(result) {
							
							var resultStr = "";

							for(var i =0; i<result.length; i++){
								resultStr += "<tr>"
											+"<td>" + result[i].couponNo+  +"</td>"
											+"<td>" + result[i].couponName +"</td>"
											+"<td>" +result[i].couponPrice +"</td>"
											+"<td>" +result[i].couponPrice +"</td>"
											+"<td>" +result[i].productName +"</td>"
											+"<td>" +result[i].couponStmt +"</td>"
											+"<td>" +result[i].createDate  +"</td>"
											+"<td>" +result[i].dueDate     +"</td>"
											+"</tr>";
											
							}
							
						
							$("#couponList").html(resultStr);
						},
						error: function() {
							console.log("ableCoupon 실패");
						}
					});
				}
			}
			*/
				/* $(function() {
					showList();
				});

					 */
			</script>
			
			
			</body>
	</html>
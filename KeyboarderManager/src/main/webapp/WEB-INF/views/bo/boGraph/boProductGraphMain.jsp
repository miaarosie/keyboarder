<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-MANAGER :: 상품 전체 통계</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<style>
.card {
	width: 95%;
	margin: auto;
}
td{
	
	padding:20px;
}
#productGraph {
	width: 350px;
	height: 700px;
}

</style>
</head>
<body class="hold-transition sidebar-mini">

<jsp:include page="/WEB-INF/views/common/boheader.jsp" />

<jsp:include page="/WEB-INF/views/common/bosidebar.jsp" />

<div class="content-wrapper">
<br>
<!-- 콘텐츠 영역 제목 -->
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전체 상품 통계</h1>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>

	<div class="content">

		<div id="btm-content" class="card">
			<div class="card-body" style="width: 100%;">
			<div id="top_product" style="width: 100%;">			
				<table style="width: 100%;">
					<tr>
						<td width="50%">
							<canvas id="productGraph" width="350px" height="700px"></canvas>
						</td>
						<td width="50%">
							<table>
								<c:forEach var="p" items="${ plist }"> 
									<tr>
										<td>셀러명:</td>
										<td>${p.sellerName}</td>
									</tr>
									<tr>
										<td>상품명:</td>
										<td>${p.productName}</td>
									</tr>
									<tr>
										<td>상품가격:</td>
										<td>${p.price}</td>
									</tr>
									<tr><td></td><td></td></tr>
								</c:forEach>
							</table>	
						</td>
					</table>	
				</div>	
			</div>	
<!-- <div id="left-status" style="width:35%; margin-left: 50px;">
	
	<canvas id="productGraph" style="display: block; height: 100%; width: 100%;" class="chartjs-render-monitor"></canvas>
</div> -->
	</div>
	<script>
	
	// console.log("${plist}");

$(function() {

	const ctx = document.getElementById('productGraph').getContext('2d');
				
	const myChart = new Chart(ctx, {
		    type: 'doughnut',
		    data: {
		        labels: ["${plist[0].productName}"
		        	   , "${plist[1].productName}"
		        	   , "${plist[2].productName}"],
		        datasets: [{
		        	type: 'doughnut',
		            label: '주문건별 top3 상품',
		            data: [${plist[0].orderCount}
		            	  ,${plist[1].orderCount}
		                  ,${plist[2].orderCount}
		                ],
		            backgroundColor: [
		            	'rgba(13, 110, 253, 0.2)',
		            	'rgba(153, 102, 255, 0.2)',
		            	'rgba(255, 206, 86, 0.2)'
		            ],
		            borderColor: [
		            	'rgba(13, 110, 253, 1)',
		            	'rgba(153, 102, 255, 1)',
		            	'rgba(255, 206, 86, 1)'
		            ],
		            borderWidth: 1,
		            order: 3
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
			 

});


	</script>


	</div> <!-- /.content -->
	</div> <!-- /.content-wrapper -->


</body>
</html>
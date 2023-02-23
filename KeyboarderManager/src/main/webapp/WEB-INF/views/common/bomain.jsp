<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>K-MANAGER</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<style>

.content {
	border: 1px solid white;
	padding: 50px;
}
#top-content, #btm-content {
	padding: 20px;
	margin: 50px;
}
#top-content { 
	height: 400px; 
	padding-bottom: 0px !important; 
}
#btm-content { 
	height: 350px; 
	padding-bottom: 20px;
}
#left-status {
	height: 100%; 
	display:inline;
	margin: 0px;
	float: left;
	padding: 10px;
}
#right-status  {
height: 100%; 
	display:inline;
	margin: 0px;
	float: left;
}

#right-status table {
	width: 100%;
	height: 100%;
}
#right-status td {
	padding-right: 15px;
	height: 100%;
}
.topTitle {
	vertical-align: top;
	text-align: right;
}
.card-header {
	font-size: 20px;
	font-weight: bold;
}
#right-status td img {
	width: 150px;
	height: 150px;
}
.atag {
	font-size: 14px;
	color: blue;
	font-weight: normal;
	float: right;
}
</style>
</head>
<body class="hold-transition sidebar-mini">

<jsp:include page="/WEB-INF/views/common/boheader.jsp" />

<jsp:include page="/WEB-INF/views/common/bosidebar.jsp" />

<!-- 콘텐츠 영역 전체 래퍼 -->
<div class="content-wrapper">
	
	<!-- 실제 콘텐츠 영역 -->
	<div class="content">
	
		<div id="top-content" class="card">
			<div class="card-header">
				전체 매출 통계
				<a href="salesStatics.bo" class="atag">전체보기</a>
			</div>
			<div class="card-body graphBox" style="width:100%; height: 400px;">
				<canvas id="barCanvas" height="60"></canvas>
			</div>
		</div>
		
		<div id="btm-content" class="card">		
			<div class="card-header border-0">
				상품 통계
				<a href="SalesProduct.bo" class="atag">전체보기</a>
			</div>
			<div class="card-body">
			
				<div id="left-status" style="width:35%;">
					<canvas id="productGraph" style="display: block; height: 100%; width: 100%;" class="chartjs-render-monitor"></canvas>
				</div>
				<div id="right-status" style="width:65%;">
					<table>
						<tr>
							<td class="topTitle" width="15%">TOP 1</td>
							<td align="center">
								<div id="attachment0">
									<img class="card-img-top" style="width: 150px; height: 150px"
									src="resources/uploadFiles/202212161804190.jpg"
									alt="..." />
								</div>
								<div id="productName0">상품명</div>
								<div id="price0">상품가격</div>
							</td>
							<td class="topTitle" width="15%">TOP 2</td>
							<td align="center">
								<div id="attachment1">
									<img class="card-img-top"
									src="https://dummyimage.com/150x150/dee2e6/6c757d.jpg"
									alt="..." />
								</div>
								<div id="productName1">상품명</div>
								<div id="price1">상품가격</div>
							</td>
							<td class="topTitle" width="15%">TOP 3</td>
							<td align="center">
								<div id="attachment2">
									<img class="card-img-top"
									src="https://dummyimage.com/150x150/dee2e6/6c757d.jpg"
									alt="..." />
								</div>
								<div id="productName2">상품명</div>
								<div id="price2">상품가격</div>
							</td>
						</tr>
					</table>
				</div>
			
			</div>
		</div>
	
	</div> <!-- /.content -->



</div> <!-- /.content-wrapper -->

<script>
function barChart() {
	
	$.ajax({
		url: "mainBarGraph.bo",
		success: function(map) {			
			
			console.log(map.tlist);
			
			// var tlist = data.map.tlist;
			// var llist = data.map.llist;
			// console.log(tlist);
			// console.log(llist);
			
			const ctx = document.getElementById('barCanvas').getContext('2d');
			
			const myChart = new Chart(ctx, {
			    type: 'bar',
			    data: {
			        labels: [map.tlist[0].sellerName
			        	   , map.tlist[1].sellerName
			        	   , map.tlist[2].sellerName
			        	   , map.tlist[3].sellerName
			        	   , map.tlist[4].sellerName ],
			        datasets: [{
			        	type: 'bar',
			            label: '당월 입점업체별 매출',
			            data: [map.tlist[0].settleDept
			                 , map.tlist[1].settleDept
			                 , map.tlist[2].settleDept
			                 , map.tlist[3].settleDept
			                 , map.tlist[4].settleDept],
			            backgroundColor: [
			            	'rgba(13, 110, 253, 0.2)',
			            	'rgba(54, 162, 235, 0.2)',
			            	'rgba(255, 206, 86, 0.2)',
			            	'rgba(75, 192, 192, 0.2)',
			            	'rgba(153, 102, 255, 0.2)'
			            ],
			            borderColor: [
			            	'rgba(13, 110, 253, 1)',
			            	'rgba(54, 162, 235, 1)',
			            	'rgba(255, 206, 86, 1)',
			            	'rgba(75, 192, 192, 1)',
			            	'rgba(153, 102, 255, 1)'
			            ],
			            borderWidth: 1,
			            order: 3
			        }, {
			        	type: 'bar',
			        	label: '전월 입점업체별 매출',
			        	data: [map.llist[0].settleDept
				             , map.llist[1].settleDept
				             , map.llist[2].settleDept
				             , map.llist[3].settleDept
				             , map.llist[4].settleDept],
				        backgroundColor: [
				        	'rgba(0, 0, 0, 0.1)', 
				       		'rgba(0, 0, 0, 0.1)', 
				       		'rgba(0, 0, 0, 0.1)', 
				       		'rgba(0, 0, 0, 0.1)',
				       		'rgba(0, 0, 0, 0.1)',
				        ],
				        borderColor: [
				        	'rgba(0, 0, 0, 0.8)',
				       		'rgba(0, 0, 0, 0.8)',
				       		'rgba(0, 0, 0, 0.8)',
				        	'rgba(0, 0, 0, 0.8)',
				        	'rgba(0, 0, 0, 0.8)',
				        ],
				        order: 2
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

function productChart(){
	$.ajax({
		url: "topProduct.bo",
		success: function(plist){			
			
			
			
			// var tlist = data.map.tlist;
			// var llist = data.map.llist;
			// console.log(tlist);
			// console.log(llist);
			
			const ctx = document.getElementById('productGraph').getContext('2d');
			
			const myChart = new Chart(ctx, {
			    type: 'doughnut',
			    data: {
			        labels: [plist[0].productName
			        	   , plist[1].productName
			        	   , plist[2].productName],
			        datasets: [{
			        	type: 'doughnut',
			            label: '주문건별 top3 상품',
			            data: [plist[0].orderCount
			            	  ,plist[1].orderCount
			                  ,plist[2].orderCount
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
		
		},
		error: function() {
			console.log("에이작스 통신실패");
		} 
	});
}
		
		function productImages(){
        $.ajax({
        	url:"MainproductImg.bo",
            success:function(data) {
            	for(var i = 0; i < data.length; i++){

	          		$("#attachment"+i + " img").attr("src", "resources/uploadFiles/"+ data[i].attachment1);
	          		$("#productName" + i).text(data[i].productName);
	          		$("#price" + i).text(data[i].price);
            	}
            },
            error:function(){
            	console.log("에러")
            }
        
        });
    }


$(function() {
	barChart();
});

$(function(){
	productChart();
	productImages();
});

setInterval(function() {
	barChart();
}, 60000); // 1분 단위로 계속 갱신
</script>


</body>
</html>
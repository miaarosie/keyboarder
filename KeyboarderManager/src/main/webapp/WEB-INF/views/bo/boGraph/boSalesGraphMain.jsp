<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-MANAGER :: 전체 매출 통계</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
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
        <h1 class="m-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전체 매출 통계</h1>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>

<div class="content">

	<div class="card" style="width: 95%; margin:auto; padding: 15px;">
		<div class="graphBox">

		<canvas id="barCanvas" width="500" height="730"></canvas>
		
		</div>
	</div>

<script>
const ctx = document.getElementById('barCanvas').getContext('2d');

const myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["${ tlist[0].sellerName }"
        	   , "${ tlist[1].sellerName }"
        	   , "${ tlist[2].sellerName }" 
        	   , "${ tlist[3].sellerName }" 
        	   , "${ tlist[4].sellerName }" ],
        datasets: [{
        	type: 'bar',
            label: '당월 입점업체별 매출',
            data: [${ tlist[0].settleDept }
                 , ${ tlist[1].settleDept }
                 , ${ tlist[2].settleDept }
                 , ${ tlist[3].settleDept }
                 , ${ tlist[4].settleDept }],
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
        	data: [${ llist[0].settleDept }
	             , ${ llist[1].settleDept }
	             , ${ llist[2].settleDept }
	             , ${ llist[3].settleDept }
	             , ${ llist[4].settleDept }],
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
        }, {
        	type: 'line',
            label: '월 평균 매출',
            data: [${ alist[0].settleDept }
                 , ${ alist[1].settleDept }
                 , ${ alist[2].settleDept }
                 , ${ alist[3].settleDept }
                 , ${ alist[4].settleDept }],
            backgroundColor: [
            	'rgba(13, 110, 253, 0)'
            ],
            borderColor: [
            	'rgba(13, 110, 253, 1)'
            ],
            borderWidth: 1,
            order: 1
        }]
    },
    options: {
    	maintainAspectRatio: false,
    	aspectRatio: 1,
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});

</script>



</div> <!-- /.content -->
</div> <!-- /.content-wrapper -->
</body>
</html>
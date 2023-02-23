<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-MANAGER :: 사용가능 쿠폰 조회</title>
<style>
#listArea, #searchArea {
	width: 95%;
	margin: auto;
}
#searchArea { padding: 30px; }
#searchArea table { width: 100%; }
#listArea {
	height: 500px;
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
	padding-top: 5px;
}
#listTable thead th {
	background-color: gray;
	text-align: center;
	color: white;
	position: sticky;
	top: 0;
	height: 50px;
}
#listTable tbody {
	margin-top: 25px;
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

<jsp:include page="/WEB-INF/views/common/boheader.jsp" />

<jsp:include page="/WEB-INF/views/common/bosidebar.jsp" />

<div class="content-wrapper">
<br>
<!-- 콘텐츠 영역 제목 -->
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0">
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;KEYBOAR-DER 사용 가능 쿠폰
        </h1>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>

<div class="content">

<div id="searchArea" class="card">
	<table>
        <tr>
           <td width="15%">발급대상</td>
           <td>
           		<input type="radio" checked>&nbsp;전체 &nbsp;
           </td>
        </tr>
   		<tr>
	        <td>발행일 기준 기간 검색</td>
	        <td>
	        	<input type="date" id="startDate" class="form-control col-lg-2">&nbsp;~&nbsp;<input type="date" id="endDate" class="form-control col-lg-2">
	        </td>  
   		</tr>
	</table>
      
    <div align="center"> 
        <button type="button" onclick="reset();" class="btn btn-outline-secondary">초기화</button>&nbsp;
        <button type="button" onclick="searchCoupon();" class="btn btn-secondary">조회</button>
    </div>
</div> <!-- /#searchArea -->

<br><br>

<div id="listArea" class="card">

	<table id="listTable" class="table-bordered">
    	<thead>
            <tr>
               <th width="10%">쿠폰번호</th>
               <th width="25%">쿠폰명</th>
               <th width="10%">쿠폰종류</th>
               <th width="5%">할인금액</th>
               <th width="25%">해당상품명</th>
               <th width="7%">쿠폰상태</th>
               <th width="9%">쿠폰발행일</th>
               <th width="9%">쿠폰유효기간</th>
        	</tr>
    	</thead>
        <tbody id="couponList">
        </tbody>
	</table>
</div><!-- /#listArea -->

</div> <!-- /.content -->
</div> <!-- /.content-wrapper -->

<script>
function reset() {
	$("#select option:eq(0)").prop("selected", true);
	$("#startDate").val("");
	$("#endDate").val("");
}

function loadList() {
	
	$.ajax({
		url: "loadCoupon.bo",
		data: {
			couponStmt : "Y"
		},
		success: function(result) {
			
			var resultStr = "";
			
			// 조회된 arraylist 반복문돌려서 출력
			for (var i=0; i<result.length; i++) {
				resultStr += "<tr>"
								+ "<td>" + '<a href="couponDetail.bo?cno=' + result[i].couponNo + '">' + result[i].couponNo + "</a></td>"
								+ "<td>" + result[i].couponName + "</td>"
								+ "<td>키보더쿠폰</td>"
								+ "<td>" + result[i].couponPrice + "</td>"
								+ "<td>" + result[i].productName + "</td>"
								+ "<td>" + result[i].couponStmt + "</td>"
								+ "<td>" + result[i].createDate + "</td>"
								+ "<td>" + result[i].dueDate + "</td>"
						   + "</tr>";
			}
			
			$("#couponList").html(resultStr);
		},
		error: function() {
			console.log("loadCoupon 실패");
		}
	});
}

function searchCoupon() {

	$.ajax({
		url: "ableCoupon.bo",
		data: {
			startDate: $("#startDate").val(),
			endDate: $("#endDate").val()
		},
		success: function(result) {
			
			var resultStr = "";
			
			// 조회된 arraylist 반복문돌려서 출력
			for (var i=0; i<result.length; i++) {
				resultStr += "<tr>"
								+ "<td>" + '<a href="couponDetail.bo?cno=' + result[i].couponNo + '">' + result[i].couponNo + "</a></td>"
								+ "<td>" + result[i].couponName + "</td>"
								+ "<td>키보더쿠폰</td>"
								+ "<td>" + result[i].couponPrice + "</td>"
								+ "<td>" + result[i].productName + "</td>"
								+ "<td>" + result[i].couponStmt + "</td>"
								+ "<td>" + result[i].createDate + "</td>"
								+ "<td>" + result[i].dueDate + "</td>"
						   + "</tr>";
			}
			
			$("#couponList").html(resultStr);
		},
		error: function() {
			console.log("ableCoupon 실패");
		}
	});
}

$(function() {
	loadList();
});
</script>

</body>
</html>
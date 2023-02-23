<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-MANAGER :: K-MONEY</title>
<style>
#conTitle {
	display : inline-block;
}
.card {
	width: 95%;
	height: 750px;
	margin: auto;
	overflow: auto;
}
#listTable {
	text-align: center;
}
#listTable td {
	height: 50px;
}
#listTable thead th {
	height: 50px;
	background-color: gray;
	color: white;
	position: sticky;
	top: 0;
}
#btnarea {
	width: 97%;
}
</style>
</head>
<body class="hold-transition sidebar-mini">

<jsp:include page="/WEB-INF/views/common/poheader.jsp" />

<jsp:include page="/WEB-INF/views/common/posidebar.jsp" />

<div class="content-wrapper">

<br>

<!-- 콘텐츠 영역 제목 -->
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-m-6">
        <h1 class="m-0" id="conTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;K-MONEY 출금신청내역</h1>
      </div><!-- /.col -->
      <div id="btnarea">
      	<form action="excelDownload.kmoney">
      		<input type="hidden" name="startDate" value="${ w.startDate }">
      		<input type="hidden" name="endDate" value="${ w.endDate }">
      		<button type="submit" class="btn btn-secondary" style="float:right;">엑셀 다운로드</button>
      	</form>
      </div>
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>

<div class="content">

	<div class=card>
		<table class="table-bordered" id="listTable">
			<thead>
				<tr>
					<th>업체명</th>
					<th>출금요청일</th>
					<th>출금요청금액</th>
					<th>출금계좌번호</th>
					<th>예금주</th>
					<th>처리결과</th>
				</tr>
			</thead>
			<c:choose>
				<c:when test="${ not empty list }">
					<tbody>
						<c:forEach var="w" items="${ list }">
							<tr>
								<td>${ w.sellerName }</td>
								<td>${ w.withdrawDate }</td>
								<td>${ w.withdrawMoney }원</td>
								<td>${ w.accountNo }</td>
								<td>${ w.repName }</td>
								<td>
									<c:choose>
										<c:when test="${ w.reqResult eq 'N' }">
											미처리
										</c:when>
										<c:otherwise>
											완료
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</c:when>
				<c:otherwise>
					<tbody>
						<tr>
							<td colspan="6">
								해당 기간에 출금 신청한 내역이 없습니다.
							</td>
						</tr>
					</tbody>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	
</div> <!-- /.content -->

</div> <!-- /.content-wrapper -->
</body>
</html>
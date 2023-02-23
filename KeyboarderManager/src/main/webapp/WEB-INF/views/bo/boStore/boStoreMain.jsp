<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-MANAGER :: 입점업체 전체 조회</title>
<style>
#listarea {
	width: 95%;
	height: 750px;
	margin: auto;
	overflow: auto;
}
#listTable {
	width: 100%;
	border-collapse: collapse;
}
#listTable td {
	text-align: center;
	height: 50px;
}
#listTable thead td {
	background-color: gray;
	color: white;
	position: sticky;
	top: 0;
	height: 50px;
}
</style>
</head>
<body class="hold-transition sidebar-mini"> <!-- 모든 body 태그에 적용 -->

<jsp:include page="/WEB-INF/views/common/boheader.jsp" />

<jsp:include page="/WEB-INF/views/common/bosidebar.jsp" />

<!-- 콘텐츠 영역 전체 래퍼 -->
<div class="content-wrapper">
<br>
<!-- 콘텐츠 영역 제목 -->
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;입점업체 관리</h1>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>

<!-- 실제 콘텐츠 영역 -->
<div class="content">

<div id="listarea" class="card">
	<table id="listTable" class="table-bordered">
		<thead>
			<tr>
				<td width="20%">상호명</td>
				<td width="15%">판매자 ID</td>
				<td width="20%">사업자 등록번호</td>
				<td width="10%">계정 상태</td>
				<td width="10%">가입일</td>
				<td>판매자 정보</td>
				<td>인증 정보</td>
				<td>송금 정보</td>
			</tr>
		</thead>
		
	<c:if test="${ not empty list }">
		<tbody>
		
		<c:forEach var="s" items="${ list }" varStatus="i">
			<tr>
				<td>${ s.sellerName }</td>
				<td>${ s.sellerId }</td>
				<td>${ s.corpNo }</td>
				<td>
					<c:choose>
						<c:when test="${ s.sellerStatus eq 'Y' }">
							정상
						</c:when>
						<c:otherwise>
							탈퇴
						</c:otherwise>
					</c:choose>
				</td>
				<td>${ s.joinDate }</td>
				<td>
					<a class="btn btn-secondary" href="storeDetail.bo?sellerNo=${ s.sellerNo }">상세보기</a>
				</td>
				<td>
					<!-- 인증 완료 시에는 인증 확인 / 아닐 때는 미인증 -->
					<c:choose>
						<c:when test="${ s.identifyStatus eq 'N' }">
							<form action="identify.bo" method="post" id="identify">
								<input type="hidden" name="sellerNo" value="${ s.sellerNo }">
								<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#identifyModal">미인증</button>
							</form>
						</c:when>
						<c:otherwise>
							<button class="btn btn-primary">인증</button>
						</c:otherwise>
					</c:choose>
				</td>
				<td>
					<form action="updateAccount.bo" method="post" id="accountForm">
						<input type="hidden" name="sellerNo" value="${ s.sellerNo }">
						<input type="hidden" id="accountNo" name="accountNo" value="">
					</form>
					<button class="btn btn-secondary" data-toggle="modal" data-target="#accountModal" onclick="resetAccountNo();">계좌변경</button>
				</td>
			</tr>
			
		</c:forEach>
		</tbody>
	</c:if>
	</table>

</div>



<!-- 인증 정보 모달 -->
<!-- data-toggle="modal" data-target="#identifyModal" -->
<div class="modal" id="identifyModal">
  <div class="modal-dialog">
    <div class="modal-content">
		
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">입점 업체 인증 정보</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        	해당 업체 입점을 승인하시겠습니까?
	      </div>
	     <input type="hidden" id="sellerNo" name="sellerNo">
	      
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-secondary" onclick="identify();">인증</button>
	      </div>
	      
    </div>
  </div>
</div> <!-- /.modal -->

<!-- 계좌 변경 모달 -->
<div class="modal" id="accountModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">입점업체 송금 계좌 변경</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      	변경할 계좌번호를 입력하세요. <br><br>
      	<input type="text" class="form-control" id="newAccount">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal" data-toggle="modal" data-target="#accountSubmitModal">변경</button>
      </div>

    </div>
  </div>
</div> <!-- /.modal -->

<!-- 계좌 변경 재확인 모달 -->
<div class="modal" id="accountSubmitModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">입점업체 송금 계좌 변경</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      	입력하신 계좌번호는 <span id="accountConfirm"></span> 입니다. <br><br>
      	변경하시겠습니까?
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-secondary" onclick="changeAccount();">변경</button>
      </div>

    </div>
  </div>
</div> <!-- /.modal -->

<script>
// 인증모달
function identify() {
	$("#identify").submit();
}


// 계좌변경 모달 - submit
function changeAccount() {
	
	// 입력한 계좌번호가 10자 미만일 경우에는 경고 alert();
	var regex = /^(\d|\-){10,20}$/;
	
	if (!regex.test($("#newAccount").val())) {
		
		alert("숫자와 - 만 입력할 수 있습니다. 정확한 계좌번호를 입력해주세요.");
		$("#newAccount").val().replace(/[^0-9]/g, '');
		$("#accountSubmitModal").modal('hide');
		$("#accountModal").modal("show");
		resetAccountNo();
		
	} else {
		$("#accountNo").val($("#newAccount").val());
		$("#accountForm").submit();		
	}
}

$(function() {
	
	// 계좌번호 입력 후 재확인시켜주기
	$("#newAccount").keyup(function() {
		$("#accountConfirm").text($("#newAccount").val());
		
	});
});

// 계좌번호 변경 취소 후 재입력시 기존 내역 삭제
function resetAccountNo() {
	$("#newAccount").val("");
	$("#accountConfirm").text("");
}
</script>


</div> <!-- /.content -->

</div> <!-- /.content-wrapper -->
</body>
</html>
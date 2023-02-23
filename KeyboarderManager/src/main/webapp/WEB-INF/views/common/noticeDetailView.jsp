<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-MANAGER :: 공지사항</title>
<link href="resources/css/boNotice.css" rel="stylesheet">
<style>
.card {
}
#noticeArea {
	width: 95%;
	margin: auto;
	height: 750px;
}
#noticeTitle {
	padding: 15px;
	margin-top: 15px;
}

</style>
</head>
<body class="hold-transition sidebar-mini">

	<!-- 로그인세션의 계정 검사해서 헤더와 사이드바 로그인한 계정에 맞는걸로 조건 설정 -->
	<c:choose>
		<c:when test="${ loginUser.sellerId eq 'admin' }">
			<jsp:include page="boheader.jsp" />
			<jsp:include page="bosidebar.jsp" />
		</c:when>
		<c:otherwise>
			<jsp:include page="poheader.jsp" />
			<jsp:include page="posidebar.jsp" />
		</c:otherwise>
	</c:choose>
	
	
	<!-- 콘텐츠 영역 전체 래퍼 -->
	<div class="content-wrapper">
	<br>
		<!-- 콘텐츠 영역 제목 -->
		<div class="content-header">
		  <div class="container-fluid">
		    <div class="row mb-2">
		      <div class="col-sm-6">
		        <h1 class="m-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공지사항</h1>
		      </div><!-- /.col -->
		    </div><!-- /.row -->
		  </div><!-- /.container-fluid -->
		</div>
		<!-- 실제 콘텐츠 영역 -->
		<div class="content">
			<div id="noticeArea" class="card">
				<div id="noticeTitle" >
					<input type="text" id="title" value="${ n.noticeTitle }" readonly style="width:65%; font-size: 16px;">
					<input type="text" id="writeDate" value="${ n.writeDate }" style="font-size: 16px;">
					<input type="text" id="writer" value="관리자" style="font-size: 16px;">
				</div>
				<hr>
				<div id="noticeContent">
					<textarea id="content" rows="10" style="resize:none; font-size: 16px;" readonly>${ n.noticeContent }</textarea>
				</div>
				<!-- bo/po 공통으로 사용하는 jsp파일이라 추후 로그인세션의 계정 검사해서 관리자일 경우에만 수정,삭제 버튼 보이게끔 if문 설정해야함 -->
				<c:if test="${ loginUser.sellerId eq 'admin' }">
					<div id="noticeBtns">
						<button id="update_btn" class="btn" onclick="noticeFormSubmit(1);">수정하기</button>&nbsp;&nbsp;&nbsp;
						<button id="delete_btn" class="btn" onclick="noticeFormSubmit(2);">삭제하기</button>
					</div>
				</c:if>
	
				<form id="noticeForm" action="" method="post">
					<input type="hidden" name="nno" value="${ n.noticeNo }">
				</form>
			
			</div>

		</div>
	</div> <!-- /.content-wrapper -->

	<script>
		function noticeFormSubmit(num) {

			if(num == 1) {
				$("#noticeForm").attr("action", "noticeUpdateForm.bo").submit();
			} else {
				
				if(confirm("해당 공지사항을 정말 삭제하시겠습니까?")){
					$("#noticeForm").attr("action", "noticeDelete.bo").submit();
				}
			}
		}
	</script>

</body>
</html>
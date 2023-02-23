<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-MANAGER :: 공지사항</title>
<link href="resources/css/boNotice.css" rel="stylesheet">
<style>
#noticeArea {
	width: 95%;
	margin: auto;
	height: 750px;
}
</style>
</head>
<body class="hold-transition sidebar-mini">

	<jsp:include page="boheader.jsp" />

	<jsp:include page="bosidebar.jsp" />
	
	<!-- 콘텐츠 영역 전체 래퍼 -->
	<div class="content-wrapper">
	
		<!-- 콘텐츠 영역 제목 -->
		<div class="content-header">
		  <div class="container-fluid">
		    <div class="row mb-2">
		      <div class="col-sm-6">
		        <h1 class="m-0">&nbsp;공지사항 수정</h1>
		      </div><!-- /.col -->
		    </div><!-- /.row -->
		  </div><!-- /.container-fluid -->
		</div>
		
		<!-- 실제 콘텐츠 영역 -->
		<div class="content">
		<div id="noticeArea" class="card">
			<form id="noticeUpdateForm" method="post" action="noticeUpdate.bo">
				<input type="hidden" value="${ n.noticeNo }" name="noticeNo">
				<div id="noticeTitle">
					<input type="text" id="title" value="${ n.noticeTitle }" name="noticeTitle" required style="font-size: 16px;">
				</div>
				<hr>
				<div id="noticeContent" style="height: 550px;">
					<textarea id="content" rows="10" style="resize:none;font-size: 16px; height: 500px;" name="noticeContent" required>${ n.noticeContent }</textarea>
				</div>
				<div id="noticeBtns">
					<button type="submit" id="write_btn" class="btn">수정하기</button>&nbsp;&nbsp;&nbsp;
					<a href="noticeList.bo"><input type="button" id="cancle_btn" value="취소" class="btn btn-outline-secondary"></input></a>
				</div>
			</form>
		</div>
		</div>
	</div> <!-- /.content-wrapper -->



</body>
</html>
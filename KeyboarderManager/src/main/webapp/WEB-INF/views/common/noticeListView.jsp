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
#writeNotice {
	width: 98%;
	align: right;
}
#noticeList {
	width: 95%;
	margin: auto;
	height: 550px;
	padding: 0px;
}
#noticeList_table {
	width: 100%;
	border-collapse: collapse;
}
#noticeList_table td {
	text-align: center;
	height: 50px;
}
#noticeList_table thead {
	height: 50px;
	background-color: gray;
	color: white;
}
.pagination {
	margin: auto;
	float: right;
	background-color: white;
	border: 1px solid gray;
	height: 40px;
	margin-bottom: 0px;
}
.card {
width: 95%;
height: 550px;
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
		      
			<!-- 로그인세션의 계정 검사해서 관리자(BO) 일 경우에만 글쓰기 보이게끔 조건 설정 -->
			<c:if test="${ loginUser.sellerId eq 'admin' }">
				<div id="writeNotice">
					<a href="noticeEnrollForm.bo"><button id="writeNotice_btn" class="btn btn-secondary">글쓰기</button></a>
				</div>
			</c:if>
			
		    </div><!-- /.row -->
		  </div><!-- /.container-fluid -->
		</div>
		
		<!-- 실제 콘텐츠 영역 -->
		<div class="content" style="height: 700px;">

			<div id="noticeList" class="card">
				<table id="noticeList_table" class="table-bordered">
					<thead>
						<tr>
							<th width="10%">번호</th>
							<th width="65%">제목</th>
							<th width="10%">조회수</th>
							<th width="15%">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${ not empty list }">
							<c:forEach var="n" items="${ list }">
								<tr>
									<td>${ n.noticeNo }</td>
									<td>${ n.noticeTitle }</td>
									<td>${ n.viewCount }</td>
									<td>${ n.writeDate }</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>

			<br>

			<div id="pagingArea">
				<ul class="pagination">
				<c:choose>
					<c:when test="${ pi.currentPage eq 1 }">
						<li class="page-item disabled">
							<a class="btn">&lt;</a>
						</li>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${ loginUser.sellerId eq 'admin' }">
								<li class="page-item">
								<button class="btn" onclick="location.href='noticeList.bo?cpage=${ pi.currentPage - 1 }'">&lt;</button>&nbsp;
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
								<button class="btn" onclick="location.href='noticeList.po?cpage=${ pi.currentPage - 1 }'">&lt;</button>&nbsp;
								</li>
							</c:otherwise>
						</c:choose>
					
					</c:otherwise>
				</c:choose>
				
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:choose>
						<c:when test="${ loginUser.sellerId eq 'admin' }">
						<li class="page-item">
							<button class="btn" onclick="location.href='noticeList.bo?cpage=${ p }'">${ p }</button>&nbsp;
						</li>
						</c:when>
						<c:otherwise>
						<li class="page-item">
							<button class="btn" onclick="location.href='noticeList.po?cpage=${ p }'">${ p }</button>&nbsp;
						</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
					<li class="page-item disabled">
						<button class="btn">&gt;</button>
					</li>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${ loginUser.sellerId eq 'admin' }">
							<li class="page-item">
								<button class="btn" onclick="location.href='noticeList.bo?cpage=${ pi.currentPage + 1}'">&gt;</button>
							</li>
							</c:when>
							<c:otherwise>
							<li class="page-item">
								<button class="btn" onclick="location.href='noticeList.po?cpage=${ pi.currentPage + 1}'">&gt;</button>
							</li>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
				</ul>
			</div>

		</div>
	</div> <!-- /.content-wrapper -->

	<script>
		$(function() {
			$("#noticeList_table>tbody>tr").click(function() {

				// 로그인세션의 계정 검사해서 로그인한 계정에 맞는걸로 url주소(bo 또는 po) 요청 설정
				if("${ loginUser.sellerId }" == 'admin') {
					location.href = "noticeDetail.bo?nno=" + $(this).children().eq(0).text();
				} else {
					location.href = "noticeDetail.po?nno=" + $(this).children().eq(0).text();
				}
			});
		});
	</script>

</body>
</html>
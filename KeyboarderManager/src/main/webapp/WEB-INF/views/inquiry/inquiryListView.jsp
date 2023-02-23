<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-MANAGER :: 1:1 문의</title>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
	<style>
        .inquiry{
            width:95%;
            margin: auto;
        }

        .inquiryList {
        width : 100%x;
        margin: auto;
        margin-top: 30px;
        }
        
        #erollbtn {
            margin-bottom: 15px;
            float:right;
            background-color : black;
        }
        
        #pagingArea ul li a{
            color:black;
        }
        
        #pagingArea {width:fit-content; margin:auto;}
        
        tbody>tr:hover {
          background-color : rgba(243, 243, 243, 0.932);
          font-weight : 600;
        }
    </style>

</head>
<body class="hold-transition sidebar-mini"> <!-- 모든 body 태그에 적용 -->

<c:choose>
	<c:when test="${ loginUser.sellerId eq 'admin' }">
		<jsp:include page="/WEB-INF/views/common/boheader.jsp" />
		<jsp:include page="/WEB-INF/views/common/bosidebar.jsp" />
	</c:when>
	<c:otherwise>
		<jsp:include page="/WEB-INF/views/common/poheader.jsp" />
		<jsp:include page="/WEB-INF/views/common/posidebar.jsp" />
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
        <h1 class="m-0" style="margin-left:20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1:1 문의게시판</h1>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>

<!-- 실제 콘텐츠 영역 -->
<div class="content">
	<div class="inquiry" class="card">
        <div class="inquiryList">
        <c:if test="${ loginUser.sellerId ne 'admin'}">
        	<button type="button" class="btn btn-dark" id="erollbtn" onclick="location.href='enrollForm.iq'">글작성</button>        
        </c:if>
        <table id="iqList" class="table table-bordered" style="text-align: center;">
            <thead>
                <tr>
                    <th width="10%">글번호</th>
                    <th width="20%">답변상태</th>
                    <th width="50%">글제목</th>
                    <th width="20%">작성일</th>
                </tr>
                </thead>
                <tbody style="background-color : white; cursor : pointer;">
                	<c:choose>
                		<c:when test="${ empty list }">
                			<tr>
                				<td colspan="4">문의내역이 존재하지 않습니다.</td>
                			</tr>
                		</c:when>
                		<c:otherwise>
                			<c:forEach var="i" items="${ list }">
		                		<tr class="iqlist">
			                      <td>${i.inquiryNo }</td>
			                      <td>
			                      <c:choose>
	                            <c:when test="${ i.inquiryReply eq '답변대기'}">
	                              답변대기
	                            </c:when>
                            	<c:otherwise>
                              답변완료
                           		 </c:otherwise>
                           		 </c:choose>
							      </td>
		                      <td>${i.inquiryName }</td>
		                      <td>${i.inquiryDate}</td>
                   			</tr>
                	    	</c:forEach>
                		</c:otherwise>
                	</c:choose>
                </tbody>
            </table>
            
            <script>
            $(function() {
              $(".iqlist").click(function() {
                location.href = "detail.iq?ino=" + $(this).children().eq(0).text();
              });
            });
            </script>
            
            <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
                			<li class="page-item disabled"><a class="page-link">&lt;</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item"><a class="page-link" href="list.iq?cpage=${ pi.currentPage - 1 }">&lt;</a></li>
                		</c:otherwise>
                	</c:choose>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="list.iq?cpage=${ p }">${ p }</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
                    		<li class="page-item disabled"><button class="page-link">&gt;</button></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="list.iq?cpage=${ pi.currentPage + 1 }">&gt;</a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </div>
</div> <!-- /.content -->

</div> <!-- /.content-wrapper -->
</body>
</html>
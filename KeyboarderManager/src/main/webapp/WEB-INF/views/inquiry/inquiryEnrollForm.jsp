<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-MANAGER :: 1:1 문의</title>

<!-- 부트스트랩-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style>
.content {
	width: 100%;
	margin: auto;
}
</style>
</head>
<body class="hold-transition sidebar-mini"> <!-- 모든 body 태그에 적용 -->

<jsp:include page="/WEB-INF/views/common/poheader.jsp" />

<jsp:include page="/WEB-INF/views/common/posidebar.jsp" />

<!-- 콘텐츠 영역 전체 래퍼 -->
<div class="content-wrapper">
<br>
<!-- 콘텐츠 영역 제목 -->
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1:1 문의작성하기</h1>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>

<!-- 실제 콘텐츠 영역 -->
<div class="content">
	<form method="post" action="insert.iq">
    <div class="container">
    <br><br>
      <table class="table table-hover">
        <tbody>
          <tr>
            <td><input type="text" class="form-control" placeholder="글 제목" name="inquiryName" maxlength="40"></td>
          </tr>
          <tr>
            <td><textarea id="contentText" type="text" class="form-control" placeholder="글 내용을 작성하세요" name="inquiryContent" onkeypress="onChange();" maxlength="1000" style="height: 400px; resize: none;"></textarea></td>
          </tr>
        </tbody>
      </table>

      <div id="count" style=" width: 100%; text-align: right;">
        <span>0</span> / 1000
      </div>

      <script>
        $(function() {
            $('#contentText').keyup(function () {		
                $("#count>span").text($(this).val().length);  			
            });
        });

        function onChange() {
          var key = window.event.keyCode;
          // enter키 처리
          if (key === 13) {
              document.getElementById("contentText").value = document.getElementById("contentText").value + " ";
              return false;
          }
          else {
              return true;
          }
        }
      </script>
      <div>
        <input type="submit" class="btn btn-dark" style="background-color : black; float:right; margin-top: 10px;" value="글쓰기">
      </div>
      
    </div>
    </form>
</div> <!-- /.content -->

</div> <!-- /.content-wrapper -->
</body>
</html>
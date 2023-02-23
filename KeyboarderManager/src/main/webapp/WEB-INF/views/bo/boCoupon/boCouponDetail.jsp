<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-MANAGER :: 쿠폰 상세</title>
<style>
#listArea {
	width: 95%;
	margin: auto;
	padding: 40px;
}
#insertStcoupone {
	width: 100%;
}
#couponForm table {
	width: 100%;
	line-height: 25px;
}
td{
	padding-left:5px;
	height: 65px;
}

input[type=date], #sellerNo, #productNo {
	display: inline-block;
}

label {
	margin-right: 15px;
}
input[type=radio] { margin-right: 5px; }
h5, h6 { padding: 5px; }
select[name=productNo] {
	width: 33%;
}
#btnarea {
	width: 97%;
}
#btnarea button {
	float: right;
	margin-right: 10px;
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
        <h1 class="m-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;KEYBOAR-DER 쿠폰 등록</h1>
      </div><!-- /.col -->
	  <div id="btnarea">
			<button onclick="couponUpdate();" class="btn btn-outline-secondary">수정하기</button>
	  </div>
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>

<div class="content">

<div id="listArea" class="card">
	<form id="couponForm" action="updateCoupon.bo" method="post">
	    <table>
	    	<tr>
	    		<td width="15%">쿠폰명 *</td>
	    		<td>
	    			<input type="hidden" name="couponNo" value="${ bc.couponNo }">
	    			<input type="text" style="width:51%;" name="couponName" value="${ bc.couponName }" class="form-control" required>
	    		</td>
	    	</tr>
	    	<tr>
		        <td>쿠폰종류 *</td>
		        <td>
		        	<label class="form-check-label"><input type="radio" name="couponPrice" value="3000" checked>3000원</label>
			        <label class="form-check-label"><input type="radio" name="couponPrice" value="5000">5000원</label>
			        <label class="form-check-label"><input type="radio" name="couponPrice" value="10000">10000원 </label>
			    </td>
			</tr>
			<tr>
			    <td>쿠폰 발행기간 *</td>
			    <td>
			    	<input type="date" name="createDate" class="form-control col-lg-2" value="${ bc.createDate }" disabled> ~ <input type="date" name="dueDate" class="form-control col-lg-2"  value="${ bc.dueDate }" disabled>
			   	</td>
			</tr>
			<tr>
				<td>쿠폰 발행범위 *</td>
				<td>
					<select name="sellerNo" id="sellerNo" class="form-control col-lg-2 select" disabled>
						<option selected>${ bc.sellerName }</option>
					</select>
					&nbsp;&nbsp;
					<select name="productNo" id="productNo" class="form-control select" disabled>
						<option selected>${ bc.productName }</option>
					</select>
				</td>
			</tr>
	   	 </table>
	   	 
	     <hr style="clear:both">
	     <br>
	     <h5>* 쿠폰 등록 설정</h5>
	     <h6>
		        파트너사 할인쿠폰 설정 시 100% 부담으로 할인이 적용됩니다. 현재 페이지에서 직접 설정한 할인액에 대해서는 KEYBOAR-DER 가 부담하지 않습니다.<br>
		    KEY-BORDER 쿠폰 사용시, 쿠폰금액만큼 판매자 수수료에서 차감됩니다. (정산 매뉴얼 참고)<br><br>   
		 </h6>
		 <h5>* 쿠폰 등록시 주의사항</h5> 
		 <h6>   
		        쿠폰 종류는 파트너사 할인쿠폰과 오픈마켓 쿠폰 중복 적용이 불가능하며 오픈마켓 정책상 모든 상품전체에 쿠폰이 적용되나, 한 상품당 하나의 쿠폰만 사용 가능합니다.<br>
		        유효기간이 지난 쿠폰도 쿠폰 목록에서 조회가능합니다.
	     </h6>
	</form> 
	    
</div> <!-- /#listArea -->

</div> <!-- /.content -->
</div> <!-- /.content-wrapper -->

<script>
$(function() {
	
	var couponPrice = ${ bc.couponPrice };
	var radioBtn = $("input[name=couponPrice]");
	
	for (var i=0; i<radioBtn.length; i++) {
		
		if (radioBtn[i].value == couponPrice) {
			radioBtn[i].checked = true;
		}
	}
	
});

function couponUpdate(num) {
	$("#couponForm").submit();
}
</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
<title>K-MANAGER :: 쿠폰 수정</title>
</head>
<style>
#listArea {
	width: 95%;
	margin: auto;
	padding: 40px;
}
td{
	padding-left:5px;
	height: 65px;
}

input[type=date], #createDate, #dueDate {
	
	width: 100%;
	display: inline-block;
}
input[type=radio] { margin-right: 5px; }
h5, h6 { padding: 5px; }
select[name=productNo] {
	width: 33%;
}

#coupone_list{
    border-collapse: collapse;
}

</style>
<body class="hold-transition sidebar-mini">

	<jsp:include page="../../common/poheader.jsp" />

	<jsp:include page="../../common/posidebar.jsp" />
	
		<form id="showCouponListPo" action="updateCoupon.po" method="post">
		<input type="hidden" name="couponNo">
		<div class="content-wrapper">

			<br>
			<!-- 쿠폰등록-->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
						</div>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>

			<div class="content">
			<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${loginUser.sellerName}&nbsp;쿠폰수정</h3>
		<div id="listArea" class="card">
		
		<input type="hidden" name="sellerNo" value="${loginUser.sellerNo}">
	
	
	    <fieldset>
			
	        <table>
	    	<tr>
	    	<td>쿠폰명*</td>
	    	<td><input type="text" style="width:100%;" name="couponName" class="form-control"></td>
	    </tr>
	
	    	<tr>
	        <td>쿠폰종류*</td>
	        <td><input type="radio" name="couponPrice" value="3000">&nbsp;3000원&nbsp;
	        <input type="radio" name="couponPrice" value="5000">&nbsp;5000원&nbsp;
	        <input type="radio" name="couponPrice" value="10000">10000원 &nbsp;</td>
	        
		</tr>
	<tr>
	    <td>쿠폰 발행기간*&nbsp;</td>
	    <td><input type="date" name="createDate" style="width:100%;"class="form-control col-lg-4" disabled >~<input type="date" name="dueDate" style="width:100%;" class="form-control col-lg-4" disabled></td>
		</tr>

		
	   	 </table>
	   	 <button style="float:right; margin-right:20px;" class="btn btn-secondary">수정하기</button><br><br>
	    <hr style="clear:both">
	    <h6>* 쿠폰 등록 설정<br>
	       파트너사 할인쿠폰 설정 시 100% 부담으로 할인이 적용됩니다. 현재 페이지에서 직접 설정한 할인액에 대해서는 KEYBOAR-DER 가 부담하지 않습니다.<br>
        KEY-BORDER 쿠폰 사용시, 쿠폰금액만큼 판매자 수수료에서 차감됩니다. (정산 매뉴얼 참고)<br><br>
        
        * 쿠폰 등록시 주의사항<br>
        
        쿠폰 종류는 파트너사 할인쿠폰과 오픈마켓 쿠폰 중복 적용이 불가능하며 오픈마켓 정책상 모든 상품전체에 쿠폰이 적용되나, 한 상품당 하나의 쿠폰만 사용 가능합니다.<br>
        유효기간이 지난 쿠폰도 쿠폰 목록에서 조회가능합니다.
        </h6>
	    </fieldset>
		</div>
	</div>
</div>
</form> 
<body>






</body>
</html>
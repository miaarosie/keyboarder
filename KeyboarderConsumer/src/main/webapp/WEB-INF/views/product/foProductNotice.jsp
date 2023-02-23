<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KEYBOAR-DER 상품 조회</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	
	<style>
        div{
            /* border: 1px solid red;*/
            box-sizing: border-box;
        }

        #fo-full-main{
            width: 1200px;
            height: 1200px;
            margin: auto;
            /* border: 2px solid black; */
        }

        #fo-product-body{
            width: 100%;
            height: 1070px;
            /* border: 2px solid black; */
            padding-top: 20px;
            /* background-color: #efefef; */
            /* border-radius: 30px; */
            margin: auto;
            margin-top: 40px;
        }
        #fo-product-header {
        	width: 100%;
        	height: 600px;
        	margin-bottom: 60px;
        }

        #fo-product-main{
            width: 85%;
            height: 800px;
            align: center;
            margin: auto;
            margin-top: 60px;
        }
        .card {
        	float: left;
        }

        .fo-product-all{
            width: 220px;
            height: 410px;
            display: inline-block;
            /* margin-bottom: 10px; */
            /* border-radius: 15px; */
            /* border: 2px solid black; */
            background-color: white;
        	margin-left: 60px;
        	margin-bottom: 60px;
        	padding-bottom: 20px;
        }

        .fo-product-img{
            width: 200px;
            height: 200px;
            /* border-radius: 5px; */
            margin-top: 5%;
        }

        .fo-product-name{
            width: 100%;
            height: 100px;
        }

        .fo-product-price{
            width: 100%;
            height: 40px;
        }

        .fo-buy-button{
            width: 100%;
            height: 45px;
        }
        
        .page-item{
        	border: 2px solid #efefef;
        	/* background-color: black; */
        	color: black;
        }
        
        #page-btn{
        	color: black;
        }
        
        #buy-btn{
        	width: 120px;
        	height: 40px; 
        }
        
        #buy-btn:hover{
        	opacity: 0.7;
        	cursor: pointer;
        	color: white;
        }

    </style>
    
</head>
<body>
	
	<!-- 헤더 include 구문 -->
	<jsp:include page="../common/foHeader.jsp" />
	
	<!-- 구매페이지 전체를 관리하는 div -->
	<div id="fo-full-main">

		<!-- 상단 이미지 -->
        <div id="fo-product-body">
        	<div id="fo-product-header">
        		<img src="https://img.topket.co.kr/files/0/logitech_%EC%B9%B4%ED%85%8C%EA%B3%A0%EB%A6%AC_%EB%8C%80%EB%B0%B0%EB%84%88_v4.jpg"
        			 width="100%" height="100%" />
        	</div>
        	
        	<!-- 구매할 수 있는 상품 리스트 조회 -->
            <div id="fo-product-main container">
                
                	<!-- 반복문을 통해 여러개의 상품 조회 가능 -->
                	<c:forEach var="p" items="${ proList }">
	                    <div class="card fo-product-all" align="center">
	                        <form action="purchase.fo" method="post" class="request">
	                        	<input type="hidden" name="paymentNo" class="imp_uid">
								<input type="hidden" name="orderNo" class="merchant_uid">
								<input type="hidden" name="productNo" class="product_name" value="${ p.productNo }">
								<input type="hidden" name="amount" class="amount">
								<input type="hidden" name="couponPrice" class="couponPrice" value="3000">
	                            <div class="fo-product-img">
	                                <img src="resources/uploadFiles/${ p.attachment1 }" style="background-size: cover; width: 100%; height: 100%;">
	                            </div>
	                            <div class="fo-product-name" style="padding: 10px; margin: 0px;">
	                            	${ p.productName }
	                            </div>
	                            <div class="fo-product-price" style="padding: 12px; margin: 0px;">
	                            	${ p.price }
	                            </div>
	                            <div class="fo-product-coupon" style="padding: 8px; margin: 0px;">
	                            	<select class="form-select couponSelect" name="couponPrice">
	                            		<c:choose>
	                            			<%-- 쿠폰 옵션 중 상품에 해당되는 옵션만 보여질 수 있음 --%>
		                            		<c:when test="${ p.keyCouponName ne null and p.stoCouponName ne null }">
		                            			<option value="${ p.keyCouponPrice }" selected>
		                            				${ p.keyCouponName }
		                            			</option>
			                            		<option value="${ p.stoCouponPrice }">
			                            			${ p.stoCouponName }
			                            		</option>
		                            		</c:when>
		                            		<c:when test="${ p.keyCouponName ne null and p.stoCouponName eq null }">
		                            			<option value="${ p.keyCouponPrice }" selected>
		                            				${ p.keyCouponName }
		                            			</option>
		                            		</c:when>
		                            		<c:when test="${ p.keyCouponName eq null and p.stoCouponName ne null }">
		                            			<option value="${ p.stoCouponPrice }" selected>
		                            				${ p.stoCouponName }
		                            			</option>
		                            		</c:when>
		                            		<c:when test="${ p.keyCouponName eq null and p.stoCouponName eq null }">
		                            			<option value="0" selected disabled align="center">
		                            				쿠폰 없음
		                            			</option>
		                            		</c:when>
	                            		</c:choose>
	                            	</select>
	                            		
	                            	<c:choose>
	                            		<c:when test="${ p.keyCouponName ne null and p.stoCouponName eq null }">
	                            			<input type="hidden" name="couponNo" value="${ p.keyCouponNo }">
	                            		</c:when>
	                            		<c:when test="${ p.keyCouponName eq null and p.stoCouponName ne null }">
	                            			<input type="hidden" name="couponNo" value="${ p.stoCouponNo }">
	                            		</c:when>
	                            		<c:when test="${ p.keyCouponName eq null and p.stoCouponName eq null }">
	                            			<input type="hidden" name="couponNo" value="X">
	                            		</c:when>
	                            	</c:choose>
	                            	
	                            </div>
	                            	<c:choose>
	                            		<%-- 로그인이 되지 않았다면 구매하기 버튼 보이지 않음 --%>
	                            		<c:when test="${ not empty loginUser }">
	                            			<div class="fo-buy-button" align="center" style="padding: 7px; margin: 0px;">
				                                <button type="button" id="buy-btn" class="btn btn-primary" onclick="requestPay(this);" style="padding: 9px; margin: 0px;">
				                                   	 구매하기
				                                </button>
			                                </div>
	                                	</c:when>
	                                	<c:otherwise>
	                                	</c:otherwise>
	                                </c:choose>
	                        </form>
	                    </div> <%-- /.fo-product-all --%>
	                </c:forEach>
                     
                     <br clear="both">
                    
                    <!-- 페이징 처리 -->
		            <div style="padding: 40px 50px; margin: 0px;">
			            <nav aria-label="Page navigation example">
						  <ul class="pagination" style="justify-content: center;">
						  	<c:choose>
						  		<c:when test="${ pi.currentPage eq 1 }">
								    <li class="page-item disabled">
								      <a class="page-link" href="#" aria-label="Previous" id="page-btn">
								        <span aria-hidden="true">&laquo;</span>
								      </a>
								    </li>						  		
						  		</c:when>
						  		<c:otherwise>
						  			<li class="page-item">
								      <a class="page-link" href="foProductNotice.pro?cpage=${ pi.currentPage - 1 }" aria-label="Previous" id="page-btn">
								        <span aria-hidden="true">&laquo;</span>
								      </a>
								    </li>
						  		</c:otherwise>
						  	</c:choose>
						    
						    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						    	<li class="page-item"><a class="page-link" href="foProductNotice.pro?cpage=${ p }" id="page-btn">${ p }</a></li>
						    </c:forEach>
						    
						    <c:choose>
                				<c:when test="${ pi.currentPage eq pi.maxPage }">
								    <li class="page-item disabled">
								      <a class="page-link" href="#" aria-label="Next" id="page-btn">
								        <span aria-hidden="true">&raquo;</span>
								      </a>
								    </li>
						    	</c:when>
						    	<c:otherwise>
						    		<li class="page-item">
								      <a class="page-link" href="foProductNotice.pro?cpage=${ pi.currentPage + 1 }" aria-label="Next" id="page-btn">
								        <span aria-hidden="true">&raquo;</span>
								      </a>
								    </li>
						    	</c:otherwise>
						    </c:choose>
						  </ul>
						</nav>
					</div>
					<!-- 여기까지가 페이징 처리 구문 -->
                
            </div>            
        </div>
    </div>

	<script>
		
		// 주문번호 만들기
		function createOrderNum(){
			const date = new Date();
			const year = date.getFullYear();
			const month = String(date.getMonth() + 1).padStart(2, "0");
			const day = String(date.getDate()).padStart(2, "0");
			
			let orderNum = year + month + day;
			for(let i=0;i<10;i++) {
				orderNum += Math.floor(Math.random() * 8);	
			}
			return orderNum;
		}
		
		var IMP = window.IMP; // 생략 가능
    	IMP.init("imp80773741"); // 예: imp00000000
		
    	function requestPay(btn) {
    		
    		var $productName = $(btn).parent().siblings(".fo-product-name").text().trim(); // 상품명
			var $productPrice = Number($(btn).parent().siblings(".fo-product-price").text()); // 상품가격
			var $couponPrice = $(btn).parent().siblings(".fo-product-coupon").children(".couponSelect").val();
			// var $couponNo = $(btn).parent().siblings(".fo-product-coupon").children("input[name=couponNo]").val();
			// console.log($couponNo);
			
			var amount = $productPrice
							- $couponPrice
							+ 2500; // 상품 가격 - 쿠폰금액 + 배송비
			
			var $form = $(btn).parent().parent();
			// console.log($form);
			
			
    	    // IMP.request_pay(param, callback) 결제창 호출
  	    	IMP.request_pay({ // param
  	            pg: "html5_inicis.INIpayTest",
  	            pay_method: "card",
  	            merchant_uid: createOrderNum(),
  	            name: $productName, // 상품명
  	            amount: amount, // 가격
  	            buyer_email: "${ loginUser.conEmail }",
  	            buyer_name: "${ loginUser.conNo }",
  	            buyer_tel: "${ loginUser.conPhone }",
  	            buyer_addr: "${ loginUser.address }"
  	        }, function (rsp) { // callback
  	            if (rsp.success) {
  	        	 
	  	            $(btn).parent().siblings().eq(0).val(rsp.imp_uid);
	  	            $(btn).parent().siblings().eq(1).val(rsp.merchant_uid);
	  	            // $(btn).parent().siblings().eq(2).val(rsp.name);
	  	            $(btn).parent().siblings().eq(3).val(rsp.paid_amount);
	  	            // $(btn).parent().siblings().eq(4).val(rsp.buyer_name);
	  	            $(btn).parent().parent().submit();
	  	            
  	                  	        	  
  	          } else {
  	        	    alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
  	          }
  	       });
			
      	 
    	}
		
		
	</script>

</body>
</html>
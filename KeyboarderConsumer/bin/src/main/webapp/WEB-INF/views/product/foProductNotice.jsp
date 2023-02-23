<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	
	<style>
        div{
            /* border: 1px solid red; */
            box-sizing: border-box;
        }

        #fo-full-main{
            width: 1200px;
            height: 1200px;
            margin: auto;
        }

        #fo-header{
            width: 100%;
            height: 20%;
        }

        #fo-product-body{
            width: 100%;
            height: 900px;
        }

        #fo-product-main{
            width: 80%;
            height: 750px;
            margin: auto;
            margin-top: 80px;
        }

        .fo-product-all{
            width: 24.5%;
            height: 320px;
            display: inline-block;
            margin-bottom: 10px;
            border-radius: 30px;
            border: 2px solid #ffad00;
        }

        .fo-product-img{
            width: 100%;
            height: 140px;
            border-radius: 30px;
            background-color: #ffad00;
        }

        .fo-product-name{
            width: 100%;
            height: 53px;
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
        	border: 2px solid #ffad00;
        	background-color: #ffad00;
        	color: #ffad00;
        }
        
        #page-btn{
        	color: #ffad00;
        }
        
        #buy-btn{
        	width: 100px;
        	height: 40px; 
        	border: 2px solid #ffad00;
        }
        
        #buy-btn:hover{
        	background-color: #ffad00;
        	cursor: pointer;
        	color: white;
        }

    </style>
    
</head>
<body>

	<jsp:include page="../common/foHeader.jsp" />

	<div id="fo-full-main">

        <div id="fo-header"></div>

        <div id="fo-product-body">
            <div id="fo-product-main">
                
                    <div class="fo-product-all" align="center">
                        <form>
                            <div class="fo-product-img">
                                <img src="" style="background-size: cover; width: 100%; height: 100%;">
                            </div>
                            <div class="fo-product-name" style="padding: 10px; margin: 0px;">상품 제목 넣어버리기</div>
                            <div class="fo-product-price">상품 가격 넣어버리기</div>
                            <div class="fo-product-coupon">
                            	<select>
                            		<option>쿠폰이름들어감</option>
                            		<option>쿠폰이름들어감</option>
                            	</select>
                            </div>
                            <div class="fo-buy-button" align="center" style="padding: 9px; margin: 0px;">
                                <button type="submit" id="buy-btn" class="btn">
                                   	 구매하기
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="fo-product-all" align="center">
                        <form>
                            <div class="fo-product-img"></div>
                            <div class="fo-product-name">상품 제목 넣어버리기</div>
                            <div class="fo-product-price">상품 가격 넣어버리기</div>
                            <div class="fo-product-coupon">
                            	<select>
                            		<option>쿠폰이름들어감</option>
                            		<option>쿠폰이름들어감</option>
                            	</select>
                            </div>
                            <div class="fo-buy-button" align="center">
                                <button type="submit" class="btn btn-outline-info" style="width: 100px; height: 40px;">
                                   	 구매하기
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="fo-product-all" align="center">
                        <form>
                            <div class="fo-product-img"></div>
                            <div class="fo-product-name">상품 제목 넣어버리기</div>
                            <div class="fo-product-price">상품 가격 넣어버리기</div>
                            <div class="fo-product-coupon">
                            	<select>
                            		<option>쿠폰이름들어감</option>
                            		<option>쿠폰이름들어감</option>
                            	</select>
                            </div>
                            <div class="fo-buy-button" align="center">
                                <button type="submit" class="btn btn-outline-info" style="width: 100px; height: 40px;">
                                   	 구매하기
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="fo-product-all" align="center">
                        <form>
                            <div class="fo-product-img"></div>
                            <div class="fo-product-name">상품 제목 넣어버리기</div>
                            <div class="fo-product-price">상품 가격 넣어버리기</div>
                            <div class="fo-product-coupon">
                            	<select>
                            		<option>쿠폰이름들어감</option>
                            		<option>쿠폰이름들어감</option>
                            	</select>
                            </div>
                            <div class="fo-buy-button" align="center">
                                <button type="submit" class="btn btn-outline-info" style="width: 100px; height: 40px;">
                                   	 구매하기
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="fo-product-all" align="center">
                        <form action="purchase.fo" method="post" id="request">
                        	<input type="hidden" name="paymentNo" id="imp_uid">
							<input type="hidden" name="orderNo" id="merchant_uid">
							<input type="hidden" name="productNo" id="product_name">
							<input type="hidden" name="amount" id="amount">
							<input type="hidden" name="conNo" id="buyer_name">
							<input type="hidden" name="couponPrice" id="couponPrice" value="3000">
                            <div class="fo-product-img"></div>
                            <div class="fo-product-name">상품 제목 넣어버리기</div>
                            <div class="fo-product-price">상품 가격 넣어버리기</div>
                            <div class="fo-product-coupon">
                            	<select>
                            		<option>쿠폰이름들어감</option>
                            		<option>쿠폰이름들어감</option>
                            	</select>
                            </div>
                            <div class="fo-buy-button" align="center">
                                <button onclick="requestPay();" type="button" class="btn btn-outline-info" style="width: 100px; height: 40px;">
                                   	 구매하기
                                </button>
                            </div>
                        </form>
                    </div>
                    
                    <!-- 페이징 처리 -->
		            <div style="padding: 30px 50px; margin: 0px;">
			            <nav aria-label="Page navigation example">
						  <ul class="pagination" style="justify-content: center;">
						    <li class="page-item">
						      <a class="page-link" href="#" aria-label="Previous" id="page-btn">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						    <li class="page-item"><a class="page-link" href="#" id="page-btn">1</a></li>
						    <li class="page-item"><a class="page-link" href="#" id="page-btn">2</a></li>
						    <li class="page-item"><a class="page-link" href="#" id="page-btn">3</a></li>
						    <li class="page-item">
						      <a class="page-link" href="#" aria-label="Next" id="page-btn">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						  </ul>
						</nav>
					</div>
                
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
	
		var amount = 4000 - $("#couponPrice").val() + 2500;
	
		var IMP = window.IMP; // 생략 가능
    	IMP.init("imp80773741"); // 예: imp00000000
		
    	function requestPay() {
    	      // IMP.request_pay(param, callback) 결제창 호출
    	      IMP.request_pay({ // param
    	          pg: "html5_inicis.INIpayTest",
    	          pay_method: "card",
    	          merchant_uid: createOrderNum(),
    	          name: 120031,
    	          amount: amount,
    	          buyer_email: "user01@gmail.com",
    	          buyer_name: 1001,
    	          buyer_tel: "010-4242-4242",
    	          buyer_addr: "서울특별시 강남구 신사동"
    	      }, function (rsp) { // callback
    	          if (rsp.success) {
    	        	  
    	              $("#imp_uid").val(rsp.imp_uid);
    	              $("#merchant_uid").val(rsp.merchant_uid);
    	              $("#product_name").val(rsp.name);
    	              $("#amount").val(rsp.paid_amount);
    	              $("#buyer_name").val(rsp.buyer_name);
    	              $("#request").submit();
    	                  	        	  
    	          } else {
    	        	  alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
    	          }
    	     });
    	 }
		
		function refundPay() {
			
			location.href = "refundPay.fo?orderNo=20180131-0000067&paymentNo=imp_872602395619";
		}
	</script>

</body>
</html>
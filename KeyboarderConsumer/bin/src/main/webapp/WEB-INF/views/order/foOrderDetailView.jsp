<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
        div{
            border: 1px solid red;
            box-sizing: border-box;
        }

        .order-all-main{
            width: 1000px;
            height: 1100px;
            margin: auto;
        }

        #order-title{
            width: 100%;
            height: 10%;
            font-size: 50px;
            font-weight: 800px;
            line-height: 90px;
            font-weight: 500;
            padding-top: 10px;
        }

        #delivery-lookup{
            width: 100%;
            height: 100px;   
        }

        .order-product-main{
            width: 80%;
            height: 200px;
            margin: auto;
        }

        .order-orderer-main{
            width: 80%;
            height: 250px;
            margin: auto;
        }

        .order-name{
            width: 100%;
            height: 50px;
            font-size: 30px;
            font-weight: 300;
        }
        
        hr{
        	background-color: red;
        }
    </style>
    
</head>
<body>

	<jsp:include page="../common/foHeader.jsp" />

	<div class="order-all-main">
        <div id="order-title" align="center">
            	주문내역 상세조회
        </div>
        <br>
        <hr>
        <br clear="both">
        <!-- form 태그 추가로 인해 %에서 px로 변경 필요 -->
        <div class="order-product-main">
            <form>
                <div class="order-product-date" style="float: left; width: 15%; height: 200px;">
                    <div style="width: 100%; height: 80px; font-size: 17px; line-height: 120px;" align="center">
                      	  주문일시
                    </div>
                    <hr>
                    <div style="width: 100%; height: 80px; font-size: 17px; line-height: 40px;" align="center">
                        2022-12-01
                    </div>
                </div>
                <div class="order-product-img" style="float: left; width: 30%; height: 200px;">
                    <div style="width: 90%; height: 180px; margin: auto; margin-top: 10px">
                        <img src="" style="background-size: cover; width: 100%; height: 100%;">
                	</div>
                </div>
                <div class="order-product-name-price" style="float: left; width: 40%; height: 200px;">
                    <div style="width: 100%; height: 40px; font-size: 17px; padding-top: 5px; padding-left: 15px;">
                       	주문번호 : 202212025459394
                    </div>
                    <div style="width: 100%; height: 40px; font-size: 17px; padding-top: 5px; padding-left: 15px;">
                        	상품명 : 아무개 키보드
                    </div>
                    <div style="width: 100%; height: 40px; font-size: 17px; padding-top: 5px; padding-left: 15px;">
                        	상품가격 : 100000원
                    </div>
                    <div style="width: 100%; height: 40px; font-size: 17px; padding-top: 5px; padding-left: 15px;">
                        	쿠폰 : 쿠폰명 - 쿠폰가격
                    </div>
                    <div style="width: 100%; height: 40px; font-size: 17px; padding-top: 5px; padding-left: 15px;">
                        	판매자 : 판매자명
                    </div>
                </div>
                <div class="order-product-delivery-status" style="float: left; width: 15%; height: 200px;">
                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 120px;" align="center">
                        	배송준비중
                    </div>
                    <hr>
                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 50px;" align="center">
                        <button type="button" class="btn btn-outline-warning">환불요청</button>
                    </div>
                </div>
            </form>
        </div>

        <br><hr><br>

        <div class="order-orderer-main">
            <div class="order-name" style="padding-left: 25px;">
                	받는 사람 정보
            </div>
            <div class="order-infomation">
                <div style="width: 100%; height: 66px; font-size: 17px; padding-top: 17px; padding-left: 25px;">
                    	받는사람 : 주멋돌
                </div>
                <div style="width: 100%; height: 66px; font-size: 17px; padding-top: 17px; padding-left: 25px;">
                    	연락처 : 010-2233-4455
                </div>
                <div style="width: 100%; height: 66px; font-size: 17px; padding-top: 17px; padding-left: 25px;">
                    	배송지 : 서울특별시 영등포구 뾰로롱
                </div>
            </div>
        </div>

        <br><hr><br>

        <div class="order-orderer-main">
            <div class="order-name" style="padding-left: 25px;">
                	결제 정보
            </div>
            <div class="order-infomation" style="float: left; width: 40%;">
                <div style="width: 100%; height: 49px; font-size: 17px; padding-left: 25px; padding-top: 10px;">
                    	결제수단 : 신용 / 체크 카드
                </div>
                <div style="width: 100%; height: 49px; font-size: 17px; padding-left: 25px; padding-top: 10px;">
                    	상품가격 : 100000원
                </div>
                <div style="width: 100%; height: 49px; font-size: 17px; padding-left: 25px; padding-top: 10px;">
                    	쿠폰할인 : 3000원
                </div>
                <div style="width: 100%; height: 49px; font-size: 17px; padding-left: 25px; padding-top: 10px;">
                    	배송비 : 2500원
                </div>
            </div>
            <div style="float: left; width: 60%; height: 200px; padding-top: 65px; padding-left: 35px; font-size: 20px;">
                              최종 결제 금액 : 97000원
                <br>
               	 최종결제금액 = 상품가격 - 쿠폰가격 + 배송비
            </div>
        </div>

    </div>    

</body>
</html>
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
            height: 1000px;
            margin: auto;
        }

        #order-title{
            width: 100%;
            height: 10%;
            font-size: 50px;
            font-weight: 800px;
            line-height: 90px;
        }

        #order-date-tracking{
            width: 80%;
            height: 15%;
            margin: auto;
        }

        #delivery-lookup{
            width: 100%;
            height: 100px;   
        }

        .order-product-main{
            width: 80%;
            height: 202px;
            margin: auto;
        }
    </style>
    
</head>
<body>

	<jsp:include page="../common/foHeader.jsp" />

	<div class="order-all-main">
        <div id="order-title" align="center">
            	주문내역조회
        </div>
        <div id="order-date-tracking">
            <form action="" method="">
                <div id="delivery-lookup">
                    <div style="display: inline-block; margin-left: 5%; font-size: 20px; margin-top: 35px; width: 15%;">
                       	 조회기간
                    </div>
                    <select style="margin-left: 5%;">
                        <option>전체</option>
                        <option>언제로할까</option>
                    </select>
                    <input type="date" style="margin-left: 3%;">
                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp~
                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <input type="date">
                </div>
                
                <div id="delivery-button" align="center">
                    <button type="submit" style="margin-top: 10px; width: 20%;">
                        	검색하기
                    </button>
                </div>
            </form>
        </div>
        <br>
        <hr>
        <br clear="both">
        <!-- form 태그 추가로 인해 %에서 px로 변경 필요 -->
        <div class="order-product-main">
            <form>
                <div class="order-product-date" style="float: left; width: 15%; height: 200px;">
                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 120px;" align="center">
                        	주문일시
                    </div>
                    <hr>
                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 40px;" align="center">
                        2022-12-01
                    </div>
                </div>
                <div class="order-product-img" style="float: left; width: 30%; height: 200px;">
                    <div style="width: 90%; height: 180px; margin: auto; margin-top: 10px">
                        <img src="" style="background-size: cover; width: 100%; height: 100%;">
                	</div>
                </div>
                <div class="order-product-name-price" style="float: left; width: 40%; height: 200px;">
                    <div style="width: 100%; height: 100px; font-size: 17px; padding-top: 20px;" align="center">
                        <a href="foDetailView.order">
                        	아무개 키보드
                        </a>
                    </div>
                    <div style="width: 100%; height: 100px; font-size: 17px; padding-top: 20px;" align="center">
                        100000원
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
        
        <br>
        
    </div>

</body>
</html>